---
name: project_cnote_figma_storybook_sync
description: "CNOTE 컴포넌트 Figma↔Storybook 동기화 작업 — 정본=Storybook, 진행현황·결정사항·남은 트랙"
metadata: 
  node_type: memory
  type: project
  originSessionId: fd1f7717-700d-4890-a9c2-57f0f188989c
---

CNOTE 디자인시스템 20종 컴포넌트의 Figma ↔ Storybook 일치화 작업 (2026-06-21 착수).

**정본 방향(사용자 결정):** **Storybook(코드)이 정본.** Figma를 코드에 맞춤. 단 아래 2개 예외 결정:
- **Badge**: 변형명(neutral/info/success/warning/danger)은 **유지**(다른 화면 인스턴스 깨짐 방지), 모양·색만 코드에 맞춤.
- **코드에 없는 Figma 상태**(Checkbox 중간상태·Textarea 에러·Select 비활성·Button 추가 사이즈/아이콘/로딩): Figma 유지 + **코드를 보강**(방향 반대=코드 작업).

**Figma 파일:** `OEqJJI0oCGgGZ28exd866d`, 컴포넌트 정본 페이지 **🧩 Component Sets (314:2)**, 24개 "DS · X" 프레임. (디자인시스템이 여러 페이지 분산: 🎨 Design System 3:2 / 🧩 Components 249:2 / Components v2 300:2 / Component Sets 314:2)
**Storybook 코드:** `03_projects/260610_C-Level_note/03_dev/260610_cnote/src/components/{Name}/`

**폰트 결정(2026-06-21 변경):** CNOTE Figma는 **Noto Sans KR로 표준화**. Pretendard Variable은 Figma에서 Bold/Medium 굵기가 제대로 렌더 안 되고 얇게 폴백돼 가독성 문제 발생 → 사용자가 Pretendard 폐기, 전부 Noto Sans KR로 교체 결정. **"Pretendard'em All"로 Noto→Pretendard 변환하던 기존 워크플로우는 더 이상 안 씀.**
- **일괄 변환 완료(~956개 노드, 전 콘텐츠 페이지)**: Pretendard 텍스트는 폰트 로드 없이 `node.fontName = {family:"Noto Sans KR", style:매핑}` 로 직접 재지정 가능(검증됨). 잔여 Pretendard 0. 영문 **Poppins는 유지**(브랜드 영문체).
- **코드 측도 Noto 전환 완료(2026-06-21)**: `tokens.css --font-sans`, `index.css` body, `.storybook/manager.ts` fontBase, `Configure.mdx`/`CHANGELOG.mdx` fontFamily 모두 Noto Sans KR. **폰트 로딩**: Pretendard jsdelivr CDN 제거 → Noto Sans KR **Google Fonts** (`index.html` 앱 + `.storybook/preview-head.html` Storybook). 단 `public/brand-logo.svg`는 Pretendard 글리프 base64 임베드 브랜드자산이라 미변경(워드마크 보존). CHANGELOG v0.4.0에 기록.
- Noto Sans KR 가용 스타일: Thin/Light/DemiLight/Regular/Medium/Bold/Black (SemiBold·ExtraBold 없음 → Medium·Bold로 매핑).
- MCP 폰트 로드: Pretendard 불가, **Noto Sans KR·Inter 가능**. 신규 텍스트는 Noto로 생성. [[project_cnote_figma_variables]]

## 진행 현황
**✅ Figma 트랙 완료 (7종):**
- Toast (356:56 / set 334:12) — 점+1줄 → 바+아이콘+제목+설명 2줄. 변형 success/error/info 재구축.
- Accordion (356:86 / set 335:18) — open 변형 primary 강조(테두리1.5px+헤더 primary-subtle+제목 primary-hover+caret primary).
- Badge (set 322:12, 변형 322:2/4/6/8/10) — radius 9999→4(radius-xs). 색/아이콘 미세정렬은 미완(선택).
- EmptyState (334:13) — primary 액션버튼 "녹음 시작" 추가.
- Modal (336:3) — 닫기 X 버튼(absolute 우상단) + 액션 구분선 + radius 20.
- Avatar (set 323:10) — sm/md/lg 변형을 32/44/56(폰트11/15/18)로 정렬. xl/dark/image 보존.
- BottomNavigation (340:3) — 라벨 연락처→인맥, 캘린더→위임 / 아이콘 CalendarBlank→ClipboardText 스왑.

