---
name: project_cnote_v06_onboarding_jit
description: CNOTE v0.6 — 온보딩 점진 프로파일링(가치먼저·JIT)+홈 2레이어+사람 탭 재설계. v0.5 동결 후 기획측 완료·배포
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-28T09:29:49.966Z
---

★260727 CNOTE **v0.6**(v0.5 동결 `_versions/v5_홈풍성화완결_20260727` 후 작업트리). 계획 정본=`_WORK_PLAN_온보딩_점진프로파일링_260727.md`(⓪~⑦+부록2 스펙). 공통 줄기=**서비스 방향 명확화**: 홈=AI 추천 유일무대 / 사람=인맥+빠른연락 / 온보딩=가치먼저·적시입력.

**기획측 완결·배포(260727)**: 게이트 PASS(device 150키·미커버0·막다른길0)·라이브 검증 3/3.
- **온보딩 JIT**: 가입→인증→`SCR_NAME_QUICK`(이름 1칸·건너뛰기, ★카피=발신 이름 실사용 안내+정중 비서톤 "실제 업무에서 쓰시는 성함으로 부탁드립니다")→`SCR_HOME|seed`(씨앗 홈=예시카드 4종: recontact/company-news/recording/calendar, 각각 적시 입력 진입점)→액션 시 `BS_INFO_NEEDED`(**명함 등록 1순위 fill**·직접입력 2순위·다음에). 직접입력=`SCR_PROFILE_CONFIRM` 경량 재편(필수 이름·회사·직책, "더 빠른 방법(명함)" 카드 **최상단 fill 승격**). **SCR_START_PICK 삭제**(씨앗 홈 흡수, nav_map 7건 재이주·_required_ids 제거).
- **3단계 점진(비차단)**: ①기본정보 ②연락처 ③직장+자소. WGT_PROFILE_PROGRESS(1/3 힌트·비압박).
- **홈 2레이어**: 미완작업(구 CARD_DRAFT_NOTE 카드) 본문 제거→최상단 `WGT_WORK_STRIP`(0건 비노출)+아침푸시·알림 이관. MY_TIMELINE=최하단 매몰→히어로 아래 앵커행 승격(히어로화 안함·260715 절제 유지).
- **사람 탭**: 추천순/전체 세그먼트 제거(AI 큐레이션→홈)·`WGT_FAVORITES_STRIP`(★순수 즐겨찾기=사용자 핀만, "최근 맥락 우선순위" 선정기준 금지—홈 재중복 방지)·가나다 전량(구 directory 흡수·삭제)·행 인라인 ACT_CALL/SMS/EMAIL 고스트+★토글·`chk-badge`(중립)+필터칩→`SCR_PERSON_LIST|needs-check`(구 SCR_INFO_INCOMPLETE 1차 승격). memory 필터 유지.
- **킷 CSS 신규**: .seed-card/.seed-eyebrow(🌱예시 tint+저채도=figure-ground)/.progress-hint/.work-strip/.fav-strip/.row-actions/.chk-badge/.filter-chip.

