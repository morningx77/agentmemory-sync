---
name: project-cnote-premium-craft
description: "CNOTE 프리미엄 미감 크래프트 — '은은하면서 쨍한' 시안 품질의 재현 규칙(260704 세션 도출)"
metadata: 
  node_type: memory
  type: project
  originSessionId: da39437f-0edf-404d-802c-2d96033dbe51
---

CNOTE 표현형 컴포넌트를 "화면 시안 수준"으로 디자인하는 크래프트 정본. 정본 문서=[[project-cnote-circle-language-clarity]]와 함께 `02_design/CDS_premium_craft_guide_260704.md`(상세) + DESIGN_PRINCIPLES ㉓ + 플레이북 P5-D.

**근본**: mid-fi는 와이어프레임(회색 구조). 그대로 옮기면 와이어프레임처럼 보인다. **radius/토큰/다크는 배관이지 디자인이 아니다.** 표현형(카드·EmptyState·타일·히어로)은 **크리에이티브 프로토콜 + 미감 크래프트 패스** 필수. 중립 atom(Input·Checkbox 등)은 평면 유지가 정답.

**크래프트 4대(260704 세션 순서대로 도출)**:
① **크리스프**(not mushy): 선명 링 paper@.85 sw2.5 / 주체 blue-soft@1 sw3 + 비비드·hot 솔리드 코어(+흰 하이라이트). 얇고 흐린 외곽선만=흐림.
② **미니멀**(not busy): 2요소 이내, **링 쌓기 금지**. 요소 덜어낼수록 절제된 고급.
③ **대담·밀도**(not hollow): 원이 프레임 채움(대담 스케일), 인터섹션(2원 겹침) 리듬. **미니멀≠횡함**(⑦⑧ 유지).
④ **광원**(not 안개): 빛=가산 `blendMode:'SCREEN'`(또는 blur타원) + **hot 흰빛 중심 #C7D2FF** + 넓은 gradual. 반투명 파랑 NORMAL=물감=안개.

**★★공간 원리(가장 중요·반복 실패의 핵심)**: 은은하게 퍼지는 광원은 **넓은 면적에서만** 성립. **글로우=대면적(배경·히어로·타이틀) 전용.** 좁은 카드 요소엔 글로우 금지 → 크리스프 미니멀 기하만, 글로우는 부모 화면 배경이 담당. (좁은 요소마다 글로우 박아서 계속 뭉갬)

**★강도=힌트 수준**: 블루 op **0.18~0.22** / 바이올렛 **0.12~0.16**, 크기 420~520, `LAYER_BLUR 150`. **색 튀면 은은함 즉시 붕괴**("약간 가미"는 문자 그대로). 실패값=0.5/0.38("너무 강해 무너짐").

**정본 색(온보딩 890:107 실측)**: 베이스=**딥 네이비 #080E1C**{0.031,0.055,0.110}(방사형 #121A30→#080D18) — ⚠순수 회색 off-black 아님, 블루 가미가 시안 느낌. 텍스트 paper #F4F4F5. 액센트 블루 라이트#3D5AF1/다크#7C93FF/코어#5A6CF7. hot 광원중심 **#C7D2FF**. 보조글로우 바이올렛 **#734FFF**.

**모티프 어휘(의미 기하만·장식 금지)**: **인터섹션**(2원 교차+렌즈=관계=CNOTE BI, 시그니처 기본) / **볼드 오빗**(큰 링+발광 코어=집중·모먼트, 타이머·히어로) / 동심(기다림·EmptyState) / 접선(성장). radius 컨테이너=㉑4px → 유일 곡선=원 돋보임.

**함정**: `layoutPositioning='ABSOLUTE'`는 부모 appendChild **후** 설정(순서). createVector open-path는 fill로 채워짐→체크마크 흰삼각형 사고(채움원 대체). SCREEN 블렌드는 대면적에서만 은은(좁으면 블롭).

