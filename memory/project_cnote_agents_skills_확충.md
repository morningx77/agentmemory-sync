---
name: project-cnote-agents-skills
description: CNOTE 에이전트·스킬 확충 Phase 1 완료(260804·회사계정). 전수검사→갭 5건 제작. 프레임워크=에이전트/스킬/스크립트 분업.
metadata: 
  node_type: memory
  type: project
  originSessionId: 5ae1536b-02db-4405-94ea-c07226b39b56
  modified: 2026-08-04T03:44:14.121Z
---

CNOTE(TieMing) 개발 4세션(기획·스토리북·피그마·크리에이티브) 전수검사 후 **회사계정(`ISPARK\.claude`)용 에이전트·스킬 확충 Phase 1 완료**(260804).

**★관통 프레임워크**: **디스패치 가능=에이전트 / 맥락 필요=스킬 / 결정론=스크립트.**
- 창의·판단(device 조립·BI·시각언어)은 **에이전트화 금지**(서브에이전트=맥락 손실→품질 저하). → **생성=세션, 방법론=스킬, 검증=가드**.
- 반복·집계·대조(flow 빌드·게이트)는 서브에이전트 대신 **래퍼 스크립트**(토큰0·함정 원천차단).

**Phase 1 산출물 5건** (전수검사 근거: 저널 411건·도구빈도):
- `rebuild_flow.mjs` + `/flow-wire` — flow 재빌드 순서강제(build_flow_nav→build_btn_nav→검증). **btnNav 함정 차단**(build_flow_nav 단독=버튼 먹통, memory `flow_btnnav_rebuild_trap`).
- `run_gates.mjs` + `/gate-check` — 전 게이트(validate·coverage·menu-order·event·states·components) 일괄 집계.
- `premium-craft` 스킬 — 시안 미감(글로우=대면적 전용·크리스프·카드 표면). 정본 `CDS_premium_craft_guide_260704`.
- `circle-visual-language` 스킬 — 원 시각언어(명시적 기하규칙=필연). 정본 `CDS_circle_visual_language_guide`.
- `figma-quality-gate` 스킬 완성 — 기존 `gate.js`(Component Set 구조 게이트)에 SKILL.md 신설(그동안 description 공란=미완).

위치=`ISPARK\.claude\{skills,commands}` + 스크립트=`.../screen_design_v2/scripts/`. CLAUDE.md(ISPARK·CNOTE) 등록 완료. 계획서=`ISPARK\...\01_docs\계획_핸드오프\_WORK_PLAN_agents_skills_확충_260804.md`.

**Phase 2 백로그**: 스킬 승격(design-foundation·ux-writing-cnote·design-reconciliation·brand-tieming) · `storybook-visual-verify` 에이전트(Playwright 배포URL 양모드 눈검증) · 개선(screen-ops 배포트랩 내재화 KEX·--structured금지·clean재빌드·캐시버스터 / screen-issue-triager→수정 디스패치).
기존 에이전트 17종=CDS 6·screen 11(전부 CNOTE 전용).
