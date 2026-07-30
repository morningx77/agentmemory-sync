---
name: project_themony_budongsan_autopost
description: "THEMONY 부동산 무한 자동발행 파이프라인 — 구축 완료, 실발행/스케줄등록만 대기"
metadata: 
  node_type: memory
  type: project
  originSessionId: 63c9e211-8ced-483f-97b7-62165ccf21bd
---

THEMONY 부동산 정보성 글 **무한 자동발행 파이프라인** 구축 완료 (2026-07-05, dry-run 검증). 계산기(허브)로 유입시키는 스포크 글을 1일 2건 발행.

**모듈** (`03_dev/budongsan_autoposter/`):
- `keyword_bank_builder.py` → `budongsan_keyword_bank.json` (**2,525건**, 도메인 긍정필터로 계산기·단지명·노이즈 제거. ~3.4년치)
- `seasonal_calendar.yaml` + `season.py` (월별 시즌 가중 2.5/0.4/1.0, 강시즌 키워드는 자기 성수월에만)
- `prompt_builder.py` (E-E-A-T 신뢰형 + 카테고리 10종 섹션템플릿 + 계산기 내부링크 + 면책 + JSON. `build_seasonal_prompt`)
- `value_checker.py` (가치게이트: 본문1500+·H2≥4·내부링크≥2·DB CTA. gov revenue_checker 대체)
- `orchestrator.py` (우선순위=골든_norm×시즌 · 다양성가드(같은 cat 3연속 금지) · 재발행(evergreen 365일/시즌 재도래) · **★토큰효율판**: 발행 1건=Claude 1호출(생성)뿐 → title AI심사·AI편집장게이트 제거, 코드게이트만(seo_check+value_check), **1차 Haiku 4.5·실패시만 Sonnet5 승격**. `--dry-run` 안전검증)
- `trend_refiller.py` (저수위<20 시 자동완성+검색광고 재조회로 신규 롱테일 보충 → 무한)

**★dedup 격리**: 공용 `_program_registry.json`은 gov 글과 일반토큰(신청/방법)으로 오탐 차단 → budongsan은 `_budongsan_registry.json`로 격리(`_dedup.REGISTRY_FILE` 오버라이드).

**스케줄러**: `scheduler.py` PIPELINES/LABELS/choices/_build_cmd에 budongsan 추가, `scheduler_config.json` **10:00·14:00** 2슬롯. **--setup 등록 완료(등록됨 확인). 라이브 가동 중**(config publish:true).

**검증**: Haiku draft 1건 실발행 성공(post 1361, "등기부등본 열람 5분 안에 하는 법", 3,386자·H2 7·계산기링크·면책 완비). **Haiku 1회로 온토픽·품질 확인.**

**★AEO/GEO 최적화(전략 추가)**: 전통SEO만 있고 답변엔진 최적화 미반영이었음. prompt_builder에 4규칙 추가(①답변우선 💡핵심요약 두괄식 ②질문형 H2("~은 어디서 하나요?") ③정형 FAQ ④출처·수치 인용·문단 자기완결) + JSON에 `faq` 배열 출력. orchestrator `_faq_schema_block()`가 faq→**FAQPage JSON-LD 스키마** 결정론 삽입(&는 KSES 훼손 방지 치환). 검증 draft 1376(행복주택): 질문형H2 6/9·핵심요약·FAQPage스키마·이미지·공식링크 완비. ※Google FAQ리치스니펫은 축소됐으나 AI답변엔진(Perplexity·AI Overviews)·GEO엔 유효, 콘텐츠구조가 스키마보다 중요. ★모듈명 충돌 함정: budongsan `prompt_builder`가 sys.modules 캐시 선점→gov main import 실패→이미지헬퍼는 로컬복제(`_wp_image_block`·`_inject_images`).

**★외부 공식사이트 링크(전략 추가)**: gov는 신청처 URL 제공하는데 부동산엔 없었음(설계누락). orchestrator에 `_OFFICIAL_SITES`(키워드토큰→공식사이트) + `_CAT_SITE_FALLBACK`(카테고리폴백) + `_official_links()`/`_official_block()` 추가 → 발행 시 하단에 "📌 관련 공식 사이트"(target=_blank 새창) 결정론적 삽입(모델 환각 방지). 매핑: 등기부등본→대법원인터넷등기소(iros.go.kr) / 청약→청약홈 / 세금→홈택스·위택스 / 대출→주택도시기금 / 주거지원→LH청약플러스 / 실거래가→국토부RT / 경매→법원경매정보 / 전입신고→정부24 등.

**★이미지(복구됨)**: 효율판 재작성 시 이미지 로직을 실수로 누락→featured_media=None. 복구: `_fetch_pixabay(category)`(카테고리별 부동산 영어검색어)로 Pixabay 대표1+본문1 → gov `upload_image_to_wp`(WebP변환)+`_wp_image_block`+`inject_images_into_content`(Gutenberg 블록 앵커). **Claude 토큰 0**. gov와 동일 포맷. sys.path 함정: 런타임은 _gov를 먼저 insert해 gov prompt_builder 우선(테스트 스크립트는 순서 주의).

**설계·계획 정본**: `_WORK_PLAN_budongsan_infinite_autopost_260704.md`(설계), `_IMPL_PLAN_budongsan_autopost_260704.md`(구현).

**★토큰 교훈**: 발행 1건당 Claude 호출을 최소화(생성 1회). gov/mrt/coupang은 발행 1건당 3~4회(생성+title_judge AI+AI편집장게이트 6000자재투입)라 하루 12건 누적이 토큰 스파이크 유력원. 단 편집장게이트 6000자는 '미완성 오판'을 고치려 800→6000 늘린 것이라 축소 시 재생성폭주 위험 → 안전레버=발행빈도/재생성상한. 관련: [[project_themony_calculators]] [[project_themony_budongsan_keywords]] [[project-themony-harness-v2]] [[themony-claude-cli-only]]
