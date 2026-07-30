---
name: project-cnote
description: 260610_C-Level_note 프로젝트 — CNOTE 디자인 시스템 개발 환경 현황
metadata: 
  node_type: memory
  type: project
  originSessionId: 5cadd301-d55d-4dc5-99ab-d36075b53590
---

C-Level 임원용 노트 앱의 프론트엔드 디자인 시스템. 개발 환경 구축 완료, 컴포넌트 미구현 상태.

**경로**: `03_projects/260610_C-Level_note/03_dev/260610_cnote/`

**기술 스택**
- React 19 + TypeScript, Vite 8, Tailwind v4 (`@tailwindcss/vite`)
- Storybook 10 + Vitest + Playwright
- concurrently로 DEV + Storybook 동시 실행

**실행**
- `npm start` → DEV(5173) + Storybook(6006) 동시 실행
- `start.ps1` → 더블클릭으로 동일 실행

**현황 (2026-06-10 기준)**
- 개발 환경: ✅ 완료
- `src/styles/tokens.css` 디자인 토큰: ⚠️ 임시값 — Figma 변수 확정 후 교체 필요
- 컴포넌트: 🔲 없음 — Figma URL 받으면 `figma-implementer` 에이전트로 시작

**Claude 자동화 구조**
- `.claude/agents/figma-implementer.md` — Figma → 컴포넌트 구현 에이전트
- `.claude/hooks/check-design-tokens.mjs` — 하드코딩 색상 저장 시 자동 감지
- `.claude/hooks/check-story-exists.mjs` — Story 없는 컴포넌트 경고
- `.claude/hooks/protect-files.mjs` — 핵심 파일 보호
- `.claude/settings.json` — hooks + .env 보호 권한 설정

**Why:** C-Level 임원용 앱이라 디자인 정확도와 토큰 일관성이 핵심 요구사항
**How to apply:** 이 프로젝트에서 컴포넌트 구현 요청 시 반드시 Figma URL 확인 후 figma-implementer 위임
