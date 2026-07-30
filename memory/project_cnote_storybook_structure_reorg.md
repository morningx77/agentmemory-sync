---
name: project_cnote_storybook_structure_reorg
description: "CNOTE 스토리북 v2 구조정리(정본 3층 Component/Module/Page) — 전수감사·Phase1 완료, Phase2부터 이어감"
metadata: 
  node_type: memory
  type: project
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
---

**★작업 위치 이전 완료(260714): `03_dev/260610_cnote_v2` → `03_dev/cnote-front/storybook/`(git repo `ispark-ai-rnd/cnote-front` 모노레포의 storybook 서브폴더). 앞으로 모든 작업·빌드·커밋·push는 여기서.** 정본=git(소스)+FTP `/upload/storybook`(빌드, 현행 유지). ✅완료: 소스 repo 최신(내용동일·LF)·협업파일(CLAUDE/GEMINI/.claude/_cds_index/claims/journal/_MULTIAGENT) 복사+`.gitignore`제외(check-ignore통과)·`storybook/.npmrc`(legacy-peer-deps, 서브폴더 install 오류 해결)·npm install·빌드검증(type-check/check-tokens/build 통과)·`.deploy.local.json` localBase 새경로 갱신(비밀 미노출)·잠금프로세스(스토리북6007·http.server6099×12) 종료·**옛 cnote_v2 → `07_archive/260610_cnote_v2_이전완료_260714`**·git 커밋(`.gitignore`+`.npmrc`) **main 머지·푸시**(e7cc058)·머지브랜치 삭제. ★Gemini: Antigravity를 **새 폴더(cnote-front/storybook)**로 열어야 협업 이어짐(journal에 shared_change_request 공지). ★repo=모노레포(RN앱 루트 + storybook/ 서브). 루트 `.npmrc`에 legacy-peer-deps 있으나 서브폴더는 자체 `.npmrc` 필요(교훈).

CNOTE 스토리북 v2(RN)를 **정본 3층 모델(Component→Module→Page)**로 정리하는 프로그램(260712 착수, 코드=SSOT, Figma 동기화 어긋나 코드 먼저 정리). 정의 정본=`02_design/CDS_IA_operating_model_guide_260704.md` §1("기능 특정인가?"). 관련 [[project_cnote_ia_reorg]](Figma IA)·[[project_cnote_storybook_v2_rn]].

**★결정 규칙(사용자 승인·성문화)**: "**props/state가 특정 도메인(인물·미팅·알림·일정·녹음 등)을 전제하면 Module, 아니면 Component**"(범용 원소=원자, 범용 조립패턴=Component, 도메인 전제=Module, 화면=Page). 정본 예시와 충돌 시 규칙 우선(예: ListItem→Module, QuickActionTile→Component 유지).

**★핵심 진단(전수감사 87파일)**: **재사용 사슬 전면 붕괴** — 37페이지 중 모듈 쓰는 건 Settings 1개뿐(나머지 카드 손으로 그림), 모듈 11개 중 9개가 하드코딩(Component 미조립), 정본 12기능카드 중 8개 누락, 모듈 있는데 페이지가 인라인 재구현 다수(Home↔ActionCard 등). → 컴포넌트 고쳐도 전파 안 됨(SettingRow 회귀 원인).

**진척**:
- ✅ Phase 0: `_cds_index.json` 생성(티어 분류 인덱스).
- ✅ Phase 1 완료·배포: 티어 이동 8건. modules→components(Modal·EmptyState·BottomSheet·Accordion·SettingsGroup·WidgetCard=범용) / components→modules(ListItem·RecordControls=도메인). components 43·modules 7. 이름 유지(ListItem→PersonListItem 개명은 후속).
- ✅ **Phase 2 핵심 3건 완료·배포(260712)**:
  - **2-① EyebrowCard**: 6개 설정화면 SettingsCard 로컬헬퍼→신규 `components/EyebrowCard`. eyebrow=uppercase 통일(Email만 누락이었음).
  - **2-③ CheckMark**: 체크박스 박스 6중복(5페이지+Checkbox내부)→신규 `components/CheckMark` 원자, Checkbox도 조립전환(중복 완전제거).
  - **2-② 파일럿**: Button에 `tonal` variant(채운 회색) 정본추가(사용자 승인) → NotificationCard·LiveActivityCard 액션버튼을 Button 조립전환(보조=tonal·주=primary). 모듈 액션버튼이 시스템 Button으로 수렴.
  - 각 건 type-check·check-tokens(arbitrary0)·양모드 렌더 PASS·배포 라이브200.
