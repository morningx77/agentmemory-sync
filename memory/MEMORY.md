# Memory Index

- [★.mcp.json은 프로필이 아니라 폴더 계층으로 상속](reference_mcp_json_folder_inheritance.md) — ★260827 실사고. CLAUDE_CONFIG_DIR로 프로필 갈라도 부모 `.mcp.json`의 MCP가 자식 트리 세션에 그대로 실린다(회사 user스코프 비었는데도 로드됨·`mcp_instructions_delta` 실증). ★경로문자열은 컨텍스트에 안 들어감(그건 과장)·새는 건 **서버명+안내문+도구명**. ★더 위험한 건 `permissions.allow` — 승인 명령 원문이 쌓여 **평문 자격증명 잔존**(앱 비번 실발견→재발급 필요). 정리는 행단위 JSON 재파싱·실패시 원복

- [프롬프팅=긍정공식·반사적 금지추가 금지](feedback_positive_prompting_no_reflex_ban.md) — ★260826 금지목록=풍선효과(사고5건 실증). 문제발견→검증항목 추가가 아니라 생성공식 보강. 레드라인 5개 이내·검사는 검증층 파일에만. 내 재발사례 포함
- [★타인 블로그 조회수/방문자 API 3종](reference_naver_blog_metrics_api.md) — ★260823 **"남의 블로그 조회수는 못 본다"는 틀렸다**. `m.blog.naver.com/api/blogs/{id}/popular-post-list` → **viewCount=실제 글별 조회수**(11/11 커버·TOP10 고정). 방문자5일치=`NVisitorgp4Ajax.naver`(2/11). 오늘/누적방문+이웃=모바일홈 JSON. ★함정=readCount는 항상0 · **공감수는 이웃수 교란이라 성과지표 금지** · PostTitleListAsync는 categoryNo 무시 · 부모카테고리는 자식글 반환
- [대기 금지·병목 파이프라인화](feedback_no_idle_waiting.md) — ★260823 "두번다시 기다리게 하지 말라". 대기=준비시간(끝나면 실행만)·스톨은 무스로틀 1콜 30초 격리·타임라인은 묻기 전에 제시

