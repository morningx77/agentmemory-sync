---
name: feedback_cnote_front_git_scope
description: "cnote-front 모노레포는 storybook/ 서브폴더만 우리 것 — 그 밖은 개발자 공간, pull만·push 금지"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
---

CNOTE 스토리북 작업 폴더 = `03_dev/cnote-front/storybook/` (git repo `ispark-ai-rnd/cnote-front`의 **모노레포** 서브폴더, 구 `260610_cnote_v2`에서 이전·260714). **우리(디자인/스토리북) 관리 공간은 `storybook/` 서브폴더뿐**이고, 그 밖(루트 RN 앱: `app/`·`modules/`·`src/`(루트)·`package.json`·`plugins/`·`app.json`·`index.js`·`metro.config.js` 등)은 **개발자 관리 공간**이다.

**Why:** 사용자 명시 지시(260714) — repo 루트 = 개발자 영역이라 우리가 push하면 개발자 작업과 충돌·오염.

**How to apply:**
- **`storybook/` 밖은 pull만. 커밋·push 절대 금지.**
- 커밋은 반드시 `storybook/` 경로로만 스코프: `git add storybook/…`. **repo 루트에서 `git add .`/`git add -A` 금지**(개발자 변경분이 딸려감).
- push 전 `git diff --stat`로 변경이 `storybook/`에만 있는지 확인.
- 루트 등 `storybook/` 밖 변경이 필요하면 임의 push 금지 → **개발자에게 요청**.
- 최신 유지: 주기적으로 `git pull`.
- 이 규칙은 `storybook/CLAUDE.md`·`GEMINI.md`(둘 다 gitignore·로컬)에도 최우선 규칙으로 박아둠 — Claude·Gemini 공통. [[project_cnote_storybook_structure_reorg]]
- ★모노레포 서브폴더 함정: 루트 `.npmrc`(legacy-peer-deps)를 서브폴더가 안 물려받음 → `storybook/.npmrc` 별도 필요(설치 오류 해결·커밋됨).