**✅ 코드 트랙 완료 (2026-06-21, TDD):**
- Checkbox: indeterminate 상태 추가(− 표시·aria-checked=mixed) + 입력 a11y 개선(display:none→visually-hidden)
- Textarea: error 상태(danger 테두리+Warning 아이콘+메시지·aria-invalid) 추가
- Select: disabled 상태 추가
- Button: medium 사이즈 + leftIcon/rightIcon 슬롯 + loading 스피너(aria-busy)
- **유닛 테스트 인프라 구축**: `@testing-library/react`+`jsdom` 설치, `vite.config.ts`에 vitest `unit` 프로젝트(jsdom, setupFiles=src/test-setup.ts, globals:true) 추가. 81개 테스트 통과, tsc 클린. 실행: `npx vitest run --project unit [경로]`. (storybook 프로젝트는 브라우저모드라 storybook dev와 동시 실행 금지)
- 테스트 셋업: `src/test-setup.ts` = `@testing-library/jest-dom/vitest` import + afterEach cleanup. tsconfig.app은 test/stories exclude라 build 영향 없음.

**별도 논의:** BottomSheet (356:106) — Figma는 grabber+제목+슬롯 범용, 코드는 아바타헤더+액션그리드 특화. 구조 분기 → grabber는 코드에 추가 검토. / Card — 슬롯 컨테이너라 변경 불필요.

**✅ 누락 컴포넌트 보강 + 사이즈 정합 (2026-06-21):**
- Figma 컴포넌트셋엔 있으나 Storybook에 없던 **FAB(56·primary·Microphone), Switch(46×26·off=border-strong/on=primary), IconButton(44×44·radius-md·primary/secondary/ghost)** 신규 구현(4파일+스토리+테스트, TDD).
- Avatar XL(64) 추가, SkeletonLoader type(list/card/text) 추가.
- **Button 사이즈 버그 수정**: lg52/md44/sm36으로 distinct화(이전 default/medium/small=52/48/48 겹침). Figma 실측 lg53/md45/sm35 기준.
- **Figma 사이즈 정합**: FilterChip(~39→32, pad7/14·fs13), SearchBar(48→44), Select(52→48), Textarea(110→100), Badge(pad3/8→4/10). 측정 검증 완료.
- 48dp 규칙 완화: 컴포넌트 실제 치수는 Figma 정본 따름(DESIGN.md 반영).
- 최종: 91개 유닛 테스트 통과, tsc 클린.

**⚠️ 핵심 함정 — Storybook에 Tailwind 누락:** `.storybook/main.ts`에 `viteFinal`로 `@tailwindcss/vite` 플러그인을 추가해야 함. 없으면 Storybook의 Vite가 Tailwind 유틸 클래스를 **전혀 생성 안 함** → Button(유일한 Tailwind 클래스 컴포넌트)의 모든 스타일(h-[..]·bg-primary 등) 무효, "사이즈 동일"·무스타일로 보임. 앱(npm run dev)은 vite.config의 플러그인이 있어 정상이라 발견이 늦음. [[reference_cnote_storybook_cache_longpath]]

**이미 일치(조치 불필요):** FilterChip, Input, RadioButton, SearchBar, Tabs, SkeletonLoader.

**✅ Checkbox 모양 정합 (2026-07-12):** Figma Checkbox 컴포넌트셋(page **314:2** = CNOTE·Component, set **327:7**)의 6변형(327:2/3/5·365:30/31/33)이 20×20 **cornerRadius=16(거의 원형)** → 코드(`rounded-xs`=4px)와 어긋나 라디오와 혼동됨(사용자 리뷰 지적). **cr 16→4로 일괄 수정**해 둥근 사각형화 → **체크박스=사각 / 라디오=원** 관례 확립. 마스터 수정이라 전 인스턴스 파급. Radio(set **363:34**, cr9999=완전원)는 정상. 정본=코드(v2 `src/components/Checkbox`=`w-5 h-5 rounded-xs`). ※카탈로그가 코드와 어긋날 수 있으니 리뷰는 코드 렌더를 정본으로.

**유용한 토큰 변수 id:** color/primary 2:3, primary-hover 2:4, primary-subtle 2:5, primary-muted 2:6 / surface/white 105:11, text/primary 105:16, text/secondary 105:17, success/500 105:28·subtle 105:29, danger/500 105:34·subtle 105:35, info/500 105:37·subtle 105:38.
