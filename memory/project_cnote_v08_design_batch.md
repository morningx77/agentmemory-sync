---
name: project_cnote_v08_design_batch
description: CNOTE v0.8.0 — 사용자 기획 설계변경 4건 일괄(일정등록/캘린더 재구성·홈 카드2종·배치정책·녹음알림 설정이관). 실행·배포 완료
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-29T10:12:25.268Z
---

★260728 CNOTE **v0.8.0** — 사용자 "이해·누적 모드"로 설계변경 4건 수렴 후 "실행" 신호에 일괄 착수·배포. 계획 정본=`_WORK_PLAN_설계변경_260728.md`. 방식=바로 반영 안 하고 계획서 누적→전체 수렴→실행(사용자 방침 §5).

- **#1 SCR_CALENDAR_ADD 재구성**(2midfi_11·normal+meeting-on): 미팅여부 토글 폐기→**일정 선택 라디오 3종(개인/모임/미팅·단순분류)**·**참석자(등록 인맥) 섹션 신규**(비필수·BTN_ADD_ATTENDEE→SCR_PERSON_ADD)·저장캘린더→**연동캘린더 리네임+하단**·장소이탈 녹음알림 제거. 유지=제목/날짜/시간/장소/장소명. meeting-on 변형이 첨부 이미지와 일치.
- **#1-B**: 장소이탈 녹음알림=일정폼 제거→**설정 SCR_SETTINGS_MEETING 전역 토글**(ROW_LOCATION_RECORDING_ALERT·자동임시저장·보관기간 아래).
- **#2 SCR_CALENDAR**: 캘린더→**일정**·부제 제거·**오늘/이번주 탭(VIEW_TOGGLE_TABS) 제거**(날짜별 그룹 단일목록). 2상태.
- **#3 홈 신규카드 2종**(2midfi_03): **CARD_UNREAD_MAIL**(확인 안 한 메일·제목+요약·회신필요/챙길일과 분리·탭→SCR_RELATION_INBOX 재사용·미연동 연결유도 조건부) + **CARD_RELATION_NEWS**(인맥 회사 소식·브리핑 톤·우리회사소식과 구분·NEWS_ITEM→SCR_PERSON).
- **#4 홈 배치정책**: **CARD_RELATION_COUNT=작업스트립 바로 아래 고정**·하위 상황별. ★스토리북2 v0.6.9(관계수를 오늘의브리핑 안에)와 상이→빼서 독립 최상단. 미드파이 normal 이미 정합, 스토리북2 정렬 요망.

**배선**: nav_map(BTN_ADD_ATTENDEE→PERSON_ADD·NEWS_ITEM_1/2→PERSON·BTN_UNREAD_MAIL→RELATION_INBOX)·flows(홈 신규카드 핫스팟·calendar_add 참석자)·build_flow_nav 재생성. 제거마커(TOGGLE_IS_MEETING·VIEW_TOGGLE_TABS·TOGGLE_LOCATION_RECORDING_ALERT)=flows/nav 미참조라 무해. 게이트 102·미커버0·눈검증 PASS·배포. changelog v0.8.0.

**★v0.8.1(260729) 씨앗 카드 정제**: SCR_HOME|seed 예시 느낌 제거·실카드화(킷 CSS 전역). ①'🌱 예시 미리보기' 이브로우 제거 ②결과 라벨 .res-lbl 숨김(내용만) ③★인포그래픽 스테이지 대형·과감(.seed-info min-height 66→130·그라디언트·수치 42px·파형확대, '인포그래픽처럼' 사용자 요구) ④CTA 크게(52/16/800)+녹음 CTA fill. 유지=기능명·가치문장. ★사용자는 flow.html(=스토리북 SeedCard)을 보고 지적→**스토리북2 SeedCard 반영이 핵심**(미드파이는 계약). 게이트102·눈검증PASS·미드파이 배포. changelog v0.8.1.