- **보류/후속**: Chip→Tag 수렴=토큰 미세차로 화면별 시안 diff 필요→별도 리뷰. ResultCard=NoteResult 단일사용. RecordControls·Timeline=고유 지오메트리라 하드코딩 정당(유지).
- ⚠ **Phase 3 감사 결과=매핑 전부 반증**: 킥오프의 "페이지↔모듈 5개 클린 스왑"이 **전부 거짓/불완전**. 페이지는 바스포크 시안 카드, 모듈(ActionCard·NotificationCard·PersonCard·Timeline 등)은 어느 페이지도 안 쓰는 **고아 제네릭**. 진짜 문제="페이지가 모듈 재구현" ❌ → "모듈이 페이지 시안과 안 맞게 만들어짐" ✅. 실제 작동 사슬=ListItem·EyebrowCard·CheckMark·Button/Avatar. 사용자 결정=**D(Phase 4 먼저)**. Phase 3는 고아모듈 정리/승격 재설계로 이관(계획서 §Phase3 감사 표).
- ✅ **Phase 4 완료·배포(260712)**: 헤더 100% 컴포넌트화. 감사로 실대상 3개 확정(SignupVerify=이미 ScreenHeader·Processing=몰입형·Followup=콘텐츠스테퍼 제외). ①PersonList[A]→기존 HubHeader(dedup+TaskList 일관성) ②신규 `components/HomeHeader`(홈 아바타+날짜/타이틀+검색·알림) ③신규 `components/StepHeader`(중앙타이틀+N/M). 헤더 4종(ScreenHeader/HubHeader/HomeHeader/StepHeader) 완성=인라인헤더 금지 완결. 게이트·양모드렌더 PASS(픽셀충실).
- ✅ **Phase 3 재설계 완료·배포(260712)**: 모듈 사용맵 감사=7중 ListItem만 실사용, 6고아. **RecordControls→Recording 사용전환**(인라인 dedup). **폐기 3**(ActionCard·NotificationCard·LiveActivityCard: 페이지정본 없음·외부참조0 확인 삭제). **재건 2**(사용자 승인): PersonCard=today_people 인물카드 정본 재작성→PersonList 3인라인 dedup / Timeline=Person flat모델(date+title+tags) 재작성→Person 접점이력 dedup. **★모듈 최종 4개 전부 실사용(고아 0)**: ListItem·PersonCard·RecordControls·Timeline. 각 건 게이트·양모드렌더 PASS·배포.
- **헤더 시스템 완성**: ScreenHeader·HubHeader·HomeHeader·StepHeader 4종(인라인헤더 0). **모듈 재사용사슬 복원**: 고아 0, PersonCard/Timeline/RecordControls 페이지가 사용.
- ⏭ **남은 후속**: Chip→Tag 수렴(시안 diff 필요·Timeline 태그칩 인라인도 이때 컴포넌트화)·ResultCard(NoteResult 단일사용) 결정.
- **★교훈(반복 확인)**: 킥오프/계획의 "재사용 매핑"을 **실측 대조 없이 신뢰 금지**. Phase3·4 둘 다 계획이 실제 재사용을 과대 계상했음. 스왑 전 페이지 시안↔모듈 API 대조 필수.

