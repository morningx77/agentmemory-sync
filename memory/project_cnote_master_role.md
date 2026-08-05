---
name: project_cnote_master_role
description: CNOTE 마스터(Master) 역할 구축 260805. 모든 작업의 정문·판정·라우팅·게이트·자기개선 루프. 관제 단일.
metadata: 
  node_type: memory
  type: project
  originSessionId: 5ae1536b-02db-4405-94ea-c07226b39b56
  modified: 2026-08-05T05:00:11.451Z
---

CNOTE 모든 실행 작업의 **정문 = 마스터(Master) 세션**(별도 세션·관제 단일). 260805 구축.

**역할**: 작업이 들어오면 ① 유형 판정(6분류×20) ② 표준 단계·도구 라우팅 ③ 함정 가드·완료 게이트 강제 ④ 관찰·회고(자기개선). **실행 안 함** — worker(기획·스토리북·피그마·크리에이티브·에이전트·스크립트)가 실행, 마스터는 검수. **마스터=1**(정문 여럿=목적 붕괴), 병렬성은 worker 층.

**통신 하이브리드**: 맥락 세션(스토리북 device·피그마·크리에이티브 BI)=협업 저널 핸드오프(비동기) / 결정론=에이전트·스크립트 직접.

**★자기개선 루프(DNA·1일차 필수)**: 착수 `memory_lesson_recall` → 완료 `memory_lesson_save` → 실패 `memory_reflect`→가드 변환(게이트/플레이북/에이전트/역할). **루프·거버넌스는 나중 붙이는 기능 아니라 작동모델**(안 그러면 무의식적 라우터로 전락 — 사용자 지적). 자동화 깊이만 점증.

**거버넌스**: 자기수정=제안→**사용자 승인**→변경이력(`_master_changelog.md`). 침묵 수정 금지(cds-extension-governor 패턴).

**산출물(회사계정 ISPARK\)**: 플레이북 정본 `01_docs/설계_명세/CNOTE_작업유형_플레이북_정본_260805.md`(6분류×20유형·함정가드·§5루프·§6거버넌스) · 스킬 `master-router`(라우팅 엔진) · 킥오프 `_KICKOFF_마스터_260805` · 로스터 `_roster_registry.json`(SSOT) · 변경이력 `_master_changelog.md` · run_gates에 **type-check(tsc) 편입**(260803 데드임포트 사고 차단·검증PASS) · ISPARK/CNOTE CLAUDE.md 진입규칙. 계획서 `_WORK_PLAN_마스터_역할구축_260805`.

**★M8 안티-디케이(쇠퇴 방지·사용자 지적 "과거엔 흐려지다 사라짐")**: 낙관 아니라 강제장치로 유지. ①**마스터 규율 후크**(ISPARK/.claude/settings.json UserPromptSubmit·매 턴 재주입 — 안 사라진 것=후크 있는 것) ②**게이트 관문화**(완료 정의=/gate-check PASS·우회불가) ③**회고 자동 트리거**(run_gates FAIL→`_master_retro_queue.jsonl` 자동적재→마스터가 회고→가드) ④**heartbeat**(`master_heartbeat.mjs`+`/master-health`·저널작업·회고적체·개선건수로 쇠퇴 조기포착). 전량 검증PASS.

**미결**: journal-notify 훅이 마스터 cwd를 '기획'으로 오판→당분간 저널 수동. storybook `package.json` gate에 tsc 근본편입은 storybook-claude 소관(권고). 프레임=[[project_cnote_agents_skills_확충]](에이전트/스킬/스크립트 3분).
