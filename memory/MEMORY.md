# Memory Index

- [Tieming BI·앱아이콘 방향](project_tieming_bi.md) — ★260729 크리에이티브. CNOTE 앱 BI명 **Tieming**(Tie+Timing, "관계는 타이밍이다") 확정. 심볼=워드마크 m을 **파동/펄스**로(2마루=m, 오른쪽 정점만 골드=그순간)→다크 스퀘어클 앱아이콘(48px가독OK). 반려이력=인터섹션 재탕·파셋 올드·CDS답습→힘있는 그래픽 재발산. 산출=02_design/(_기반브리프·_생성프롬프트·tieming_bi_board.html 아티팩트). 함정=use_figma 벡터 bbox정규화(노드x/y=점min·교체말고 재생성)·아티팩트눈검증=chrome-headless-shell. 미결=전체 리네이밍 확인대기

- [CNOTE v0.8.0 설계변경 4건 일괄](project_cnote_v08_design_batch.md) — ★260728 이해·누적 모드로 수렴 후 실행. #1 일정등록 재구성(일정선택 라디오3·참석자 섹션·연동캘린더 하단) #1-B 녹음알림 설정이관 #2 캘린더→일정·탭제거 #3 홈 카드2종(미확인메일·인맥회사뉴스) #4 관계카드 작업스트립 아래 고정. 게이트102·배포완료. ★v0.8.4=캘린더 기간필터·참석자 인라인검색(BTN_ADD_ATTENDEE 폐기)·마이 재편(명함=프로필 축 통합·자산카운트 제거·내정보 3섹션·노트 모아보기만 보존). ★v0.8.5=마이 상단='내 디지털 명함' 카드(탭=크게보기·[편집])+신규 SCR_PROFILE_EDIT 편집폼(내정보 인라인 제거→승격). ★신규 SCR_화면=_required_ids 제외(check-coverage는 lofi대조)

- [CNOTE v0.6 씨앗홈·점진온보딩](project_cnote_v06_seed_onboarding.md) — ★260727 스토리북2 전량 완료(aa55d03)·flow 20/20·SeedCard v2 파스텔 정본(실카드=크리스프4px/씨앗=파스텔24px)·상태스코프 nav키·남은=할일 추가분 ①~④

- [CNOTE v0.6 온보딩 JIT·홈2레이어·사람탭·튜토리얼허브](project_cnote_v06_onboarding_jit.md) — ★260727~28 v0.6~v0.6.2 기획측 완결·배포(게이트 99화면·미커버0). 온보딩=가치먼저·적시(NAME_QUICK·씨앗홈 4카드 가로캐러셀·SCR_WELCOME 명함필수·BS_INFO_NEEDED·START_PICK삭제)·홈2레이어·인맥탭(구 사람, 세그제거·즐겨찾기·인라인연락·needs-check). ★v0.6.2=튜토리얼 허브·할일 재구조화·GNV 사람→인맥. ★v0.6.5=**설정 IA 재편**: GNB 4탭 '설정'→'마이' 승격(라벨 89곳 스윕·목적지 ACCOUNT)·마이=탭루트(⚙설정 기어→SCR_SETTINGS·백버튼제거·ID유지)·설정=2depth(←뒤로·[일정검색알림]제거·프로필히어로삭제)·로그아웃/탈퇴 설정 최하단 이관·연결된메일 요약제거·헤더통일 마이탭예외. 배포완료. ★함정=BS시트 EXTRA+flows스텝 필수·bs-wrap 파일위치=문맥·GNB스윕은 nav정확문자열·2midfi_10~12는 전체glob·Playwright샷=NODE_PATH(npx캐시). ★사용자 방침=화면설계는 "실행"신호까지 이해단계. **미결논의=인물상세 미완료 알림카드 중복(방향 A권장)**. 스토리북2 device 역반영 대기
- [CNOTE v0.5 홈풍성화·우리 회사 소식](project_cnote_v05_home_company_news.md) — ★260724 v0.4 동결 후 v0.5 착수. 조용한 날 홈 3선반(재접촉·미완후속·회고, 선반 킷·peek·3+캐러셀/<3폴백·근거)·우리 회사 소식 재사용모듈(네이버뉴스API·명함결과/내회사정보/설정 3배치+신규 SCR_COMPANY_NEWS 전체목록·잠잠6개월멘트)·설정 IA(프로필히어로+진입행)·changelog v0.5·URL딥링크. device=스토리북2(22:50Z 킥오프저널). 함정=check-coverage로파이대조(신규화면 _required_ids제외)·nav_map map키. 핸드오프 _HANDOFF_기획세션_260724

