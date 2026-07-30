---
name: project_themony_topic_cluster
description: THEMONY 전 카테고리 공통 토픽 클러스터(Pillar-Cluster) 자동화 — 인프라 구축+부동산 파일럿 실발행 완료(260713)
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
---

THEMONY가 낮은 도메인 권위로 빅키워드를 직접 못 잡으니 **롱테일 다수+3층 내부링크로 주제 전문성**을 쌓는 토픽 클러스터 전략을 전 카테고리 자동발행에 공통 적용. 정본 계획서=`04_ops/_WORK_PLAN_topic_cluster_automation_260713.md`.

**3층 구조**: 카테고리(N) > 필러(N) > 클러스터(N). ★카테고리는 한 주제 종속 아님 — 여러 필러(예 부동산=주담대·전세·청약·세금·임대차). 필러·클러스터 **둘 다 발굴·확장**(고정 금지).

**핵심 설계(최소 침습)**: 기존 파이프라인이 이미 `build_prompt(internal_links=[(제목,URL)])`→본문삽입→`gate._internal_link_check` 완비. standard_structure 안 건드리고 **internal_links 공급원만 관계 기반으로 교체**. 관계링크 없으면 기존 폴백=회귀 0.

**구축물**:
- `harness/topic_cluster.py` — 관계 원장 I/O·등록·mark_published·**internal_links_for**(상향필러·형제·하향·관련필러, 실존URL만, max_links상한)·next_targets(필러선행)·progress_report·links_or_fallback·budongsan_pillar 매핑. selftest 15/15.
- `harness/_topic_map.json` — SSOT 관계원장. 부동산 5필러+클러스터. url 게이트형태(`/슬러그/`·`/?p=N`)만 링크로 나감.
- **연결**: budongsan(build_prompt에 internal_links 파라미터+orchestrator 카테고리→필러 공급, dry-run "관계링크 4개" 확인) / gov(_gov_internal_links로 얹음, gov필러 원장 생기면 자동활성·없으면 최근글 폴백). 백업 .bak_260713tc.

**파일럿(라이브)**: 「주택담보대출 총정리」post_id=2097 publish. 2457자·표준6요소·경험날조0. 하향 계산기6링크 렌더보존. 원장반영→DSR글 관점 상향필러+형제 자동공급.

**계산기 클러스터 실URL**(사이트조회): DSR1261·LTV1262·DTI1263·원리금1259·중도상환1265·대출이자54 / 전세대출이자1264 / 취득세1266·양도1268·재산세1267·보유세1270·증여1269 / 중개보수1271.

**A·B 완료(260713)**: ①slug 정리 완료 → `/주택담보대출-총정리/`(REST POST /wp-json/wp/v2/posts/2097 {slug}, MCP는 slug변경불가). ②**양방향 3층 완성** — 계산기 6개(1261·1262·1263·1259·1265·54)에 상향 필러링크 삽입. ★계산기 수정은 REST context=edit로 raw(wp:html래핑 포함) 가져와 tmcalc-source(구버전54=tmx-source) 뒤 삽입→raw저장(wpautop회피, 래핑보존 검증). 눈검증=style내<p>0·script유지. 멱등(주택담보대출-총정리 있으면skip).

**C 검토결과(다음 필러 우선순위)**: ★**부동산세금 1순위** — 계산기5개(취득1266·양도1268·재산1267·보유1270·증여1269) 이미 클러스터 발행됨 → 필러글만 쓰면 즉시 5하향+양방향(주담대와 동일패턴). 전세대출·임대차=계산기1개, 청약=0개(순수글 클러스터 발굴필요).

**남은것**: ①부동산세금 필러글 발행(재심사 통과 후) ②전카테고리 확산(보험·생활정보 필러시드+발굴) ③gov 필러원장 구축→gov_pillar() 구현. ★재심사 대기중이라 대량발행 보류(파일럿 1건만 라이브). [[project_themony_adsense_remediation]] [[project_themony_calculators]] [[project_themony_budongsan_keywords]]
