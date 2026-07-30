---
name: project-cnote-figma-componentization
description: CNOTE 신규 컴포넌트를 실제 Figma Component Set으로 제작한 현황 + Figma 페이지 구조의 함정
metadata: 
  node_type: memory
  type: project
  originSessionId: fd1f7717-700d-4890-a9c2-57f0f188989c
---

CNOTE Figma 파일(OEqJJI0oCGgGZ28exd866d)의 컴포넌트 페이지 구조와 2026-06-22 실제 컴포넌트화 작업.

**페이지 구조 (중요)**
- `🧩 Components`(249:2) = **진짜 컴포넌트 라이브러리**. 원본 ~20종이 COMPONENT_SET(변형)으로 존재(Button 12·Input 10·Checkbox 6·Card 4·Badge 5·Avatar 4 등) + 단일 COMPONENT(ListItem·Modal·BottomSheet·EmptyState·SkeletonLoader·Tabs).
- `🧩 Component Sets`(314:2) = **문서용 쇼케이스 Frame 모음**("DS · X"). 컴포넌트가 아니라 그냥 Frame(그림). FAB만 예외적 COMPONENT. ← P0/P1/P2/Tooltip/Card패밀리를 여기에 Frame으로만 만들어서 "컴포넌트/변형화 안 됨" 문제 발생했던 곳.
- `🧩 Components v2`(300:2) = Button 1개 실험 후 방치.
- `🎨 Icon`(44:2) = Phosphor 아이콘 1500+ Component Set.

**함정**: "Figma에 반영"=쇼케이스 Frame만 그리면 실제 컴포넌트가 아님. 인스턴스 생성·변형·라이브러리 등록 안 됨. 반드시 `figma.createComponent()` + `figma.combineAsVariants([comps], page)`로 만들어야 진짜 Component Set.

**제작 방법(검증됨)**: 변형마다 createComponent, name=`"Prop=value"`(다중은 `"P1=v1, P2=v2"`) → combineAsVariants로 묶음 → 세트는 변형이 **겹쳐 쌓이므로**(원본도 동일) 세트에 `layoutMode='VERTICAL'`+itemSpacing+padding 줘서 펼침. 단일(변형없음)은 createComponent만(combine 안 함)=COMPONENT.

**완료 (2026-06-22)**: 신규 **21종** 실제 제작, `🧩 Components` 페이지 y≥3960, 5컬럼(x=80/520/940/1360/1820), 헤더 "🆕 신규 컴포넌트(코드 동기화)". 변형세트 12종: Tag(Type5)·ChecklistItem(Tone3)·Divider(Orientation2)·Banner(Type4)·Spinner(Size3)·Tooltip(Position4)·SocialLoginButton(Provider2)·ActionCard(Type3)·PersonCard(Type3)·SettingRow(Type2)·RecordControls(State3)·LiveActivityCard(State2). 단일 9종: QuickActionTile·WidgetCard·NotificationCard·SettingsGroup·Timeline·RecordTimer·AudioWaveform·ProcessingStepList·Stepper. 토큰 바인딩+Noto.

**최종 구조 변경 (2026-06-22) — 마스터를 섹션 안으로**: 사용자 요구="Component Sets 페이지(314:2)인데 컴포넌트가 다른 페이지(249:2)에 있는 게 이상, 섹션 자체에 컴포넌트가 포함돼야". → 신규 마스터 Component Set/Component **21종 전부를 249:2에서 314:2의 각 DS·X 섹션 body 안으로 이동**(body.appendChild(masterSet), 셋은 layoutMode=HORIZONTAL+WRAP+FILL로 변형 가로배치). 인스턴스 행은 제거. 카드류 5종은 Card 패밀리 박스(464:60) 서브블록 안으로 이동(Card는 원본254:25라 인스턴스 유지). 결과: **249:2=원본 20종만, 314:2=신규 21종 마스터가 섹션 내 존재**. 314:2 재정렬 완료(41요소). 249:2의 "신규 컴포넌트" 헤더 제거.

핵심 교훈: 컴포넌트 마스터는 COMPONENT_SET째로 일반 FRAME 안에 nest 가능(set.parent=frame OK, 타입 유지). 페이지 위치 무관하게 assets에서 검색됨.

**아이콘=Phosphor 라이브러리 인스턴스 (2026-06-22)**: 컴포넌트 내 아이콘은 텍스트 글리프(✕✓›)나 손그림 도형이 아니라 **디자인시스템 아이콘 라이브러리(🎨 Icon 페이지 44:2) 인스턴스**를 써야 함(사용자 요구). Phosphor 1512종이 44:2 컨테이너에 중첩(page.findAllWithCriteria로 검색, 직속 아님). 각 아이콘=COMPONENT_SET, 변형 12종=`Format=Outline|Stroke, Weight=Regular|Thin|Light|Bold|Fill|Duotone`. 주요 ID: X 44:43491·Check 44:34733·Record 44:14341·Stop 44:15647·Play 44:14126·Play/Pause/Microphone/CaretRight(44:63698) 등. 인스턴스: variant.createInstance()+resize. **재색칠 함정**: 아이콘 인스턴스 recolor 시 fills를 모든 descendant에 적용하면 투명 컨테이너 프레임까지 채워져 사각형됨 → **VECTOR/BOOLEAN_OPERATION/도형 노드에만** fills 설정. RecordControls는 X/Check/Record/Stop/Play 인스턴스로 교체 완료.

**전체 아이콘 Phosphor 교체 완료 (2026-06-22)**: 신규 컴포넌트 손그림/글리프 아이콘을 모두 Phosphor 인스턴스로 교체. Banner(Info/CheckCircle/Warning/WarningOctagon)·ChecklistItem(CheckCircle)·ProcessingStepList(CheckCircle/Circle, active는 spinner ring 유지)·SettingRow(Bell/Trash + CaretRight)·SettingsGroup(User/Bell/ShieldCheck + CaretRight)·QuickActionTile(Users)·WidgetCard(Users/Microphone)·NotificationCard(Megaphone)·SocialLoginButton(GoogleLogo, kakao는 Phosphor 없어 'K' 유지)·RecordControls(X/Check/Record/Stop/Play). 교체 헬퍼 3종: swapEllipse(ELLIPSE 찾아 교체)·fillSquare(빈 아이콘칸에 채움)·replaceGlyph(텍스트 글리프 교체). 아이콘ID: Info69205·Warning70758·WarningOctagon70887·Circle22348·Bell33758·User66240·Users67112·ShieldCheck70266·Trash49781·CaretRight63698·Megaphone4775·GoogleLogo29192·Microphone13364.

남은 백로그: 원본 20종 314:2 통합 검토 + Pretendard→Noto 정합. [[project_cnote_wireframe_ia]] [[project_cnote_figma_storybook_sync]]
