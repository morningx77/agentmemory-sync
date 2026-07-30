---
name: project_themony_calculators
description: THEMONY 부동산 계산기 12종 라이브 발행 완료 + WordPress KSES 인라인JS 함정
metadata: 
  node_type: memory
  type: project
  originSessionId: 63c9e211-8ced-483f-97b7-62165ccf21bd
---

THEMONY(themony.com)에 **부동산 계산기 12종을 HTML/JS로 제작·라이브 발행 완료** (2026-07-04). 리서치 T1 골든키워드(취득세계산기 45,100·DSR 97,600 등) 기반.

**구성**: 대출6(원리금균등1259·DSR1261·LTV1262·DTI1263·전세대출이자1264·중도상환1265) / 세금5(취득세1266·재산세1267·양도세1268·증여세1269·보유세1270) / 중개1(복비1271). 생활계산기 성격, 페이지로 발행.

**아키텍처**: `03_dev/calculators/` — 공식 정본=`verify/verify_formulas.py`(파이썬, 19케이스), JS공식=`_template/calc_formulas.js`(파이썬과 node로 19/19 대조), 렌더엔진=`calculator_base.js`(createElement), 빌드=`build_calculators.mjs`→`dist/*.html`, 배포=`deploy_calculators.py`(REST, wp:html 래핑), 자산업로드=`upload_assets.py`(FTP). 자격증명=`_wp.local.json`(로컬).

**★핵심 함정(반드시 기억)**: WordPress KSES 새니타이즈가 **인라인 `<script>` 안의 `&&`를 `&#038;&#038;`로 인코딩**해 JS를 깨뜨린다(브라우저가 script 내부 엔티티를 디코드 안 함). → **엔진 JS를 정적파일로 FTP 업로드(`/wp-content/uploads/tmcalc/`)하고 `<script src>`로 참조**해 KSES 우회. 인라인은 CSS(안전)+`&&`없는 mount 스크립트만. `<script>`·`<style>` 태그 자체는 보존됨(admin app-password).

**남은 것**: (1) 세율 상수 6항목([확인필요]: 스트레스DSR율·규제LTV·공정시장가액특례·취득세중과·양도중과 한시배제·종부세)은 2026 공식값 최종 확인 권장(YMYL). (2) 애드센스는 Auto Ads가 자동삽입, `#cta-slot`은 상담DB 폼 준비 후 채움. (3) 계산기 URL=`dist/_deployed.json` → 무한발행 글의 내부링크 허브(트랙②). 관련: [[project_themony_budongsan_keywords]] [[project-themony-harness-v2]]
