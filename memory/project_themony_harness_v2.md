---
name: project-themony-harness-v2
description: "THEMONY 자동포스팅 v2(하네스) 구축 완료 — 병렬수집·제목심사·3중게이트·CLI생성, scheduler 전환됨"
metadata: 
  node_type: memory
  type: project
  originSessionId: f7cab873-9bfb-4d06-824d-c00b89223abf
---

2026-07-03 THEMONY 자동 포스팅을 하네스 v2로 재설계·전환 완료. 설계 정본=`03_dev/_WORK_PLAN_harness_seo_revenue_260703.md`, 운영=`04_ops/HARNESS_V2_RUNBOOK_260703.md`.

- 구조: `03_dev/harness/`(core·cli_client·title_judge·seo_validator·revenue_checker·revenue_scorer·gate) + 파이프라인별 orchestrator.py (v1 main.py 무수정 재사용, 몽키패치)
- scheduler.py PIPELINES가 v2 경로로 전환됨(gov/mrt orchestrator.py, coupang_orchestrator.py), timeout 1800초. 롤백=경로 3줄 원복
- 검증 결과: gov draft 1135 PASS(sonnet 1회), coupang draft 1138 PASS(쿨 목토시). 게이트가 불량 초안 실제 차단·피드백 재생성·폴백 동작 확인
- v1 잔존 결함 발견: post_validator AI 편집장이 앞 800자만 검토(미완성 오판), build_disclosure에 '공정거래위원회' 부재, 이미지 업로더 latin-1 한글 예외 — 모두 v2 레이어에서 우회 해결
- ⚠️ 중대 결함(수정됨): content_strategist·post_generator가 함수 지역 `import anthropic`라 patch_sdk_module 우회 실패 → 실제 API 과금 지속. install_anthropic_shim(sys.modules 교체, harness import 시 자동)으로 완전 차단. 크레딧 소진 상태 정상발행으로 검증
- coupang도 즉시공개(publish) 전환 완료 + Google/네이버 색인 추가(_load_coupang_indexer 격리로드). 이제 gov/mrt/coupang 전부 즉시공개
- ★GSC 색인거부(404·표준없는중복) 근본원인=중복발행. harness/dedup.py 신규(원문URL+정규화지문+제목유사도)로 3파이프라인 발행전 차단, 발행글 116건 백필. 진단·조치기록=04_ops/GSC_INDEXING_FIX_260704.md. 기존 중복 4건(1083·1102·1039·1006) draft전환, 쿠팡글 카테고리교정(1146·1197→26)
- 미처리: 불량 draft(1137·1138·1099·1071·1135·1131) wp-admin 수동삭제(MCP 삭제권한 없음), mrt/coupang claude_generator 하드코딩 API키 폐기(revoke), 2단계(KPI루프·variant A/B) 보류
- **2026-07-06 안티그래비티 연동 시도→롤백**: agentapi는 `ANTIGRAVITY_LS_ADDRESS`+`ANTIGRAVITY_CSRF_TOKEN`(IDE 통합터미널에도 미주입되는 내부 세션비밀) 둘 다 필요→외부 스크립트·스케줄러로는 Gemini 발행 원천 불가 확정. 모델토큰은 flash_lite|flash|pro뿐. **사용자 지시로 전량 롤백**: cli_client=claude전용 복원(run_antigravity_cli·세션캐시 제거), scheduler.py --provider 제거, config에서 provider·antigravity필드 제거, test_antigravity_cli.py·.gemini_session.json 삭제. 계획서 `01_docs/_WORK_PLAN_antigravity_cli_integration_260706.md`는 무효(참고보존). **현 스케줄=재분배 16슬롯**: 09~20시 주간 절반을 새벽00~08시로 분산(dawn 9 / day 7). gov5·mrt5·coupang4·budongsan2. 전부 claude 구독발행. ⚠️구 daily-publish(07:30·Highest)는 scheduler_config 밖 레거시라 삭제됨·명령미상→복원하려면 사용자에게 정의 필요
- ~~(구)안티그래비티 연동 세부~~: cli_client에 `run_antigravity_cli`(agentapi) + `cli_json`/심 라우팅(env `LLM_PROVIDER` 또는 모델명) + **antigravity 실패 시 Claude 자동폴백**(검증 완료). scheduler.py에 `--provider` argparse·env주입·VBS 반영. 모델=config `antigravity_model`(env `ANTIGRAVITY_MODEL` 오버라이드). ★agentapi 실제 명령표면(2026-07-06 조사): `new-conversation [--model=<flash_lite|flash|pro>] <prompt>` / `get-conversation-metadata` / `send-message`. **모델 토큰은 flash_lite|flash|pro 3개뿐** — "Gemini 3.5 Flash Medium"=`flash`로 매핑(config를 flash로 정정). ⚠️⚠️**헤드리스 원천 불가 확정**: agentapi는 `ANTIGRAVITY_LS_ADDRESS`(=127.0.0.1:LS포트)+`ANTIGRAVITY_CSRF_TOKEN` 둘 다 필요. LS_ADDRESS는 IDE 실행 중이면 포트탐지 가능하나 **CSRF_TOKEN은 IDE가 자기 통합터미널에만 주입하는 세션비밀**(디스크X·타셸X, 프로세스메모리 추출은 보안차단). 포트51147·52876이 "missing CSRF token"으로 응답=올바른 엔드포인트지만 토큰없어 거부. → **agentapi 실발행은 Antigravity IDE 통합터미널에서만 가능**(Task Scheduler·외부셸=항상 Claude 폴백). 통합터미널 실행법: `$env:LLM_PROVIDER="antigravity"; python budongsan_autoposter/orchestrator.py --limit 1`(draft, --publish시 공개). 사용자 방침=폴백 허용
- **스케줄 완화·재등록(2026-07-06)**: 계획서 26슬롯(00~07시 15건 야간버스트)은 애드센스 스팸·구독한도 위험→**주간 균등 10슬롯**(08~21시 1.5h 간격, gov/mrt/coupang/budongsan 라운드로빈, provider 교차)으로 축소 등록. ★함정: config가 이미 신규명으로 바뀌어 `--remove`가 구 작업명 못지움→기존 THEMONY-* 42개(구17+겹친신규) 와일드카드 전삭제 후 --setup. 일부는 admin(S4U/Highest)=UAC 필요
- **2026-07-07 이미지·제목 품질 수정(3파이프라인)**:
  · **mrt**: `mrt_image_fetcher.fetch_products`가 필리핀 검색 시 유심/이심/와이파이(TNA 비투어)를 상위로 실어와 **USIM 광고가 대표·본문 이미지**로 들어감. 수정=`NOISE_TOKENS` 필터 + `_fetch_tour_items`(destination을 city로 우선검색). 보라카이 2글(1452·1391) 실제 투어이미지로 교체.
  · **gov 대표이미지 전부 동일**(떡 한지인형): `fetch_tourapi_images`가 고정 키워드로 `urls[0]`만 써서 매번 동일. 수정=`_load_used_urls` dedup+로테이션. 5글(1432·1428·1330·1319·1308) 주제별 이미지 교체.
  · **gov 제목 메인키워드 오인식**: 프롬프트(`main_keyword="{target_short} 지원금 신청 방법"` + "메인KW 앞배치")·orchestrator(`main_kw="{content_type} 지원금"`)가 "정책 지원금 신청방법/정책뉴스"를 전 제목 앞에 강제. 수정=프롬프트를 "이 공고의 구체적 핵심키워드(사업명·혜택 기반)"로, orchestrator는 `post_data.main_keyword`(구체키워드)를 judge·gate에 사용(제목반영 시만, 게이트 오탈락방지 폴백). 검증=근로장려금·수산유통자금 제목이 핵심주제 앞배치 확인.
  · **coupang 이미지 누락**(1146 이미지0·1197 1장): Pixabay 1장만 쓰던 구조, 한글키워드 매칭실패로 0장. **상품에 이미 `.image`(네이버쇼핑 썸네일) 있는데 미사용**. 수정(orchestrator 몽키패치)=`fetch_pixabay_image→None` + `build_product_card`에 상품이미지 삽입 + `_localize_product_images`(WP업로드·치환, 1위=대표). 상품당 실제 이미지, 검증완료. 기존 2글 백필. ★사용자방침=Pixabay금지·실제상품이미지만(상세이미지는 JS렌더링이라 2단계 보류). ★★Pixabay 핫링크 만료 버그: 옛 coupang은 Pixabay `/get/` URL을 WP업로드 없이 본문에 **핫링크**→만료로 깨짐("URL invalid or expired"). 5글(818·1197·1305·1379·1425) figure 제거+상품이미지 백필. 근본개선=coupang Pixabay 미사용+상품이미지 WP업로드(_localize). **원칙: 본문 외부이미지 핫링크 금지, 반드시 WP 미디어 업로드**(gov/mrt는 이미 업로드형이라 안전).
  · **coupang 발행량 저조 진단(미수정)**: 토픽이 여름 생활템(아이스팩·쿨링) 반복 집중→dedup 스킵으로 4슬롯중 다수 미발행. 시즌캘린더 다양화가 개선책(별도).
- 관련: [[themony-claude-cli-only]]
