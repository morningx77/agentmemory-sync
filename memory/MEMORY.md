# Memory Index

## 규율

- [★.mcp.json은 폴더 계층 상속](reference_mcp_json_folder_inheritance.md) — 260827 프로필 갈라도 부모 .mcp.json이 자식 트리에 실린다. `permissions.allow`엔 평문 자격증명이 쌓인다
- [★일부만 보고 "없다" 금지](feedback_partial_response_is_not_absence.md) — FP 7건. 조용히 틀린다(조회 성공+그럴듯한 숫자). 빈 결과=범위 의심 먼저
- [★미확인·추정을 사실처럼 말하지 말 것](feedback_no_unverified_as_fact.md) — 검증만 단정·추정은 "확인필요" 먼저·모르면 모른다
- [★본문이 셸을 거치면 백틱이 실행된다](feedback_shell_body_corruption.md) — 260904 실사고. 도구엔 파일경로만 넘겼는데 그 파일을 만든 `python -c`가 셸이라 파일명 3개 증발. **무음**(exit 0·사후검증 통과). Write 도구로 만들 것
- [★컴팩션 후 재개 검증](feedback_post_compact_verification.md) · [맥락 회수](feedback_post_compact_context_recall.md) — 요약=기억. 추측편집 금지·실파일이 정본. 밖 맥락은 원본 .jsonl Grep→_INDEX→메모리→질문
- [컴팩트 시 킥오프 자동생성](feedback_compact_kickoff_doc.md) — §0=붙여넣기. 요청 없어도 자동
- [★일관성 > 축별 최적·60대](feedback_consistency_over_local_optimum.md) — "이 화면만 예외"를 혼자 가르지 마라. 범위는 "무엇을 가졌느냐"로 센다
- [기각 전 4단 재심](feedback_reexamine_before_rejection.md) — 역방향·조건부분해·역할전환·제약재정의 후에만
- [프롬프팅=긍정공식](feedback_positive_prompting_no_reflex_ban.md) — 금지목록=풍선효과. 생성공식을 보강한다
- [규율 승격=문서 등재까지](feedback_rule_promotion_needs_doc.md) — 확인=정본 grep. ★해시 일치≠화면 정상
- [디자인 요소는 의미를](feedback_design_meaningful_elements.md) — 분모 없는 게이지=거짓. 규율은 나쁜 디자인만 막는다
- [디자인=전체시스템](feedback_design_holistic_not_piecemeal.md) — 국소반영하면 매 수정이 새 결함
- [★빌드·배포 출력 자르지 마라](feedback_never_truncate_build_output.md) — tail이 경고와 종료코드를 먹는다. deploy-sftp는 빌드 안 한다
- [★본문을 셸에 싣지 마라](feedback_visual_verification.md) — 백슬래시·백틱=조용한 훼손(하루 6회·라이브 유출 2건). 패치는 파일로 써서 node. 한글 \u 금지. className도 토큰으로 대조
- [★시각 작업 눈 검증](feedback_visual_verification.md) — 코드성공≠시각정상. ★「면이 보인다」는 backgroundColor 로 안 잡힌다(box-shadow·filter·::before 함께). className 도 렌더에서 읽어라
- [완료=확인위치 안내](feedback_design_output_location.md) — Figma 링크(노드ID·페이지)
- [대기 금지](feedback_no_idle_waiting.md) — 대기=준비시간. 타임라인 먼저
- [토큰효율 실행전략](feedback_token_efficient_execution.md) — 직접vs서브에이전트·스크립트·모델라우팅
- [배포는 요청 시에만](feedback_deploy_on_request_only.md) — 임의 배포 금지
- [버튼 이모지 금지](feedback_no_emoji_in_buttons.md) — phosphor. 편집=IconButton+PencilSimple
- [투명 outline=서피스 배경](feedback_outline_button_surface_bg.md) — 투명bg는 회색캔버스서 사라짐
- [크기값=시맨틱 토큰](feedback_semantic_size_tokens.md) — raw px 금지. 코드=SSOT
- [cnote-front git=storybook/만](feedback_cnote_front_git_scope.md) — 밖은 pull만
- [주간보고 포맷](feedback_weekly_format.md) — U+3000·테이블 금지·5분류
- [docx 처리](feedback_docx_handling.md) — pandoc 변환 먼저
- [한글 응답](feedback_language.md) — 모든 대화 한글
- [THEMONY Claude=CLI 전용](feedback_themony_claude_cli_only.md) — API 과금 금지

## CNOTE / Tieming