- [★★★홈판 붕괴 원인=소재 (imgsrc_)](project_imgsrc_blog_collapse.md) — ★260823 **확정: 홈판 편성이 소재를 바꿨다**. 연애·열애·이혼 8월편성 **30%**/조회2,728 ↔ **학력·교육 90%/34,400 · 가족고생 100%/44,259**. ★내 TOP10=10/10 연애사 → 통째 배제 · ★★내부대조=isj1511 연애사 7편중 8월 0편, **유일 생존글이 학력글** · **형식은 무죄**(같은 훅·…·.jpg로 10만) · ★홍기자는 연애사 생존 예외지만 상한 1/8이라 **벤치마킹 부적합**(나흘 손실) · ⛔철회2=단독사건·규모완전분리(starlit26 190만·이웃151인데 10만회)
- [★홍기자 성공패턴 = 공식이 아니라 절차](project_hongkija_success_pattern.md) — ★260823 전환점분석 결론. **공식은 원인 아님**(완전공식이 3/24 공감19로 실패 · 히트 3/28이 먼저) · 시간교란 제거하면 생존 요소는 **제3자 실명뿐**(리즈.jpg +42p→**+8p 붕괴**·톱 −1p) · ★**효력 감쇠곡선**(06하 3.7x→**07상 0.7x 사망**, 그런데 채택률은 07하 **94% 최고**·중앙16 최저) · **07상=내부**(동종 100~149%인데 나만 42%)/**08상=외부**(연예3곳 −52~79%인데 나만 상승) · ★산출=**조기경보 3종**(배수<1.5×2연속·상한−50%·동종대조) · **규칙 박제 금지**(8월 부호 역전: 실명 +96→−10)

- [기각 전 4단 재심 필수(FP)](feedback_reexamine_before_rejection.md) — ★260823 평이한 사고로 폐기 금지. ①역방향 ②조건부분해 ③역할전환 ④제약재정의 후에만 기각. 재심 발견=가설 승격(채택 아님). 실사례=수급 역방향·시간외 재정의

- [일부만 보고 "없다" 금지 · 실측 규율 6](feedback_partial_response_is_not_absence.md) — ★260814~21 FP 7건 반복, 대부분 사용자가 먼저 발견. **조용히 틀린다**(조회 성공+그럴듯한 숫자). KIS output1 미확인→시총 있었음 · 유무상증자 piic_/fric_ 접두사로 설명 통째 빔 · thstrm_add_amount. 도구=`api_probe.py` 전필드덤프. 자매규율=0채움금지·달력박지말기·"결과있으면맞다"금지·반대말·절대날짜금지

- [일관성 > 축별 최적 · 60대 사용자](feedback_consistency_over_local_optimum.md) — ★260815 "다 동일한 사용자 경험이 60대한테 더 효과적". 통일 작업에서 **"이 화면만 예외"를 마스터가 혼자 가르지 마라**(캘린더만 검색 끔 판정 → 사용자가 뒤집음). ★범위 산정 규율=**"어디로 가느냐"로 세면 "안 가는 것"을 못 센다 — "무엇을 가졌느냐"로 세라**(BS_FILTER 진입점으로 세다 칩줄만 가진 2화면 누락, 사용자가 발견)

- [규율 승격=문서 등재까지 · 배포검증 층별](feedback_rule_promotion_needs_doc.md) — ★260815 "올린다"고 말했는데 문서엔 0건(260811 재발). 확인=정본 grep · 등재는 신설보다 **기존항목 확장**(상계 불요·F1-03/B1-05 선례) · 오너 있으면 제안만. mid-fi 배포검증=**curl+md5**(스토리북은 스토리 열기) · ★**해시 일치≠화면 정상**(같은 날 D2에서 해시 일치 상태로 눈이 결함 2건)

- [디자인 요소는 의미를 가져야 · 규율≠디자인](feedback_design_meaningful_elements.md) — ★260814 사용자 지적 2건. ①**분모 없는 게이지=거짓**(녹음 길이엔 최대가 없다 → 호가 아무것도 안 가리킴 · 제목 지어내기와 같은 위반). 분모 실재할 때만·화면 질문에 답하는 값·닫힘/열림이 신호·모든 원이 정보를 담게. ②**규율은 나쁜 디자인을 막지만 좋은 디자인을 만들지 않는다** — 요청 오면 ⓐ미이행분(실행만) ⓑ새 미감(시안)으로 갈라 보고 · 레버를 **수치로**

- [SCR_NOTE_RESULT 리포트화 확정](project_cnote_note_result_report.md) — ★260814 크리에이티브. 정리결과=저장전 검수화면을 **한 편의 리포트**로. 3변경=히어로→**마스트헤드**·관련인물 **통합**·스크립트펼침→**`원본`칩+시트**(★기본=요약근거 발췌, 발화 100~300 대응). FU-92·93 닫힘제안/FU-91 해소/FU-90 확대. ★personal=제목없음 계약·sales-new는 OFF가 정본·OFF엔 행선지줄 없음. ★★**P6 온컬러 고정4색 승인**(#FFFFFF/#EDEAFF/#C5BBFF/#8873FF·모드스위칭없음) — 알파9종이 **다크면 AA붕괴**·기존 primary토큰은 모드따라 뒤집힘. ★함정=**알파만 게이트 통과**(경고)·hex는 차단 → 토큰신설+차단승격이 1단위. 실행完(정본 v0.58.0·device v0.50.0)

- [CNOTE Figma 아이콘 라이브러리(🎨 Icon·Phosphor 1512셋)](reference_cnote_figma_icon_library.md) — ★260812 화면 조립 시 아이콘은 SVG 직접그리기 금지·라이브러리 컴포넌트 인스턴스로. Format×Weight variant. SCR_HOME 재구성 정본=섹션 2545:7208(라이트 2549:126/다크 2563:126). 사용자 지적으로 29개 SVG→인스턴스 전량 교체

- [CNOTE 프로세스 개선 5건 — ★채택 완료](project_cnote_process_tiering_proposal.md) — ★260810 마스터 반영完(4파일+루트): 티어링 T1직행/T2풀·1게이트1주인(★②는 절충=게이트 재실행 금지하되 **대사표 실측 유지**)·핸드오프1회발행·안티그래비티=저위험만·규칙 다이어트 분기1회. 남은위험=T1 오판은 사후회고에서만 드러남

- [CNOTE 체크리스트 v1.1 — 하류 대조](project_cnote_checklist_v11_downstream.md) — ★260810 A3-05 신설(판정규칙 확정 전 하류 화면 1:1 대조·게이트가 못 잡는 유형)+B1-05 확장(빈상태 이중의미 금지). 104→105. ⚠**§5-5 상계 1건 미이행** — 다음 분기 다이어트에서 1건 하향·폐기 필요

- [git useHttpPath 전역 금지(회사 push 마비)](reference_git_credential_usehttppath_trap.md) — ★260810 실사고. 전역에 켜면 회사 repo가 host레벨 자격증명(git:https://github.com)과 매칭 실패→push 통째로 불가(재인증창도 안 뜨고 그냥 실패). 반드시 includeIf 하위 ~/.gitconfig-personal에만. 검증=양쪽 git ls-remote. 교훈=전역설정 변경은 동시 세션을 조용히 망가뜨림

- [FP 세션(재무설계+파이썬자동화+풀스택) 프로젝트](project_fp_finance_automation.md) — ★260810 신설. 별칭 FP=3역 겸직. 폴더=IMGINE/03_projects/260810_FP(표준구조+01_docs 4분류+_INDEX). ★데이터원칙=로컬전용·git커밋금지·자격증명분리·가정라벨. 상태=셋업만 완료, 스택·첫스텝·데이터소스 미정(사용자 대기)

- [컴팩트 재개=킥오프 밖 맥락은 추측금지·원본 실검색](feedback_post_compact_context_recall.md) — ★260810 킥오프/요약에 없는 파일·수치·이름을 건드리면 착수 전 원본 .jsonl Grep→_INDEX→메모리→질문 순 회수. 원본 트랜스크립트는 디스크 보존(요약 말미 경로). compact-prep §5 재개프로토콜+§4a 킥오프§0 템플릿에 명문화(2프로필). post_compact_verification(검증)의 짝=유실회수

- [토큰 자가감시 범용 배치(개인·회사)](reference_context_selfmonitor_universal.md) — ★260810 compact-prep 스킬·context-guard 후크·context-pct 스크립트를 ~/.claude·~/.claude-company 양 유저레벨에 자립 미러(누수0). context-pct=CLAUDE_CONFIG_DIR 자동감지 범용화. 워크스페이스 후크는 이중발화 방지로 제거. 재시작 후 적용. 미검증=후크 병합규칙(1회 발화 확인 필요)

- [컴팩션 후 재개 검증 절차(필수)](feedback_post_compact_verification.md) — ★260810 컴팩션 요약=기억. 재개 즉시 자동발동: 추측편집 금지(실파일 앵커)·전후 편집 전수 재검증(미치환 grep)·결과 보고·실파일이 정본. 루트 CLAUDE.md 등재. 실사고=태그스윕 미치환+병합행 중첩 오삽입

- [CNOTE 람스 디자인철학 도입(초안)](project_cnote_rams_philosophy.md) — ★260808 크리에이티브. 디터 람스 10원칙을 CNOTE/Tieming 디자인철학으로 도입(정본초안). spine=람스 규율/signature=원언어+골드, 2층분리(코어 엄격/표현층 완화), #6정직=AI확신위조금지. 산출=_DESIGN_PHILOSOPHY_Rams적용_초안·SCR_HOME before/after(artifact b9d8badd). 미결(마스터결정)=게이트강제·정본편입형태. 거버넌스=마스터 검토대상

- [CNOTE IBMS2 연동명세 v1 정합 v0.24.0](project_cnote_ibms2_spec_v1.md) — ★260806 명세 htm=정본. no-opp 반전(막다른길→AI 신규영업건 동반생성)·CASE_DETAIL 신규(단계·이름만 수정)·인물상세 영업건 섹션 5상태+이력 병합·요약 5줄 형식·업체담당 고정. 함정=midfi bottomnav은 게이트 밖·예시 데이터 정합·both-sides 앵커 중복

- [Claude 회사/개인 프로필 분리](reference_claude_profile_split_company_personal.md) — ★260806 검증성공. 로그인=Windows사용자당1개(~/.claude/.credentials.json)라 VS Code·Antigravity 공유됨 → **CLAUDE_CONFIG_DIR**로 분리(VS Code=회사 `_회사_VSCode_실행.cmd` / Antigravity=개인 기본). ★함정=VS Code 완전종료후 런처실행·.cmd는 ASCII전용(CP949)·통째복사 금지

- [CNOTE 멀티 명함 N개 v0.23.1](project_cnote_multicard.md) — ★260806 구현완료. 상한5·기본1·삭제=링크 즉시만료·연락처 공통. 마이|cards 칩스위처+PROFILE_EDIT|multi/new(기본지정·삭제 흡수)+BS_CARD_DELETE_CONFIRM+공유시트 칩. ★v0.23.1 SCR_MY_CARDS 폐기(칩+✎와 중복). 함정=이름 nowrap·화면CTA는 인라인 보라(.btn.fill은 시트용)

- [CNOTE 마스터(Master) 역할](project_cnote_master_role.md) — ★260805 모든 작업 정문. 유형판정(6분류×20)·라우팅·게이트·자기개선루프(lesson_recall/save/reflect). 관제단일·실행안함(worker가 실행). 통신=맥락세션 저널핸드오프/결정론 직접. 거버넌스=수정 승인+변경이력. 산출=플레이북정본·master-router스킬·로스터·run_gates에 tsc편입. 루프는 DNA(1일차)

- [CNOTE IA 정책+개선배치 G0~G7](project_cnote_ia_policy_g_batch.md) — ★260805 v0.17~0.20 완결. nav=1depth만+check-nav-policy 게이트·5탭 공통불변·AI비서=헤더🤖 상시/비서(사람)=마이 조건부·비서모드 순환(비서마이 신설)·헤더규격 🤖🔔+탭유틸1. G1 명함(랜딩 480중앙)·G2 녹음필·G3 🔔관리인맥 스위치·G4 위치기회(km+체류+쿨다운)·G5 이메일권한 오버스펙 제거·G6 delegate 정렬. 스토리북2 device 백로그 대량

- [CNOTE 에이전트·스킬 확충 Phase1](project_cnote_agents_skills_확충.md) — ★260804 회사계정. 프레임워크=디스패치가능→에이전트·맥락필요→스킬·결정론→스크립트. 제작=rebuild_flow(/flow-wire·btnNav함정차단)·run_gates(/gate-check)·premium-craft·circle-visual-language·figma-quality-gate. ISPARK\.claude. Phase2 백로그有

- [워크스페이스 회사/개인 분리(★Phase1 실행완료)](project_workspace_company_personal_split.md) — ★260804 Phase1 완료: 회사 6항목→`ISPARK/` 이동(CNOTE 새 경로=`ISPARK/03_projects/260610_C-Level_note/`, storybook 검증통과·.cache 삭제필수). Phase2(개인 IMGINE/) 대기. 하위폴더안(ISPARK\·IMGINE\)+루트CLAUDE.md범용화. 회사=FIGMA/ISPARK_MCP/CNOTE+02_office/04_design/07_archive, 개인=forest/MATO/Chrome/THEMONY/TSMIN/DEEPNAUT/skills, 공용=000000_INFO/05_notes(A). 검증=CLAUDE.md만 상위상속(누수)·settings/MCP/메모리 격리. 다른세션 완료후 실행
- [AI 비서(대화형·3계층) 신설](project_cnote_ai_assistant.md) — ★260803 v0.15.0 MVP2. 기획 3계층 SCR_ASSISTANT 활성화. 앱데이터 그라운디드·조회+간단액션(승인게이트)·결과카드·단일대화·음성1급·새창. 신규 2midfi_13_assistant 4상태(empty 추천칩·normal 대화+카드·action-confirm 승인·listening 음성). flows ⑫ 그룹. ★진입점 미정(TBD)
- [브리핑 고정대상=즐겨찾기 재정의](project_cnote_pinned_briefing.md) — ★260803 v0.13.0 즐겨찾기★=‘챙기는 분’(고정 대상) 통합재정의. 인맥 이중구조(고정=통제↔quiet=AI발굴). SCR_HOME 신규 CARD_PINNED_UPDATES(4유형·상한3·fill없음·변화없으면숨김)+★의미전달(LABEL_PINNED_STATE·BS_PINNED_INTRO 1회안내). 개발=8시집계 4종스캔·직책자동감지는 후행

- [브리핑 고정대상=즐겨찾기 재정의](project_cnote_pinned_briefing.md) — ★260803 v0.13.0 즐겨찾기★=‘챙기는 분’(고정 대상) 통합재정의. 인맥 이중구조(고정=통제↔quiet=AI발굴). SCR_HOME 신규 CARD_PINNED_UPDATES(4유형·상한3·fill없음·변화없으면숨김)+★의미전달(LABEL_PINNED_STATE·BS_PINNED_INTRO 1회안내). 개발=8시집계 4종스캔·직책자동감지는 후행

- [스토리북 Component/Module 위계+게이트](reference_storybook_hierarchy_gate.md) — ★260803 형제조합=Module/·원시=Component/(title 접두사). 재분류 Comp56/Mod25/Page50. check-hierarchy.mjs 게이트(gate편입·FAIL차단)·ATOM/MODULE_ALLOWLIST. ★함정=flow참조 story id(TutorialSheet/ProfileMethodSheet)는 title만 Module/·id=component-* 보존
- [빈상태 히어로=원 언어 재해석](project_cnote_empty_circle_language.md) — ★260803 empty 8종 구상아이콘 폐기→원(Circle) 시각언어(㉒-ⓐ). HeroIllust EmptyMark 8종(동심pulse/수직시리즈/수렴/그리드/동심포함/방사72°/단일동심/대각). 공통셸 EmptyMarkShell(glow+무대링r58op.32)·내부 절제·링여백. 시안=Artifact승인
- [디자인=전체시스템·원점(단편수정 금지)](feedback_design_holistic_not_piecemeal.md) — ★지적부분만 국소반영하면 매수정이 새결함(클립보드→배터리). 정본원칙 로드→전체 한 시스템 설계→시안승인→일괄. brainstorming 스킬로 방향먼저. 로컬SVG 사전검증
- [CNOTE 튜토리얼 시트 흐름 정본](project_cnote_tutorial_sheet_flow.md) — ★260730 씨앗홈 튜토리얼(명함/일정/할일) flow.html 최종. payoff=시트안마무리·passthrough제거·시트=내용만(TaskList embedded, 탭바있는건 얘뿐)·하단[홈으로|닫기(→허브)]·시트배경 whitenSheet로 흰색·완료가이드카드

- [회사↔집 agentmemory 동기화(방식1)](project_agentmemory_sync_cross_pc.md) — ★260729. GitHub 비공개 repo 경유(export JSON 집에서 직접읽기)+SessionEnd훅+30분스케줄러. .claude쓰기·git push는 auto필터 차단→로컬실행
- [서비스명 Tieming·스플래시](project_cnote_brand_tieming.md) — ★260730 CNOTE 대외명=Tieming. SCR_SPLASH 신설(바이올렛·5노드·골드). v0.9.0. ★v0.9.2 온보딩 재설계(신규 SCR_SIGNUP_EMAIL 이메일+이름 통합·NAME_QUICK 삭제·소셜 WELCOME직행·나중에하기)
- [MVP2 착수 IA점검](project_cnote_mvp2_ia_audit.md) — ★260803 1차 실측 SCR66·상태135·정합100%. ★갭=비서위임/통제 7화면 flows 미연결·기획v2.1 MVP표 2버전 모순·IA엑셀36 미현행화·IBMS2 문서밖. 결정필요=비서위임 1차vs2차. 리포트 01_docs/검토_분석/_MVP2_착수_IA점검_260803
- [메뉴 순서 정본=flows.json](reference_cnote_menu_order_ssot.md) — ★260730 프로토타입·flow.html·스토리북 메뉴순서를 flows.json flows[] 하나로 정본화(유틸리티 뒤로). export_menu_order→_menu_order.json(스토리북 계약)·build_flow_nav 꼬리덤프 수정·check-menu-order 게이트. 스토리북 불일치 23건 저널 전달
- [Tieming BI·앱아이콘 방향](project_tieming_bi.md) — ★260729 BI=Tieming(Tie+Timing). 심볼=워드마크 m 파동/펄스, 오른쪽 정점만 골드. 다크 스퀘어클 앱아이콘
- [CNOTE v0.8.0 설계변경 4건](project_cnote_v08_design_batch.md) — ★260728 일정등록 재구성·녹음알림 이관·캘린더→일정·홈카드2·관계카드. v0.8.4 캘린더필터·마이 재편. v0.8.5 디지털명함카드+SCR_PROFILE_EDIT
- [CNOTE v0.6 씨앗홈·점진온보딩](project_cnote_v06_seed_onboarding.md) — ★260727 스토리북2 완료(aa55d03)·flow 20/20·SeedCard v2 파스텔 정본
- [CNOTE v0.6 온보딩JIT·홈2레이어·인맥탭](project_cnote_v06_onboarding_jit.md) — ★260727~28 v0.6~0.6.5 배포. 온보딩=가치먼저·적시. v0.6.5 설정→마이 승격. 미결=인물상세 알림카드 중복(방향A)
- [CNOTE v0.5 홈풍성화·우리회사소식](project_cnote_v05_home_company_news.md) — ★260724 조용한날 홈 3선반+회사소식 재사용모듈(네이버뉴스API)+SCR_COMPANY_NEWS
- [CNOTE 배포 KEX 근본해결](reference_cnote_deploy_sftp_kex_fix.md) — ★deploy-sftp를 ssh2-sftp-client 단일연결로(260723). 208파일 38초·재시도0
- [DEEPNAUT 유튜브 프레임 백엔드](project_deepnaut_youtube_frames.md) — ★260723~24 영상프레임 추출. 자립형 backend-installer(포트8777). 확장 v1.5.0. 함정=-g progressive+ffmpeg시킹·vbs숨김창
- [DEEPNAUT 확장 글쓰기 삽입](project_deepnaut_editor_injector.md) — ★260723 claude.ai 자동생성→네이버 원클릭삽입. chrome.debugger 신뢰입력·blob Ctrl+V. v1.6.0 홍기자개선. ★wrangler deploy가 대시보드 vars삭제→키는 secret
- [DEEPNAUT 네이버 자동로그인 확장](project_deepnaut_naver_login_ext.md) — ★260722 별칭 딥노트. 버그=패스키버튼 오클릭→정확히"로그인"선택(v1.1.1). 정답=수동1회 세션유지
- [NativeWind Animated.View className 함정](reference_nativewind_animated_classname.md) — ★className 무시됨. Animated.View엔 style만·시각스타일은 내부 View className
- [THEMONY GSC 색인 실측법](reference_themony_gsc_measurement.md) — ★260801 라이브 실측. SA=google-blog-check(MATO credentials.json)·sc-domain·URL은 원문UTF-8+슬래시로 조회(퍼센트인코딩 넣으면 전부 unknown 오판). 실측=리라이트 재크롤0/30·숨김49색인잔존→검토요청 아직NO. 강제색인 API불가, 사이트맵재제출만
- [THEMONY AdSense 니치집중·숨김·소수정예](project_themony_adsense_niche_focus.md) — ★260731 소수정예 완료: 공개108→57(전부 최필립개선·미개선0)·초지역정부지원43+연금중복8 숨김·리라이트30(설계Opus+Sonnet팬아웃+스크립트검증). SPC=fallback_cache FTP리네임. 4~8주뒤 AdSense검토요청
- [협업 저널 자동감지 A훅](reference_journal_notify_hook.md) — ★journal-notify.mjs+UserPromptSubmit. 세션별커서·cwd역할판정. 신규저널 다음입력시 주입
- [CNOTE 명함 일괄등록/내보내기+테마](project_cnote_card_import_theme.md) — ★260720 신규3화면(CARD_IMPORT·EXPORT·BS_THEME_PICK). 리멤버 13열·30일
- [CNOTE 트랜잭션 이메일 템플릿](reference_cnote_email_templates.md) — ★공통 OTP폼 cnote_email_otp_verify.html. Pleos계승·브랜드 CNOTE. SCR_MAIL_OTP_VERIFY
- [토큰효율 실행전략 상시적용](feedback_token_efficient_execution.md) — ★매 본격작업 착수전 직접vs서브에이전트·스크립트·모델라우팅 1줄 판단. UserPromptSubmit 후크로 재주입
- [THEMONY 인증 레이어](project_themony_auth_layer.md) — ★260716 Nextend+TML REST, 구글로그인 라이브. ★wp-admin캐시버그=CF Page Rule bypass
- [CNOTE 디자인 파운데이션 정본](project_cnote_design_foundation.md) — ★5축(타이포·스페이싱·라인·레디우스·컬러) 전42화면 확산(260716). SSOT=WidgetCard. 게이트 check-foundation.mjs
- [CNOTE×IBMS2 연동 IA통합](project_cnote_ibms2_integration.md) — ★260715 추가3화면 통합·배포. IBMS2=MVP상시. 함정=deploy-sftp midfi 고정목록에 추가필요
- [THEMONY Cloudflare CDN](project_themony_cloudflare.md) — ★260715 HTML 엣지캐싱. cafe24 wp-admin 국내IP만→CF프록시 403충돌 해소. zone 0072ee1e
- [THEMONY 한국인 이미지 소스](reference_themony_korean_image_sources.md) — ★Pixabay 약함·Pexels 한국사진多(API키 등록, User-Agent필수)
- [CNOTE Flow Player(flow.html)](reference_cnote_flow_player.md) — ★모바일 실화면 흐름검증. emitCta→btnNav. 정본 _nav_map.json. _screen_links에 SCR_X|state 파이프키 등록해야 잡힘
- [cnote-front git 범위=storybook/만](feedback_cnote_front_git_scope.md) — ★스토리북=03_dev/cnote-front/storybook/. 밖은 pull만. add storybook/…로 스코프
- [투명 outline 버튼=서피스 배경 필수](feedback_outline_button_surface_bg.md) — ★투명bg는 회색캔버스서 사라짐. outline/ghost=bg-surface+테두리. 캔버스 투명 금지
- [THEMONY 마케팅 카테고리(A/B/C)](project_themony_marketing_categories_260711.md) — ★계산기24 라이브+내비. 교훈=배포전 슬러그충돌 확인
- [THEMONY 애드센스 콘텐츠 개선](project_themony_adsense_remediation.md) — ★260711 gov63·여행49·연금33·계산기22 표준적용. 경험날조 제거. wp:html로 JS wpautop회피
- [CNOTE 팔레트=바이올렛+골드+그레이](project_cnote_palette_violet_gold.md) — ★primary#4127D1/#6549FF·accent골드#F2DB10≤5%·canvas#EBEBEB. 다크 primary계열 전체정의 필수
- [CNOTE 메인탭 헤더=MainTabHeader](reference_cnote_maintabheader.md) — ★모듈2174:129(3변형 자동플립). 15화면 인스턴스. 인라인 헤더 금지
- [CNOTE 설정+사람 카테고리](project_cnote_settings_people.md) — ★설정9+사람6 완료. 크롬이원화·PersonHeroCard·섹션 상대좌표
- [CNOTE BottomSheet 시안 표준](reference_cnote_bottomsheet_style.md) — ★세트1056:362 시안통일(순백·핸들·타이틀18중앙·풀폭55·라디오)
- [CDS 탐색·메타 정책](project_cds_nav_meta_policy.md) — ★상세화면 탭바숨김·mid-fi 메타5종 이관금지. 미결=설정5화면 재확인
- [디자인 완료=확인위치 안내 필수](feedback_design_output_location.md) — ★완료시 Figma 링크(노드ID·페이지) 안내. 눈검증용
- [CDS 하네스(/cds-build+워커6종)](reference_cds_harness.md) — 시안동결·모듈강제·게이트2종. 정본=CDS_로직체계_정본_260706
- [THEMONY Claude 호출=CLI 전용](feedback_themony_claude_cli_only.md) — API 과금 금지, harness/cli_client 경유(구독)
- [THEMONY 하네스 v2](project_themony_harness_v2.md) — 병렬수집·제목심사·3중게이트, scheduler 전환(260703)
- [미확인·추정을 사실처럼 말하지 말 것](feedback_no_unverified_as_fact.md) — ★260801. 검증/인용만 사실 단정·실측은 측정값 명시·추정은 "추정·확인필요" 먼저 밝힘·모르면 모른다. "4~8주"·"하루10건" 추정 단정이 계기
- [버튼 이모지 금지→아이콘](feedback_no_emoji_in_buttons.md) — ★260810 버튼·인터랙티브에 이모지(✎·🔍) 금지, phosphor 아이콘 사용. 편집=IconButton+PencilSimple(NoteResult/Person 스타일). 배지 ✨/⚠도 Sparkle/Warning 아이콘. 실사례 OUTBOX [✎수정]→IconButton(4acd4a0)
- [한글 응답 설정](feedback_language.md) — 모든 대화·설명 한글
- [시각 작업 눈 검증 필수](feedback_visual_verification.md) — 코드성공≠시각정상. 렌더를 적대적으로 눈검증. 렌더 이상신호를 툴아티팩트로 성급히 기각 금지
- [Figma SECTION 자식=상대좌표](reference_figma_section_relative_coords.md) — ★섹션 appendChild 후 절대좌표=밖으로 튕김. 로컬좌표 사용
- [CNOTE 대비이슈 해결→다음=이슈2](next_session_cnote_contrast.md) — ✅이슈1 완료(tertiary→secondary 28곳). 다음=이슈2 다크카드 분리감
- [폴더 형상관리 가이드](reference_folder_governance.md) — ISPARK 폴더 구조·파일 위치 기준
- [주간보고 포맷 규칙](feedback_weekly_format.md) — U+3000 들여쓰기, 테이블 금지, 계층 구조
- [CNOTE 프로젝트 현황](project_cnote.md) — 260610_C-Level_note 디자인 시스템 환경 구축 완료
- [워크스페이스 자동화 현황](project_workspace_automation.md) — /meeting·/weekly 커맨드, 환경체크 파이프라인
- [다음 세션 CNOTE 작업](next_session_cnote.md) — tokens.css 교체+첫 컴포넌트 구현
- [docx 처리 절차](feedback_docx_handling.md) — docx 전달시 pandoc 변환 먼저, 그다음 버전 비교
- [CNOTE Figma 변수/폰트](project_cnote_figma_variables.md) — Variables 바인딩·다크모드 완료. node 3:2 레퍼런스. Pretendard MCP 로드불가
- [CNOTE 와이어프레임 IA 산출물](project_cnote_wireframe_ia.md) — v2 36화면 IA 엑셀+분할이미지+Figma보드
- [agentmemory 설치 현황 + ★260813 전량유실 사고](project_agentmemory.md) — ★사실상 한 번도 영속된 적 없었다(예약작업 WorkingDirectory 공란→상대경로 ./data 가 System32 로→미영속·재시작마다 전량소실). 예약작업 WD 적용完·start-daemon.ps1 미보강(잔여). 판별식 4종·복구순서(검증 없이 import 금지)·30분 백업 .agentmemory-sync. ★보조기억일 뿐 1차사료=저널·대장. 관할=vs마스터. summarize 실패는 결함 아닌 LLM압축OFF 정책의 부작용
- [PS5.1 BOM 함정](reference_ps51_bom.md) — BOM없는 UTF-8 .ps1은 PS5.1서 파서에러. 셋업전 BOM 확인
- [세션 별칭 레지스트리](project_session_alias_registry.md) — 멀티세션 별칭(피그마/기획/오피스)+SessionStart 후크로 역할질문
- [CNOTE Storybook 캐시 긴경로 함정](reference_cnote_storybook_cache_longpath.md) — .cache 긴경로 스킵→deps 504. 캐시삭제 후 재기동, 압축시 .cache 제외
- [Figma 스킬 설치 방식](reference_figma_skills_install.md) — figma-use·create-new-file 로컬설치. skillNames=resource:figma-use
- [CNOTE Figma↔Storybook 동기화](project_cnote_figma_storybook_sync.md) — 20종 일치화. 정본=Storybook
- [CNOTE Figma 컴포넌트화](project_cnote_figma_componentization.md) — 쇼케이스 Frame≠컴포넌트. 21종 실제 Component Set으로 제작
- [CNOTE 로파이 HTML 와이어프레임](project_cnote_wireframe_html.md) — 02_design/screen_design/ lo-fi+mid-fi+brief, data-*+check-coverage.mjs
- [화면설계 파이프라인 재사용도구](reference_screen_design_pipeline.md) — /screen-pipeline+워커3종+툴킷. 인벤토리→lofi→midfi→brief
- [CNOTE 화면 정본=IA v2](project_cnote_ia_source_of_truth.md) — 정본=CNOTE_IA_v2_draft 엑셀(36화면)
- [CNOTE 운영도구(배포·DB)](reference_cnote_ops.md) — screen-ops+deploy-sftp·db-admin. 자격증명=.deploy.local.json. SFTP 140.238.15.203
- [CNOTE 화면링크 추적허브](reference_cnote_screen_links.md) — 화면별 Figma·Storybook 링크 자동매핑. _screen_links.json
- [CNOTE 반영근거 자동집계](project_cnote_screen_changes.md) — 화면별 근거 export→프로토타입 메모패널. 버전라벨 v0.N
- [Claude Design CNOTE Home 시안](reference_claude_design_cnote_home.md) — DesignSync MCP. Home 시안3종 DS적용 HTML
- [CNOTE Dynamic Layer 라이브러리](project_cnote_dynamiclayer_library.md) — dynamiclayer.io/docs 로컬구조화(컴포넌트40+토큰21)
- [크롬확장 자동화 프로젝트](project_chrome_ex.md) — 260624_Chrome_Ex. MV3 네이버 자동포스팅. 핵심=chrome.debugger+CDP
- [THEMONY MRT 이미지 파이프라인](project_themony_mrt_image.md) — partner-ext-api Bearer로 투어이미지→WP. mrt_image_fetcher.py
- [Themony 접속 정보](reference_themony_credentials.md) — wp-admin·FTP. FTP=philichoi1977.mycafe24.com(21). 140.238.15.203은 CNOTE(혼동금지)
- [THEMONY 부동산 키워드](project_themony_budongsan_keywords.md) — 11,847건. 계산기군 골드. 정책규제=죽은카테고리
- [THEMONY 부동산 계산기 12종 라이브](project_themony_calculators.md) — 대출6·세금5·복비1. ★KSES가 인라인JS훼손→FTP정적+script src. 정본 verify_formulas.py
- [THEMONY 연예/방송 자동발행 기획](project_themony_broadcast.md) — broadcast_autoposter. yt-dlp+자막+프레임→리캡DNA→WP. 설계 대기
- [THEMONY 보험통합+요일스케줄](project_themony_insurance_schedule.md) — ★보험 파이프라인 통합(5번째). 하루3글 요일로테이션. 재심사중 이중비활성
- [THEMONY 이미지 최적화 표준](reference_themony_image_optimization.md) — ★업로드전 최적화 필수. 정본 image_optimizer.py(1600px·≤200KB). 배치후 LiteSpeed purge
- [THEMONY 토픽 클러스터 자동화](project_themony_topic_cluster.md) — ★Pillar-Cluster 3층. topic_cluster.py+_topic_map.json. 파일럿 post2097
- [THEMONY 부동산 무한발행](project_themony_budongsan_autopost.md) — budongsan_autoposter 구축. 스케줄 10·14시. 실발행/--setup 대기
- [API 키 중앙 레지스트리](reference_api_keys.md) — 전세션 공통. 000000_INFO/API_KEYS.md. 네이버/Pixabay/Claude/Gemini/WP/쿠팡/Supabase
- [CNOTE 디자인 로드맵](project_cnote_design_roadmap.md) — 3단계+47화면 분류. 정본 _DESIGN_ROADMAP_260701.md
- [CNOTE 원 시각언어 명료성](project_cnote_circle_language_clarity.md) — 원은 명시적 기하규칙(접선·동심·방사72°)으로 조립. 카탈로그 정본 314:2
- [CNOTE 프리미엄 미감 크래프트](project_cnote_premium_craft.md) — 크리스프·미니멀·광원. ★글로우=대면적 전용·힌트강도. 베이스 네이비#080E1C. 정본 CDS_premium_craft_guide
- [CNOTE 녹음 진입 설계](project_cnote_recording_entry.md) — FAB 미팅정리→녹음 통일. 탭=녹음즉시/롱프레스=시트. 게이트는 state로 오버레이
- [CNOTE IA 재편 프로그램](project_cnote_ia_reorg.md) — Component/Module/Templet 3층. 정본 CDS_IA_operating_model_guide. Phase0 진행
- [CNOTE 반응형 레이아웃](project_cnote_responsive_layout.md) — 모바일유동+태블릿 max-width640. 스펙 _RESPONSIVE_LAYOUT_SPEC_260703
- [CNOTE mid-fi 메타분리·탐색구조](project_cnote_midfi_meta_nav.md) — mid-fi P1/◆/→/hidden=설계메타(UI아님). 상세·과정=탭바숨김/모달
- [CNOTE 디자인 기획 현행화 프로세스](project_cnote_design_reconciliation.md) — 미드파이=살아있는 스펙. 시안델타 삼중 역동기화. 정본 CDS_design_reconciliation_process
- [CNOTE 병렬 하네스](reference_cds_parallel_harness.md) — 다중세션 병렬(클레임/락/저널+모델정책). MVP=사람·소통·설정·미팅흐름
- [THEMONY 디자인 레퍼런스=tworld](reference_themony_design_system.md) — ★Tworld 느낌(넉넉여백·큰타이포·샤프2px·그레이). 브랜드색은 THEMONY 파랑#2563eb 유지
- [THEMONY 계산기 UX 고도화](project_themony_calculators_ux.md) — 계산기12+허브. Phase1 배포(프레임·천단위·프리셋·게이지). 정본 _WORK_PLAN_calculator_ux_upgrade
- [컴팩트 시 킥오프 지시서 자동생성](feedback_compact_kickoff_doc.md) — ★/compact 추천시 다음세션 킥오프 지시서(§0=붙여넣기) 자동작성. 요청없어도 자동
- [CNOTE 스토리북 v2=RN 전환](project_cnote_storybook_v2_rn.md) — ★v2(260610_cnote_v2)=웹→RN 재작성 피벗(260709). NativeWind·react-native-web. 계획서 _WORK_PLAN_RN_전환
- [크기값=시맨틱 토큰 일관관리](feedback_semantic_size_tokens.md) — ★패딩·폰트·치수·보더를 시맨틱토큰. 코드=SSOT·Figma 역반영. raw px 금지
- [CNOTE 스토리북 구조정리(3층)](project_cnote_storybook_structure_reorg.md) — ★정본 3층(Component/Module/Page). Phase1 완료. Phase2 킥오프 260712
- [명함일괄/테마 신규3화면 RN조립](project_cnote_bulkcard_theme_screens.md) — ★260720 완료(CardImport 3상태·CardExport 2탭·BS_THEME_PICK)
- [flow btnNav 재빌드 함정](reference_flow_btnnav_rebuild_trap.md) — ★flow 화면내 버튼이동=btnNav 의존. build_btn_nav 마지막 실행 필수(260730 실발생)
