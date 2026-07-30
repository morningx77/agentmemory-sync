---
name: project_themony_marketing_categories_260711
description: THEMONY 마케팅 콘텐츠 카테고리 기획(A정부지원금확장/B생활정보/C트렌드) — A·B 키워드리서치 완료, C 대기
metadata:
  node_type: memory
  type: project
  originSessionId: 2d769983-1263-48d4-a3cb-24676a48ec5c
---

THEMONY(themony.com) 검색 트래픽 확보용 마케팅 콘텐츠 카테고리 기획 (2026-07-11, 워드프레스3 세션, salgoonews.com 벤치마크 계기). 계획서=`03_projects/260627_THEMONY_MCP/01_docs/_WORK_PLAN_marketing_category_content_260711.md`. 사용자 승인 우선순위=**A→B→C 순차**.

**원칙**: 살구뉴스는 카테고리 폭/속도만 참고, 클릭베이트 thin 콘텐츠는 배제(THEMONY가 260709~11에 애드센스 thin-content 위반 개선을 막 끝내고 재심사 대기 중이라 재발 리스크 큼, [[project_themony_adsense_remediation]]).

**A안 정부지원금 확장 완료**: 신규 domain config `05_notes/04_claude/naver-keyword-research/domain_configs/정부지원금.yaml`(18카테고리·90시드, 기존 gov 63건과 부동산.yaml 주거지원 카테고리 중복 배제) → 5,928건 스캔. 결과문서=`01_docs/정부지원금_발행우선순위_260711.md`. **핵심발견**: 에너지바우처(201,200·낮음경쟁)·문화누리카드(117,900)·청년도약계좌(316,100) 등 T1 바우처·T3 청년정책금융 고볼륨. **실업급여계산기(119,100·낮음경쟁)**가 계산기 기회로 확인. 노이즈 심함(직업훈련/노인복지 카테고리가 일반 구직·사금융 검색 대량 흡수) → 알바/이력서/무직자대출/자격증 등 대량 제외.

**B안 생활정보 확장 완료**: 신규 domain config `domain_configs/생활정보.yaml`(16카테고리·80시드, 근로노무·퇴직급여·연말정산·4대보험·자동차·통신·소비자보호·의료비·카드·예적금·상속증여·장례·반려동물·법률분쟁) → 11,734건 스캔. 결과문서=`01_docs/생활정보_발행우선순위_260711.md`. **★최대수확=급여·생활비 계산기 클러스터**(퇴직금계산기319,000·시급계산기198,300·적금계산기192,800·월급계산기117,000·**예금이자계산기126,100·낮음경쟁=최우수조합**·4대보험계산기103,300·실수령액계산기96,100·주휴수당계산기92,200 등 11종) — 기존 계산기12종 허브(page 891) 확장 근거. ★기존 전략플랜(`themony_전략플랜_260627.md`)의 미구현 "연봉 실수령액 계산기"가 바로 이 실수령액계산기(96,100)로 확인됨. **노이즈가 A보다 훨씬 심함**: 금융시드(적금·카드) co-occurrence로 은행/카드사 브랜드명(우리은행·국민카드 등)·주가정보(현대차주가·카카오주가 등)가 대량 유입되어 전량 제외. 상속증여·소비자보호 카테고리는 부동산.yaml과 대부분 중복이라 제외. 신규 니치=장례상조 생활정보(49제계산 등)·생활법률 셀프서식(내용증명·차용증·지급명령).

**B안 계산기 구현 완료(260711 같은 세션)**: 급여·생활비 계산기 7종을 `03_dev/calculators/` 기존 파이프라인(build_calculators.mjs+calc_formulas.js+verify_formulas.py)에 추가 완료 — 월급/연봉 실수령액·퇴직금·예금이자·적금·시급(주휴수당)·연말정산 간이모의계산(사용자 지시로 포함, 카드사용액공제 등은 미반영 disclaimer). 계획서=`03_dev/calculators/_WORK_PLAN_salary_calculators_260711.md`. 파이썬 40/40, JS↔Python대조 28/28, build 자체점검 20/20 전체 PASS. hub.html 갱신(준비중 4개 중 3개 라이브 전환+연말정산 라이브, 퇴직연금만 준비중 유지, 신규 3종 카드 추가). **배포는 미실행**(로컬 dist 생성·검증까지, 실제 WP 발행은 별도 승인 필요). 2026 요율 상수(국민연금상한637만·최저시급10320원 등)는 매년 갱신 필요.

**남은것**: C안(트렌드·이슈해설, 연예·트렌드 카테고리 활성화)은 저작권 리스크 있고 broadcast_autoposter Task0(런타임설치) 선행 필요 — 사용자 go 대기. A안(gov_autoposter 키워드뱅크 확장)은 리서치만 완료, 구현 미착수.

**★계산기 실제 WP 배포 완료 + 중복발행 사고 수습(260711 같은 세션)**: "발행해줘" 지시로 upload_assets.py+deploy_calculators.py 실행 → **월급/연봉실수령액·퇴직금 3종이 슬러그 충돌로 기존 라이브 페이지(240/241/242, 260628 제작, 퇴직금은 세후계산까지 있어 더 완성도 높음)와 중복 발행됨**(URL에 -2 자동접미). 사용자 확인 후 신규3종 휴지통 처리+기존 유지로 결정. 이어 "살아있는것은 모두 보이기" 요청으로 **hub.html(page 891) 급여·세금 섹션 준비중 배지 전부 실제였음을 발견**(퇴직연금322·나이244·글자수세기212·특수문자표213도 260628에 이미 제작되어 있었으나 허브 미연결) → 전부 라이브 링크로 전환. **★재발버그**: _deployed.json에서 트래시 처리한 3개 키를 "_note" 문자열로만 남겼더니 스크립트가 "미배포"로 오인해 --update 재실행 시 또 중복생성(1947-1949)함 → 근본수정은 build_calculators.mjs CALCS 배열에서 그 3종을 완전히 제거하고 EXTRA_NAV(참조전용, 배포 안 함)로 이동 + pageHtml의 related 링크 조회를 CALCS만이 아닌 ALL_CALCS(=CALCS+EXTRA_NAV)에서 찾도록 수정. **최종 상태**: 계산기 20개 전부 라이브(기존13+신규4+오르판7=24개 전체 페이지), 전 페이지에 "🧮 계산기 바로가기" 통합 내비게이션(select+calculator_base.js) 부착 완료. 교훈: WP 배포 전 **반드시 슬러그 충돌 여부를 먼저 확인**할 것(REST API `?slug=` 쿼리로 사전 체크), "준비중" 표시를 실제 부재의 증거로 성급히 믿지 말 것(hub.html 갱신 이력 확인 필요).

관련: [[project_themony_adsense_remediation]] [[project_themony_budongsan_keywords]] [[project_themony_calculators_ux]] [[project_themony_broadcast]] [[project-themony-harness-v2]]
