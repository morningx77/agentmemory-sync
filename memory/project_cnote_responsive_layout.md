---
name: project-cnote-responsive-layout
description: CNOTE 반응형 레이아웃 전략 — 모바일 다해상도 유동 + 태블릿 세로 중앙 max-width 컬럼
metadata: 
  node_type: memory
  type: project
  originSessionId: da39437f-0edf-404d-802c-2d96033dbe51
---

CNOTE 디자인은 **모바일 다양한 해상도 + 태블릿 세로**에 대응해야 함(사용자 요구 260703, 레이아웃 고정 금지). 정본 스펙 = `03_projects/260610_C-Level_note/02_design/_RESPONSIVE_LAYOUT_SPEC_260703.md`.

**2층 전략**: ①**모바일(360~430)=유동**(content Fill + 좌우패딩, 절대요소 constraints) ②**태블릿 세로(768~834)=적응 = 중앙 max-width 컬럼**(콘텐츠 max-width **640**, 프레임 중앙, 좌우 여백; 풀블리드=상태바·하단바·글로우는 전폭). 사용자 확정=중앙 컬럼(마스터-디테일 2단은 후속 여지).

**좋은 기반(실측)**: 현재 화면들의 카드/행이 이미 **layoutSizingHorizontal=FILL, layoutAlign=STRETCH** → 컬럼 폭만 바꾸면 자동 유동. 고정된 건 프레임(390)+content 컬럼 폭뿐. 리트로핏 비용 작음.

**Figma 규약**: content=auto-layout VERTICAL, FILL, maxWidth 640, 부모 counterAxisAlignItems CENTER, padding 20~24. 카드=FILL/STRETCH(고정폭 금지). 절대요소 constraints: 하단바 LEFT_RIGHT+BOTTOM, FAB CENTER+BOTTOM, 상태바 클록 LEFT/배터리 RIGHT, 글로우 SCALE/CENTER. **폰트는 고정pt(Scale 금지 — 태블릿서 과대)**. 산출=화면별 Mobile(390)+Tablet(834) 2프레임, 컴포넌트 1벌 공유. 컴포넌트 카탈로그(금주)를 **반응형 우선(Fill/Hug+constraints)** 으로 설계해야 화면이 조합만으로 유동.

**오토레이아웃 기본 규칙(사용자 지시 260703)**: **모든 Figma 작업의 기본값=오토레이아웃**(고정배치는 예외적으로만, 작업 시 명시). 17개 앱 프레임 전부 NONE→오토레이아웃 전환 완료.

**NONE→오토레이아웃 전환 레시피 + 함정(중대)**: 프레임=VERTICAL, counterAxisAlignItems=CENTER, content는 flow(FILL+maxWidth 640 → 태블릿 중앙컬럼 자동), 나머지(상태바·nav·FAB·글로우·홈인디)는 layoutPositioning='ABSOLUTE'+constraints(nav=STRETCH/MAX, FAB/홈인디=CENTER/MAX, 상태바 클록=MIN/MIN·배터리=MAX/MIN). **⚠️ 순서 함정**: `F.resize(W,H)`를 절대요소 **위치 지정 後**에 하면, 리사이즈 시 constraints(특히 CENTER)가 요소를 재이동시켜 **nav가 화면 중앙/밖으로, 심볼·타이머가 세로로 흩어짐**(Y만 스크램블, X는 보존). → **반드시 resize를 먼저, 절대요소 x/y 지정을 마지막에**. 이미 깨졌으면 Y좌표만 원위치 복원. content 화면은 절대요소가 상/하단(MIN/MAX)이라 덜 티나지만 **글로우·nav/FAB(CENTER/MAX)는 어긋남 → 전수 점검 필수**. 아트 중앙화면(온보딩·녹음)은 all-absolute라 오토레이아웃 이점 없음(태블릿 반응형엔 구성 그룹핑 필요=후속).

**검증**: 홈 태블릿 데모 `965:122`(SCR2·홈·Tablet 세로, 834×1194, 콘텐츠 640 중앙) — 카드가 Fill로 640에 자동 확장, 폰 디자인 그대로 태블릿 적용 확인. [[project-cnote-circle-language-clarity]]의 라이트 라인·컴포넌트 작업과 연계.

**★코드 구현 완료(스토리북 RN v2, R3 260709)** — [[project_cnote_storybook_v2_rn]]: `src/components/ScreenContainer`(재사용 프리미티브 = `w-full items-center` > `w-full max-w-column`). `tailwind.config.cjs`에 `maxWidth.column=640px` 토큰 신설(arbitrary 금지 준수). **적용 패턴**: 바 배경(AppBar)·FAB 레이어는 **전폭**, 바 안 내용·스크롤 콘텐츠만 ScreenContainer로 640 컬럼 정렬. FAB는 전폭 fixed 레이어 안 640 컬럼 우측 정렬(태블릿서 화면 far-corner 아닌 콘텐츠 우측). Home 적용·검증 완료: 390 유동/834·1280 중앙640/다크 정상. R4 화면 조립 시 각 페이지가 ScreenContainer로 감싸면 자동 반응형.
