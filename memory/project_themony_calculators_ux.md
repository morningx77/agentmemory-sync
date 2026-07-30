---
name: project_themony_calculators_ux
description: "THEMONY 생활도구·계산기 디자인/사용성 고도화 (Phase 1 배포완료, Phase 2~4 대기)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 63c9e211-8ced-483f-97b7-62165ccf21bd
---

THEMONY 부동산 계산기 12종 + 허브(생활 도구 모음, page 891) **디자인·사용성 고도화**. 정본 계획서=`03_dev/calculators/_WORK_PLAN_calculator_ux_upgrade_260707.md`(⓪원칙~⑥단계 + 결정사항). 관련: [[project_themony_calculators]].

**진단(실측 260707)**: ①허브 = 링크 21개 중 **9개 죽은링크(404)** — 급여세금·생활도구 계산기 도구 미존재(블로그 글만), 실제 도구는 부동산 12종뿐. ②계산기 = 페이지 프레임 CSS 없이 WP테마 의존, 입력 포맷·값확인처·프리셋 없음, 결과 숫자나열뿐(해석·시각화·복사 없음), 모델 단순화(DSR 단일대출·취득세 생애최초 누락 등).

**사용자 결정**: ①죽은링크=**준비중 비활성 표시** ②착수=**Phase 1부터 순차** ③모델깊이=**기본 간단+고급옵션 접기(accordion)**.

**아키텍처(불변)**: 계산기=self-contained HTML(WP 붙여넣기), CSS는 페이지 인라인, **엔진 JS(calc_formulas.js+calculator_base.js)는 FTP 정적파일 `<script src>`**(WP KSES가 인라인 `&&` 훼손 우회). 빌드=`build_calculators.mjs`(CALCS 배열→dist/*.html), 배포=`upload_assets.py`(FTP `/www/wp-content/uploads/tmcalc/`) + `deploy_calculators.py --update --publish`(기존페이지 갱신, 매핑=dist/_deployed.json, 페이지 1259~1271). 허브=page 891(WP MCP wp_update_page, wp:html 래핑). FTP=philichoi1977.mycafe24.com/morningx77. 계산 정본=`verify/verify_formulas.py`.

**★Phase 1 배포완료(260707)**: 공용엔진(`TMCalc.mount`) 확장으로 12종 일괄 — 프레임 CSS(카드·헤더·해설/FAQ/참고표 스타일), 금액 **천단위 자동포맷**, **값확인처 링크**(hintHref, 공시가격→realtyprice.kr), **프리셋 칩**(presets), **해석배지**(verdict {level:ok/warn/danger}), **비율게이지**(gauge, DSR·DTI·LTV), **결과 복사/공유**. compute 12/12 무회귀. 라이브 서빙 검증 완료.

**★디자인 2차(260707)**: Tworld 토큰 적용(넉넉여백·큰타이포·샤프2px·그레이#35343c·Noto Sans, 파랑유지 → 정본 [[reference_themony_design_system]]). **계산기 타이틀바** 신설=제목+**전체 계산기 바로가기 select 내비**(optgroup 카테고리별, calculator_base.js `wireNav` 배선, onchange→location). **테마 기본 페이지타이틀 숨김**(`.entry-header.page-title{display:none}` 계산기 페이지 인라인). **허브=Tworld 세로카드**(아이콘 원형 상단+이름, 회색패널·화이트카드, 인트로 제거). 참고=카테고리페이지(finance-investment)의 `arc-title-row` 패턴. 배포완료.

**다음(대기)**: Phase 2=모델 정확도(취득세 생애최초·취득원인 / 양도세 장특공제 자동·비과세 / DSR 다중대출 / 보유세 종부세) + verify_formulas 확장, "기본+고급옵션 접기". Phase 3=도구별 사용법·FAQ(+스키마)·세율표·값확인처, 허브 검색·인기. Phase 4=미구축 고트래픽 도구 신규(연봉실수령액·나이계산기 우선).
