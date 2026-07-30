---
name: project_themony_adsense_remediation
description: "THEMONY 애드센스 '빈약한 콘텐츠' 위반 → 전면 콘텐츠 개선 대작업(260711). 완료분·남은 Tier4·발견버그·wp:html 노하우"
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
---

THEMONY(themony.com)가 구글 애드센스 **"가치 없는 콘텐츠(thin/low-value)"** 위반 판정 → 260709~11 전면 콘텐츠 개선 진행. 정본 핸드오프=`03_projects/260627_THEMONY_MCP/04_ops/_HANDOFF_adsense_remediation_260711.md`(다음 세션은 이것부터 읽기).

**진단 반전**: 사용자 가설(글자수 부족)은 여행·연금세금엔 반증(양호)이나 **누락됐던 gov 지원금 63개**(카테고리 미집계, 전수 백업으로 발견=총160개)에선 정확히 적중(중앙값956자·시효만료·템플릿). gov가 진짜 주범.

**완료(실사이트 반영·검증)**: gov 63(상록수화49·병합대표5=811/1157/1382/928/1187·draft9) / 시효성태그7삭제 / 301리다이렉트9(사용자 Rank Math) / Tier0결함9 / 더미(Test·Sample)·중복페이지(About476→51·개인정보479→52) / **품질표준6요소**(목차·바이라인·소제목최소본문·견해톤·마무리·출처박스) / gov재보강53 / **여행49**(★경험날조 대량제거) / **연금세금33** / **계산기22**(EEAT설명보강).

**★경험날조 발견**: 자동발행이 여행글에 "저도 다녀왔는데" 등 허위 1인칭 경험을 대량 심어놨음(E-E-A-T 치명위반) → 전량 2인칭 공감·장면묘사로 교체. E-E-A-T는 경험 날조 금지, 견해·해석·문체는 진짜 부가가치(유형별 톤: 여행=감각적/정보성=실무조언).

**★기술 노하우**: 인라인 JS 페이지(계산기)는 `<!-- wp:html -->…<!-- /wp:html -->`로 감싸 저장하면 wpautop·KSES가 style/script 훼손 안 함. 안 감싸면 `<style>` 안 `<p>` 삽입돼 CSS 깨짐(DSR 1261 검증). 태그삭제·리다이렉트 검증은 REST API(curl+App Password force)로.

**260711 전량 완료**: 글 **151/151 전카테고리 표준적용**(gov54·여행49·연금세금33·쇼핑9·부동산3·금융/보험/계산기글3, Uncat 4개 쇼핑분류)+계산기22페이지. ★경험날조는 여행뿐 아니라 **쇼핑글·제목에도** 대량 있었음(전량 정화). gov excerpt 정리✅.

**근본수정✅(Tier4·전 파이프라인)**: ★사용자 "모든 자동발행 반영?" 지적으로 gov만→**4종 전부**. gov(6파일: prompt_builder _STYLE_GUARDRAILS·title_judge D-페널티·post_validator/gate 1500자fatal+내부링크·claude_generator H1·wp_poster 새니타이즈). **coupang**(content_strategist ANGLES19개 경험날조제거·post_generator 경험담삭제·title_judge연결) **mrt**(prompt_builder "경험삽입"역지시삭제+가드레일·wp_poster 새니타이즈/H1) **budongsan**(가드레일·value_checker 동기화). 공용버그: _inline_md 상대경로링크 변환 수정. ★경험날조 근본원인=coupang ANGLES·mrt가 가짜1인칭경험 구조적 강제였음. 백업.bak_260711(b)·문법검증.

**버그해결✅**: 퇴직금계산기242 `avgWage*30/365→avgWage*days/365`(30배→월300·10년 세전3천만 정상, wp:html래핑 배포). 세액공제128/168 400→600만원·IRP합산900·율16.5/13.2 통일.

