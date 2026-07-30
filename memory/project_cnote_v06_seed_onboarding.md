---
name: cnote-v06-seed-onboarding
description: CNOTE v0.6 씨앗홈·점진온보딩·사람탭 재설계 — 스토리북2 device 전량+flow 20/20 완결(260727)
metadata: 
  node_type: memory
  type: project
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-07-28T23:31:31.227Z
---

★2026-07-27 스토리북2 세션. v0.6 킥오프 전량 완료(48e252c 이후 → **aa55d03** push).

- **신규 공용 5종**: SeedCard·ProfileProgressHint·WorkStrip·FavoritesStrip·InfoNeededSheet + 씨앗 토큰(`seed-tint/seed-border`, global.css+tailwind).
- **SeedCard v2 = 사용자 레퍼런스(토스류)**: 보더 없는 파스텔 틴트 면+rounded-xl(24)+p-lg+흰 이브로우 칩(Plant 아이콘)+톤온톤 흰 CTA. ★figure-ground 이중화 정본: **실카드=크리스프 4px·surface / 씨앗=소프트 24px·파스텔**.
- **화면**: SCR_NAME_QUICK(동심원+HeroBadge·카피 간소화=안내 2문장+입력칸 헬퍼, 사용자 '너무 길다' 지시)·SCR_HOME|seed/seed-partial(GrowIn '자라는' 전환 900ms: 실카드 부상+씨앗 틴트 워시 걷힘)·BS_INFO_NEEDED·PROFILE_CONFIRM 재편(Sonnet 서브에이전트)·PersonList 재설계(세그먼트 제거·directory→default 흡수·FavoritesStrip·SVG 고스트 ACT_CALL/SMS/EMAIL·needs-check)·홈 normal 2레이어(WorkStrip+타임라인 앵커행+CARD_DRAFT_NOTE 제거)·StartPick 삭제.
- **flow 완전 결선(사용자 지시)**: nav_map 15키 직접 추가(★상태 스코프 키 `SCR_HOME|seed-partial|BTN_PROFILE_PROGRESS` — emit이 screen='SCR_HOME|seed-partial' 전달하면 flow가 상태분기)·BS 오픈 전용 스토리 2종(`--seed-info-needed`·`--seed-partial-card-control`)=_screen_links BS키 대상·flow.html 해시 %7C 디코딩 패치. **Playwright 실클릭 20/20 PASS**(검증 스크립트 함정: 해시만 바꾸면 flow 리로드 안 됨→쿼리 캐시버스터, 파이프 encodeURIComponent 금지).
- **마커 표준 변경**: 씨앗①=BTN_CONNECT_CONTACTS·④=BTN_ADD_SCHEDULE(per-kind)·GNB 4탭 헤더=BTN_HEADER_CALENDAR/SEARCH/NOTI(구 BTN_SEARCH/NOTIFICATIONS류 폐기)·AnalyticsId에 `ACT_*` 확장.
- **추가분(12:40Z)도 완료(ed4cfbc)**: BS_TASK_COMPLETE 완료확인 시트(체크≠즉시완료)·CollapseOut 접힘 모션(240ms·onLayout 실측 height interpolate·reduced-motion 존중·★Animated 래퍼는 width:100% 필수 — items-start 컨테이너 수축 함정)·완료행 강화(op-60+취소선+중립 배지)·메모 1000자. SeedCard 최종=v3(셸 크리스프 정본+중앙 IllustIcon: user/business/speaker/notepad — v2 파스텔은 사용자 철회). flow.html 캐시버스터(&v=배포시각) — 구번들 캐시 재발 방지 정본.
- **★260728 v0.6.1~0.6.3 전량 완료(c6b4e1b·flow 17/17)**: SeedCard v4(이득소구: 이브로우+기능명+AI배지+가치문장+**인포그래픽 4종 크래프트**(infographics.tsx: 파형→3줄·127→12·미니캘 도트·체크리스트)+결과예시, 정본=seedContent.tsx SEED_SPECS)·seed 몰입(크롬 제거+SeedCarousel 84% peek+둘러보기)·SCR_WELCOME(Sonnet 초벌+폴리시)·**튜토리얼 허브**(seed-partial 3층: 진행바→BS_TUTORIAL_HUB 시트/내활동추천 GrowIn/브리핑)·할일 재구조화(필터칩·라디오 RADIO_STATUS_*·BS_TASK_COMPLETE 폐기·CollapseOut 유지)·날짜 네비게이터(HomeHeader onDatePress▾+todayAction·BS_DATE_PICKER 달력·SCR_HOME|dated)·GNV 인맥·반가워요 헤더(★슬림화 아바타L+title-lg=잘림 해소).
- **오케스트레이션 전례**: 하이브리드(메인=크래프트+단일공유파일 Home / Sonnet 2기=WELCOME 초벌·TaskList 재구조화 병렬) — 풀 팬아웃 부적합 판단 근거=Home 단일파일 집중+크래프트 가치.
- **미결**: recording 씨앗 일러스트 결정 대기(구건)·BS_INFO_NEEDED 존치/폐기·헤더 슬림화 미드파이 역반영·RADIO_STATUS_ 접두 정본화 — 기획 회신 대기(13:40 저널).
- **★260729 SeedCard 정본=v0.8.1**(커밋 60addd7·배포·라이브검증 PASS): '예시' 프레이밍 걷고 **실카드처럼**. ①기본 '예시 미리보기' 이브로우 제거(씨앗4=이브로우 없음·허브 '남은 튜토리얼'/done '완료'만 명시 prop 조건부) ②결과 미리보기 라벨 제거(내용만) ③**인포그래픽 대형·과감**(그래픽존 h-28→h-36·InfoMetric display-lg 34→**display-xl 44**·파형 h-12→h-16 9바 진폭엔벨로프·DotGrid 셀 4→5·화살표 20→24=진짜 데이터비주얼) ④CTA 확대(**Button size 'large' 신설**=h-control-lg 52·label-lg 16)+주카드 primary fill. flow.html seed 라이브=스토리북 정본이라 storybook 배포로 자동 반영. ★v0.8.0 #4 홈 배치(관계카드 독립 최상단)는 내 v0.6.9(관계수 '오늘의 브리핑' 통일)와 **상충·되돌림**=대기.

관련: [[cnote-v05-home-company-news]] [[reference_cnote_flow_player]] [[project_cnote_premium_craft]]
