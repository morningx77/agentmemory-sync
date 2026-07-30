---
name: reference-screen-design-pipeline
description: 재사용 커맨드 /screen-pipeline + 워커 에이전트 3종 — 인벤토리→lo-fi→mid-fi→브리프 재현 도구
metadata: 
  node_type: memory
  type: reference
  originSessionId: 1eb6668f-19d8-4993-a54f-2430e5f07c0f
---

화면 설계를 동일 품질로 재현하는 **범용 도구**(2026-06-22 구축). 다음 세션에서 `/screen-pipeline`으로 바로 호출.

**오케스트레이터 커맨드**: `.claude/commands/screen-pipeline.md` → `/screen-pipeline [인벤토리경로] [출력폴더]`. 인벤토리→① lo-fi 와이어프레임→② mid-fi 기본 UI→③ AI 디자인 브리프를 단계 디스패치, 누락 0건 자동검증.

**워커 서브에이전트 3종** (`.claude/agents/`): `screen-lofi-wireframer`(①+커버리지), `screen-midfi-designer`(②), `screen-design-briefer`(③). Agent 도구 `subagent_type`으로 직접 호출도 가능.

**조직 공통 툴킷**: `05_notes/04_claude/screen-design-pipeline/`
- `METHOD.md` 방법론 정본(data-* 컨벤션·검증·핸드오프). 워커가 참조.
- `templates/`: kit_lofi.css·kit_midfi.css(스킨), check-coverage.mjs·list-elements.mjs(인벤토리 기반 일반화 — `_required_ids.json` 읽음), brief_template.md.

**범용화 핵심**: 스크립트가 `_required_ids.json`(인벤토리에서 추출한 화면/컴포넌트/BS·PUSH ID)을 읽어 프로젝트 무관 동작. 출력폴더에 템플릿 복사(kit_lofi.css→_kit.css, kit_midfi.css→_midfi_kit.css) 후 단계 진행.

**AI 자가검증 루프(2026-06-26 추가)**: midfi-designer가 issue-panel을 ✅반영(화면 실재만·날조 금지·Grep 자가대조)/🟡🔴후속과제로 구분 작성. 오케스트레이터 **Phase 7.6** = 근거 자동집계(`export-screen-changes.mjs`) + 근거 0 전수검사 + 근거↔화면 일치성 전수검사(Explore 워커)로 누락·거짓반영을 게이트에서 차단. 사람이 일일이 안 잡아도 걸리게 제도화. [[project-cnote-screen-changes]]

**게이트 계층 확장(2026-06-26 · 하네스 진단 후)**: 기존 구조 게이트(check-coverage 누락0·sync-check 정합·build 미커버0) 위에 ① `validate-data.mjs`(스키마: flows·_required_ids·_screen_changes 구조·ID형식·JSON파싱) ② `validate-flows.mjs`(의미: flows의 step·hotspot이 mid-fi 1차 device에 실재 — 상태·핫스팟 유효성) ③ `make-snapshot.mjs`(스냅샷 CLI: 수동복사 드리프트·.cache 긴경로 함정 제거+자동재빌드) 신설. **음성 테스트로 결함 적발 검증 완료**(없는 화면 hotspot→exit1). 하네스 성숙도 L2(의미검증) ★★☆→★★★. 남은 과제: 실패복구 명문화·SSOT 통합·eval셋(중장기).

**컴포넌트 카탈로그(⑧ 단계, 2026-06-27)**: `screen-component-cataloger` 워커 — 흐름별 `data-component`를 **유형(컴포넌트) 축으로 재배열** → `2midfi_00_components.html`(컴포넌트 가이드). 유형 매핑 정본=`data/_component_types.json`(12종: ActionCard·PersonCard·NotificationCard·Widget·TaskCard·ScheduleCard·SummaryCard·BottomSheet·EmptyState·StatusCard·InputArea·ActionGroup). **숨은 중복**(이름 다른 같은 유형)을 묶어 ~12 컴포넌트만 집중 디자인(스토리북 좌측·Figma 컴포넌트 1:1). 화면 축(SCR_X)과 직교. **렌더 실재 게이트** `validate-components.mjs`(흐름 data-component↔_component_types 매핑↔가이드 실제 렌더 3중 대조, exit1)로 **"표만 있고 시각변형 안 그려진" 거짓커버 차단** — N/N data-component 렌더 강제(CNOTE=48/48). cataloger가 "대표만 그리고 나머진 표로" 두는 실수가 여기서 걸림. [[reference-cnote-screen-links]]

레퍼런스 사례 = CNOTE [[project-cnote-wireframe-html]] (이 방법론의 최초 산출물).
