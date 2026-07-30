---
name: project-cnote-design-reconciliation
description: "CNOTE 디자인 기획 현행화 프로세스 — 미드파이=살아있는 스펙, 시안 델타를 삼중 역동기화"
metadata: 
  node_type: memory
  type: project
  originSessionId: bccc86de-297c-4b84-91df-91629bde597f
---

**CNOTE 콘텐츠 영역 프로세스(260705 확립)**. 정본=`03_projects/260610_C-Level_note/02_design/CDS_design_reconciliation_process_260705.md`.

**문제**: 지금까지 조립판=미드파이 충실복제(단방향). 그러나 시안=미드파이(계약·기본)+**차별화 사용성·크리에이티브(디자인 기획)**. 이 델타가 어디에도 없어 개발 커뮤니케이션 오류.

**해결=양방향 현행화 루프**: ①계약읽기 ②디자인기획(시안 수준, 단순복제 금지) ③시안반영(Figma) ④**현행화(역동기화)**: 추가분을 `2midfi_*.html`에 `data-delta="creative|usability"` 주석 반영(단일소스) ⑤모듈/컴포넌트+파생화면 반영 ⑥델타로그(`_design_deltas.json`). **미드파이=살아있는 스펙**.

**★파생(Cascade)**: 기획이 신규 UI→신규 화면/플로우를 부르면 **미드파이 인벤토리(_required_ids)+flows+Figma 디자인 함께 성장**. 침묵 파생 금지→델타로그 derivedScreens 백로그 명시. 게이트=삼중정합+파생정합+계약불변.

**델타 유형**: creative(시각·모티프·브랜드) / usability(발견성·인지부하·시니어). 계약훼손(필수정보·nav·플로우)은 델타 아님=계약변경 트랙(PM승인).

**홈 첫 적용(삼중 완료)**: 델타 `CARD_RELATION_COUNT`(관계수127 히어로+증감+5노드 네트워크 모티프, 원언어 방사대칭72°) → 모듈 **RelationCountCard 1302:521**. normal·quiet 양모드 반영. 미드파이 주석화. **파생 SCR_RELATION_NETWORK**=인벤토리 stub+백로그(미설계). 로그=_design_deltas.json.

**★콘텐츠 시안정합 오버홀(260705)**: 사용자 지적=기존 토큰 기계적 재사용, 시안 디자인 미반영. 근본=시안 디자인언어를 스타일로 적용 안 하고 border로 때움. **시안 카드=`Elevation/Card Glass` 이펙트스타일(배경블러28+소프트섀도우)+surface(2:13) 50%투명=글래스모피즘. 이 스타일이 이미 시스템에 있는데 미사용이 문제.** 수정: 7카드컴포넌트+CARD_PENDING에 Card Glass적용·하드border 전부제거·radius16. 배경=상단국소→시안 대면적글로우(다크 867:29 3글로우/라이트 882:80) 12프레임. ActionCard text-group VERTICAL→HORIZONTAL(아바타+이름 가로). 모티프 링→오각형엣지+허브방사선 벡터(원언어72°). ⚠벡터 vectorPaths는 x/y를 path min으로 세팅해야 정렬. **교훈: 카드구분=border아닌 엘리베이션스타일. 컴포넌트는 시스템 Elevation 이펙트스타일 적용해야 시안품질.**

