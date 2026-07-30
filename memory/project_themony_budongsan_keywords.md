---
name: project_themony_budongsan_keywords
description: THEMONY 부동산 정보 콘텐츠 키워드 발굴 결과 및 발행 우선순위
metadata: 
  node_type: memory
  type: project
  originSessionId: 63c9e211-8ced-483f-97b7-62165ccf21bd
---

THEMONY(themony.com) 부동산 정보 콘텐츠(애드센스+대출/세무/분양 DB)용 키워드 리서치 완료 (2026-07-04). `/keyword-research 부동산` 파이프라인으로 18카테고리·90시드 → **11,847건** 수집.

**핵심 결론**:
- **계산기·도구군이 압도적 1순위** — DSR계산기(97,600)·취득세계산기(45,100)·LTV계산기(43,800)·복비계산기(19,080). THEMONY 생활계산기+애드센스 모델과 정확히 일치. 기존 대출이자 계산기(페이지 54)와 "계산기 허브"로 연결.
- **대출·주거지원 = 고볼륨+DB 이중골드** — 행복주택(87,300)·보금자리론(84,100)·디딤돌대출(70,200)·청년안심주택(56,800).
- **`15_정책규제`는 죽은 카테고리** — 부동산정책·투기과열지구·조정대상지역 검색량 0 (규제해제로 수요소멸). 제외.
- 단지명류 480건은 키워드 아님 → 콘텐츠 태그로만 (인테리어 후속조사 패턴과 동일).

**산출물**: 03_projects/260627_THEMONY_MCP/01_docs/ 하위 — `부동산_발행우선순위_260704.md`(정본, 4-Tier 수익관점+TOP30+허브전략), `부동산_keyword_universe_260704.csv`, `부동산_scan_report_260704.md`. config=`05_notes/04_claude/naver-keyword-research/domain_configs/부동산.yaml`.

**교훈**: 이 파이프라인은 로컬 서비스업 기준(tier=견적/지역업체)이라 정보 콘텐츠엔 tier 자동라벨·domain_match 노이즈플래그가 무의미 → 최종 문서에서 정보성 수익관점으로 재분류해야 함. 관련: [[project_themony_harness_v2]] [[reference_screen_design_pipeline]]