- [마스터 역할](project_cnote_master_role.md) — 정문·유형판정·라우팅·게이트·자기개선루프. 실행은 안 함
- [★ag 세션 온보딩 규약](project_cnote_ag_session_onboarding.md) — 배분=handoff_to에 내 별칭 있을 때만. ★claim done은 점유 안 꺼짐(status 직접 변경). device 게이트 12종(문서의 10은 낡음)
- [프로세스 개선 5건](project_cnote_process_tiering_proposal.md) — 티어링 T1/T2·1게이트1주인·핸드오프1회
- [체크리스트 v1.1](project_cnote_checklist_v11_downstream.md) — 105항목. ⚠§5-5 상계 1건 미이행
- [IA 정책 G0~G7](project_cnote_ia_policy_g_batch.md) — v0.17~0.20. nav 1depth·5탭 불변·헤더 🤖🔔
- [IA 재편 3층](project_cnote_ia_reorg.md) · [화면 정본=IA v2](project_cnote_ia_source_of_truth.md) — Component/Module/Templet. 정본=IA_v2 엑셀 36화면
- [MVP2 IA점검](project_cnote_mvp2_ia_audit.md) — SCR66·상태135. 갭=비서위임 flows 미연결
- [디자인 현행화 프로세스](project_cnote_design_reconciliation.md) — 미드파이=살아있는 스펙. 삼중 역동기화
- [디자인 로드맵](project_cnote_design_roadmap.md) — 3단계+47화면 분류
- [에이전트·스킬 확충](project_cnote_agents_skills_확충.md) — 디스패치→에이전트/맥락→스킬/결정론→스크립트
- [CDS 탐색·메타 정책](project_cds_nav_meta_policy.md) · [mid-fi 메타분리](project_cnote_midfi_meta_nav.md) — 상세=탭바숨김. P1/◆/→/hidden=설계메타
- [반응형 레이아웃](project_cnote_responsive_layout.md) — 모바일유동+태블릿 max-width640
- [비서 위임·역할 분리](project_cnote_delegate_role_split.md) — 위임 범위·권한
- [SCR_NOTE_RESULT 리포트화](project_cnote_note_result_report.md) — 마스트헤드·원본칩+시트. ★P6 온컬러 고정4색(알파는 다크서 AA붕괴)
- [람스 디자인철학](project_cnote_rams_philosophy.md) — 10원칙·2층분리. 미결=게이트강제
- [팔레트=바이올렛+골드](project_cnote_palette_violet_gold.md) — #4127D1/#6549FF·골드#F2DB10≤5%·canvas#EBEBEB
- [디자인 파운데이션 정본](project_cnote_design_foundation.md) · [컴포넌트 시스템](project_cnote_component_system.md) — 5축 전42화면. SSOT=WidgetCard·check-foundation.mjs
- [프리미엄 미감 크래프트](project_cnote_premium_craft.md) — 크리스프·광원. 글로우=대면적 전용
- [원 시각언어](project_cnote_circle_language_clarity.md) · [빈상태 히어로](project_cnote_empty_circle_language.md) — 접선·동심·방사72°(카탈로그 314:2). EmptyMark 8종
- [IBMS2 명세 v1](project_cnote_ibms2_spec_v1.md) · [IA통합](project_cnote_ibms2_integration.md) — 명세 htm=정본·no-opp 반전. 함정=deploy-sftp 고정목록
- [멀티 명함 N개](project_cnote_multicard.md) — 상한5·기본1. 칩스위처. SCR_MY_CARDS 폐기
- [명함 일괄등록/테마](project_cnote_card_import_theme.md) · [RN조립](project_cnote_bulkcard_theme_screens.md) — 리멤버 13열·30일. CardImport 3상태
- [AI 비서 3계층](project_cnote_ai_assistant.md) — SCR_ASSISTANT 4상태. ★진입점 미정
- [브리핑 고정대상=즐겨찾기](project_cnote_pinned_briefing.md) — CARD_PINNED_UPDATES(상한3·변화없으면숨김)
- [튜토리얼 시트 흐름](project_cnote_tutorial_sheet_flow.md) — 시트안 마무리·passthrough 제거
- [녹음 진입 설계](project_cnote_recording_entry.md) — FAB 통일. 탭=즉시/롱프레스=시트
- [설정+사람 카테고리](project_cnote_settings_people.md) — 설정9+사람6. PersonHeroCard
- [Tieming 브랜드·스플래시](project_cnote_brand_tieming.md) · [BI](project_tieming_bi.md) — SCR_SPLASH·온보딩 재설계. m 파동/오른쪽 정점 골드
- [v0.8.0 설계변경](project_cnote_v08_design_batch.md) — 캘린더→일정·홈카드2. v0.8.5 명함카드
- [v0.6 씨앗홈](project_cnote_v06_seed_onboarding.md) · [온보딩JIT](project_cnote_v06_onboarding_jit.md) — SeedCard v2·가치먼저. 설정→마이 승격
- [v0.5 홈풍성화](project_cnote_v05_home_company_news.md) — 3선반+SCR_COMPANY_NEWS
- [반영근거 자동집계](project_cnote_screen_changes.md) — 근거 export→메모패널. v0.N
- [Figma 아이콘 라이브러리](reference_cnote_figma_icon_library.md) — SVG 직접그리기 금지·인스턴스로. SCR_HOME 2545:7208
- [MainTabHeader](reference_cnote_maintabheader.md) · [BottomSheet 표준](reference_cnote_bottomsheet_style.md) — 2174:129·1056:362. 인라인 헤더 금지
- [Figma 변수/폰트](project_cnote_figma_variables.md) — Variables 바인딩·다크모드. node 3:2
- [Figma 컴포넌트화](project_cnote_figma_componentization.md) · [Storybook 동기화](project_cnote_figma_storybook_sync.md) — 쇼케이스 Frame≠컴포넌트. 정본=Storybook
- [스토리북 v2=RN](project_cnote_storybook_v2_rn.md) · [3층 구조정리](project_cnote_storybook_structure_reorg.md) — NativeWind. Component/Module/Page
- [스토리북 위계 게이트](reference_storybook_hierarchy_gate.md) — check-hierarchy.mjs. flow참조 id 보존
- [캐시 긴경로 함정](reference_cnote_storybook_cache_longpath.md) — .cache 스킵→deps 504
- [Dynamic Layer](project_cnote_dynamiclayer_library.md) · [Claude Design Home 시안](reference_claude_design_cnote_home.md) — 컴포넌트40+토큰21. DesignSync MCP
- [Flow Player](reference_cnote_flow_player.md) · [btnNav 재빌드 함정](reference_flow_btnnav_rebuild_trap.md) — emitCta→btnNav. build_btn_nav 마지막 실행 필수
- [메뉴 순서 정본=flows.json](reference_cnote_menu_order_ssot.md) — check-menu-order 게이트
- [운영도구(배포·DB)](reference_cnote_ops.md) · [KEX 해결](reference_cnote_deploy_sftp_kex_fix.md) — screen-ops·db-admin. ssh2-sftp-client 단일연결
- [화면링크 추적허브](reference_cnote_screen_links.md) — _screen_links.json
- [화면설계 파이프라인](reference_screen_design_pipeline.md) · [로파이 HTML](project_cnote_wireframe_html.md) · [IA 산출물](project_cnote_wireframe_ia.md) — /screen-pipeline+워커3종·check-coverage
- [CDS 하네스](reference_cds_harness.md) · [병렬 하네스](reference_cds_parallel_harness.md) — 워커6종·게이트2종. 클레임/락/저널
- [협업 저널 훅](reference_journal_notify_hook.md) — journal-notify.mjs·세션별커서
- [★ag세션 온보딩 정본](reference_ag_session_onboarding.md) — ag기획=정본·ag스토리북=device. ★claim은 done append로 안 꺼진다(status 직접 갱신)·보고=요구/전/후/확인
- [이메일 템플릿](reference_cnote_email_templates.md) — 공통 OTP폼·Pleos계승
- [대비이슈→이슈2](next_session_cnote_contrast.md) · [다음 세션](next_session_cnote.md) · [현황](project_cnote.md) — 이슈1 완료·다크카드 분리감

