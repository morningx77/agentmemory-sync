---
name: project_cnote_brand_tieming
description: CNOTE 앱의 서비스명=Tieming(대화 기반 인맥관리 서비스) 확정·스플래시 신설(v0.9.0)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-30T02:39:31.627Z
---

★260730 CNOTE 앱의 **서비스명 = Tieming** 확정(사용자). 'tie'(인맥 연결) + 대화 기반. **★일괄 리네임 실행**: screen_design_v2 전 설계 소스(2midfi_*·docs·flow.html·link.html·scripts·data/*.json)에서 **대문자 'CNOTE'→'Tieming'** 치환(115건). **★소문자 'cnote' 인프라는 보존**(Firestore `cnote-64d56`·git repo `cnote-front`·폴더 `260610_C-Level_note`·배포경로) — 대문자만 치환해 자동 분리. CLAUDE.md·memory·01_docs(내부 repo 문서)는 미치환(내부명은 CNOTE 유지 가능·필요시 별도). **태그라인 = "대화 기반 인맥관리 서비스"**. (CNOTE=내부/repo 명, Tieming=대외 서비스명.)

**스플래시 신설(v0.9.0)** SCR_SPLASH(2midfi_01_onboarding·온보딩 최전방→SCR_SIGNUP): 브랜드 딥 바이올렛 그라디언트(#4127D1→#2E1580→#221058)·대면적 상단 광원·**5노드 네트워크 모티프**(원 언어·72° 방사·센터 흰노드+5방사노드·상단노드 골드 #F2DB10 accent ≤5%)·워드마크 Tieming(42px 800)·태그라인·하단 ISPARK. statusbar도 브랜드색 full-bleed. flows 첫 step·nav BTN_SPLASH_CONTINUE→SCR_SIGNUP. changelog v0.9.0. 게이트 106화면·미커버0·눈검증 PASS. 로고 모션·자동전이·전용 로고타입=스토리북2/개발(저널 전달). **미결=SCR_SPLASH BI 최종안 선택**(5노드 네트워크/A.bars 이퀄라이저/B.wave 물결 — 스토리북2가 biType으로 A/B 시안 병렬 제작, 사용자 선택 대기).

**★온보딩 재설계(v0.9.2)** — 이메일 가입에 '메일주소 입력' 화면이 없어 인증코드로 바로 점프하던 결함 해소. **신규 SCR_SIGNUP_EMAIL**(2midfi_01): [이메일로 계속하기]→**이메일 주소(name@company.com)+이름('어떻게 불러드릴까요') 한 화면 통합**(구 SCR_NAME_QUICK 흡수·둘 다 필수·이름=메일/문자 초안 발신명)→[인증 메일 보내기]→SCR_SIGNUP_VERIFY→SCR_WELCOME. **SCR_NAME_QUICK 삭제**(이메일 경로 흡수·소셜 경로 생략). **소셜(구글·카카오) 간소화**: 플랫폼 OAuth가 인증·이름 처리→앱 이메일인증·이름입력 생략, BTN_SIGNUP_GOOGLE/KAKAO→바로 SCR_WELCOME. **SCR_WELCOME [나중에 하기] 추가**(BTN_WELCOME_LATER→SCR_HOME|seed·명함 등록 건너뛰기). nav_map/flows 재배선. 게이트 163키·미커버0·눈검증(SCR_SIGNUP_EMAIL·SCR_WELCOME) PASS. changelog v0.9.2·인덱스 갱신. 저널로 스토리북2 story 요청 전달.

**★프로필 등록 흐름 재설계(v0.9.3)** — SCR_WELCOME 버튼 [명함 등록하고 시작]→**[프로필 등록하기]**(BTN_WELCOME_REGISTER→BS_PROFILE_METHOD), '명함 없이 직접 입력' 삭제, [나중에 하기] 유지. **신규 BS_PROFILE_METHOD**(바텀시트·명함 등록/직접 입력하기 2택, build_prototype EXTRA 등록 필수). **신규 SCR_CARD_RESULT|manual**(직접 입력=상단 명함 촬영 CTA 카드[BTN_SCAN_TO_FILL→CARD_SCAN·촬영 자동채움]+하단 빈 폼). **SCR_CARD_RESULT 폼 통일**: 부서 필드 추가→이름·회사·부서·직책·전화·이메일(normal·manual 동일). **SCR_PROFILE_CONFIRM 폐기**(전 소스 제거: mid-fi·flows·nav·_required_ids·1lofi_01; NAME_QUICK 삭제 선례 준수)→상세 프로필=마이 SCR_PROFILE_EDIT. 게이트 162키·미커버0·눈검증 4종 PASS. 저널로 스토리북2 story(BS_PROFILE_METHOD·CARD_RESULT manual·ProfileConfirm 스토리 삭제) 요청. [[reference_cnote_menu_order_ssot]] [[project_cnote_palette_violet_gold]] [[project_cnote_v08_design_batch]]
