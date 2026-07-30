---
name: project-cnote-wireframe-html
description: CNOTE 로파이 HTML 와이어프레임 제작 방식·산출물 위치·커버리지 검증 게이트
metadata: 
  node_type: memory
  type: project
  originSessionId: 1eb6668f-19d8-4993-a54f-2430e5f07c0f
---

CNOTE(260610_C-Level_note) 와이어프레임은 **lo-fi HTML 단일 소스** 방식으로 제작됨(2026-06-22). UI 디자인 *전* 단계의 정보구조(IA) 레이어.

**산출물 위치**: `03_projects/260610_C-Level_note/02_design/screen_design/` (HTML 파이프라인 전용 폴더 · 단계 접두어 체계 + `README.md` 지도). 기존 `wireframes/` 폴더와 분리함
- `_kit.css` — 로파이 회색조 스킨(룩 단일 관리)
- `1lofi_01_home`~`1lofi_09_delegate_tablet_2.html` 9개 묶음(화면 45 + 푸시 12). check/list 스크립트는 `1lofi_*`만 스캔
- `_manifest.md` — 커버리지 정본 74개 체크리스트
- `check-coverage.mjs` — Tier 1: data-* 추출해 74개 인벤토리 ID 대조(누락 시 exit 1)
- `list-elements.mjs` → `_elements.md` — Tier 2 안전망: 화면별 전체 요소(gate+aux) 자동 추출. 와이어프레임 수정 시 재실행. 디자인 핸드오프 누락 방지(보조 aux 46종 추적)
- `_progress.md` — 제작 ledger

**AI 인식 컨벤션(핵심)**: 화면=`data-screen`/`data-stage`/`data-state`, 컴포넌트=`data-component`(반드시 인벤토리 ID만 — 보조요소는 `data-aux`), 슬롯=`data-priority="1|2|3|hidden|fallback"`. data-priority가 인벤토리 3장 데이터 노출 매트릭스(1순위/숨김/대체)와 1:1.

**정본**: `01_docs/AI_Designer_Screen_Pack_v1.md`(인벤토리 v5). Gemini 3.5가 1차 정리한 `와이어프레임_설계서_01~05.md`는 화면 서술 초안 참고용(PNG 목업은 폐기 방향).

**설계/계획 문서**: `01_docs/2026-06-22_wireframe_method_design.md`(스펙), `..._implementation_plan.md`(구현계획).

**커버리지 보증**: 화면 22 + 컴포넌트 30 + BS·PUSH 22 = 74개 누락 0건 자동 검증 통과.

**기본 UI(미드파이)**: `_midfi_kit.css` + `2midfi_01~05.html`(1차 14화면 baseline, 회색조). 사람용 베이스라인 참조(게이트 아님). `2midfi_00_compare.html`=lo-fi↔mid-fi 비교(인라인 스타일 자립). 디자인 브리프=`3brief_*.md`.

**주의(미해결)**: 원래의 `02_design/wireframes/` 폴더에 기존 PNG 와이어프레임 55장(`WF01~37`/`EX01~11`/`WGT01~07`) 잔류 — HTML 파이프라인과 출처·연계 미확인. 구(舊) 방식일 가능성. 정리/폐기는 사용자 확인 필요(HTML 산출물은 screen_design/로 이미 분리됨).

**디자인 컨셉(확정)**: CNOTE 무드 = **모던 프리미엄**(고급·절제·신뢰·세련, 2026 트렌드). 솔리드 면+소프트 섀도우(깊이감), 큰 라운드(16~24px), 넉넉한 여백, 정제된 타이포 대비, 뉴트럴+딥인디고#2A3FEC 포인트. 올드 안티패턴(얇은 보더만·빽빽·작은폰트·평면) 회피. 시니어 가독성 우선. 브리프에 필수 포함.

**UI 디자인 전략(확정)**: 도구는 **Claude 디자인 + Google Stitch**(생성형). 기본 UI를 AI에 **기본 미전달**(레이아웃 다양성 보존), 필요시에만 "이해용·복제 금지"로 전달. AI엔 **화면별 디자인 브리프**(목적+콘텐츠+우선순위+상태+CNOTE UX제약: 시니어UX·48dp·딥인디고#2A3FEC·3중표기·추측데이터억제)를 전달, 생성된 시안은 lo-fi/`_elements.md`로 누락 검증. 미드파이는 생성형 도구 품질에 기여 안 함(브리프·반복이 품질 좌우).

**다음 단계(핸드오프)**: UI 디자인/Figma·[[project-cnote-figma-storybook-sync]] 단계에서 각 와이어프레임 `CARD_*`를 Storybook 프리미티브로 합성. 와이어프레임 단계에선 디자인시스템 미반영(고도 분리). 보류 Minor: 03파일 케이스 번호 중복, 문서화 주석.