- ✅ **화면 네이밍 4자 정합(260713)**: 미드파이=Figma=스토리북(그룹·리프)=분석 screenId 글자일치. 화면ID정정 3건(SELF_TIMELINE→COMPANY_INFO·ONBOARD_001→RECONTACT_SORT·FOLLOWUP_001→FOLLOWUP). 스토리 name+title=SCR_XXX(★URL도 `page-scr-{scr}--{variant}`로 변경). 정본=`_SCREEN_NAMING_MAP_260713.md`.
- ✅ **프로토타입 화면링크 연결(260713)**: 우측패널 🎨Figma(node-id)·📚Storybook(storyId) 자동. 정본=`data/_screen_links.json`(figma.nodes40+storybook.stories48 명시맵). ★버그해결=build_prototype sbId 자동변환(page-scr-...와 불일치)→명시맵 사용. Figma CDS `CNOTE·Templets`(549:301) node-id 126 추출. 화면추가 시 _screen_links에 한 줄 추가.
- ✅ **Phase 5 고아 컴포넌트 정리(260713)**: 48중 19고아 감사(3병렬 서브에이전트, `_WORK_PLAN_컴포넌트_재사용복원_260713.md`). **5a 폐기4**(AppBar·Modal·Toast·Tooltip=dead). **5b 리와이어3**(FAB→BottomNavigation 4화면일괄·SocialLoginButton→Signup·SearchBar→Search). 게이트·양모드·force배포 검증.
- ✅ **Phase 5c 시범 완료·배포(260713)**: 사용자 결정 ①시범=Tabs세그먼트 먼저 ②세그먼트=**신규 `components/SegmentedControl`**(Tabs 밑줄형 탭내비와 어포던스 분리·의미 정직, variant 흡수 아님). variant `pill`(TaskList·Calendar: bg-surface border p-xs h-12·내부 rounded pill·text-label·미선택secondary)/`flush`(SettingsMeeting: border overflow-hidden flush py-sm·text-body-sm·미선택primary+active). 3곳 인라인 세그먼트→조립(onChange에서 setState+emitCta·좁은상태 as캐스트). 게이트·양모드 픽셀정합(회귀0)·force배포·라이브 5스토리 200/에러0. ★교훈 재확인=WidgetCard 계획('title-style prop 하나')이 실측(헤더 eyebrow/title 2계열+강조+패딩+gap)을 과소평가→앱전역 최대위험이라 시범을 저위험 Tabs로 전환(계획 맹신 금지).
- ✅ **Phase 5c 명확건 3 완료·배포(260713)**: 사용자 결정=WidgetCard(어려움)는 맨 뒤로, **명확한 것부터 RecordTimer→Stepper→IconButton**. ①RecordTimer(고아→사용): size(md/lg)+tone(default/inverse) prop + fmt 분 제로패딩→Recording 02:14 리와이어. ②Stepper(고아→사용): `beads` variant 신설(구슬+선+트레일링 링)→Followup 스텝바(Fragment import 제거). ③IconButton(→used): `plain` variant 신설(배경0·색=className text-*+아이콘 currentColor)→7곳(NoteDetail·Search·Recording·TaskList×2·Settings·PersonList). **종+danger뱃지는 icon prop에 `<>fragment</>`로 전달(RN 기본 relative가 앵커)**. 게이트·양모드 스크린샷(신규스토리3+7페이지) 픽셀정합 회귀0·force배포·라이브200/에러0. ★교훈=IconButton은 계획상 '명확'이나 7곳 이질(뱃지·절대위치·색상)→사이트별 실측 후 className/fragment 흡수.
- ✅ **Phase 5c 중간 3건 처리·배포(260713)**: ①**Tag**(고아→used, Chip 수렴): 시안=로컬Chip에 맞춰 재정의(px-sm py-2xs·default bg-surface-subtle·info variant 신설·danger text-danger). ★`py-smxs`가 config 미정의(패딩0 버그)→정의된 py-2xs 통일. 로컬 Chip 3곳(NoteDetail·Calendar·Person)+Timeline칩→Tag. ②**BottomSheet**(고아→used): children 슬롯+accessibilityLabel prop→ConnectSourceSheet 인라인 Modal셸이 첫 소비자(픽셀정합·avatar모드 무회귀). ③**Accordion=스킵**(WidgetCard식 과잉통합 거부): NoteDetail 스크립트토글(카드)·CompanyInfo 더보기(중앙 footer링크)는 Accordion과 공유셸 없고 펼침콘텐츠 없음→인라인 유지가 정직. 게이트·양모드·라이브 검증 회귀0.
- **★배포교훈 갱신**: `--force`도 SSH-8 일시실패로 특정파일(index.json 포함) 누락 가능 → "N개 업로드" 숫자 신뢰 금지, **라이브 신규스토리 실검증이 진짜 게이트**, 실패 시 증분 재배포 반복(fails=0까지).
- ✅ **Phase 5c 완전종료(260713)**: **WidgetCard 전면완료**(고아→used·사용자 '전면완료' 지시)—정본화 eyebrow+eyebrowTone(primary/secondary)+title+emphasized(border-2)+gap(sm/cozy/md), **14 eyebrow카드 리와이어(CallMemo·NoteDetail·Followup·MeetingBrief·PersonMatch)**. 남김=Search ResultGroup(구조상이)·NoteResult ResultCard(onEdit)·plain 무헤더카드. ★eyebrow 색 2종(primary강조/secondary중립)·emphasized=border-2 교정. **Phase5c=7/7 done**(SegmentedControl·RecordTimer·Stepper·IconButton·Tag·BottomSheet·WidgetCard)+Accordion 스킵. 유지4=Select·EmptyState·SkeletonLoader·AudioWaveform(미설계).
- ✅ **홈 6상태 + MobileFrame 삭제**: Home variant 5상태 구현([[위]]) + 장식 데코 MobileFrame 스토리 삭제(화면상태 아님).
- ✅ **배포/핸드오프 최종안(260713·개발자 협의 확정)**: **원본→git**(`ispark-ai-rnd/cnote-front` repo의 `storybook/`), **빌드→기존 FTP `/upload/storybook` 루트**(현행 유지·nginx 손 안 댐·공개 URL `.../design/storybook/` 그대로). ★이전 `--structured`(/build+/src)·nginx docroot 변경안은 **폐기**(서버의 /build·/src 잔재도 이미 제거됨=404 확인). 빌드 배포명령=`node scripts/deploy-sftp.mjs storybook`(--structured 안 씀). ★deploy-sftp.mjs에 원격 재귀삭제 모드 `--rm-remote <sub> [--dry]` 추가(안전가드=remoteBase 하위만·dry-run). ★교훈=빌드만 주면 개발자가 못 빌드→원본(src+설정) 별도 제공 필요.
- ✅ **로컬 폴더 정리(260713·git 대비)**: cnote_v2 루트에서 참고·계획 문서(_WORK_PLAN×9·_HANDOFF·_R4·_RDESIGN·_SIAN·_TOKEN·_GUIDE·_FIGMA·VERSION·docs/·_review_*·.shots/·스크립트·README) **30개를 `03_projects/260610_C-Level_note/01_docs/storybook_v2_작업문서/`로 이동**. Vite 데모 9개(index.html·main/App.tsx·App/index.css·react/vite.svg·hero.png·icons.svg) 삭제. 협업파일(C: CLAUDE.md·GEMINI.md·.claude·_MULTIAGENT·_cds_index·_storybook_claims·_storybook_journal)은 **제자리 유지+`.gitignore` 추가**(워크플로 경로 고정). 결과=`git add .` 하면 빌드정본만. 스토리북 빌드 정상 검증(BUILD=0). ★핸드오프 zip=`06_downloads/cnote_storybook_v2_소스_260713.zip`(bsdtar로 정방향슬래시·데모/문서 제외). ★참고: 가이드가 참조하던 _R4·_SIAN이 01_docs로 이동해 git repo에선 죽은참조(추후 가이드 정리 여지).
- **★배포교훈**: deploy-sftp 증분=로컬 md5캐시(서버부재 미반영)+storybook-static stale청크 누적 → 404. 해결=클린 재빌드(rm assets)+`--force`+라이브 검증. SSH-8 일시실패=증분 재배포 복구. h-px/h-hairline=이 NativeWind서 height0→Divider는 style{height:1}.

