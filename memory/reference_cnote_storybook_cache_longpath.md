---
name: reference_cnote_storybook_cache_longpath
description: 압축 이전 시 node_modules/.cache 긴 경로 스킵 → Storybook deps 504/공백. 캐시 삭제 후 재생성으로 해결
metadata: 
  node_type: memory
  type: reference
  originSessionId: fd1f7717-700d-4890-a9c2-57f0f188989c
---

CNOTE dev 환경(`03_projects/260610_C-Level_note/03_dev/260610_cnote`)을 압축→다른 PC로 이전할 때 발생하는 함정 (2026-06-21 확인·해결).

**증상:** Storybook(6006)에서 docs 페이지가 콘텐츠 영역 공백으로 뜨고, 컴포넌트 페이지는 `Failed to fetch dynamically imported module: .../node_modules/.cache/storybook/10.4.4/<hash>/sb-vite/deps/@storybook_addon-docs_n_@storybook_react-dom-shim.js?v=...` 에러. 서버 자체는 200으로 뜸(스토리 인덱스도 정상).

**근본 원인:** 압축 해제 시 Windows MAX_PATH(260자) 제한으로 `node_modules/.cache/storybook/.../sb-vite/deps/` 안의 **긴 경로 파일이 스킵**됨 → `_metadata.json`은 `react-dom-shim`을 등록했는데 실제 청크 파일은 없는 **불일치 상태** → Vite가 해당 deps에 **HTTP 504**(재최적화 필요) 반환 → 동적 import 실패. (캐시 폴더 여러 개 중 일부는 0 files로 남는 정황도 동반)

**해결 (코드 변경 아님, 안전·재생성 가능):**
```bash
# 1) storybook/vite 중지
# 2) 깨진 캐시 삭제
rm -rf node_modules/.cache node_modules/.vite
# 3) 재기동 → Vite가 실제 node_modules 소스에서 deps 새로 최적화
npm run storybook   # / npm run dev
```
재최적화가 성공하면 = 실제 패키지 소스는 멀쩡하다는 증거이므로 `npm ci` 불필요. (소스 파일까지 스킵됐다면 최적화가 실패하니 그때만 `npm ci`)

**예방:** 워크스페이스 압축/이전 시 `node_modules/.cache`, `node_modules/.vite`는 **재생성 가능한 캐시이므로 압축 대상에서 제외**할 것. RUNBOOK 이전 절차에 반영 권장. [[project_cnote]]

**검증 방법:** `find node_modules/.cache/storybook -name "*react-dom-shim*"` 로 청크 존재 확인 + iframe 강제 렌더(`/iframe.html?id=...&viewMode=docs`)가 200인지 확인.

**⚠️ 추가 함정 (2026-06-21) — 좀비 프로세스 / Configure.mdx:**
- **캐시를 지우고 재기동해도 docs가 504(`?v=<옛해시>` stale, 예 58f25f93)로 빈 페이지면 → 좀비 Storybook 프로세스 의심.** Windows에서 TaskStop은 `npm run storybook`의 **자식 node(vite) 프로세스를 못 죽임** → 여러 인스턴스 중첩, 가장 오래된 게 포트(6006) 점유한 채 옛 in-memory deps serving. 디스크 청크는 지워져 504.
  - 진단: `netstat -ano | grep :6006` 로 PID 확인 + `Get-CimInstance Win32_Process -Filter "Name='node.exe'"` 의 CommandLine에서 storybook/vite 필터. 여러 개면 좀비.
  - 해결: 모든 storybook/vite node PID를 `Stop-Process -Force` 로 종료 → 6006 FREE 확인 → **단일** Storybook 재기동.
  - 교훈: storybook dev 떠 있을 때 **vitest 동시 실행 금지**(같은 vite optimize 캐시 충돌). 재기동 반복 시 좀비 누적 주의.
- **증상 "본문이 0.1초 떴다가 사라지고 빈 페이지" = hydration 크래시.** MDX에서 **여러 줄로 쓴 JSX `<p>`/`<h1>` 안 텍스트를 MDX가 마크다운 문단(`<p>`)으로 재감쌈** → `<p>` 중첩 → React 하이드레이션 터짐. 해결: 해당 텍스트를 **한 줄로** (`<p ...>텍스트</p>`).
- **검증 도구:** Playwright(프로젝트 devDep)로 `iframe.html?id=...&viewMode=docs` 로드 후 `document.body.innerText.length` + console/네트워크 504 확인. CDP `Network.setCacheDisabled` 로 브라우저캐시 배제하면 서버측 문제 vs 브라우저캐시 구분 가능.