## 인프라 / 환경

- [★워크스페이스 회사/개인 분리](project_workspace_company_personal_split.md) — 회사=ISPARK/. CLAUDE.md만 상위상속(누수)·settings/MCP/메모리 격리
- [★agentmemory 사고 2건(260813·260903)](project_agentmemory.md) · [회사↔집 동기화](project_agentmemory_sync_cross_pc.md) — ★LISTEN≠정상(/health로 판정)·cwd상속하면 빈 저장소 생성. **보조기억일 뿐 1차사료=저널·대장**
- [★git useHttpPath 전역 금지](reference_git_credential_usehttppath_trap.md) — 전역에 켜면 회사 push 통째 불가. includeIf 하위에만
- [프로필 분리(CLAUDE_CONFIG_DIR)](reference_claude_profile_split_company_personal.md) — VS Code=회사/Antigravity=개인. ★.cmd는 ASCII전용
- [토큰 자가감시 배치](reference_context_selfmonitor_universal.md) — 양 프로필 자립 미러
- [세션 별칭 레지스트리](project_session_alias_registry.md) · [워크스페이스 자동화](project_workspace_automation.md) — SessionStart 역할질문. /meeting·/weekly
- [폴더 형상관리](reference_folder_governance.md) · [API 키 레지스트리](reference_api_keys.md) — 000000_INFO/API_KEYS.md
- [PS5.1 BOM 함정](reference_ps51_bom.md) — BOM없는 .ps1은 파서에러
- [Figma SECTION 상대좌표](reference_figma_section_relative_coords.md) · [스킬 설치](reference_figma_skills_install.md) — 절대좌표는 밖으로 튕김
- [NativeWind Animated className](reference_nativewind_animated_classname.md) — Animated.View엔 style만
- [FP 세션(재무설계+자동화)](project_fp_finance_automation.md) — 3역 겸직. 데이터=로컬전용·git금지

