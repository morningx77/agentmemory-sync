---
name: reference-figma-section-relative-coords
description: Figma SECTION 자식의 x/y는 섹션 원점 기준 상대좌표(PAGE 자식 절대좌표와 다름) — 섹션 배치 함정
metadata: 
  node_type: memory
  type: reference
  originSessionId: bccc86de-297c-4b84-91df-91629bde597f
---

**Figma SECTION 노드의 자식 x/y는 "섹션 원점 기준 상대좌표"다** — PAGE 직속 자식의 절대(캔버스) 좌표와 다르다. `use_figma`로 섹션에 `appendChild` 한 뒤 자식을 **절대좌표라 생각하고** x=26176 식으로 놓으면 실제 위치 = 섹션.x(25776) + 26176 ≈ **abs 51952** 로 섹션 밖으로 튕긴다.

**증상**: 섹션 박스는 비어 보이고(선택 시 childCount는 N인데) 화면들이 격자 모양은 유지한 채 통째로 우측/아래로 이동해 있음. get_screenshot(섹션)의 `original_width`가 섹션 실제 폭과 불일치(자식 abs 최대치까지 렌더).

**올바른 배치**: appendChild 후 **로컬좌표(섹션 원점 기준, 여백부터)**로 x/y 설정. 검증은 `child.absoluteBoundingBox.x` 가 `section.absoluteBoundingBox.x ~ +width` 범위 안인지 확인(단순 `child.x` 비교 금지 — 그건 로컬값이라 착시).

**CNOTE 실측(260708)**: WORKSTAGE2 섹션(1954:4909, abs x25776 y-1697, 9290×7928)에 완료화면 11개 배치 시 발생. 로컬좌표(여백400·gap340, 설정 row1 y=400 / 사람 row2 y=4400)로 재배치해 해결. 상세=[[project_cnote_settings_people]] 핸드오프 _cds_handoff_사람_260708.

★이 사건은 [[feedback-visual-verification]] 안티패턴 재발이기도 함: 첫 렌더의 "폭 34666·좌측 빈공간" 이상신호를 "섹션 렌더 아티팩트"로 **성급히 기각**했다가 사용자 눈에 잡힘. 렌더가 예상과 다르면 툴 탓 하기 전에 실제 원인부터 실측.
