---
name: reference_storybook_hierarchy_gate
description: CNOTE 스토리북 Component/Module 위계 = title 접두사 + check-hierarchy 게이트로 강제
metadata: 
  node_type: memory
  type: reference
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-08-03T04:12:10.526Z
---

★260803 스토리북 3층 위계(Component/Module/Page)를 게이트로 고정.

**판단 기준(SSOT·한 줄)**: 형제 컴포넌트/모듈을 **조합(import)하면 `Module/`(합성 UI), 순수 원시면 `Component/`(atom)**. `src/modules/` 폴더는 무조건 Module/. 위계는 물리 폴더가 아니라 **스토리 `title` 접두사**로 표현(폴더 이동 없이 title만).

**재분류 결과**: Component 56(atom) / Module 25(합성 18 승격 + 기존 modules 4 + slot 3: ContactPicker·CardImage·ScreenEmpty) / Page 50. 승격 = 시트·헤더·카드·네비·리스트류.

**게이트 = `storybook/check-hierarchy.mjs`** (npm run gate 편입·prebuild 자동 선행·빌드 FAIL로 차단):
- composite(형제 import>0)인데 `Component/` → FAIL(드리프트 주범)
- 비표준 3레벨 title(`Component/Atom/`·`Molecule/`) 금지 · `src/modules/`=Module/ 강제
- 예외: `ATOM_ALLOWLIST`(폼·오버레이 원시 Input·Textarea·Checkbox·FieldLabel·Modal·CardBilingualField) · `MODULE_ALLOWLIST`(slot 컨테이너 ScreenEmpty·CardImageFrame). **새 예외는 반드시 이 목록에 등록**.

**★함정 — flow가 참조하는 컴포넌트 story id 보존**: TutorialSheet·ProfileMethodSheet는 `_screen_links.json`(BS_TUTORIAL_*)이 `component-tutorialsheet--*` id로 렌더. Module 승격 시 title만 Module/로 바꾸고 **meta에 `id: 'component-*'` 명시해 story id 보존**(안 하면 module-* 로 바뀌어 flow 파손). [[reference_cnote_flow_player]] [[feedback_cnote_front_git_scope]]
