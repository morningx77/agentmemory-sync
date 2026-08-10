---
name: project-fp-finance-automation
description: FP 세션(재무설계+파이썬자동화+풀스택 3역) 전용 프로젝트 — IMGINE/03_projects/260810_FP
metadata: 
  node_type: memory
  type: project
  originSessionId: cde9ec63-a46d-4b06-a884-43e7289c8a1c
  modified: 2026-08-10T08:49:45.356Z
---

**세션 별칭 `FP` = 3역 겸직** — ① Financial Planner(개인 재무설계·자산관리) ② 20년차 파이썬 자동화 개발자 ③ 기획·디자인까지 겸하는 풀스택 개발자. 핵심 = "재무를 설계하고, 그 관리 체계를 직접 돌아가는 제품으로 만든다" — 산출물이 설계서에서 끝나지 않고 실행되는 코드·화면까지 간다.

**작업 폴더 = `IMGINE/03_projects/260810_FP/`** (2026-08-10 생성, 개인 영역). 표준 구조 + `01_docs` 4분류(기획·설계_명세·계획_핸드오프·검토_분석) + `_INDEX.md`. 프로젝트 CLAUDE.md·IMGINE 프로젝트목록·페르소나 정본 문서에 모두 등재 완료.

**★ 데이터 취급 원칙(프로젝트 CLAUDE.md §3)** — 개인 금융정보라 로컬 전용(외부 전송 금지)·git 실데이터 커밋 금지(.gitignore 먼저)·자격증명은 .env/*.local.json 분리·문서엔 마스킹·추정치는 "가정" 라벨 필수·투자권유 아님 명시.

**★ git = 개인계정 완전분리 (260810 구축·실증 완료)**. remote `github.com/morningx77/260810_FP.git`(비공개). 구조: 전역 `~/.gitconfig` 신규 생성 → `includeIf gitdir/i:` 로 **경로가 곧 정체성** (`IMGINE/`→`~/.gitconfig-personal` morningx77 / `ISPARK/`→`~/.gitconfig-company` ispark-ai-rnd). 충돌 원인이던 "자격증명 1개 공유"는 **`credential.useHttpPath=true`** 로 해소 — cmdkey 실측상 `git:https://github.com`(회사)와 `git:https://github.com/morningx77/260810_FP.git`(개인)가 **별도 항목으로 공존**. 이 repo에 로컬 `user.name`을 박으면 전역 분기가 무력화되니 금지.
- 함정①: **비대화형 세션에서는 첫 push 불가**(GCM 인증창을 못 띄움) → 사용자가 터미널에서 1회 수동 push. 이후엔 세션에서 push 정상.
- 함정②: `.gitignore`를 **커밋 전에 먼저** 작성했고 csv·.env·xlsx 투입 실테스트로 차단 검증함. 새 데이터 유형 생기면 .gitignore 먼저 갱신.
- 미확인: useHttpPath 전환으로 **회사 repo(cnote-front)가 다음 push 때 1회 재인증**을 요구하는지 — GCM의 host-only fallback 여부 미실측.

**진행 상태(260810 기준)**: 폴더·규칙·git 셋업 완료(커밋 `25dad25`·`52e96a2`). `02_design`·`03_dev` 비어 있음 — 스택(pandas+SQLite / Streamlit vs FastAPI)·첫 스텝(진단 먼저 vs 시스템 기획 먼저)·데이터 소스 형태 **미정, 사용자 답변 대기**.

**Why:** 회사(ISPARK)와 완전 분리된 개인 금융 영역이라 스코프·보안 규칙이 다르다. FP 세션이 새로 뜰 때마다 폴더·원칙을 다시 찾지 않도록 고정한다.
**How to apply:** FP 세션 시작 시 `260810_FP/CLAUDE.md`와 `01_docs/_INDEX.md`를 먼저 읽고 시작. 다단계 작업은 `01_docs/계획_핸드오프/_WORK_PLAN_*` 계획서 선행. 관련=[[project-session-alias-registry]], [[feedback-no-unverified-as-fact]]