- [CNOTE 배포 KEX 근본해결](reference_cnote_deploy_sftp_kex_fix.md) — ★반복되던 SFTP KEX 에러(파일당 curl=핸드셰이크 폭주) 해결=deploy-sftp.mjs를 ssh2-sftp-client 단일연결로 전환(260723). 208파일 38초·KEX0·재시도0. 배포워커에 재시도반복 지시 불필요. 백업 .bak_260723

- [DEEPNAUT 유튜브 프레임 이미지 백엔드](project_deepnaut_youtube_frames.md) — ★260723 P1·P2·P3 코드완료(눈검증만 남음). 방송리캡용 영상프레임 추출(youtube.py재사용)+원클릭 자동실행+확장 소스토글. ★함정3: (1)--download-sections av1/avc1 60s스톨→`-g` progressive URL+ffmpeg입력시킹(1초·360p확정) (2)Register-ScheduledTask 관리자권한요구→Startup폴더 vbs (3)pythonw는 print()실패로 즉사→python.exe+vbs Run(...,0)숨김창. 엔드포인트=/api/v1/images/youtube-frames(base64 dataURL). ★260724 자립형 재작성: backend-installer/server/(app.py+run.py 포트8777) 부트스트랩 설치기(Python/venv/pip/ffmpeg자동)로 BLOG_AUTO_V2 의존 제거(집PC 경로실패 해결). 확장 v1.5.0 팝업+패널 스타일/유형 드롭다운(홍기자A~F/더할①②③)+텍스트박스 편집(claude키 stopPropagation)+3중폴백. 더할 추출=제목L2·소제목OFF

- [DEEPNAUT 확장 글쓰기 삽입 end-to-end](project_deepnaut_editor_injector.md) — ★260723 완성. claude.ai 자동생성(L0~L6)→네이버 자동삽입 원클릭(제목·세로호흡본문·이미지15장·저작권·태그). 정본: 에디터=iframe#mainFrame동일출처·합성paste거부→chrome.debugger 신뢰입력(배너·F12닫기)·이미지=다운로드→PNG변환→blob신뢰Ctrl+V(host_perm필수·clipboard focus재시도)·시퀀스=제목칸신뢰클릭→Ctrl+V→Enter→블록순차·L4부실→L6링크삽입본문폴백·임시저장팝업=CDP신뢰클릭(최소컨테이너)·프롬프트4곳(L2제목70자·L4생략금지). ★260725 v1.6.0 홍기자 5문제개선: L1이벤트카드+T1/T2 2층사실·L2역추적(후보≥3)·L4문장묶음 18~25자·L6+자동수집 구글→다음(worker 카카오API auto폴백, Secret3종). ★★wrangler deploy가 대시보드 vars 삭제(NAVER키 증발사고)→키는 secret으로·배포=CLOUDFLARE_API_TOKEN(API_KEYS.md)

- [DEEPNAUT 네이버 자동로그인 크롬확장](project_deepnaut_naver_login_ext.md) — ★260722 세션 별칭 딥노트. 근본버그=로그인폼 [패스키 로그인]+[로그인] 두 버튼→content.js가 "로그인" 포함매칭으로 패스키버튼 오클릭→WebAuthn실패. 수정=isPasskeyBtn제외+정확히"로그인"초록버튼선택(manifest v1.1.1). 오답=passkey-block(PublicKeyCredential삭제)→"패스키실패"에러만·폴백X→되돌림. 캡차=봇탐지(반복테스트 위험점수)·자동해결안함. ★정답=로그인상태유지 1회수동→세션쿠키 수주→"쓰기 바로가기"로 무한자동

- [NativeWind Animated.View className 함정](reference_nativewind_animated_classname.md) — ★Animated.View의 className은 NativeWind가 조용히 무시(bg·padding·layout 사라짐). 해결=Animated.View엔 style(opacity·transform)만·시각스타일은 내부 일반 View className. 게이트PASS≠렌더OK→눈검증 필수. Toast(260721) 실발생. Animated 신규컴포넌트 전부 동일패턴