**★상투구 반복 정화(260713)**: gov 발행글 반복 상투구 발견 — "많이들 놓치는" 40/66글(60%)·"실무에서" 30·"여기서" 42. ★정보성 글에만 집중(여행51글=0, 감각톤이라 안 겹침). 원인=프롬프트가 다양성 미강제→모델이 동일 톤지시서 동일 상투구로 자율수렴(프롬프트에 상투구 명시유도는 없었음). **scaled content abuse 신호**. 대응①재발방지=gov·budongsan·coupang prompt_builder _STYLE_GUARDRAILS에 상투구 금지+구체사실로 문장시작 강제(mrt=제외, 상투구0). ②기존글=decliche.py로 상투 표현별 다양한 풀(8~10개) 글별 순환치환 89글(raw REST update). 재스캔=상투구 0글, 대체표현 각4~9글 분산.

**★제목 "총정리" 정형(260713)**: gov 제목 75%(50/66)가 "[사업명] 신청 방법·대상·금액 총정리" 판박이. ★프롬프트엔 이미 "총정리 금지" 있었음(과거·gap-filling 발행분이 문제, 상투구와 동일패턴). 대응①title_judge 감점 -1.5→-3.5 강화(생성돼도 선택회피) ②detitle.py로 "총정리"→제거(가중)+정리계열 5종(한눈에보기·핵심/요점/간단 정리) 글별순환 50개 제목치환(title REST update, slug불변=SEO안전). 재스캔 총정리 0%. ★풀 설계 시 원제목 키워드("신청·방법·금액")와 중복되는 마무리(자격·금액 안내 등) 배제. "신청 방법" 종결은 실키워드라 유지.

★교훈=자동발행 품질검사에 "상투구·제목 n-gram 반복" 축 필요. ★공통패턴=정규경로는 방지돼도 과거·gap-filling 발행분이 문제(상투구·featured중복·제목 모두 동일).

**★경험날조 재정화+게이트화(260713)**: 다축감사(adsense_audit.py)로 경험날조 24건 잔존 발견(여행, 260711때 놓침). ★정직한 프레임=애드센스가 날조를 문장단위 자동탐지·패널티하는 것 아님(E-E-A-T는 사람평가자·전반품질신호). 진짜문제=봇의 어색한 가짜1인칭+여러글 모순(신뢰저하)="부자연 개선"이 본질. mrt 프롬프트는 이미 금지(line103, 과거분이 문제=공통패턴). 대응①재발방지=post_validator._rule_check에 `_EXPERIENCE_FABRICATION` 검사추가→"발행 불가" 문구로 gate.py fatal(179-182 매칭)자동차단. 오탐회피=경험동사 한정(FAQ "제가직접 선택" 통과, 유닛5:5). ②기존=naturalize_exp.py로 경험날조 <p>문단 CLI(run_claude_cli haiku)재작성 22글(1인칭→2인칭일반화/후기인용, HTML유지·검증후교체)+<p>외(h2·li·목차) 2글 국소치환. 재스캔 경험날조 0.

**다축감사 결과(260713, adsense_audit.py 재사용·재활용)**: ✅Thin0·본문중복0(12-gram자카드)·excerpt양호. 처리완료: ⚠경험날조24→0(해소) / **alt누락 44글·97개 img→0**(fill_alt.py 제목핵심 기반 서술alt, `<img>`에 속성삽입) / **무이미지 12글→0**(add_images.py 주제별 Pixabay→optimize_webp_bytes→featured+본문삽입, 21~185KB). 판정=수정불필요: E시효성1(1018)=오탐(여행준비 "출발 D-7일" 체크리스트, 공고마감 카운트다운 아님) / B.H2정형9종(FAQ66·신청방법53·자격36)=정보성글 정당섹션구조(H2=SEO키워드, 억지다양화시 손실). ★교훈=위험지표 자동측정(다축감사 스크립트)으로 눈검증 대체 가능, 단 오탐(시효성·H2) 맥락판단 필요.

**남은것**: 최종 눈검증 + 색인안정화1~2주 → 재심사(사용자실행). 정본핸드오프=_HANDOFF_adsense_remediation_260711.md. [[reference_themony_credentials]] [[project_themony_harness_v2]]