**함정·학습**:
- BS 시트 추가 시 **build_prototype EXTRA 화이트리스트 등록 필수**(BS_CARD_CONTROL·BS_INFO_NEEDED 둘 다 이걸로 놓쳤었음). 신규 화면은 **flows 스텝**이어야 jumpTo·커버리지 작동(핫스팟 to만으론 무반응).
- bs-wrap 블록의 **파일 내 위치=문맥**(BS_CARD_CONTROL은 quiet 뒤·BS_INFO_NEEDED는 seed 뒤) — 사용자가 어긋남 지적.
- 미드파이 인라인 액션 이모지=임시(컬러) → 스토리북2 SVG 교체 지시됨.
- 눈검증=Playwright(`npx playwright screenshot` + file://#해시 딥링크, chromium 설치됨).

**추가 반영(260727 후반)**: ①`SCR_HOME|seed-partial`(혼합 상태: 완료 씨앗→실카드 상단 승격·남은 씨앗 하단 "이런 것도 열 수 있어요"·4/4=자연 졸업). ②할 일: BS_TASK_EDIT 메모 필드(1000자)+`BS_TASK_COMPLETE` 신설(체크 탭→요약+편집/완료하기, 완료 모션=페이드아웃+하위 카드 올라붙음·완료행 disabled 강화=스토리북2). ③**GNB 1depth 헤더 통일**: 홈·사람·할일·설정 15헤더=[일정][검색][알림] 고정, 마커 `BTN_HEADER_CALENDAR/SEARCH/NOTI` 표준(2depth 제외). ★스윕 함정=BS 시트 dimmed 배경에 오삽입(1차 device만 cur 갱신하는 버그)→감사로 10건 제거.

**★v0.6.1 온보딩 첫인상 강화(260727·계획=_WORK_PLAN 확장사이클E)**: ①NAME_QUICK 건너뛰기 삭제(이름 필수). ②**신규 SCR_WELCOME**(이름 직후·한 화면): 가입 환영 히어로+"명함 등록하면 회사 뉴스" 이득소구(회사소식 예시 인포그래픽)+명함 필수등록 fill/[명함 없이 직접입력]폴백→PROFILE_CONFIRM. 회사소식 씨앗 여기로 이관. ③**씨앗 홈 4→3카드**(음성기록/연락처연결(재접촉+지인명함)/일정·할일)+각 카드 이득소구 3구성=.seed-title(기능명)+.seed-value(가치문장 primary)+.seed-info(인포그래픽:파형·127→12노드·미니캘린더)+.seed-result(채워진 결과예시·값안가림). 프로필힌트 제거(명함=WELCOME완료). CTA 직접진입(RECORDING/RECONTACT_INTRO/CALENDAR_ADD). ④seed-partial 남은씨앗 recording+calendar. ⑤PROFILE_CONFIRM 프로필사진↔명함카드 순서교체. ★인포그래픽 비주얼크래프트=스토리북2(보험앱 건강정보 대시보드 수준·유치금지). 게이트 99화면·미커버0. 저널 핸드오프 발행(14:30Z). ★사용자 방침=화면설계는 "개선 다 전달"할 때까지 이해단계 유지 후 일괄 계획→실행.

**★v0.6.2 대규모(260728)**: ①GNV **사람→인맥** 전면(하단네비·제목·flows 85곳). ②음성 씨앗 AI 배지. ③인맥탭 즐겨찾기 '밀접한 관계' 타이틀. ④**할일 재구조화**: 기간필터칩+체크박스 제거+카드탭→BS_TASK_EDIT(완료 상태 라디오 진행중/완료 추가)·**BS_TASK_COMPLETE 전량 폐기**(device·flows·nav·links·EXTRA). ⑤★★**튜토리얼 허브 모델**(SCR_HOME|seed-partial 전면 재작성): 인라인 남은-씨앗 폐기→첫 액션(또는 seed '둘러보기') 후 홈=크롬복귀+3층(①WGT_TUTORIAL_PROGRESS 진행바→BS_TUTORIAL_HUB ②내 활동 추천=CARD_AFTER_MEETING 실카드 ③오늘의 브리핑). **BS_TUTORIAL_HUB 신규 바텀시트**(EXTRA 등록·남은 튜토리얼 앞/완료 disabled 맨뒤). 4/4 완료→진행바 소멸→순수홈. ⑥seed '둘러보기' 이탈구. 게이트 99화면·미커버0. ★사용자 방침 재확인=이해단계 유지 후 "실행" 신호 시 일괄. changelog v0.6.2. 저널 핸드오프(02:00Z).

**★v0.6.3(260728)**: ①홈 헤더 인사 '오늘의 브리핑'→'홍길동님, 반가워요'(홈 전반·섹션라벨 유지). ②**날짜 네비게이터**(홈 전반): 헤더 날짜(밑줄+▾) 탭→**BS_DATE_PICKER**(신규 달력 바텀시트·EXTRA 등록)→**SCR_HOME|dated**(신규: 그 날 추천만·헤더 [오늘] 복귀버튼·빈날 조용). ③seed-partial 내 활동 타임라인→내 활동 추천 바로 아래 승격. 게이트 100화면·미커버0.

**★v0.6.4(260728)**: 명함 결과 액션 맥락 분기 — SCR_CARD_RESULT|normal=내 명함(등록 4종→이 정보로 등록+직접입력 2개, 인물등록/이인물갱신 제거·설정 재스캔 시 '내 프로필에 반영'→설정 치환), **|person 신설**=상대 명함(이 인물 정보 갱신/새 인물로 등록 택1+직접입력·BANNER_PERSON_MATCH·매칭없으면 배너숨김+신규단일). 온보딩 flow normal '인물로 등록' 핫스팟 제거. 게이트 101화면·미커버0.

**★v0.6.5(260728) 설정 IA 재편**: GNB 4번째 탭 **'설정'→'마이'** 승격(라벨 89곳·12파일 스윕·탭 목적지 SCR_SETTINGS→SCR_SETTINGS_ACCOUNT). **SCR_SETTINGS_ACCOUNT=마이 탭 루트**(헤더 '마이'+우상단 ⚙설정 기어 BTN_HEADER_SETTINGS→SCR_SETTINGS·백버튼 제거·★ID/스토리북 키 page-scr-settings-account--default 유지). **SCR_SETTINGS=2depth**(←뒤로 BTN_BACK→마이·1depth 통일헤더 [일정검색알림] 제거·프로필 히어로 BTN_SETTINGS_ACCOUNT_ENTRY 삭제). **로그아웃·계정탈퇴=마이→설정 최하단 '계정' 섹션 이관**(BTN_LOGOUT/WITHDRAW 스코프 SCR_SETTINGS로). 마이 '연결된 메일' 요약 제거(중복: 기본이메일=프로필필드 존재·데이터연동 정본=설정). 역할분리=마이(신원·프로필·명함·회사·소식·소셜계정)/설정(데이터연동·알림·테마·보안·내보내기·로그아웃·탈퇴). 헤더 통일 정본에 **마이 탭 예외**(기어). 4결정 사용자확정(권장/마이/권장/권장). 게이트 101화면·미커버0·눈검증 PASS·배포완료. 계획=_WORK_PLAN_설정_마이_IA재편_260728. device 역반영(⚙아이콘화·2depth전환·로그아웃이관)=스토리북2. ★함정=GNB 라벨스윕은 `<div class="ic"></div>설정</div>` 정확문자열 치환(nav 전용)·2midfi_10~12는 `2midfi_0*` glob에 안 잡힘(전체 glob 필요). Playwright 엘리먼트샷=npx 캐시 node_modules를 NODE_PATH로(로컬 미설치).

**★v0.6.6(260728)**: ①설정 2depth GNB 정리 — SCR_SETTINGS+하위 15화면 bottomnav 제거('탭바=1차 대메뉴만' 정책·[[project_cds_nav_meta_policy]]), 탭루트 마이만 유지(08_settings.html 스크립트=phone별 nav 소유주 판정 후 ACCOUNT 제외 제거). ②인물 상세 중복알림 제거(**A안 확정**)=ctx-banner(CARD_CONTEXT_CTA '제안서 피드백…할 일로 등록') 삭제·긴급도는 약속할일 '오늘'배지 흡수(중복+근접붕괴+CTA모순 해소·배선무변). ③인물 프로필 카드 sticky=position:sticky;top:0+data-behavior=STICKY_TOP(normal·both-sides)·collapse/모션=스토리북2. 게이트 101화면·미커버0·눈검증PASS·배포. changelog v0.6.6. ★미드파이 sticky는 단독렌더(고정높이 컨테이너 없음)선 정지동작 미표현→디바이스프레임서만 확인.

**★v0.6.7(260728) 온보딩 첫 녹음 가이드 모달**: 신규 **BS_RECORDING_COACH**(bs-wrap·02_meeting_flow.html·SCR_RECORDING 뒤). 씨앗홈 '첫 미팅 정리해보기'(온보딩 seed 녹음)→SCR_RECORDING 진입 직후 자동 등장. 막연한 첫 녹음→추출불가 방지. 예시 대본+추출 미리보기로 의미있는 첫 녹음 유도. ★타이포=히어로 대본 20px·절 3줄(1줄1호흡)·**word-break:keep-all**(한글 어절보존 필수·22px땐 '만/났어요' 깨짐)·3색 하이라이트(인물#4127D1/일정#0e7c86/할일#b0500f)↔칩 매칭. CTA=🎙녹음시작(BTN_COACH_START_REC→SCR_RECORDING)/취소(BTN_COACH_CANCEL→SCR_HOME|seed). ★전이버그 수정(스토리북2 260728): device emit screen을 BS_RECORDING_COACH로 명시해야 nav_map 매칭(안 하면 컨트롤 없는 화면 머묾)·secondary 직접말할게요(중복)→취소 분리·미드파이 정합. ★flows/nav_map=기획 정본(스토리북2 라이브버그 직접수정→기획 수락, 향후 journal 요청 권장). 배선=seed만(일반 녹음 진입 제외)·nav_map SCR_HOME|seed|recording|BTN_SEED_TRY→코치·EXTRA 등록·flows 코치스텝. 게이트 101+보조20·미커버0·눈검증PASS·배포. changelog v0.6.7. 계획=_WORK_PLAN_녹음가이드모달_260728. 등장모션·프리미엄크래프트·3색토큰화·온보딩1회상태=스토리북2.

**★v0.6.8(260728) 스토리북2 회신 결선**: device 회신 6건 트리아지. 【역반영】SCR_NAME_QUICK 카피 간소화(사용자 직접 지시)=안내 2문장+실명유도는 입력칸 헬퍼(HELPER_MY_NAME)로 이동. 【승인】person 등록→SCR_PERSON·마이 아이콘 UserCircle·RADIO_STATUS_* 정본 승격·헤더 슬림화(title-lg, RN 잘림픽스=미드파이 무변). 【표현=스토리북2 정본·무액션】SeedCard v5.1·풀블리드 가로스크롤·히어로 일러스트 3종·사람탭 압축. 【결정보류】BS_INFO_NEEDED=존치(씨앗 직접진입化+WELCOME 명함필수로 트리거 약화, 프로토타입 flows 경로 잔존·폐기는 사용자 확정 대기·파괴적). 게이트 101+보조20·미커버0·눈검증 PASS·배포. changelog v0.6.8.

**★v0.6.9(260728) 마이 상단 아이덴티티 히어로**: 마이(SCR_SETTINGS_ACCOUNT) 좌측 '내 명함' 카드→중앙 정렬 히어로(CARD_MY_HERO·현대카드 마이 번안): 큰 아바타+'프로필 사진 등록' pill+큰 이름+회사·직책+시작메타+**자산 행 4**: 인맥127→PERSON_LIST · **명함=상태**(단수구조라 카운트X: 등록후'확인'→SCR_CARD_RESULT/등록전'등록'→SCR_CARD_SCAN) · **노트**48→MY_TIMELINE(구'기록') · 할일3→TASK_LIST. 시작메타('CNOTE와 함께') 삭제. 내 정보=CARD_PROFILE_INFO 재구성(연락처 신규+eyebrow). 구 CARD_MY_BUSINESS_CARD 폐기. 히어로 프리미엄크래프트·인맥/노트/할일 실데이터·명함 조건부상태변형(hasMyCard)=스토리북2. 게이트 101·미커버0·눈검증PASS·배포. changelog v0.6.9.

**★v0.7.0(260728) 명함 양면 결과 폼 재설계**: SCR_CARD_RESULT|both-sides '앞면/뒷면' 물리적 면 그룹 폐기(카드마다 배치 달라 무의미)→**의미 필드 통합**. CARD_FRONT/BACK_FIELDS 삭제→**CARD_BASIC_FIELDS**(이름·회사·직책 FIELD_NAME/COMPANY/POSITION)+**CARD_CONTACT_FIELDS**(전화·이메일·주소). ★국/영문=필드레벨 병합(INPUT_NAME/COMPANY 한 셀에 국문 주값+영문 보조 서브라인+'영문' 배지·영문값 보존). 연락처=언어무관 단일. FIELD_ADDRESS 확인필요 배지. 면 출처=상단 썸네일만. 단면=양면 폼 로직 통일. 스토리북2=both-sides 재작성·양면 다른값 나열+주값라디오·영문 조건부렌더. 게이트 101·미커버0·눈검증PASS·배포. changelog v0.7.0.

**★v0.7.1(260728) 노트 모아보기(B안 임시)**: '녹음 저장분 전용 공간 없음' 지적→전용 노트함(A안) 대신 저비용 B. 신규 **SCR_MY_TIMELINE|notes**(2midfi_10): 노트 칩 사전선택+'48개의 정리 노트'+노트카드 3(미팅/개인메모/통화=녹음정리 기반·이메일 제외)→NOTE_DETAIL. 마이 BTN_STAT_NOTES data-link/nav_map→SCR_MY_TIMELINE|notes·flows notes스텝+마이 진입핫스팟·build_flow_nav 재생성. ★사용자 flow.html로 테스트→nav_map/_flow_nav 최신화 필수(build_flow_nav). '노트'범위=정리노트(이메일 제외). 전용 노트함 A안=백로그. 게이트 102·미커버0·눈검증PASS·배포. changelog v0.7.1.

**★v0.7.2(260728) 명함플로우 정합**: 스토리북2 명함 검토 device 반영(#3/#5/#6) 기획 정합. 【#5 직접입력 제거】CARD_RESULT normal/person/both-sides '직접 입력으로 전환' 3버튼+loading disabled+flows/nav_map 핫스팟 삭제. ★근거=**명함 없는 사람=인물 추가(SCR_PERSON_ADD→직접 입력→PERSON_ADD_FORM) 또는 WELCOME서 분기하는 독립 경로 존재**→카드 결과 직접입력은 중복(사용자 재확인). 【#3 CardScan】중복 촬영하기 버튼 제거(뷰파인더 BTN_CAPTURE 탭=촬영)·직접입력 제거·갤러리에서 선택 승격. 【#1 NAME_QUICK】소셜 이름 프리필 헬퍼('카카오 계정 이름 불러옴'). 【#6】앞면 다시 찍기=이미 정합. 【#2 WELCOME 카피】스토리북2에 구체 확인 요청(정보 부족). 게이트 102·미커버0·눈검증PASS·배포. changelog v0.7.2. ★배선 경계=flows/nav_map 기획 정본(스토리북2 요청 A로 수신→기획 정합).

**남은 것**: 스토리북2 회신 대기(v0.6~v0.6.4 device·인포그래픽·달력·person 매칭 조건부·전환/완료 모션). 계획서 정본=_WORK_PLAN 확장 E(E-3-1~3-9). ★사용자 방침=화면설계는 "실행"신호까지 이해단계 유지.(저널 kickoff 260727: 신규 device 3종·사람탭 표현·씨앗→실카드 전환 모션·SVG 아이콘·초성 인덱스바). IA 엑셀·인벤토리·로파이에 NAME_QUICK 등재(sync-check 경고). 알림 매트릭스 "아침 정리 대기" 추가. [[project_cnote_v05_home_company_news]] [[project_cnote_design_reconciliation]]