**★v0.8.2(260729) BS_CONNECT_DATA(맥락형 데이터 연결 유도 시트)**: CNOTE 가치사슬(데이터연결→맥락추천) JIT 이어줌. 미연동 데이터 필요 카드/리스트 탭→바텀시트 연결유도. 신규 **BS_CONNECT_DATA**(2midfi_03·connect-email canonical): 유형 일러스트→헤드라인→가치소구+미니예시(CONNECT_VALUE_PREVIEW)→BTN_CONNECT_DATA(→SCR_SETTINGS_EMAIL)/BTN_CONNECT_LATER. **단일 재사용+유형 파라미터**(이메일/캘린더→CALENDAR/연락처→PERSON_ADD/통화→SMS_CALL/명함→CARD_SCAN). 5갈래=단일시트·미연동만·1회dismiss기억·미니예시포함·**BS_INFO_NEEDED 승격·흡수**(device·EXTRA·flows·nav·links 전면 이전, 명함=변형). 트리거 조건분기·1회dismiss·유형변형·일러스트=스토리북2. 게이트102·미커버0·눈검증PASS·배포. changelog v0.8.2. ★BS_INFO_NEEDED 완전 대체(잔존=onboarding 텍스트 주석 2건만). ★★goto 렌더 버그 수정(사용자 "링크 안 보임"): **EXTRA BS시트는 build_prototype이 항상 `NAME|normal`로 등록**(mid-fi data-state 무시). 따라서 **flows 스텝 state는 반드시 없음(=normal)이어야** goto=NAME(=normal 조회)이 매칭됨. 마이그레이션서 flows 스텝 state를 data-state('connect-email')로 잘못 설정→goto-missing(빈 iframe). validate-flows는 data-component로 통과해 못 잡음. 진단=prototype.html?goto=X&bare 본문길이/스크린샷(2.5KB blank vs 60KB). 신규 BS시트 추가 시 flows 스텝 state 비워둘 것.

**★v0.8.3(260729) BS_CONNECT_DATA 5변형 전량 정의**: 사용자 '데이터 유형 미리 정의+디자인 모두 포함'→이메일 canonical→5유형 전량 설계. **connect-email(=normal)/calendar/contacts/call/card**, 각 일러스트(📧📅👥📞📇)·헤드라인·미니예시2줄·CTA→목적지(EMAIL/CALENDAR/PERSON_ADD/SMS_CALL/CARD_SCAN). 명함=구 BS_INFO_NEEDED. ★빌드 인프라=**build_prototype EXTRA 다변형 등록**(extractAllByComponent·첫 변형=|normal canonical·나머지=data-state 키). 단일시트는 기존 |normal 유지. flows 5스텝(첫=normal·나머지 state)·홈 트리거5. goto 전량 렌더(60~62KB). 스토리북2=단일 컴포넌트+type prop 스왑·일러스트·1회dismiss. 게이트 102+보조25·미커버0·눈검증PASS·배포. changelog v0.8.3. ★신규 BS 다변형 규칙=flows 첫 변형만 state 없음(normal), 나머지 data-state.

**★v0.8.4(260729) 캘린더 기간필터·참석자 인라인검색·마이 재편**: 누적 #6·#7 + 마이 홀리스틱 재편. **#6 SCR_CALENDAR 상단 기간필터**(칩 오늘·이번주[기본on]·이번달·직접선택 CALENDAR_PERIOD_FILTER, 타임라인 칩패턴 재사용, normal·empty 2상태). ★calendar 파일에 .filter-chips/.chip CSS 미정의→이식 필요(ibms2서 복사). **#7 SCR_CALENDAR_ADD 참석자=인라인 인맥검색**(회사명 검색패턴): 검색창(ATTENDEE_SEARCH 🔍+✕)→주소록 드롭다운(ATTENDEE_SEARCH_RESULTS 이름·회사·직책)→선택 시 하단 리스트(ATTENDEE_SELECTED_LIST 행별✕)·미일치=ATTENDEE_ADD_NEW→SCR_PERSON_ADD_FORM. BTN_ADD_ATTENDEE 폐기. normal·meeting-on. **#8 마이(SCR_SETTINGS_ACCOUNT) 재편**=명함(=내 프로필) 축 통합: 명함3동사 정리[보기=히어로 BTN_VIEW_MY_CARD→CARD_RESULT / 편집=내정보 인라인 / 스캔갱신=내정보 헤더 BTN_RESCAN_CARD 흡수]·**자산카운트(ROW_MY_STATS) 제거**(인맥·할일=GNB·명함=히어로CTA, ★노트 모아보기만 필요메뉴 보존 BTN_MY_NOTES→MY_TIMELINE|notes 고아방지)·내정보 3섹션(연락처/소속/기본)·내회사 카드(CARD_MY_COMPANY 회사상세·우리회사소식)·히어로 부서추가. ★사용자 원칙="굳이 메뉴 필요없는 건 빼고 필요한 것만 메뉴로". nav_map(BTN_STAT_*5제거·신규3추가). 게이트 61/61·미커버0·눈검증3PASS·배포. changelog v0.8.4. device 역반영(칩·인라인검색·마이)=스토리북2(저널 전달). ★스토리북2가 직전 '캘린더 기간필터' 선반영→계약 정합 확인요망.