- [THEMONY AdSense 니치집중·숨김](project_themony_adsense_niche_focus.md) — ★260721 "가치없는콘텐츠" 재반려 대응. 진단=글자체OK(2700자·유사도0)나 대량자동발행지문(140글/2.5주·하루22글)이 원인. 여행51+쇼핑9=60글 draft숨김(REST일괄, 복원=_HANDOFF_콘텐츠숨김_복원가이드_260721.md+ids.json). 메뉴309·310삭제+템플릿(front-page/header)FTP편집(.bak_260721niche). ★★SPC디스크캐시(fallback_cache/*.html)=CF퍼지·touch로 안지워짐→FTP삭제필요, opcache리셋(validate_timestamps=0). 남=E-E-A-T·고유가치→검토요청

- [협업 저널 자동감지 A훅](reference_journal_notify_hook.md) — ★.claude/hooks/journal-notify.mjs + settings.json UserPromptSubmit. 세션별커서·cwd역할판정(storybook→기획글/C-Level_note→스토리북글). 신규 저널 다음입력시 자동주입. ★반자동(유휴깨우기 아님)·기획세션은 cwd가 프로젝트트리여야 동작. 완전무인=B안(워처+claude -p)

- [CNOTE 명함 일괄등록/내보내기+테마](project_cnote_card_import_theme.md) — ★신규 3화면 완료(260720): SCR_CARD_IMPORT(3상태)·SCR_CARD_EXPORT(2탭 리멤버UX)·BS_THEME_PICK(라디오3). 진입=SCR_PERSON_ADD 기존 CARD_ADD_ROUTE_BULK 연결(12_notify 소속)·설정2행. 리멤버 13열·30일보관. 4결정(건너뛰기·자동매핑·전체·바텀시트). 게이트·배포·실측 PASS. 개발=엑셀엔진·테마토큰

- [CNOTE 트랜잭션 이메일 템플릿](reference_cnote_email_templates.md) — ★공통 OTP 인증폼 02_design/email_templates/cnote_email_otp_verify.html. Pleos 레이아웃 계승·브랜드 CNOTE(#4127D1)/Ispark. M1~M3(가입·재전송·이메일변경) 1폼 커버. 치환변수 6종. M4 비서초대(버튼형)·M5~7 보류. IA 행89 SCR_MAIL_OTP_VERIFY(★validate-data가 SCR_ 강제) 유형=메일. ⓪공통 카테고리 파이프라인 표준(lofi/midfi/flows/prototype)

- [토큰효율 실행전략 상시적용](feedback_token_efficient_execution.md) — ★매 본격작업 착수 전 직접vs서브에이전트·스크립트·모델라우팅 1줄 판단 후 진행(사용자 반복지시 해소). ★근본해결=UserPromptSubmit 후크(.claude/settings.json)가 매 턴 재주입(CLAUDE.md/메모리는 세션1회 로드라 감쇠). 루트 CLAUDE.md에도 codified

- [THEMONY 인증 레이어 진행](project_themony_auth_layer.md) — ★260716 Task1·2·3·5 완료+가입토글ON: Nextend+ThemeMyLogin REST설치, 인증페이지 login2525·register2523·lostpassword2546(★TML엔드포인트 이기는 실제페이지 트릭)·forgot2524고아, 구글로그인 라이브(redirect=social-auth프록시). 디자인=살구뉴스레퍼런스 레드#E5202A. ★★wp-admin캐시버그=CF cache_everything이 wp-admin캐시→저장안보임(해결:Page Rule bypass). ★Code Snippets 큰CSS=502(페이지content주입만). 미결=T6 login_redirect→홈·subscriber차단·T4 Turnstile키·헤더구독→로그인(Customizer)
- [CNOTE 디자인 파운데이션 정본](project_cnote_design_foundation.md) — ★5축(타이포·스페이싱·라인·레디우스·컬러) 전42화면 확산완료(260716). 앱표준: 히어로/카운트 title-xl20·엔티티/할일/리스트 앵커 title-lg18·본문 body-md15·메타 body-sm14·섹션kicker label-md14, 명시 font-* 금지(토큰 weight내장). 박스셸SSOT=WidgetCard(radius 크리스프4px). 게이트 check-foundation.mjs(폐기별칭 title-s/m/l·body·caption·micro 등 차단)+codemod 2종 재사용. 배포=force+전수스윕(SSH-8누락). 미결=Figma Variables 코드값 갱신

- [CNOTE×IBMS2 연동 IA통합](project_cnote_ibms2_integration.md) — ★개발단 추가 3화면(설정IBMS2·내 활동 타임라인·활동→IBMS2전송) 정본통합·배포(260715). IBMS2=핵심MVP상시, MY_TIMELINE=5번째탭 아님·홈하위(개발 5탭 반려·시니어UX)·내비 4탭유지. ★함정=deploy-sftp midfi 고정파일목록(.deploy.local.json)에 신규 미드파이 추가해야 배포. RELATION_NETWORK 백로그 해소(홈 관계수카드 링크→PERSON_LIST 재연결·화면 1차제외)→check-coverage 누락0 완전통과

- [THEMONY Cloudflare CDN 적용](project_themony_cloudflare.md) — ★260715 완료. HTML 엣지캐싱(Page Rule cache_everything+edge_ttl 7200, MISS→HIT). ★cafe24 매니지드WP=wp-admin 국내IP만 허용→CF프록시(해외IP) 403충돌→디렉토리설정 wp-admin삭제+WAF"wp-admin KR only". Page Rule은 API직접생성(플러그인 Permission Error 우회). zone_id 0072ee1e…. PS5.1=Invoke-RestMethod+TLS12

- [THEMONY 한국인 이미지 소스 비교](reference_themony_korean_image_sources.md) — ★Pixabay=한국인 인물 약함(음식/베트남남 등). Pexels=한국 현지촬영 사진多(서울·수원 지명태그), API키 등록됨(260714), User-Agent 헤더 필수. 지디웹나눔무료이미지(gdweb.co.kr) 사용자 제공, 미탐색

- [CNOTE Flow Player(flow.html)](reference_cnote_flow_player.md) — ★모바일서 실제 스토리북 화면으로 전 흐름 검증(next.sgate.biz/v1/design/flow.html). emitCta postMessage→btnNav 실제버튼이동·점프메뉴·몰입(100dvh우선)·다크. build_flow_nav+build_btn_nav 재생성→deploy flow. 상태화면 12건 보강완료(detect_missing_states). ★명시맵 _nav_map.json=정본(SCR|BTN→목적지, 라벨추측 대체)·dead신호=emit↔맵diff(misses.txt 오탐多). ★함정=스토리북-only 시트는 _screen_links에 SCR_X|state 파이프키로 등록해야 flow가 잡음(BS_별칭키 스킵). 미결=PrivatePeople/ActivityLog 베이스없음·PersonAddForm중복·전수200스윕필수
- [cnote-front git 범위=storybook/만](feedback_cnote_front_git_scope.md) — ★스토리북 작업=03_dev/cnote-front/storybook/(모노레포 서브폴더, 구 cnote_v2 이전). storybook/ 밖(루트 RN앱)=개발자공간 pull만·push금지. 커밋은 git add storybook/…로 스코프(루트 add . 금지). 서브폴더 .npmrc 별도필요

- [투명 outline 버튼=서피스 배경 필수](feedback_outline_button_surface_bg.md) — ★투명 bg 요소는 회색 캔버스서 사라짐. outline/ghost 버튼은 bg-surface+테두리색 구분. 정본 미드파이 .btn.outline=흰배경. CNOTE Button neutral/ghost 수정완료(45곳). 캔버스 배치 요소 투명 금지

- [THEMONY 마케팅 콘텐츠 카테고리 기획(A/B/C)](project_themony_marketing_categories_260711.md) — ★계산기 24개 전체 라이브+통합내비 완료. ★교훈=WP배포전 슬러그충돌 필수확인(중복발행 2회 발생·수습), "준비중"배지 못믿음(오르판페이지 4개 발견). C·A구현은 미착수
- [THEMONY 애드센스 콘텐츠 개선 대작업](project_themony_adsense_remediation.md) — ★260711 완료: gov63·여행49·연금세금33·계산기22 전면 표준적용(목차·EEAT·견해톤). ★경험날조 대량제거(자동발행이 "저도 다녀왔는데" 심음). ★wp:html블록으로 계산기JS wpautop회피. 남은=excerpt정리·Tier4파이프라인근본수정(재발방지). 발견버그=퇴직금계산기242 30배. 핸드오프=_HANDOFF_adsense_remediation_260711.md

- [CNOTE 신규 팔레트=바이올렛+골드+그레이](project_cnote_palette_violet_gold.md) — ★색상 3층 확정(primary #4127D1/#6549FF·accent 골드 #F2DB10 ≤5%·canvas #EBEBEB/#100E18). 기존 #2A3FEC·Figma #5a6cf7 폐기. 코드=SSOT. ★다크 primary 계열 전체정의 필수(base만 뒤집으면 밝은덩어리 버그). 골드=fill+검정글자 최상위CTA1개, warning앰버와 구분

- [CNOTE 메인탭 헤더=MainTabHeader 모듈](reference_cnote_maintabheader.md) — ★홈·사람·할일·설정 상단 검색/알림 = 모듈 2174:129(단일마스터 3변형 자동플립). 15화면 인스턴스, 헤더변경=마스터1곳. NotificationBadge 2134:519. 인라인 헤더 금지
- [CNOTE 설정+사람 카테고리 진행](project_cnote_settings_people.md) — ★설정9+사람6 전량완료(WORKSTAGE2 정렬). 크롬이원화·PersonHeroCard·프리11 래퍼흰색·섹션 상대좌표
- [CNOTE BottomSheet 시안스타일 표준](reference_cnote_bottomsheet_style.md) — ★세트1056:362 전변종 시안통일(순백·핸들·타이틀18Bold중앙·top r20·풀폭55버튼·OR선택지 라디오·note-menu 아이콘중앙버튼·capture-sheet 신규변종). 신규 시트도 준수
- [CDS 탐색·메타 정책(기획260707)](project_cds_nav_meta_policy.md) — ★상세화면 탭바숨김(탭바=1차대메뉴만)·mid-fi 메타5종 이관금지. 미결: 설정5화면 BottomNav 재작업 사용자 재확인 대기
- [디자인 완료=확인위치 안내 필수](feedback_design_output_location.md) — ★전 디자인작업: 완료 시 반드시 Figma 링크(노드ID·페이지/섹션) 안내. 사용자 눈검증용
- [CDS 하네스(/cds-build+워커6종)](reference_cds_harness.md) — CNOTE Figma 거버넌스: 시안동결·모듈강제·게이트2종·승인거버넌스. 규칙정본=CDS_로직체계_정본_260706
- [THEMONY Claude 호출=CLI 전용](feedback_themony_claude_cli_only.md) — API 과금 금지, harness/cli_client 경유(구독)
- [THEMONY 하네스 v2](project_themony_harness_v2.md) — 병렬수집·제목심사·3중게이트 구축, scheduler 전환 완료(260703)
- [한글 응답 설정](feedback_language.md) — 모든 대화와 설명은 한글로 진행
- [시각 작업 눈 검증 필수](feedback_visual_verification.md) — 코드 결과만 믿지 말고 렌더를 '적대적으로' 눈으로 검증(무엇이 잘못됐나 사냥). 코드 성공≠시각 정상. ★눈은 양방향 불신뢰(빌드=놓침/감사=거짓양성)→코드로 잴 건 코드로. ★렌더 이상신호(크기·위치 불일치)를 "툴 아티팩트"로 성급히 기각 금지(260708 재발)
- [Figma SECTION 자식=상대좌표](reference_figma_section_relative_coords.md) — ★섹션 appendChild 후 절대좌표로 놓으면 abs=섹션x+값 으로 밖으로 튕김. 로컬좌표(여백부터) 사용. 렌더 크기 불일치가 결함 증거
- [CNOTE 대비이슈 해결→다음=이슈2](next_session_cnote_contrast.md) — ✅이슈1(흐리멍텅) 완료: 진단수정(토큰재정의X→바인딩교정) tertiary→secondary 28곳+SearchResult투명캡션 복구. 다음착수=이슈2 다크카드 분리감. 계획서 _WORK_PLAN_contrast_handoff_260704.md
- [폴더 형상관리 가이드](reference_folder_governance.md) — ISPARK 폴더 구조 규칙 및 파일 위치 기준
- [주간보고 포맷 규칙](feedback_weekly_format.md) — U+3000 들여쓰기, 테이블 금지, 계층 구조
- [CNOTE 프로젝트 현황](project_cnote.md) — 260610_C-Level_note 디자인 시스템 환경 구축 완료, 컴포넌트 미구현
- [워크스페이스 자동화 현황](project_workspace_automation.md) — /meeting·/weekly 커맨드, 환경체크 파이프라인
- [다음 세션 CNOTE 작업](next_session_cnote.md) — tokens.css 교체 + 첫 컴포넌트 구현 (Figma URL 필요)
- [docx 처리 절차](feedback_docx_handling.md) — docx 전달 시 pandoc 변환 먼저, 그 다음 버전 비교 분석
- [CNOTE Figma 변수/폰트](project_cnote_figma_variables.md) — Variables 바인딩·다크모드 완료. node 3:2가 품질 레퍼런스. Pretendard는 MCP 로드 불가(Inter→텍스트스타일 / Noto Sans KR 우회). v2 컴포넌트 재구축 시작(페이지 🧩 Components v2 — Button Component Set 시범 완료, 301:2)
- [CNOTE 와이어프레임 IA 산출물](project_cnote_wireframe_ia.md) — v2 기준 36화면 IA 엑셀 + 분할 이미지 + Figma 보드(tXrzbF3xbn1LxToZzwLtVd)
- [agentmemory 설치 현황](project_agentmemory.md) — Claude Code 작업 자동기록(로컬DB/iii엔진), 로그인 시 자동시작, 재시작해야 캡처 시작
- [PS5.1 BOM 함정](reference_ps51_bom.md) — BOM 없는 UTF-8 .ps1은 PowerShell 5.1에서 파서 에러로 실패, 셋업 전 BOM 확인
- [세션 별칭 레지스트리](project_session_alias_registry.md) — 멀티세션 별칭(피그마/기획/오피스) + SessionStart 후크로 새 세션마다 역할 질문·기록
- [CNOTE Storybook 캐시 긴경로 함정](reference_cnote_storybook_cache_longpath.md) — 압축이전 시 node_modules/.cache 긴경로 스킵→deps 504/공백. 캐시 삭제 후 재기동으로 해결, 압축 시 .cache 제외
- [Figma 스킬 설치 방식](reference_figma_skills_install.md) — figma-use·figma-create-new-file 로컬 설치 완료(.claude/skills), 나머지·references는 MCP 리소스 온디맨드. skillNames=resource:figma-use
- [CNOTE Figma↔Storybook 동기화](project_cnote_figma_storybook_sync.md) — 20종 일치화. 정본=Storybook. Toast·Accordion·Badge·EmptyState 완료. Modal/Avatar/BottomNav(Figma)+Checkbox/Textarea/Select/Button(코드) 남음
- [CNOTE Figma 컴포넌트화](project_cnote_figma_componentization.md) — Figma 페이지 구조 함정(쇼케이스 Frame≠컴포넌트). 신규 21종을 실제 Component Set(combineAsVariants)으로 🧩 Components 페이지에 제작 완료
- [CNOTE 로파이 HTML 와이어프레임](project_cnote_wireframe_html.md) — 02_design/screen_design/ lo-fi+mid-fi+brief, data-* 컨벤션+check-coverage.mjs(74 ID 게이트). 정본=AI_Designer_Screen_Pack_v1.md. (구 wireframes/엔 기존 PNG 55장 잔류)
- [화면설계 파이프라인 재사용도구](reference_screen_design_pipeline.md) — /screen-pipeline 커맨드 + 워커 3종(.claude/agents) + 툴킷(05_notes/04_claude/screen-design-pipeline). 인벤토리→lofi→midfi→brief 재현
- [CNOTE 화면 정본=IA v2](project_cnote_ia_source_of_truth.md) — 정본=CNOTE_IA_v2_draft 엑셀(36화면). AI_Designer_Pack은 케이스별 컴포넌트 detail. 기존 HTML은 어긋나 재빌드 필요
- [CNOTE 운영도구(배포·DB)](reference_cnote_ops.md) — screen-ops 에이전트 + deploy-sftp(SFTP /upload)·db-admin(Firestore 백업/통계). 자격증명=.deploy.local.json(로컬). SFTP 140.238.15.203
- [CNOTE 화면링크 추적허브](reference_cnote_screen_links.md) — 프로토타입 화면별 🎨Figma·📚Storybook 링크. ID명 규칙 자동매핑(Figma=프레임명 SCR_X→MCP node-id추출 / 스토리북=pages-x--state 규칙). _screen_links.json
- [CNOTE 반영근거 자동집계](project_cnote_screen_changes.md) — 화면별 근거(검토/휴리스틱/사용성) export-screen-changes→프로토타입 메모패널 표시. 버전라벨 v0.N. SCR_CARD_RESULT 신규(53화면)
- [Claude Design CNOTE Home 시안](reference_claude_design_cnote_home.md) — DesignSync MCP(projectId d979ef70…), Home 시안 3종을 DS 적용 HTML로 재구현(02_design/screen_design/home_*_DS적용.html)
- [CNOTE Dynamic Layer 라이브러리 사전](project_cnote_dynamiclayer_library.md) — dynamiclayer.io/docs를 02_design/component_library_dynamiclayer/에 로컬 구조화(컴포넌트40+토큰21, _scraper.py 재수집)
- [크롬확장 자동화 프로젝트](project_chrome_ex.md) — 260624_Chrome_Ex. MV3 확장으로 네이버 자동포스팅(검색누락 회피)+Gemini 무료활용. 핵심=chrome.debugger+CDP(isTrusted). 기반기술 순차 조사 중(로드맵 7단계)
- [THEMONY MRT 이미지 파이프라인](project_themony_mrt_image.md) — partner-ext-api.myrealtrip.com Bearer 인증으로 투어 상품 이미지 수집→WP 업로드 완성. mrt_image_fetcher.py + 상세가이드 01_docs/mrt_openapi_image_guide.md
- [Themony 접속 정보](reference_themony_credentials.md) — wp-admin·FTP·MCP 자격증명. FTP=philichoi1977.mycafe24.com/morningx77(포트21). 140.238.15.203은 CNOTE 서버(혼동 금지)
- [THEMONY 부동산 키워드 발굴](project_themony_budongsan_keywords.md) — 11,847건. 계산기군 압도적 골드(DSR계산기 97,600)·대출/주거지원 DB골드. 정책규제=죽은 카테고리. 정본 부동산_발행우선순위_260704.md
- [THEMONY 부동산 계산기 12종 라이브](project_themony_calculators.md) — 대출6·세금5·복비1 HTML/JS 발행완료. ★WP KSES가 인라인JS `&&`→`&#038;` 훼손→엔진JS는 FTP 정적파일+`<script src>`로 우회. 공식정본 verify_formulas.py(19케이스). 생활도구모음(891)=그리드허브
- [THEMONY 연예/방송 자동발행 기획](project_themony_broadcast.md) — broadcast_autoposter(나는솔로 등). yt-dlp+자막+인물프레임(260220 기반기술)→봄봄 리캡DNA→WP. ⓐ리캡·변형 방침(저작권안전). 실현성 검토완료, 설계 대기
- [THEMONY 보험통합+요일스케줄](project_themony_insurance_schedule.md) — ★보험 자동파이프라인 완전통합(5번째 카테고리). orchestrator신규(budongsan템플릿)+prompt_builder 경험날조/TOP N 유도제거+가드레일. 하루3글 요일로테이션(gov 월수금·나머지균형, slots+weekly, --run-slot). 기존16태스크(대량발행)제거. 재심사중 이중비활성(enabled:false+Disabled). 활성화=Enable+--resume
- [THEMONY 이미지 최적화 표준](reference_themony_image_optimization.md) — ★모든 업로드 전 최적화 필수(SEO/LCP). 정본=harness/image_optimizer.py(1600px·JPEG q82단계·≤200KB·EXIF strip). optimize_bytes(업로드삽입)·optimize_inplace(FTP포맷유지). coupang2+mrt3 삽입·gov기존WebP. 전수검수=868중201초과(127MB)→FTP in-place배치(URL불변). ★배치후 LiteSpeed purge필수. gov featured중복=gap-filling이 정규경로 안탄것(해소)
- [THEMONY 토픽 클러스터 자동화](project_themony_topic_cluster.md) — ★전카테고리 공통 Pillar-Cluster(카테고리>필러>클러스터 3층, 한주제 종속아님). harness/topic_cluster.py(관계원장+internal_links_for, selftest15/15)+_topic_map.json. budongsan/gov 연결(폴백=회귀0). 파일럿=주담대총정리 post2097 라이브(하향계산기6). 남=slug정리·양방향·확산·재심사대기
- [THEMONY 부동산 무한발행 파이프라인](project_themony_budongsan_autopost.md) — budongsan_autoposter 구축완료(뱅크2525·시즌·프롬프트·게이트·orchestrator·리필러). 스케줄 10:00·14:00. dry-run검증. 실발행/--setup만 대기
- [API 키 중앙 레지스트리](reference_api_keys.md) — 전 세션 공통. 03_projects/000000_INFO/API_KEYS.md 참조. 네이버/Pixabay/Claude/Gemini/WordPress/쿠팡/Supabase 키 일괄 관리
- [CNOTE 디자인 로드맵](project_cnote_design_roadmap.md) — 3단계(컴포넌트→화면baseline→크리에이티브협업)+47화면 AI/크리에이티브 분류. 정본 _DESIGN_ROADMAP_260701.md
- [CNOTE 원 시각언어 명료성](project_cnote_circle_language_clarity.md) — 원은 흩뿌리면 '우연', 명시적 기하규칙(접선·동심·방사대칭72°·순서패턴)으로 조립하면 '필연'. 실패모드→수정규칙 표. 가이드+샘플v2 검증. **+컴포넌트 카탈로그 정본=314:2(A하드닝~40+B셋화14/14)·바인딩버그(VariableID prefix)·레이아웃 컨벤션**
- [CNOTE 프리미엄 미감 크래프트](project_cnote_premium_craft.md) — '은은하면서 쨍한' 시안품질 재현규칙. 계약(와이어프레임)≠디자인. 크리스프·미니멀·대담밀도·광원(not안개). **★글로우=대면적 전용(좁은요소 금지)·강도=힌트(op0.18~0.22)·베이스=네이비#080E1C**. 정본 CDS_premium_craft_guide_260704.md
- [CNOTE 녹음 진입 설계](project_cnote_recording_entry.md) — FAB '미팅정리→녹음' 통일 + 탭=녹음화면 즉시(텍스트/명함 정식전환)/롱프레스=입력방식 시트 이원. 시니어=숨김제스처 유일진입 금지. 명함기록=화면재사용→인물등록. 게이트는 라벨 미검증·state로 오버레이. 정합프레임(계약=midfi/표현=프리미엄, 홈절제)
- [CNOTE IA 재편 프로그램](project_cnote_ia_reorg.md) — Component/Module/Templet 3층. 구조먼저·디자인나중. 정본=CDS_IA_operating_model_guide_260704.md. 인덱스 _cds_index.json. Phase0: 0-1·0-2 완료, 다음 0-3~0-6. 기존정본 각단계 자동동작 필수
- [CNOTE 반응형 레이아웃](project_cnote_responsive_layout.md) — 모바일 유동+태블릿 세로 중앙 max-width 640 컬럼. 카드 Fill 기반 이미 유동친화. 스펙 _RESPONSIVE_LAYOUT_SPEC_260703.md, 태블릿데모 965:122
- [CNOTE mid-fi 메타분리·탐색구조](project_cnote_midfi_meta_nav.md) — mid-fi P1/◆/→/hidden/issue-panel=설계메타(UI아님, Figma재구축시 분리, 우선순위=순서·강조·라벨). 상세·과정화면=탭바숨김/모달. 검토보고서(260707) 화면ID 가공됨(실제 data-screen 기준). 비서 1차제외. 피그마 전달완료
- [CNOTE 디자인 기획 현행화 프로세스](project_cnote_design_reconciliation.md) — 미드파이=살아있는 스펙. 시안 델타(창의·사용성)를 삼중(미드파이 data-delta주석·모듈/컴포넌트·_design_deltas.json) 역동기화. 파생화면=인벤토리+Figma 함께성장. 홈 첫적용=RelationCountCard(관계수 히어로 1302:521). 정본 CDS_design_reconciliation_process_260705.md
- [CNOTE 병렬 하네스](reference_cds_parallel_harness.md) — 다중세션 병렬(거버넌스 3기제 클레임/파운데이션락/저널+모델정책 하이브리드+공지채널policyVersion). 소통완료·미팅흐름2/8. MVP=사람·소통·설정·미팅흐름(비서·통제제외). 다음킥오프 01_docs/킥오프/260708_미팅흐름_이어서_킥오프.md
- [THEMONY 디자인 레퍼런스=tworld.co.kr](reference_themony_design_system.md) — ★앞으로 모든 디자인 페이지에 Tworld 느낌 반영. 넉넉한 여백·큰 타이포·샤프2px·그레이(#35343c)·절제된 그림자·Noto Sans. 단 브랜드색은 THEMONY 파랑#2563eb 유지(퍼플 아님)
- [THEMONY 계산기 UX 고도화](project_themony_calculators_ux.md) — 부동산계산기12+허브(891) 디자인·사용성 고도화. 죽은링크9=준비중. Phase1 배포완료(프레임CSS·천단위·값확인처·프리셋·해석배지·게이지·복사공유). 다음=Phase2 모델정확도. 정본 _WORK_PLAN_calculator_ux_upgrade_260707.md
- [컴팩트 시 킥오프 지시서 자동생성](feedback_compact_kickoff_doc.md) — ★전 세션 공통(주제 무관). /compact 추천 시 그 세션 맥락을 스스로 파악→다음 세션 킥오프 지시서(_WORK_PLAN/_HANDOFF, §0=붙여넣기 지시) 자동 작성 후 안내. 요청 없어도 자동. 세션 무한 이어짐
- [CNOTE 스토리북 v2 = RN 전환](project_cnote_storybook_v2_rn.md) — ★v2(260610_cnote_v2)는 웹→React Native 재작성 피벗(260709). div→View·NativeWind·react-native-web로 웹URL유지. 산출물=RN컴포넌트소스(빌드=개발자). v1=웹동결. 계획서 _WORK_PLAN_RN_전환_260709.md. Phase0복사·1a재편·1c계측·R0파일럿 완료. 작동 툴체인 레시피 포함
- [크기값=시맨틱 토큰 일관관리](feedback_semantic_size_tokens.md) — ★패딩·마진·거터·폰트·행간·컴포넌트치수·보더를 시맨틱 토큰으로. 코드(Storybook)=SSOT, Figma는 이후 역반영. 컴포넌트 raw px 금지(h-[52px]→h-control-lg). R-Tokens 단계에서 설계·정규화
- [CNOTE 스토리북 구조정리(3층)](project_cnote_storybook_structure_reorg.md) — ★정본 3층(Component/Module/Page) 코드정리. 결정규칙=props도메인전제→Module. 진단=재사용사슬 붕괴(37페이지중 모듈사용 1개·모듈9/11 하드코딩). Phase1 티어이동8 완료·배포. 다음=Phase2(SettingsCard→EyebrowCard·하드코딩모듈 조립전환). 킥오프 260712_스토리북_구조정리_Phase2_킥오프.md
- [명함일괄/테마 신규3화면 RN조립](project_cnote_bulkcard_theme_screens.md) — ★260720 완료(CardImport 3상태·CardExport 2탭·BS_THEME_PICK). 기획 _screen_links 등록 대기·MY_TIMELINE emit=스토리북2. AnalyticsId TAB_/OPT_ 확장·BULK마커 정합
- [flow btnNav 재빌드 함정](reference_flow_btnnav_rebuild_trap.md) — ★flow.html 화면 내 버튼 이동=_flow_nav.json btnNav 의존. build_flow_nav가 btnNav 덮어씀→반드시 build_btn_nav 마지막 실행. build_flow_nav만 돌리면 flow 전역 버튼 먹통(260730 실발생). aux는 스토리북 emit 기준 정합(BTN_ATTENDEE_ADD_NEW 등)
- [서비스명 Tieming·스플래시](project_cnote_brand_tieming.md) — ★260730 CNOTE 대외 서비스명=Tieming(대화 기반 인맥관리). SCR_SPLASH 신설(브랜드 바이올렛·5노드 모티프·골드accent). v0.9.0
