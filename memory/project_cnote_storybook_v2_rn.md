---
name: project_cnote_storybook_v2_rn
description: "CNOTE 스토리북 v2는 React Native 재작성으로 피벗 — div→View, NativeWind, react-native-web로 웹URL 유지"
metadata: 
  node_type: memory
  type: project
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
---

CNOTE 스토리북 **v2**는 웹(React DOM)에서 **React Native 컴포넌트 소스**로 피벗됨(260709, 스토리북 세션). v1(`03_dev/260610_cnote`)은 웹 그대로 **동결**, v2(`03_dev/260610_cnote_v2`)가 RN 버전.

**전달 지시(정본)**
- 컴포넌트를 웹 `<div>` → RN `<View>`/`<Text>`/`Pressable`로 재작성. **웹전용 신규작성 중단**.
- 스토리북에 **react-native-web** 세팅 → 기존 웹 URL 그대로 디자인 검토 유지(개발서버 `/upload/storybook`, https://next.sgate.biz/v1/design/storybook/).
- 스타일 **NativeWind 권장**(현 Tailwind 토큰 방식 거의 그대로 이관 — tokens.css 시맨틱 토큰).
- 분류체계(Component/Module/Templet) + **반응형 스펙(세로고정·태블릿 640 컬럼)** 준수.
- **산출물 = RN 컴포넌트 소스**(앱 빌드는 개발자 몫).

**리스크(검증 필요)**: NativeWind는 Metro/Babel 전제 → Storybook(react-vite)+react-native-web 조합은 비표준. 아이콘 @phosphor-icons/react(웹) → RN 대체(phosphor-react-native + react-native-svg) 필요. **대량 마이그레이션 전 Button 1개로 툴체인 spike(POC) 선행**이 방침.

**진행 현황(260709)**: R0·R1·R2·R-Tokens·**R-Design(신팔레트 [[project_cnote_palette_violet_gold]])·R3(반응형 ScreenContainer, [[project_cnote_responsive_layout]]) 완료. R4 착수(화면조립)**. 포함51=온보딩10/미팅흐름9/사람6/소통5/설정10/캘린더3/알림4/할일3+홈1완료(제외=비서7·통제2·위젯0). 계획서=`03_dev/260610_cnote_v2/_WORK_PLAN_R4_Page_260709.md`, 킥오프=`01_docs/킥오프/260709_스토리북RN_R4_Page_킥오프.md`.

**★R4 접근 교정(260709 오너 개입) = 시안 기반 재조립**: mid-fi(회색조)는 **구조 계약일 뿐**, **비주얼 정본=Figma 시안**(fileKey OEqJJI0oCGgGZ28exd866d, 페이지 Templets 549:301). 첫 SIGNUP을 mid-fi만 보고 즉흥 조립→시안과 크게 어긋남(흰버튼·"C"로고 vs 네이비글로우·두원마크·다크서피스버튼). 오너 확정: ①**색=새 바이올렛 팔레트 유지**(code=SSOT, 시안 슬레이트네이비 #080E1C는 피벗 전 값이라 미채택 — 시안은 구조·트리트먼트만 정본) ②**화면마다 시안 읽어 정합**(`get_design_context(nodeId)`→Tailwind참조+토큰). **시안 노드맵=`_SIAN_NODE_MAP_260709.json`**(192노드/46화면, 다크+라이트+상태). 온보딩5(895–899/991)=프리미엄시안, 나머지=`🧩 모듈 조립판 · SCR_*`섹션. **시안없는 ~10화면**(온보딩 SELF_TIMELINE·START_PICK·ONBOARD_001·RECONTACT_INTRO·RELATION_SCAN/알림 PERSON_ADD·PERSON_ADD_FORM·SEARCH/할일 BS_AFTERCONTACT·BS_CADENCE)=시스템 디자인언어 폴백. **컴포넌트도 시안 정합 필요**(SocialLoginButton=풀브랜드색 vs 시안=다크서피스+칩 → 수정 후 사용). 티어판정=`02_design/CDS_분류체계_정본_260709.md`§3, 가이드=`_GUIDE_티어개념_Figma참조_260709.md`. **SIGNUP 파일럿 교정완료**(양모드 시안정합·게이트PASS). 정본참고 [[feedback_visual_verification]](계약≠디자인).

**★JIT 클린재기동 필수**: 처음 쓰는 유틸 클래스(w-tile 등)는 NativeWind JIT가 클린재기동 없이 CSS 미생성→렌더 유령버그(원이 세로pill로). **눈검증 전 반드시 포트6007 kill+`node_modules/.vite`+`.cache/nativewind` 삭제+재기동**. R4는 신규클래스 대량이라 매 배치 필수.

**★SVG 색=모드 토큰 준수(하드코딩 금지)**: react-native-svg fill/stroke는 명령형이라 처음엔 hex 고정하기 쉬운데(오너가 잡음: BrandMark를 다크값 #6549FF로 통일→라이트서 too bright). **해법=`fill/stroke="currentColor"` + `<Svg className="text-primary">`** → RNW가 색을 모드별로 플립(라이트 #4127D1/다크 #6549FF). 검증됨. **기존 하드코딩 부채**: Tooltip 화살표(라이트값 고정)·BottomNavigation active색(#7D8CF5 고정)=후속 정합. 신규 SVG는 무조건 currentColor. BrandMark(Component/Brand, 두 원 교집합 vesica, `_SIAN_NODE_MAP` 941:6)가 정본 패턴. **★phosphor 아이콘도 `color="currentColor"` + 부모 className `text-*토큰` → 모드 플립 검증됨**(VERIFY 뒤로화살표·봉투 아이콘 양모드 정상). 기존 AppBar/BottomNav 하드코딩 아이콘색도 이 방식으로 정합 가능. **온보딩 진척: SIGNUP·SIGNUP_VERIFY 완료(양모드 시안정합). 신규 컴포넌트 OTPInput(6칸코드)·BrandMark 생성. 온보딩 헤더·HeroIconBadge는 인라인(컴포넌트화 후속).**

**★행동분석 계측=R4 화면마다 필수(오너 260709 확인)**: 1c 스캐폴드(`src/analytics/`)의 "analyticsId 실부착 이후 단계"=R4. 화면 만들 때 같이 심는다(㉕ 설계ID=이벤트ID). ①페이지 top `useScreenView('SCR_X')` ②핵심CTA `onPress=emitCta('BTN_X',SCREEN)`(mid-fi data-aux BTN_* 재사용, 페이지 핸들러서 emit=컴포넌트 무수정) ③민감필드 `{...(privateProps as any)}`(이메일·이름·연락처·OCR·음성·검색어·메일본문 §7). 스토리북=noop(무전송). SIGNUP·VERIFY 적용완료. index.ts 배럴 재export 누락(useScreenView·emitCta·privateProps) 보강함. 라운드=시안 4px 전체통일(카드·컨트롤·태그·칩 rounded-xs, 원형만 rounded-full). 테두리 대비 상향(border 라이트#D3D9E1/다크#3F3C4C).

**★컴포넌트 시안정합=재사용 전 필수(오너 지적 260709)**: 기존 컴포넌트 다수가 시안 이전 버전 → 재사용=옛디자인 전파. "막 가져오기" 금지. **BottomNavigation 정합완료**: 옛 홈/인맥/위임/설정 → 시안 홈/사람/할일/설정(1089:382, House·UsersThree·Sparkle·GearSix)+중앙 녹음FAB. NavItemId=home|people|tasks|settings. **FAB=굵은 솔리드 primary+상단돌출(elevated -mt-6)+흰마이크+글로우. 바=bg-surface 전폭풀블리드(rounded없음). 배치=`fixed inset-x-0 bottom-0 z-20`(화면하단 항상고정·스크롤무관·여백0), 콘텐츠 pb-24.** **★공용 크롬 헤더 2종 신설**: `ScreenHeader`(상세=뒤로+중앙타이틀)·`HubHeader`(허브=좌측타이틀+우측액션), 둘 다 px-lg 기준선 정렬(인라인 헤더 기준선버그 공통해소). 인라인 헤더 금지. VERIFY·Settings·상세4종 적용. **1차웨이브(People·Comm·Settings) Sonnet 디스패치→컴포넌트정합 이슈로 중단(7/21 페이지 생성)**. **Settings·RelationInbox=시안정합 완료(크롬 신패턴 레퍼런스)**: HubHeader(RelationInbox는 부제 지원 추가)·고정 전폭 하단바·RelationInbox 리스트=한 카드 안 divider 행+뱃지(warning/info/success+아이콘)+짧은메타+빈상태 임시 Tray아이콘(원안, 브랜드모티프 미정). 나머지 5(SettingsAccount·SettingsPermission·CommDetail·ReplyNeeded=ScreenHeader적용/본문미검증, PersonList=nav미부착) 검증 대기.

**★오너 목표(260709 세션말): 온보딩 완성(10화면)+메인 Home 1개 — ✅달성·양모드 눈검증 완료.**
- **온보딩 10 완료**: SIGNUP·VERIFY·RelationInbox(이전) + **ProfileConfirm·CardScan·CardResult(프리미엄시안897/898/899 정합·검증)** + **RelationScan·RecontactIntro·RecontactSort(=ONBOARD_001)·StartPick·CompanyInfo(=SELF_TIMELINE)**(시안없음→시스템언어, Sonnet 5에이전트 병렬조립+Opus 중앙눈검증). 폴더명: SELF_TIMELINE→`pages/CompanyInfo`, ONBOARD_001→`pages/RecontactSort`(SCREEN const는 원 ID 유지).
- **Home 재정합 완료**(시안1262:423): 홈헤더(아바타+MON·날짜+오늘의브리핑+검색/알림뱃지3, 인라인=HomeHeader 4번째패턴 후속) / RelationCountCard(127 히어로 `text-number-hero`=84px 신설토큰·font-en·tracking-tight + NetworkMotif 인라인SVG 5노드방사 currentColor) shadow-2 / ActionCard(오늘먼저처리·근거바·맡기기·처리하기) / ScheduleCard(caret원) / RelationInboxCard(챙길일3건·info칩·로켓CTA) / 고정 BottomNavigation(activeItem=home, FAB내장). 앰비언스 글로우2(web filter, 네이티브=그라디언트 후속).
- **신규 파운데이션**: Button `neutral` variant(중립아웃라인 border-border+text-primary, 시안 갤러리/건너뛰기/직접입력전환). fontSize `number-hero` 84px. 시맨틱 -subtle 다크 오버라이드([[project_cnote_palette_violet_gold]]). Checkbox 라벨 `flex-1 min-w-0`(긴 라벨 미줄바꿈 결함 수정, 전 사용처 적용).
- **재사용 정본 패턴**: CardResult(헤더·카드·필드행·고정CTA·계측)=신규화면 정본 exemplar. 확인필요 필드=`bg-warning-subtle border border-dashed border-warning`+값 text-text-primary+⚠뱃지. 카메라뷰파인더=4모서리 브래킷(border-l-2 등)+HandTap. ProcessingStepList(done/active/pending)=스캔단계. ChecklistItem tone success=안전보증.
- **후속(다음 세션)**: §4대로 에이전트 잔여페이지 검증 + 나머지 그룹 + 컴포넌트 시안정합 잔여 + StepHeader·HomeHeader 컴포넌트화 + R5(build-storybook·deploy-sftp).

**★★★멀티에이전트 + 전 화면 완료 + 계측·토큰 단계(260710 후반) — 이어받기 정본 = `01_docs/킥오프/260710_스토리북_전화면완료_계측토큰_다음단계_킥오프.md`** (구 미팅캐노니컬 킥오프 대체):
- **두 에이전트 병렬**: `storybook-claude`(나)=신규·캐노니컬 + 공유파일 오너 / `antigravity-gemini`=파생·반복·수정·일관성. **작업유형** 분담(policyVersion 2). 조정=`_storybook_claims.json`(락)+`_storybook_journal.jsonl`(로그). **한 파일 동시 1인**(git 없음, Gemini가 실시간 다수 파생중). 규칙=CLAUDE.md/GEMINI.md.
- **★내 신규 캐노니컬 전량 완료**: 미팅5(Recording·Processing·NoteResult·PersonMatch·Followup)·사람3(Person·NoteDetail·MeetingBrief)·Calendar·Notifications·TaskList·Search(시안없어 신규설계·검색어§7마스킹)·SettingsEmail·Home·온보딩. done claims ~34. **큐 비었음.**
- **★계측 신설이벤트 11 부착**: ai_edit·match_correct·delegate_intent·loop_closed·briefing_view/action(`analytics.track` EventPropsMap 타입안전). funnel_step 보류(screen_view 시퀀스 재구성 가능). 정본 `04_ops/CNOTE_사용자행동분석_실행설계_260706.md`.
- **★B3 토큰 일관성 Phase1 완료(오너)**: 값1개=정본이름1개(SSOT `_TOKEN_SSOT_260710.md`). config 신설 `2xs`(2)·`2sm`(6)·`cozy`(12)(remap없음). check-tokens 게이트 alias감지=warn(전역389). 내 10파일 코드모드(`_codemod_spacing.mjs`) 정규화 109건(→280). **Phase2=Gemini배치 후 나머지+2차토큰의미화+치수+게이트fail승격.**
- **★Gemini 검수 통과**(파생 variant·설정6·수정3 해결). 발견2=journal shared_change_request(Followup `←`복원·SettingsNoti push_mute). Gemini 미빌드 파생6(TODAY_PEOPLE·INFO_INCOMPLETE·CALENDAR_ADD/DETAIL·PERSON_ADD/FORM).
- **다음(나)**: B2 계측 인계문서 → B3 Phase2 → B1 배포(build-storybook+deploy-sftp storybook). 전체계획 `_WORK_PLAN_다음단계_260710.md`.
- **파운데이션(260710)**: Button neutral·danger / fontSize number-hero(84)·display-lg(40) / -subtle 다크완비 / **탭바=1depth 허브만**(캘린더=제거·사용자확인, [[project_cds_nav_meta_policy]]) / 하단바=`fixed inset-x-0 bottom-0`(absolute+min-h는 상단튐 함정) / config토큰변경=JIT클린재기동.

아래는 R-Tokens 이하 세부 이력.

**R-Tokens 완료 = 시맨틱 사이즈 토큰 신설(borderWidth DEFAULT=1.5·control-sm/md/lg높이·nav/tile/field·2차패딩 2.5/3.5/4.5/5.5·lineHeight snug/base/relaxed·letterSpacing tight/wide·radius 2xs/sm-plus/pill·fontSize micro/overline) + arbitrary px 82건 토큰 치환 + Modal 고정폭→유동폭(w-full max-w-[20rem]) + type-check PASS + 회귀0 양모드 눈검증(Button높이·Modal유동·Home픽셀동일·Select·ListItem). 오너결정: 오프그리드 보존·별도lineHeight·15px→body스냅·Modal유동. 산출: `_FIGMA_TOKEN_BACKPORT_260709.md`(Figma역반영목록)·`check-size-tokens.mjs`(재발방지 게이트=npm run check-tokens, allowlist=스켈레톤11/13·Switch26·Modal max-w). [[feedback_semantic_size_tokens]].** 다음=**R-Design**(Figma 토큰 동기화 + 대표 델타측정). 계획서=`03_dev/260610_cnote_v2/_WORK_PLAN_Rtokens_260709.md`. 이어받기=`03_projects/260610_C-Level_note/01_docs/킥오프/260709_스토리북RN_R2이어서_킥오프.md`. 앱은 RN(행동분석 정본 Clarity/GA4 **RN SDK** — [[project_cnote]]). 관련 [[project_cnote_responsive_layout]] [[project_cnote_figma_storybook_sync]].

★R2 교훈: 서브에이전트가 인라인 `style={{'var(--x)'}} as any`로 남기면 RNW브라우저만 렌더·네이티브RN 무효 → className 토큰 필수(그룹C 재작업함).

**★작동 툴체인 레시피(R0 검증됨, 재사용)**: `@storybook/react-native-web-vite`(framework, options.pluginReactOptions.jsxImportSource='nativewind') + react-native@0.81 + react-native-web@0.21 + nativewind@4 + **tailwindcss@3**(NativeWind는 v3 기반, v4 아님) + react-native-svg + phosphor-react-native + autoprefixer. 설치 `--legacy-peer-deps`.
- **함정1**: package.json `type:module`이라 `postcss.config`·`tailwind.config`는 **반드시 `.cjs`**(require/module.exports).
- **함정2**: vite.config의 `@vitejs/plugin-react` `react()`를 **제거**해야 함 — 프레임워크가 react-refresh 주입, 중복 시 "RefreshRuntime already declared" 렌더 실패.
- **토큰**: `src/global.css`에 `@tailwind` 3지시어 + `:root`/`.dark` CSS 변수(=tokens.css 값 이관). `tailwind.config.cjs` colors는 `var(--color-*)` 매핑 → className·다크 그대로 보존. `nativewind/preset`, darkMode:'class', content globs.
- **타입**: `src/nativewind-env.d.ts`에 `/// <reference types="nativewind/types" />`(className 인식, src include 안에 둘 것).
- **RN 매핑**: div→View, 문자열→Text 래핑, button→Pressable(onClick→onPress·hover→active:), 아이콘 color는 명령형이라 hex(예외). ActivityIndicator=로딩.
- 눈검증: Playwright로 `iframe.html?id=<story>&viewMode=story` 캡처, 다크는 `document.documentElement.classList.add('dark')`. 스크립트 `_shot.mjs`(v2 루트).
