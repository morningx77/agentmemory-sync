---
name: project_cnote_card_import_theme
description: CNOTE 명함 일괄 등록/내보내기 + 화면 테마 신규 3화면 완료
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-20T09:25:12.111Z
---

★명함 일괄 등록/내보내기 + 화면 테마 신규 3화면 완료·배포·라이브실측(260720).

**신규 화면**: `SCR_CARD_IMPORT`(3상태 intro/preview/result, 2midfi_12_notify_add_search) · `SCR_CARD_EXPORT`(2탭 normal/file-manage, 2midfi_08_settings) · `BS_THEME_PICK`(바텀시트 라디오3 시스템/라이트/다크, 08_settings).

**진입**: ①일괄 등록 = SCR_PERSON_ADD "여러 명 가져오기"(★기존 CARD_ADD_ROUTE_BULK가 이미 설계돼 있어 data-link 연결만 추가). SCR_PERSON_ADD는 12_notify_add_search 소속(04 아님). ②내보내기·③테마 = 설정 허브(08) 신규 2행(BTN_SETTINGS_EXPORT_ENTRY·BTN_SETTINGS_THEME_ENTRY).

**참고**: 리멤버 명함첩 엑셀 = 13열(회사·이름·부서·직함·이메일·주소·전화·팩스·휴대폰·등록일·명함첩이름·그룹·메모). 내보내기 UX = 리멤버 "파일로 내보내기" 2탭(파일 생성/파일 관리·30일 보관·유효기간) — sample=02_design/sample/img_6152·6153.

**4결정(260720)**: ①중복=이름+휴대폰 매칭 건너뛰기 기본 ②컬럼=자동 인식(13열 고정) ③범위=전체 인물 ④테마=바텀시트 심플플로우(별도화면 아님).

**개발 전달(디자인 밖)**: 엑셀 파싱/생성 엔진·샘플 xlsx·비동기 생성·30일 보관·다운로드 URL·중복 판정·테마 토큰 스위칭(prefers-color-scheme, 다크 토큰 기존 존재=코드 SSOT).

**등록**: _required_ids(screen2+bspush BS_THEME_PICK)·flows(people·settings)·_nav_map(6줄)·IA 행90~92·build_prototype EXTRA(BS_THEME_PICK). 게이트 62/62·미커버0 PASS. 계획서=_WORK_PLAN_명함일괄_테마_260720. [[reference_cnote_bottomsheet_style]] 준수.

★**리멤버 카피 차별화(260720)**: 사용자 지적("Export가 리멤버와 똑같아 카피 우려")→**관계수 히어로 시그니처**로 차별화. CardExport=2탭(리멤버 지문) 폐기→단일 스크롤·"내보낼 명함첩 127명" 히어로 리드·형식 정적필드(1옵션 드롭다운·Select 스태킹버그 회피). CardImport result=관계자산 증가 히어로(127→134명, Export 현재자산과 대칭=가져오기는 인맥 증가). **차별화 원칙=계약(정보구조) 유지·표현(레이아웃)만 CNOTE 정체성(관계 자산으로 리드)**. 스토리북이 Export 선재디자인→기획 미드파이 역동기화(design reconciliation). Import는 기획 선차별화→스토리북 RN 반영 요청. TAB_ 마커 폐기. [[project_cnote_premium_craft]]. Select RNW 스태킹버그(z-index)=dev 별도수정 백로그.