- ✅ **홈 상태화면 5종 + outline버튼 수정(260713)**: 사용자 지적—미드파이·Figma엔 홈 6상태인데 RN엔 default만. ①**Button outline 근본수정**(재발이슈): neutral/ghost=`bg-transparent`가 회색 캔버스서 사라짐→정본 미드파이 `.btn.outline{background:#fff}`대로 `bg-surface`로(45곳 파급). 정본메모 [[feedback_outline_button_surface_bg]]. ②**HomePage variant prop**(normal 무회귀): empty·capture-sheet(BottomSheet children 재사용)·quiet·after-meeting·pending 5상태 구현+스토리. **★Figma가 비주얼 정본**(미드파이 '반갑습니다/일러스트'와 달리 실제=표준헤더+절제카드). Figma Templets Home 6상태 Light/Dark node표=empty1280:928·quiet1278:804·after1276:650·pending1284:1050·capture1286:1182·normal1262:423. ③**프로토타입 개별연결**: _screen_links 상태별키 `SCR_HOME|{state}`→figma node+story, build_prototype 조회를 `keyOf(screen|state)` 우선+screen 폴백 확장(회귀0). 게이트·양모드 Figma대조·배포·라이브 검증. 계획서=`_WORK_PLAN_home_states_260713.md`.

**정본/킥오프**: 계획서 `03_dev/260610_cnote_v2/_WORK_PLAN_스토리북_구조정리_260712.md` · 인덱스 `_cds_index.json` · 킥오프 `01_docs/킥오프/260712_스토리북_구조정리_Phase2_킥오프.md`(§0 붙여넣기 지시).

**함정**: 티어 이동 시 형제 import(`../Avatar`)→`../../components/Avatar` 교정(단 modules/X·components/X는 src직속이라 `../../` 깊이 동일) · check-tokens ALLOWLIST 키=경로(이동 시 갱신) · 배포 SSH -8 일시실패는 증분 재실행 복구 · 모듈 조립전환/리와이어링 후 양모드 렌더 회귀검증 필수.