**⚠★근본원인 확정(260705 실측 — 이전 "재바인딩" 접근은 오진)**: 다크 미플립의 진짜 원인은 팔레트 바인딩 자체가 아니라 **프레임이 다크 전환 시 `setExplicitVariableModeForCollection`을 시맨틱 컬렉션(`2:2`)에만 걸고 팔레트 컬렉션(`105:2` CNOTE Colors)엔 안 걸어서**다. 팔레트 컬렉션도 Light/Dark 모드가 **실재**하고 값이 다름(surface/base 흰↔#0f172a, text/primary #0f172a↔#f8fafc, border/default #e2e8f0↔#334155 등. primary/500·surface/white는 양모드 동일). 그래서 105:x 바인딩 노드가 다크 프레임서 라이트값 렌더=다크온다크. **정답=재바인딩 0개. 모든 다크 화면 프레임에 `frame.setExplicitVariableModeForCollection(coll105_2,'105:1')` 추가**(라이트는 '105:0'). 그러면 1076개 팔레트 노드가 전부 자동 플립. ★컴포넌트 라이브러리 1076노드가 팔레트 참조=정상(스케일색 primary/500·danger/500은 시맨틱에 없음). **이전 세션들이 개별노드 105:x→2:x 재바인딩한 건 증상 땜질**(무해하나 불완전). 홈 12프레임 전부 양컬렉션 모드 명시 완료·눈검증 통과(pending 라이트 블랙배경/다크 리스트 버그 동시 소멸). 메인컬러 통일=2:3+105:6 양모드 #5a6cf7. **화면 빌드 표준: 다크프레임=두 컬렉션(2:2→2:1, 105:2→105:1) 다 전환, 라이트=(2:0,105:0) 명시.**

**★실장모드 실패 교훈(260705)**: 사용자가 "코드로만 보고 정상이라 넘긴다=개발실장모드지 디자인실장모드 아님"이라 지적. **디자인 실장=적대적 눈이 먼저**(무엇이 잘못됐나 사냥)→코드는 눈이 잡은 결함의 원인규명용. 놓친 것: 라이트인데 카드만 검정·리스트 미설계(정렬·구분·위계 없음). **★인라인 프레임(createFrame)의 색 바인딩은 모드전환에 실패**해 캐시색을 렌더할 수 있음(컴포넌트 인스턴스는 안정 플립)→일회성 인라인카드는 컴포넌트 승격 or 프레임별 명시색. 레이아웃 방향전환 시 텍스트컬럼 HUG 필수(정렬). 관련 [[feedback-visual-verification]].

**★최종목표(사용자 확정 260705)**: 전 57화면을 모듈/컴포넌트 조립 템플릿(양모드)으로 완성 + 모듈/컴포넌트 정본 완비 = **스토리북 개발 직전 단계까지**. 킥오프 지시서 정본(최신)=`01_docs/킥오프/260706_전화면_모듈화_시안First_이어서_킥오프.md`(§0=붙여넣기 지시, §2=3대표준, §3=함정, §4=순서, §5=시안매핑. 선행=260705판). 선결=팔레트→시맨틱 전수감사+CARD_PENDING 모듈승격. 순서=핵심nav3→플로우별 확산.

**★★★모듈 강제 아키텍처 전환(260706·사용자 "완전 제각각·일관성 전무" 지적 후 확정)**: 반응형 화면단위 수정으로는 일관성 불가 판명. **정본 규칙**(예외 없음): ①**템플릿=오토레이아웃 루트 + 모듈 인스턴스만**(인라인 카드 조립·손수정 전면 금지). ②**카드는 반드시 모듈을 거친다**(모듈 마스터=유일 정본). ③**색=시맨틱 토큰 바인딩**(카드 fill=color/surface 바인딩→모드 자동플립. raw색·per-mode 손수정 금지). ④**모드=복제+플립, 재빌드 금지**(정본 모드 1개만 조립→복제해 두 컬렉션 모드 전환→반대 모드. 다크=라이트 설계 동일 구조보장. SIGNUP 다크≠라이트 같은 드리프트 원천차단). **근본원인=다크/라이트 프레임이 독립 손빌드로 드리프트+카드가 모듈 안 거쳐 제각각.** **정본 카드처리(1회)**: fill=color/surface 바인딩·**opacity 0.72(은은, 배경 과노출 방지)**·흰테두리@0.12·radius4·Card Glass. 홈 5카드마스터(RelationCountCard·ScheduleCard·ActionCard·RelationInboxCard·PendingReviewCard) 통일→전화면 파급. **루트 AL 변환**: root VERTICAL AL + 헤더를 content 편입(gap16 pad24) + 오버레이(glow·nav·fab·scrim·sheet) ABSOLUTE + nav h88 y756. ⚠root AL 시 primaryAxisSizingMode FIXED만으론 부족→**resize(390,844)+clipsContent 명시**(안 하면 프레임이 content높이로 늘어나 nav가 중간에 뜸). **홈 파일럿 완성**(12프레임 일관, 양모드 눈검증). 다음=이 패턴을 person·task·settings·온보딩에 전파 + SIGNUP라이트 등 드리프트는 복제플립 재건. PersonHeroCard셋(1441:2283)=Module페이지 이관. 계획 [[project-cnote-ia-reorg]].

**★시안정합·모듈·AL 바로잡기 오버홀(260706·사용자 3지적: 타이포불일치/모듈미적용/AL미적용)**: 실측으로 근본원인 확정. ①**타이포 근본=마스터 드리프트**(127=52→시안84 Poppins·미팅카드14:00=34→16·nav h76→88). 시안값 교정→전 화면 자동파급. 정본 실측표=`02_design/_시안_스펙_260706.md`(타이포/레이아웃 램프). ②**AL은 이미 적용돼 있었음**(오독이었음 — get_metadata의 x/y는 AL자식도 절대표기. 실측=PERSON 57·SETTINGS 46·PROFILE 35 AL프레임. 루트화면만 NONE=홈과 동일 의도된 캔버스). ③**모듈미적용=일부 사실**(PERSON 히어로 인라인). **처리**: RelationCountCard(127→84·lineHeight 100%가 관건, AUTO는 1.5배로 과대)·ScheduleCard(리치세로 h176→시안 컴팩트 가로 h94, 14:00김도현@16+caret 재구성)·BottomNav 4변종(h88 상단정렬 pad12 gap5)·ActionCard(제목20→18) 마스터 교정. 홈 12프레임 content gap16·좌우pad24(카드폭342)·카드 FILL. **PersonHeroCard 2변종셋 승격(1441:2283)** — 모드별 라디얼 그라디언트라 단일마스터 불가→mode=Dark/Light. ListSection은 가변길이라 제외. **교훈: '자꾸 다르게'의 진짜 원인은 AL아닌 마스터 타이포/lineHeight 드리프트. 카드 반투명·radius4·figure-ground는 이미 정상.** 계획서 `_WORK_PLAN_시안정합_모듈AL_바로잡기_260706.md`. 6화면(홈·person·task·settings·signup·verify·profile) 양모드 눈검증 통과. 관련 [[feedback-visual-verification]].

**★★시안-First 원칙(260705·반복 divergence 근본대응, 사용자 "자꾸 다르게 반영되는 근본원인" 지적)**: 근본원인=**미드파이(회색 와이어=구조/계약)를 비주얼 기준으로 오인**. 색·radius·투명도·테두리·타이포·모티프·아이콘은 **시안이 정본**인데 미드파이+내 해석+컴포넌트 default(radius16·불투명·ListChecks·흰pill)로 채워 어긋남. 사후에만 실측(반응형). "내 눈에 프리미엄"≠"시안 일치". **해결 프로토콜(착수 전 필수)**: ①시안 위치확인(홈867:29/882:80·온보딩890:107·카드정본 1119:2·Creative839:2) ②실측→스펙화(값 발명 금지) ③매칭빌드(미드파이=구조/시안=비주얼값) ④diff-gate(시안과 나란히 요소별 차이 전수 열거·교정, 기준=일치). **시안 없는 화면=성문 시안언어(가이드§7·§7-5·premium craft) 엄격적용**. **품질상향=컴포넌트 시안감사(공유 마스터 전수 시안값 교정→전화면 자동상향)+레퍼런스구동(가정금지)+diff-gate 상시.** 정본=CDS_design_reconciliation_process §2.5. **앞으로 신규화면**: 단순 미드파이 복제 금지 — 항상 시안 수준 기획→역현행화→모듈/컴포넌트. **카드는 Card Glass 엘리베이션+글래스(surface50%), border 금지.** 관련 [[project-cnote-ia-reorg]]·[[project-cnote-circle-language-clarity]]·[[project-cnote-premium-craft]].
