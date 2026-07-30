---
name: reference-cnote-ops
description: CNOTE 운영(SFTP 배포·Firestore DB) 도구 — screen-ops 에이전트 + deploy-sftp/db-admin 스크립트
metadata: 
  node_type: memory
  type: reference
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
---

CNOTE screen_design_v2 운영 자동화(2026-06-26 구축). 하네스 철학 = 결정론은 스크립트, 판단만 에이전트.

- `scripts/deploy-sftp.mjs <target>` — **타겟별 구분 배포**. 타겟은 `.deploy.local.json`의 `sftp.targets`에 정의(원격경로·로컬소스 분리). 기본 2종: `prototype`→`/upload`(prototype.html+`_versions`), `storybook`→`/upload/storybook`(`storybook-static/` 폴더 재귀). `files`/`dir`/`versions`/`localBase` 옵션. `spawnSync` 배열(인젝션 차단) + curl `--insecure --ftp-create-dirs`. 인자 없으면 타겟 목록 출력. **증분 업로드**: md5 해시를 `.deploy-state.json`에 기록해 변경분만 올림(같으면 스킵), `--force`로 전체 강제.
- `scripts/db-admin.mjs <backup|stats>` — Firestore `memos` 백업(`backups/memos_*.json`)·통계(이슈/댓글/검토자/상태).
- **자격증명**: `.deploy.local.json`(로컬 전용·공유 금지, `.example` 템플릿). `sftp{host,user,pass,remoteDir}` · `firestore{project,apiKey,collection}`. **코드·에이전트에 하드코딩/노출 절대 금지.**
- `.claude/agents/screen-ops.md` — 운영 워커. 스크립트 호출+검증+보고, config는 읽지도 출력도 안 함. tools=Read,Bash,Glob,Grep.
- SFTP 서버: `140.238.15.203` `/upload` (user `yschoi2`). ⚠ 비번이 대화에 노출됐으므로 변경 필요.

재배포: `node scripts/build_prototype.mjs && node scripts/deploy-sftp.mjs`

[[reference-screen-design-pipeline]] [[project-cnote-screen-changes]]
