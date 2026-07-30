---
name: next-session-cnote
description: 다음 세션 이어서 할 작업 — CNOTE 컴포넌트 구현 시작
metadata: 
  node_type: memory
  type: project
  originSessionId: 5cadd301-d55d-4dc5-99ab-d36075b53590
---

CNOTE 디자인 시스템 컴포넌트 구현 작업 (2026-06-10 세션에서 환경 구축 완료, 구현 미착수)

**다음 세션에서 바로 시작할 것**

1. **Figma 변수 확정 → tokens.css 실제 값 교체**
   - `src/styles/tokens.css`의 임시 placeholder 값을 Figma 실제 변수로 교체
   - Figma 파일 URL을 사용자에게 받아서 `get_variable_defs` 호출
   - 경로: `03_projects/260610_C-Level_note/03_dev/260610_cnote/src/styles/tokens.css`

2. **첫 번째 컴포넌트 구현**
   - Figma URL 받으면 `figma-implementer` 에이전트에 위임
   - 1컴포넌트 = 4파일: `index.tsx` + `{Name}.types.ts` + `{Name}.stories.tsx` + `{Name}.test.tsx`
   - 저장 경로: `src/components/{ComponentName}/`

3. **`docs/DESIGN.md`에 Figma 파일 URL 추가** (TODO 있음)

**사전 준비 (사용자)**
- Figma 파일 URL 준비
- `npm start` 실행 후 DEV(5173) + Storybook(6006) 확인

**참고**
- 관련 메모리: [[project-cnote]]
- 에이전트: `.claude/agents/figma-implementer.md`
- 훅: `.claude/hooks/check-design-tokens.mjs` (하드코딩 자동 감지)

**Why:** 환경만 완성되고 실제 컴포넌트가 하나도 없는 상태. 토큰 확정이 컴포넌트 구현의 선결 조건.