## 블로그 / THEMONY

- [★홈판 붕괴 원인=소재](project_imgsrc_blog_collapse.md) — 홈판 편성이 소재를 갈랐다. 연애 30%/2,728 ↔ 학력 90%/34,400. **형식은 무죄**
- [★C트랙 봉쥬르 생성공식](project_ctrack_bonjour_formula.md) — 목적=전수 재현·조회수는 결과. 골격 3종(리드문장형 57% 주력)·영상이 유형을 정함·재해석 소감 본형. 기각→분기
- [★타인 블로그 조회수 API](reference_naver_blog_metrics_api.md) — popular-post-list→viewCount. readCount 항상0·**공감수는 지표 금지**
- [홍기자 성공패턴=절차](project_hongkija_success_pattern.md) — 공식은 원인 아님. 효력 감쇠곡선·조기경보 3종. 규칙 박제 금지
- [★발행=zip 하나로 이식](feedback_publish_zero_install.md) — 어느 PC든 ①클로드생성 ②zip받기 ③설치기+확장등록. 트랙 바뀌어도 불변. ★코드 고치면 zip 재생성
- [크롬확장 자동화](project_chrome_ex.md) — MV3. chrome.debugger+CDP
- [DEEPNAUT 유튜브 프레임](project_deepnaut_youtube_frames.md) · [글쓰기 삽입](project_deepnaut_editor_injector.md) · [자동로그인](project_deepnaut_naver_login_ext.md) — installer(8777)·신뢰입력·수동1회 세션유지
- [AdSense 니치집중](project_themony_adsense_niche_focus.md) · [콘텐츠 개선](project_themony_adsense_remediation.md) — 공개108→57. 경험날조 제거·wp:html
- [GSC 색인 실측법](reference_themony_gsc_measurement.md) — sc-domain·**URL은 원문UTF-8**(퍼센트인코딩=전부 unknown 오판)
- [부동산 계산기 12종](project_themony_calculators.md) · [UX 고도화](project_themony_calculators_ux.md) — KSES가 인라인JS 훼손→FTP정적+script src
- [마케팅 카테고리](project_themony_marketing_categories_260711.md) — 배포전 슬러그충돌 확인
- [부동산 키워드](project_themony_budongsan_keywords.md) · [무한발행](project_themony_budongsan_autopost.md) — 11,847건·계산기군 골드. 스케줄 10·14시
- [토픽 클러스터](project_themony_topic_cluster.md) · [보험+요일스케줄](project_themony_insurance_schedule.md) — Pillar-Cluster 3층. 하루3글 로테이션
- [연예/방송 자동발행](project_themony_broadcast.md) — yt-dlp+자막+프레임→리캡DNA
- [하네스 v2](project_themony_harness_v2.md) — 병렬수집·3중게이트·scheduler
- [인증 레이어](project_themony_auth_layer.md) · [Cloudflare CDN](project_themony_cloudflare.md) — Nextend+TML. wp-admin캐시=CF bypass
- [MRT 이미지](project_themony_mrt_image.md) · [이미지 최적화](reference_themony_image_optimization.md) · [한국인 이미지 소스](reference_themony_korean_image_sources.md) — 1600px·≤200KB. Pexels 우세
- [디자인 레퍼런스=tworld](reference_themony_design_system.md) — 넉넉여백·큰타이포. 브랜드색 #2563eb
- [접속 정보](reference_themony_credentials.md) — ★140.238.15.203은 CNOTE(혼동금지)