**★v0.8.5(260729) 마이 상단='내 디지털 명함' 컨셉 재편 + SCR_PROFILE_EDIT 신규**: 사용자 컨셉 변경(마이 진입 시 상단에 나의 디지털 명함 보임→[편집]으로 폼 진입→명함 아래 메뉴 리스트). v0.8.4 히어로→**CARD_MY_DIGITAL_CARD**(명함 비주얼: 브랜드바#4127D1+프로필사진+이름·직책·회사+구분선+전화·이메일, 탭=크게보기 BTN_VIEW_MY_CARD→CARD_RESULT, 하단 [편집] BTN_EDIT_MY_PROFILE→SCR_PROFILE_EDIT). **CARD_PROFILE_INFO(내정보 인라인3섹션) 제거→신규 SCR_PROFILE_EDIT로 승격**(폼: 명함으로 자동채우기 BTN_RESCAN_CARD→CARD_SCAN·사진변경·연락처/소속/기본 입력필드·저장 BTN_SAVE_PROFILE→SETTINGS_ACCOUNT). 메뉴 리스트(내회사·노트·소셜)=v0.8.4 유지. ★★신규 SCR_ 화면 등록 관례=**check-coverage는 _required_ids↔lo-fi 대조**라 신규 mid-fi화면은 **_required_ids 제외**(lofi 미존재 실패 방지)·mid-fi+flows+nav_map만 갱신. ★validate-flows는 class="device" 블록서 data-screen 수집(설정파일=device 래퍼+phone data-screen 패턴, 신규화면도 이 패턴). 게이트 validate-flows158키·coverage61/61·build_prototype103·미커버0 PASS. 눈검증 2화면PASS. changelog v0.8.5. ★신규화면은 스토리북 story 미제작→flow_nav '목적지 story없음1'(비차단)·device역반영+story제작=스토리북2(저널 요청). 배포.

**★v0.8.6(260729) 명함카드 라벨+미등록 변형**: 카드 우상단 '크게 보기'→**'내 명함 보기'**(primary). 신규 **SCR_SETTINGS_ACCOUNT|no-card**(명함 미등록=등록 유도: 회색바·점선 📇·안내·[명함 등록 BTN_REGISTER_MY_CARD→CARD_SCAN]). ★build_prototype은 상태(screen|state)까지 미커버 추적→신규 상태는 flows에 step 추가해야 커버(no-card step). nav_map BTN_REGISTER_MY_CARD→CARD_SCAN. 게이트 159키·미커버0·눈검증PASS. 등록/미등록 분기=스토리북2. changelog v0.8.6.

**★v0.8.7(260729) 명함 일괄등록 정리**: SCR_CARD_IMPORT normal — '받기↓'→'⤴ 공유'(BTN_DOWNLOAD_SAMPLE→BTN_SHARE_SAMPLE·제목 공유받기), CARD_FORMAT_INFO 위치이동(양식카드 아래)+내용변경('이렇게 인식해요/13열'→'양식으로 등록해 주세요'), 중복 CTA '파일 선택하기'(BTN_SELECT_FILE) 삭제→드롭존(AREA_FILE_SELECT) 자체 트리거(nav_map 재연결). changelog v0.8.7.

**★v0.8.8(260730) 연락처 보관함 신설 + 인맥탭 용어·리멤버**: 사용자="가져온 연락처를 AI가 개인/비즈니스 분류→오분류·미분류 안전망으로 전체 저장 보관함+진입점". **신규 SCR_CONTACT_ARCHIVE**(전체 원본 저장소): 요약(전체/비즈니스/개인/미분류)+세그먼트4+미분류 우선 재검토(행별 인맥으로 BTN_ARCHIVE_TO_PERSON→PERSON_ADD_FORM/개인/삭제)+분류됨(배지). 진입=인맥탭 상단 [📁 보관함 BTN_OPEN_ARCHIVE]+일괄등록 result CTA. SCR_CARD_IMPORT preview 안내+result 보관함 카드+[보관함 열기] 주CTA. **SCR_PERSON_LIST 용어**='인물 추가'→'인맥 추가', empty [명함 스캔]→[+인맥 추가](→PERSON_ADD 허브). **리멤버 브랜드 삭제**(앱화면 2곳→'명함 앱'). ★신규 SCR_는 _required_ids 제외(check-coverage=lofi대조)·mid-fi+flows+nav만. 게이트 161키·105화면·미커버0·눈검증4 PASS. AI 분류로직·세그먼트=개발/스토리북2(신규 story 요청). changelog v0.8.8.

**★v0.8.9(260730) 온보딩 관계관리 인트로 게이트웨이**: 사용자="온보딩 이후 관계관리 진입 시 SCR_RECONTACT_INTRO 먼저 노출(BS_TUTORIAL_HUB처럼)". 권장 실행=①미시작 시에만 게이트웨이 ②홈 관계카드 미시작 변형. **CARD_RELATION_COUNT 미시작 변형**(data-state='not-started', SCR_HOME|empty 상단 hero): '관계 관리를 시작해보세요'→SCR_RECONTACT_INTRO(BTN_START_RELATION), 점선 모티프. normal 홈 활성 카드(127→PERSON_LIST) 불변. 미시작/활성 분기=스토리북2. nav_map BTN_START_RELATION→RECONTACT_INTRO·flows empty hotspot. 게이트161키·미커버0·눈검증PASS. changelog v0.8.9. ★참고=empty 시작가이드 ②'연락처 연결하기'도 동일 목적지(중복여지·hero=강조/②=스텝). ★기발견=SCR_HOME|empty가 곧 온보딩직후 미시작홈(시작가이드 0/3)·재접촉 거부 도착지.

**★v0.8.10(260730) 마이·프로필·인맥추가·보관함 5화면 정리**: 스토리북2 프리미엄 명함 기준 필드·구조 정합. ①마이=프로필 명함카드에 학력·저서+홈페이지·링크드인·자기소개+상단 연필(프로필편집), 내회사정보=미리보기3(회사명·대표자·주요상품)+[+더보기]+연필(회사편집 BTN_EDIT_COMPANY→COMPANY_INFO), 우리회사소식 제거. ②PROFILE_EDIT 순서=아바타→명함자동채우기→기본/연락/소개(홈페이지·링크드인·학력·저서 추가). ③PERSON_ADD_FORM=2섹션→1폼·**모든항목 필수**(★UX=전부 필수면 개별* 소음→제거·상단안내+저장검증). ④PERSON_ADD=일괄구분선 삭제·4방식 한그룹(명함스캔→연락처→직접→여러명)·헤더 인맥추가. ⑤CONTACT_ARCHIVE=세그먼트 탭 제거→현황4칸 클릭필터(기본 미분류). ⑥**이즈파크 전역스윕**(mid-fi 이스파크→이즈파크·ispark→izpark). 게이트·미커버0·btnNav265·눈검증5 PASS. changelog v0.8.10. ★★flow 배포=build_flow_nav→build_btn_nav 순서 준수([[reference_flow_btnnav_rebuild_trap]]).

**★v0.8.11(260730) 마이 우리회사소식·인맥추가 순서·보관함 기획변경**: ①마이=내 회사 정보 미리보기3→**우리 회사 소식 캐러셀**(SHELF_COMPANY_NEWS 재사용·SCR_CARD_RESULT 모듈)+내 회사 정보 메뉴행 노트 위 재추가(CARD_MY_MENU). ②PERSON_ADD 순서 스왑(명함스캔→직접입력→연락처→여러명). ③**★CONTACT_ARCHIVE 기획변경=미분류 전용 큐**(전체저장소 폐기): 비즈니스/개인=인맥 자동등록, 미분류만 보관함. [인맥으로 추가] BTN_ARCHIVE_TO_PERSON→**SCR_PERSON_LIST**(구 PERSON_ADD_FORM)+큐제거. 현황4칸·분류됨·세그먼트 전부 제거(별도탭 불필요). 일괄등록 안내 정합. nav BTN_COMPANY_NEWS_ALL/NEWS_CARD→COMPANY_NEWS. 게이트161·미커버0·눈검증3 PASS. changelog v0.8.11. 인덱스도 갱신.

**남은 것**: #2 부제/통합뷰는 권장(제거·날짜그룹)으로 진행함. 스토리북2 device 역반영(일정선택 라디오·참석자·홈 2카드·#4 배치정책). 미확인 메일 '기존 화면 재사용' 목적지=SCR_RELATION_INBOX로 잠정(사용자 재확인 여지). [[project_cnote_v06_onboarding_jit]]
