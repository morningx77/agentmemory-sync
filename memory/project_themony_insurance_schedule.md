---
name: project_themony_insurance_schedule
description: THEMONY 보험 자동파이프라인 통합(5번째) + 하루 3글 요일 로테이션 스케줄(260714)
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
---

**보험(insurance) 자동발행 완전 통합(260714)** — 부동산과 동급. 이제 자동발행 5개 카테고리(정부지원·부동산·보험·여행·쇼핑).

**구축물**:
- `insurance_autoposter/orchestrator.py` 신규(budongsan 템플릿): topics.json 큐(미발행/오래된 우선)→토픽클러스터 내부링크(폴백 2개 보장)→CLI생성(Haiku→Sonnet 승격)→게이트(seo_check+budongsan value_check 재사용)→dedup→이미지(Pixabay→gov wp_poster _to_webp_bytes 자동 WebP최적화)→발행(category="insurance"). --limit/--dry-run/--publish.
- `insurance_autoposter/prompt_builder.py` ★전면개선: 기존이 "저도 이 보험에 가입했어요" 경험날조+TOP N 제목을 **명시 유도**(최악)했음 → 삭제+가드레일(경험날조·상투구·D-N·TOP N/총정리 금지+목차/FAQ/출처/내부링크 의무)+internal_links 파라미터.
- 연결: standard_structure `_CATEGORY_META["insurance"]`(프레임·출처) / topic_cluster `insurance_pillar()`(실손·자동차·암·생애주기·어린이·종신·연금 7필러)+_topic_map insurance 시드 / gov wp_poster는 이미 category별 apply_standard_structure.
- ★insurance는 orchestrator 없던 v1(main.py만)이라 scheduler 미등록이었음(사용자가 "3개만 보인다" 발견). budongsan도 docstring 낡아 3개로 보였으나 실제 4개였음.

**스케줄 요일 로테이션(하루 3글, 260714)**: scheduler.py 확장 — config `slots`(08:40/13:20/19:10)+`weekly`(0=월~6=일 요일별 3타입). Task Scheduler 슬롯 3개(매일)+`--run-slot N`이 오늘요일 weekly[요일][N] 실행. gov=월수금만, 나머지(부동산·보험·여행·쇼핑) 균형(주간 gov3·부동산5·보험5·여행4·쇼핑4). ★기존 16태스크(하루16~40글=scaled content 원인) 제거. ★gov orchestrator --limit 기본3이라 scheduler _build_cmd에서 gov도 --limit1 강제. coupang --lead=주치→lead_weeks 1로.

**재심사 중 이중 비활성**: config `enabled:false`(run_slot이 발행 스킵)+태스크 `Disabled`. ★재심사 통과 후 활성화=`Get-ScheduledTask THEMONY-slot* | Enable-ScheduledTask` + `python scheduler.py --resume`. 첫 coupang 산출물 1건 눈검증 권장(lead→limit1 정상여부).

[[project_themony_harness_v2]] [[project_themony_topic_cluster]] [[project_themony_adsense_remediation]]
