---
name: project_cnote_bulkcard_theme_screens
description: CNOTE 명함 일괄등록/내보내기+화면테마 신규 3화면 RN 조립 완료(260720). 기획 _screen_links 등록 대기.
metadata: 
  node_type: memory
  type: project
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
  modified: 2026-07-20T08:29:18.128Z
---

기획 핸드오프(_WORK_PLAN_명함일괄_테마_260720)의 **신규 3화면 RN 스토리북 조립 완료**(storybook-claude, 260720). 정본 미드파이(2midfi_12·2midfi_08) 계약 기준, 기존 컴포넌트 재사용해 파운데이션 정합 조립. 배포·양모드 눈검증 PASS.

**산출 화면**:
- `pages/CardImport` SCR_CARD_IMPORT 3상태(normal 파일선택·preview 등록요약3배지+인물리스트·result 완료히어로). story=page-scr-card-import--default/preview/result
- `pages/CardExport` SCR_CARD_EXPORT 2탭(Tabs: 파일생성 FieldLabel+Select / 파일관리 생성중·생성됨). story=page-scr-card-export--default/file-manage
- `pages/Settings` +2행(화면테마→BS_THEME_PICK 시트·명함첩내보내기→EXPORT)+BS_THEME_PICK(BottomSheet children+RadioButton3 시스템/라이트/다크). story=page-scr-settings--theme-pick

**정합 처리**: PersonList 진입마커 `BTN_PERSON_IMPORT_BULK`→`BTN_PERSON_BULK_IMPORT`(nav_map 정본). `analytics/analyticsId.ts` AnalyticsId에 `TAB_*`·`OPT_*` 패턴 추가(mid-fi 마커 1:1, 기존 SCR_/BTN_만이라 type-check 실패했었음).

**★미결(핸드오프)**:
1. **기획**: `_screen_links` 파이프키 등록 필요 → SCR_CARD_IMPORT|preview·result, SCR_CARD_EXPORT|file-manage, BS_THEME_PICK=page-scr-settings--theme-pick. 등록 후 flow 재빌드하면 flow player 점프 활성(현재 스토리는 있으나 flow 미연동). 저널 handoff 기록됨.
2. **스토리북2**: MY_TIMELINE 노트항목에 `BTN_OPEN_NOTE_MEMO` emit 추가(개인메모 상세 재열람 flow, nav_map 전방준비 완료) — 개인메모=스토리북2 담당이라 미착수.

관련 [[project_cnote_design_foundation]] [[reference_cnote_bottomsheet_style]] [[reference_cnote_flow_player]] [[feedback_cnote_front_git_scope]]