**프루프(스크래치 존, 314:2)**: 히어로존 데모 1108:342(네이비+힌트글로우+크리스프 인터섹션=최종 승인). EmptyState 1095:342·SummaryCard 1101:342·QAT 1102:378은 구 버전(글로우 요소내 과함)→이 크래프트로 재정제 대기. A/B 카드들(1104~1107)은 크래프트 학습 근거.

**작업물 페이지**: 신규 페이지 `🎨 CDS · Premium Craft Lab`(1112:2)로 이관·정리 — ①최종승인 히어로존(1108:342) / ②학습A-B(1104~1107) / ③구프루프(1095/1101/1102) / ④재정제 최종(SummaryCard-v2 1113:3·EmptyState-v2 1114:2·QAT-v2 1115:30).
**재정제 완료(최종 크래프트 적용)**: 3종 v2 = 네이비 베이스(#141C33→#0A0F1E)·크리스프 미니멀 모티프(요소 글로우 블롭 제거, 코어만 tight rim)·EmptyState는 대면적이라 아주 옅은 배경 힌트글로우(blur120 op.16)·SummaryCard 코너 인터섹션·QAT 오빗·녹음 blue hero. **이게 확정 품질바.**
**★★260704 최종 정정(사용자 지시·가장 중요)**: "프리미엄 다크" 별도개념 폐기. **모든 것 라이트/다크 이원화·품질 동일, 디자인 언어 하나.** 구분=①컴포넌트 디자인(314:2)↔②템플릿(화면) 디자인 뿐. **navy/off-black은 다크값일 뿐 → 반드시 토큰 바인딩(surface 2:15·text 2:16/2:18·primary 2:3)으로 구현해 자동 반전. 하드코딩 금지.** **카드 내부 글로우 없음**(시안 카드 클린) — 글로우/틴트=대면적 화면배경(템플릿) 몫. 라이트기준=홈882:80·녹음Light944:102, 다크=867:29·891:107(실측: 흰↔네이비 카드·크리스프 블루 모티프·대담 데이터·텍스트 반전). **검증완료: SummaryCard-tokenized(1126:2) 토큰 듀얼모드 — light인스턴스 1126:26 / dark 1126:50 둘다 정상**(표면·텍스트·모티프 반전·클린). 이게 정답. 구 프루프(navy 하드코딩 1113~1123)는 방식 폐기·재구성 대상. lens boolean은 intersect 후 x/y 재설정 필수. **롤아웃=토큰 듀얼모드로 314:2 컴포넌트 → 이후 템플릿.** **★완전위생 필수(색만 바인딩 부족·사용자 지적): 텍스트→텍스트스타일(setTextStyleIdAsync)·radius→radius/xs(4)·간격→spacing토큰(105:40, 4/8/16/24/40 임의px금지)·공통atom→인스턴스(①). 골든레퍼런스=SummaryCard-HYGIENE(1139:128, 데이터층 allTextStyled·radius/spacingBound=true 검증). 텍스트 wrap=layoutAlign STRETCH+textAutoResize HEIGHT.** 텍스트스타일 목록: Title/Large20·Body/Medium14·Number/md34·Number/lg56·Display/md32·Caption11·Label/Medium12 등. **★최종 종착점(사용자 지정): 확정 컴포넌트를 314:2 `DS·X` 가이드 포맷(1200폭·넘버eyebrow+타이틀+설명+셋+사용예·라이트/다크 병기)으로 이관·문서화 → 314:2가 와이어프레임카탈로그에서 프리미엄 디자인시스템 가이드로 완성.** 계획서=_WORK_PLAN_premium_rollout_260704.md. 구 롤아웃분(Schedule1127·Status1129·Note1130)은 위생 재작업 대상. **완전위생 체크리스트(사용자 재강조·반응형 대응 전제): 오토레이아웃+로컬 텍스트스타일+변수토큰(색/radius/spacing)+그림자 effect스타일(Elevation/Level 1·Card=S:ffffc315…, setEffectStyleIdAsync·direct effects 금지)+공통atom 인스턴스(①).** 재사용 hygiene()로 텍스트스타일/radius/spacing 일괄바인딩. **위생완료: Summary·Schedule·Status·Note 4종 = 데이터층 통과(allTextStyled·radius/spacing/effBound=true)·적대검증·양모드.** 남음: ①atom 인스턴스화(아바타·태그 아직 raw)·신규카드·특수·템플릿·314:2 가이드화.
**롤아웃 진행(토큰듀얼·적대검증 통과)**: SummaryCard(1126:2)·ScheduleCard(1127:48·아바타 겹침)·StatusCard(1129:82·진행링 arcData 66%)·NoteCard(1130:102·오빗+해시태그). 각 light/dark 인스턴스로 검증.
**★데이터카드 10종 전부 완결(게이트·양모드)**: Summary·Schedule·Status·Note·PersonAdd·Calendar·Notification·SearchResult·Delegate·TaskCard(1157:280). 전부 오토레이아웃+텍스트스타일+색/radius/spacing토큰+effect+Avatar인스턴스+토큰듀얼모드+증분 실장눈검증.
**★특수표현형 5종 전부 완결(게이트·양모드, Lab 1112:2)**: EmptyState(1160:303·동심원 모티프·투명컨테이너=화면이배경, 다크는 canvas토큰 backing으로 검증)·QuickActionTile(1165:14·오빗·SPACE_BETWEEN 타일)·Timeline(1168:26·노드=원·현재primary+흰inner·rail connector layoutGrow)·Modal(1170:68·타이포명료·ghost/fill균등)·BottomSheet(1172:82·상단radius/xs·핸들·옵션행 chevron·경량divider). **컨테이너형(Modal·BottomSheet·Timeline)은 크래프트=구성·타이포·크리스프 완성도로 격상(원모티프 억지 금지). 소형타일·EmptyState는 크리스프 계산 원모티프, 글로우는 화면(템플릿)몫.**
**★★314:2 가이드화 완료(최종 종착점 달성)**: 15종 전부 `✨ DS·{name}` 프리미엄 가이드 프레임으로 314:2에 생성(밴드 1174:462, y=18440~, 3열 메이슨리). 포맷=기존 DS·X 정확복제(accent bar primary 6px + 넘버 eyebrow Label/Medium + 타이틀 Display/md + 서브타이틀 Body/Small + 설명박스 surface radius4 + 섹션라벨 Caption + **쇼케이스=라이트/다크 2패널**). **듀얼모드 검증법=패널 bg를 canvas토큰(2:12)로 깔고 패널·인스턴스에 setExplicitVariableModeForCollection(2:0/2:1) → 투명컨테이너(EmptyState)도 패널배경이 모드 담당해 정상.** 재사용 makeGuide(spec,x,y)+panel(comp,mode,label) 제너레이터. 파일럿(SummaryCard 1174:463)→나머지14 일괄. 메이슨리=col별 실제 f.height 누적+gap100로 무겹침. **구 회색 DS·X 16개는 삭제 안 하고 `📸 BAK · DS · {name} (회색·구본→✨PREMIUM 대체)`로 rename 아카이브.** **★15종을 단일 섹션 프레임 `✨ PREMIUM 컴포넌트 가이드 — 듀얼모드 15종`(1178:473, 4160×3927, 314:2 내)으로 래핑 완료** — 흩어진 배치(사용자 "하나밖에 안 보임" 지적) 해결. 함정: `appendChild`는 절대위치 보존 안 됨(자식 x/y=상대) + 상대좌표에 절대값 넣으면 튐 → 자식 x/y를 **상대 3열 메이슨리(X=[40,1480,2920]·colY 누적+gap90·f.height 런타임)**로 재설정하고 wrap.resize로 정리해야 함. **★★사용자 지시(중요): 프리미엄 가이드는 314:2 정본 카탈로그에 얹지 말 것 — "왜 커버(정본)페이지에 넣냐" 반려. → 래퍼(1178:473)를 새 페이지 `✨ CDS · Premium Guide (듀얼모드 15종)`(1181:513)로 이동, 314:2의 BAK rename 16개 전부 원복(DS·{name}). 정본 314:2는 원래 회색 카탈로그 그대로 유지, 프리미엄 가이드는 독립 페이지 관리.**
**★모티프 세트 차별화(사용자 "의미별 차별화" 지시)**: NoteCard·QAT·EmptyState가 같은 "링+중심점 과녁"으로 평이·반복 → 원 언어를 의미별로 분화. **EmptyState=동심(ring+중앙dot, 기다림) / QAT=편심 오빗(ring+가장자리 위성core, 실행·모먼트, core를 링 path 반지름 거리에 배치=코드로 offset==r 검증) / NoteCard=접선(ring+외접 솔리드원, 성장·연결, 두 중심거리==r1+r2 검증).** 기하 배치는 코드로 판정(offset/접점 실측), 읽힘·프리미엄은 눈+세트대조.
**★폴리시 4건 수정(③④⑤⑥)**: ③Notif 본문·④Modal 제목 = 한글 어중간 줄바꿈/고아줄 → **명시적 \n 삽입**으로 균형 개행. ⑥Summary 인터섹션 링 옅음 → 블루링 sw 2→3(쨍 보강, 은은함 유지). **★⑤ 토큰 갭 발견=`primary/50`(VariableID 105:3, 컬렉션 105:2) 가 Light==Dark 동일값(#EDEFFE)이라 다크에서 아바타 순백 튐 → 다크값 `#263156`{0.149,0.192,0.337} 부여로 정본 수정(이 토큰 쓰는 모든 다크 개선). 교훈: 틴트 스케일 토큰(primary/50 등)은 dual-mode 값 갭 흔함 — 다크에서 순백/과밝 요소 보이면 토큰 valuesByMode에 Light==Dark 아닌지 확인.** 다음 대단계=템플릿(화면) 조립+대면적 배경글로우.
**★카드 표면 표준 확정(260705·시안 홈 867:29/882:80 재실측으로 정정)**: **radius 4 · fill color/surface 반투명(다크 op0.5/라이트 op0.72·모듈 마스터는 0.6 단일) · 테두리 흰색@0.12(글래스엣지 raw white, color/border 아님) 1px INSIDE · Card Glass**. ⚠**내가 앞서 "불투명+color/border+radius16"으로 기록한 건 오류**(시안은 반투명·radius4·흰엣지). 바인딩 SOLID도 opacity 정상렌더(과거 "무시" 관찰=오진). "배경과 자연 조화"=반투명이라 배경글로우 비침. +컴포넌트 시안정렬: nav 할일=Sparkle(ListChecks아님)/FAB primary·네트워크 외곽노드 hollow(text-sec 스트로크, surface fill 금지=다크서 안보임)·세그먼트 선택pill=primary블루+흰텍스트(반전 text-primary 금지)·EmptyState=동심모티프(빈원 금지). ⚠"투명처리"는 사용자 표현일 뿐 실제는 불투명+테두리+그라디언트. 적용: 홈 카드마스터 5종(RelationCountCard·ScheduleCard·RelationInboxCard·PendingReviewCard·ActionCard셋 전변종)+person-list 섹션카드 = 테두리 추가·양모드 검증. **리스트 행 표준(별건)=ListItem 플랫(fill 투명·박스제거·하단 헤어라인 divider strokeBottomWeight1 border@55%·radius0), 카드 마지막행 divider 숨김**(이중박스 금지). **★인라인프레임(createFrame) fill 바인딩은 모드전환에 캐시색 렌더=안플립→모드별 프레임엔 명시 raw색. 모듈 인스턴스는 안정 플립(마스터 바인딩 OK).**
**★★치명 함정(260704): 변수 바인딩된 SOLID 색은 paint.opacity를 렌더서 무시**(설정해도 100%). 토큰 틴트(primary@0.14 칩/배지/아바타)를 opacity로 못 만듦→솔리드+동색텍스트 소실. 해결=칩은 중립 surface토큰bg+primary텍스트 or 배경없는 컬러텍스트(해시태그) or 별도 tint변수. **함정: 고정크기 요소에 layoutMode 걸면 내용에 hug돼 찌그러짐(아바타 30→12)→FIXED 고정.** **적대적 눈검증이 이 버그들 다 잡음(코드는 성공 리턴).**
