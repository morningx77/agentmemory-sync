---
name: reference_cnote_deploy_sftp_kex_fix
description: CNOTE 배포 KEX 에러 근본해결 — deploy-sftp를 단일 SSH 연결(ssh2-sftp-client)로 전환
metadata: 
  node_type: memory
  type: reference
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-07-23T11:42:34.368Z
---

CNOTE 미드파이/스토리북 배포(`02_design/screen_design_v2/scripts/deploy-sftp.mjs`)에서 반복되던 **SFTP KEX 에러**("Unable to exchange encryption keys", curl -8, 매 실행 파일 1~4개 무작위 실패 → `--force` 4~8회 재시도)의 **근본원인 = 파일당 curl 1회 = SSH 핸드셰이크 1회**. 전수배포(208파일)면 208 핸드셰이크가 순간에 몰려 서버(140.238.15.203)가 일부를 throttle. 시스템 결함이 아니라 **도구의 per-file 연결 설계** 문제.

**해결(260723)**: `ssh2-sftp-client` **단일 연결 재사용**으로 전환(핸드셰이크 1회). 결과 = 208파일 **38초·KEX 0·재시도 0**(구: 150~920초+재시도). CLI·타겟·증분해시(state)·EXCLUDE·`--structured` 보존, `--rm-remote`(희소 관리모드)만 curl 유지, put 실패 시 3회 소폭 재시도(연결 유지). 백업=`deploy-sftp.mjs.bak_260723`, 의존성 `npm i ssh2-sftp-client`(screen_design_v2/package.json).

★교훈: **배포 워커에 "KEX 재시도 반복" 지시 불필요**해짐. `node deploy-sftp.mjs <target> [--force]` 그대로 1회 성공. 서버 인프라 튜닝 요청 없이 클라이언트 도구 교체만으로 해소. 향후 유사 SFTP 대량전송 도구도 단일 연결(세션 재사용) 원칙 적용. [[reference_cnote_ops]]

---

## ★★ storybook 배포는 **루트(비-structured)** — `--structured` 쓰면 라이브 안 바뀜(260723)

**증상**: 스토리북 코드 수정→빌드→`deploy-sftp.mjs storybook --structured`(exit 0) 했는데 **라이브만 옛 화면**. 로컬 빌드(`storybook-static`)를 직접 http.server로 렌더하면 정상 → "로컬 정상·라이브 깨짐"이 반복. 캐시로 오인해 `--force`·CDN 퍼지 시도해도 안 고쳐짐.

**근본원인**: `--structured`는 build를 `remoteBase/build`(=`/upload/storybook/build/`)·src를 `/src`로 올린다. 그러나 **nginx 서빙 경로는 `/upload/storybook/` 루트**(사용자 URL `/v1/design/storybook/iframe.html`, flow의 `storybookBase=…/storybook`도 루트). 즉 새 빌드가 **아무도 안 보는 `/build/` 하위**로 가고 서빙 루트는 옛 빌드 그대로 → 라이브 미갱신. 진단 결정타=라이브가 로드하는 에셋 해시가 로컬 빌드와 다름(`Recording.stories-<hash>.js` 불일치) + 라이브 `getComputedStyle flexGrow==='1'` 카운트 0(신규 flex 레이아웃 미적용) + `/storybook/assets/<신해시>.js`=404인데 `/storybook/build/assets/<신해시>.js`=200.

**해결**: `node scripts/deploy-sftp.mjs storybook --force`(★`--structured` 빼기) → build가 서빙 루트로. 검증=`fetch('/storybook/assets/<로컬빌드해시>.js')`=200 + 라이브 `flexGrow1_count>0` + 실제 URL 스샷.

---

## ★★ 무한 로딩 = storybook-static 청크 누적→배포 청크 드롭(260723)

**증상**: 라이브 스토리북 전 화면 "무한 로딩". iframe body="Failed to fetch dynamically imported module: …/assets/X.stories-<hash>.js", 콘솔 404. 즉 iframe.html이 참조하는 청크가 **서버 404**(로컬 빌드엔 존재).

**근본원인**: `build-storybook`이 `storybook-static/`을 **클린하지 않고 누적** → 세션 내 십수 회 재빌드하면 assets가 **2508개**까지 불어남(한 스토리 청크 15개 등). 배포(전 파일 업로드)가 비대해져 **청크 드롭 위험 급증** + 배포 시간↑. 드롭된 현재 청크가 404 → 그 스토리 로드 실패 → 매니저 무한 로딩.

**해결**: `rm -rf storybook-static && npm run build-storybook`(클린 재빌드) → assets **2508→175**(한 스토리 청크 15→1). 그 뒤 `deploy-sftp.mjs storybook --force`(210파일, 단일연결, 드롭0). 라이브 404 해소·콘솔에러0 확인.

★함정: rm이 **동시 진행 중인 배포와 겹치면 "Device or resource busy"**로 실패(배포가 storybook-static 읽는 중) → storybook-static 반쯤 지워져 빌드도 실패. **진행 중 배포 완료 후 rm**. 진단 결정타=로컬 `ls storybook-static/assets | grep <stories> | wc -l`이 1보다 크면 누적. ★주기적(또는 배포 이상 시) 클린 재빌드로 예방.

★교훈: (1)스토리북 배포는 **루트(비-structured)**. CLAUDE.md의 "storybook=--structured(/build+/src)"는 개발자 미래 협의 구조일 뿐 **현재 라이브 서빙과 불일치**. (2)라이브 검증은 반드시 **사용자가 여는 실제 URL**(루트)로. (3)"로컬 정상·라이브 깨짐"이면 **캐시로 단정 말고** 라이브가 로드하는 에셋 해시를 로컬 빌드 파일명과 대조(불일치=경로/배포 문제, 일치+옛내용=진짜 캐시). nginx엔 캐시 계층 없음(age/x-cache 없음)이라 CDN 퍼지 헛수고. [[project_cnote_storybook_structure_reorg]] [[feedback_visual_verification]]
