---
name: project_cnote_brand_tieming
description: CNOTE 앱의 서비스명=Tieming(대화 기반 인맥관리 서비스) 확정·스플래시 신설(v0.9.0)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-30T05:48:10.593Z
---

★260730 CNOTE 앱의 **서비스명 = Tieming** 확정(사용자). 'tie'(인맥 연결) + 대화 기반. **★일괄 리네임 실행**: screen_design_v2 전 설계 소스(2midfi_*·docs·flow.html·link.html·scripts·data/*.json)에서 **대문자 'CNOTE'→'Tieming'** 치환(115건). **★소문자 'cnote' 인프라는 보존**(Firestore `cnote-64d56`·git repo `cnote-front`·폴더 `260610_C-Level_note`·배포경로) — 대문자만 치환해 자동 분리. CLAUDE.md·memory·01_docs(내부 repo 문서)는 미치환(내부명은 CNOTE 유지 가능·필요시 별도). **태그라인 = "대화 기반 인맥관리 서비스"**. (CNOTE=내부/repo 명, Tieming=대외 서비스명.)

**스플래시 신설(v0.9.0)** SCR_SPLASH(2midfi_01_onboarding·온보딩 최전방→SCR_SIGNUP): 브랜드 딥 바이올렛 그라디언트(#4127D1→#2E1580→#221058)·대면적 상단 광원·**5노드 네트워크 모티프**(원 언어·72° 방사·센터 흰노드+5방사노드·상단노드 골드 #F2DB10 accent ≤5%)·워드마크 Tieming(42px 800)·태그라인·하단 ISPARK. statusbar도 브랜드색 full-bleed. flows 첫 step·nav BTN_SPLASH_CONTINUE→SCR_SIGNUP. changelog v0.9.0. 게이트 106화면·미커버0·눈검증 PASS. 로고 모션·자동전이·전용 로고타입=스토리북2/개발(저널 전달). **미결=SCR_SPLASH BI 최종안 선택**(5노드 네트워크/A.bars 이퀄라이저/B.wave 물결 — 스토리북2가 biType으로 A/B 시안 병렬 제작, 사용자 선택 대기).

**★온보딩 재설계(v0.9.2)** — 이메일 가입에 '메일주소 입력' 화면이 없어 인증코드로 바로 점프하던 결함 해소. **신규 SCR_SIGNUP_EMAIL**(2midfi_01): [이메일로 계속하기]→**이메일 주소(name@company.com)+이름('어떻게 불러드릴까요') 한 화면 통합**(구 SCR_NAME_QUICK 흡수·둘 다 필수·이름=메일/문자 초안 발신명)→[인증 메일 보내기]→SCR_SIGNUP_VERIFY→SCR_WELCOME. **SCR_NAME_QUICK 삭제**(이메일 경로 흡수·소셜 경로 생략). **소셜(구글·카카오) 간소화**: 플랫폼 OAuth가 인증·이름 처리→앱 이메일인증·이름입력 생략, BTN_SIGNUP_GOOGLE/KAKAO→바로 SCR_WELCOME. **SCR_WELCOME [나중에 하기] 추가**(BTN_WELCOME_LATER→SCR_HOME|seed·명함 등록 건너뛰기). nav_map/flows 재배선. 게이트 163키·미커버0·눈검증(SCR_SIGNUP_EMAIL·SCR_WELCOME) PASS. changelog v0.9.2·인덱스 갱신. 저널로 스토리북2 story 요청 전달.

**★프로필 등록 흐름 재설계(v0.9.3)** — SCR_WELCOME 버튼 [명함 등록하고 시작]→**[프로필 등록하기]**(BTN_WELCOME_REGISTER→BS_PROFILE_METHOD), '명함 없이 직접 입력' 삭제, [나중에 하기] 유지. **신규 BS_PROFILE_METHOD**(바텀시트·명함 등록/직접 입력하기 2택, build_prototype EXTRA 등록 필수). **신규 SCR_CARD_RESULT|manual**(직접 입력=상단 명함 촬영 CTA 카드[BTN_SCAN_TO_FILL→CARD_SCAN·촬영 자동채움]+하단 빈 폼). **SCR_CARD_RESULT 폼 통일**: 부서 필드 추가→이름·회사·부서·직책·전화·이메일(normal·manual 동일). **SCR_PROFILE_CONFIRM 폐기**(전 소스 제거: mid-fi·flows·nav·_required_ids·1lofi_01; NAME_QUICK 삭제 선례 준수)→상세 프로필=마이 SCR_PROFILE_EDIT. 게이트 162키·미커버0·눈검증 4종 PASS. 저널로 스토리북2 story(BS_PROFILE_METHOD·CARD_RESULT manual·ProfileConfirm 스토리 삭제) 요청. [[reference_cnote_menu_order_ssot]]

**★녹음 가이드 이관(v0.9.4)** — 튜토리얼 바텀시트 대본을 외우기 어려움 → 녹음 화면에서 읽으며 녹음. **신규 SCR_RECORDING|coached**(온보딩 첫 녹음 전용·2midfi_02): 무음 안내(HINT_RECORD_LIMIT) 자리에 예시 대본 크게(GUIDE_SCRIPT 22px·3색 하이라이트 김대표님/다음 주 수요일/제안서), 무음60초·30분은 작게 강등. 일반 녹음(normal)엔 미노출. **BS_RECORDING_COACH 전환**: 큰 대본 제거→'녹음 화면의 문장을 따라 읽어보세요' 안내+칩 유지. nav BS_RECORDING_COACH|BTN_COACH_START_REC→SCR_RECORDING|coached(coached 버튼은 기존 SCR_RECORDING|BTN_* 재사용). ★사용자 방침=가이드는 **온보딩에서만**. 게이트 163키·미커버0·눈검증 PASS.

**★AI 정리 결과 화면 9건 개선(v0.9.5·SCR_NOTE_RESULT|normal·2midfi_02)** — ①중복 배너(BANNER_CONTEXT_STAGE) 제거 ②'AI 정리 요약'→'요약' ③할일 체크박스 제거 ④요약 제목(SUMMARY_TITLE) 추가 ⑤할일 일정유도 칩(CHIP_TASK_DATE·미설정=점선 CHIP_ADD_TASK_DATE) ⑥'일정 후보'→'다음 일정 예약' ⑦일정 추가 버튼(BTN_ADD_SCHEDULE) ⑧할일 인물유도 칩(CHIP_TASK_PERSON·미연결=점선) ⑨하단 인물 연결하기(BTN_LINK_PERSON) 삭제→요약 섹션 인물 자동연결(AREA_LINKED_PERSON·수정·＋인물추가). ★personal 상태는 수동 인물연결 버튼 유지. SUMMARY_EDIT_MODE 기본 접힘 정리. 칩=점선(유도)/솔리드(설정) 2종. 게이트 163키·미커버0·눈검증 PASS.

**★씨앗 홈 튜토리얼=큰 바텀시트 흐름(v0.9.6·2midfi_03)** — 튜토리얼을 전체화면 이동 대신 큰 바텀시트 팝업으로. **신규 3종**(bs-dimmed min-height:84vh·flex column·하단 CTA 고정): BS_TUTORIAL_CONTACT(연락처·미니 프리뷰)·BS_TUTORIAL_SCHEDULE(일정·간이폼)·BS_TUTORIAL_TASK(할일·간이폼). 각 BTN_TUTORIAL_DONE/LATER/CLOSE→SCR_HOME|seed-partial 복귀. 씨앗 홈 카드②③④+BS_TUTORIAL_HUB의 BTN_SEED_TRY data-link을 시트로 재배선(구 SCR_RECONTACT_INTRO/CALENDAR_ADD/TASK_LIST 전체화면 폐지). **녹음(①)만 전체화면 유지**(마이크·파형 필요). **재사용 화면(CALENDAR_ADD·TASK_LIST·RECONTACT_INTRO)은 미변경**(다른 탭 맥락). build_prototype EXTRA에 3종 등록 필수. 게이트 163키·미커버0·눈검증 3종 PASS.

**★다화면 개선 배치(v0.9.7)** — #5 씨앗홈 이름 큰 줄(SEED_INTRO SI_NAME 28px). #10 일정추가 유형순서 행사모임·미팅·개인(모임→행사모임)·취소삭제(이탈=헤더←). #11 일정상세 녹음시작 삭제. #13 인물상세 미팅기록추가 삭제. #14 인맥목록 +인맥추가 fill·인물상세 즐겨찾기★(프로필헤더 우상단·골드)·내 메모 카드(CARD_PERSON_MEMO 관계요약 아래). #15 마이 내명함보기→📤명함 보내기(BTN_SHARE_MY_CARD·디바이스 공유·화면없음)·프로필편집 내명함 관리카드(AREA_MY_CARD_MANAGE 프리뷰+크게보기+재촬영). #16 ★보관함 프로세스: [인맥으로 추가]→신규 SCR_CONTACT_ARCHIVE|detail(프리필 상세확인)→[인맥에 추가하기 BTN_ARCHIVE_CONFIRM_ADD]→보관함 복귀(즉시추가 폐지·큐 연속처리). #18 할일 empty 세그먼트 숨김·주CTA=＋할일 직접추가(fill)·미팅정리=보조링크. **★튜토리얼 BS_TUTORIAL_CONTACT→BS_TUTORIAL_CARD**(인맥 명함 등록): [인맥 명함 등록하기]→SCR_CARD_SCAN→CARD_RESULT|person→[등록하기]→SCR_PERSON(종료). 씨앗홈·허브 카드 라벨 갱신. build_prototype EXTRA CONTACT→CARD. 게이트 164키·미커버0·눈검증 PASS. ★#16은 ADD_FORM 재사용 대신 archive|detail 자기완결 상태로(ADD_FORM 6곳 진입 복귀 충돌 회피). [[project_cnote_palette_violet_gold]] [[project_cnote_v08_design_batch]]
