---
name: project_cnote_design_foundation
description: CNOTE 디자인 파운데이션 정본(타이포 램프·스페이싱·라인·레디우스·컬러) + 게이트/codemod. 전 42화면 확산 완료.
metadata: 
  node_type: memory
  type: project
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
  modified: 2026-07-22T05:13:37.689Z
---

CNOTE 스토리북(`03_dev/cnote-front/storybook/`) 5축 디자인 파운데이션 — 사용자(디자인 오너) 트리거(글자 작음·크기 제각각·위계 약함·두께 미적용·회색배경 대비저하, 카카오뱅크 node 134:2 기준)로 재설계. **파일럿(홈·인물) 확정 → 전 42화면+컴포넌트+모듈 확산 완료·배포·양모드 눈검증 PASS(260716).**

**★앱 표준 타이포 위계(암기)**: 화면히어로/큰카운트=`title-xl`(20/700) · 엔티티/카드/리스트/할일 앵커=`title-lg`(18/700) · 본문·설명=`body-md`(15/400) · 메타/타임스탬프=`body-sm`(14/400) · 섹션 kicker(WidgetCard eyebrow)=`label-md`(14/500) · 캡션/부제=`caption-lg`(13). **명시적 `font-*` 금지**(토큰에 weight 내장, `text-title-lg` 하나로 크기+행간+두께). 정본 SSOT=`tailwind.config.cjs` fontSize.
**★시니어 UX 13px 텍스트 플로어(260722)**: `caption-sm`(11px)·`caption-md`(12px)=텍스트 사용 금지(고령 C-Level 가독성). 게이트 DEPRECATED에 등록·차단. 역할기반 매핑=kicker(tracking-wide)→label-md(14)·메타/부제/캡션→caption-lg(13)·본문→body-md(15). 과거 caption-sm 65곳 codemod교정(`_codemod_caption_floor.mjs` 재사용). "작게 느껴짐" 신호는 이 플로어 위반 스캔(grep text-caption-sm).

**색(0단계 전역)**: canvas `#F2F3F5`(near-white, 구 #EBEBEB) · text-tertiary 라이트 `#64748B`(AA)·다크 `#9E9BAE`. `global.css`.

**박스 셸 SSOT = `components/WidgetCard`**(bg-surface·border border-border·rounded-xs·p-md·shadow). radius=크리스프 **4px 유지**(사용자 결정). 보더=`borderWidth.DEFAULT` 1.5px(config 1곳). 이 1곳 수정=전 카드 일괄 변경.

**폐기 구별칭(사용 금지, 게이트 차단)**: `text-{body,body-l,body-m,label,caption,micro,title-s,title-m,title-l}` → 신규 램프로 이관됨. body-m/gap-smsm/pt-smxs/pb-smxl 등은 **미정의 별칭=렌더0 버그**였음(교정됨).

**재사용 도구**: 게이트 `check-foundation.mjs`(★8규칙: 폐기별칭·raw간격·arbitrary색·필수라벨·h-px·아이콘색·**hex리터럴**·**인라인style숫자**) + `check-size-tokens.mjs`(arbitrary크기·allowlist) + `_codemod_typography/spacing.mjs`(확산) + `_audit_visual.mjs`·`_audit_hardcode.mjs`(감사=인라인style·hex·arbitrary 집계). 스페이싱=세만틱 슬롯 있는 raw만 차단.

**★RN 명령형 색 SSOT(260720)**: `src/theme/colors.ts`(`RNColor`) = className 불가한 RN prop(placeholderTextColor·ActivityIndicator color·chevron·color={상수})의 **단일 정본**. 파일마다 hex 박던 것(22곳·스테일 #2A3FEC옛파랑·#8097AE틀린값 포함) 전량 모듈 참조로 통일→1곳수정=전역. RNColor.{white,primary#6549FF,textTertiary#64748B,muted#94A3B8,success,warning,danger,info}. 명령형이라 테마반응 불가(양모드 절충값)→theme-reactive는 useColorScheme 후속. **★전세션 강제**: `package.json` prebuild-storybook(=`npm run gate`)이 `build-storybook` 자동 선행→위반시 빌드중단(스토리북n·기획·Gemini 누구든 배포전 통과 필수). 규칙 정본=storybook `CLAUDE.md#토큰 사용 규칙`+협업프로토콜. 하드코딩 3금지=hex리터럴·arbitrary[Npx]·인라인style숫자. ⚠블록주석에 `text-*/bg-*`처럼 `*/` 시퀀스 금지(주석 조기종료 파서에러).

**잔여감사(260720)**: 결정론 스캔 5축 판정 — radius✅·섀도우(1기본/2강조/3부유 시맨틱)✅·보더(-border연틴트 vs plain강조=의도된 2토큰)✅·터치타깃✅. **결함=히어로배지 6곳 통째복제** → 신규 `components/HeroBadge`(w-tile원+border-2 border-primary+bg-primary-subtle, cloneElement로 size36·currentColor 주입=아이콘크기까지 1곳관리) 승격·5곳치환(Calendar·Notifications·RelationInbox·SignupVerify·TaskList, 양모드 눈검증 PASS)·RecontactIntro는 스토리북2 building중이라 저널인계. EmptyState 아이콘색 토큰화. **아이콘색 하드코딩 스윕 완료(260720)**: `color="#.."` 47→0. ★핵심패턴=**Button/Badge/FAB가 아이콘을 변형별 텍스트색 View로 감싸 currentColor 상속**(소비처 color 불필요·disabled 아이콘 흰색버그 동시해결·Badge secondaryAction이 선례). 폼/상태/검색 아이콘=부모 text-토큰+currentColor. standalone 흰아이콘(bg-primary 원)=부모 text-white. SPINNER stale색 #2A3FEC→#4127D1 동기. **게이트 규칙(6) 신설**=`color="#hex"` 차단(RN 명령형 color={상수}는 미매치). 배포·양모드 눈검증 PASS.

**함정**: 배포=`deploy-sftp.mjs storybook --force` 후 **전 청크 전수스윕**(SSH-8이 매번 2~3청크 조용히 누락→재배포 루프, 159청크 누락0 확인). 기계적 치환만으론 위계 안 커짐→역할기반 필수. 다크 base만 뒤집기 금지.

**Figma 갱신(260716 완료)**: CDS 파일 `OEqJJI0oCGgGZ28exd866d`. CNOTE Tokens 색41+text크기11·CNOTE Colors 18원시색·텍스트스타일 10종(Body/Medium 14→15·Regular 등)을 코드 SSOT로 동기화(primary 옛파랑#5A6CF7→바이올렛#4127D1/#6549FF·canvas#F2F3F5·tertiary AA·다크 바이올렛틴트 서피스). 값 재조회 검증. ★Noto Sans KR엔 SemiBold(600) 없어 600은 Bold매핑. **잔여 follow-up**: Number/Display 스케일(Poppins·84/56/34 네이밍 모호)·accent(gold) 변수 Figma 부재(코드엔 있음)·surface-overlay/glass 알파·badge-*·4컬렉션 중복구조 정리(리팩터). 앱=코드SSOT라 무영향(Figma는 디자이너용). 계획서 `01_docs/계획_핸드오프/_WORK_PLAN_디자인_파운데이션_정본_260715.md`. 관련 [[feedback_semantic_size_tokens]] [[feedback_visual_verification]] [[project_cnote_premium_craft]] [[reference_cnote_maintabheader]]
