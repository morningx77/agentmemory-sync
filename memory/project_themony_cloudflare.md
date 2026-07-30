---
name: project_themony_cloudflare
description: THEMONY Cloudflare CDN 적용 완료(260715) — HTML 엣지캐싱·wp-admin 국내제한 충돌 해결·WAF 한국제한
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
---

THEMONY(themony.com)에 Cloudflare 무료 CDN을 프록시 연동 완료(260715). 목적=서버 TTFB(1초) 개선으로 LCP 단축. [[project_themony_harness_v2]] [[reference_themony_credentials]]

## 구성 (SSOT)
- **도메인**: 호스팅kr 등록, 네임서버를 Cloudflare(monika/nolan.ns.cloudflare.com)로 변경. cafe24 웹호스팅(openresty)은 그대로.
- **zone_id**: `0072ee1ef4b756707b7082c3f1f8277f` / 계정 Philichoi77@gmail.com
- **SSL**: Full (cafe24에 Let's Encrypt 있음). Universal SSL 발급까지 활성화 후 ~10분 대기함.
- **A레코드**: themony.com → 119.205.197.76, **Proxied(주황)**. MX·SPF(TXT)는 반드시 **DNS only(회색)** 유지(메일 보호).

## ★핵심 함정 — cafe24 매니지드 WP는 wp-admin을 "국내 IP만" 허용
- Cloudflare 프록시 IP(해외 등록)로 오면 cafe24가 **/wp-admin/ 을 Apache 403**으로 차단(프론트는 통과). Cloudflare Analytics엔 안 잡힘(origin이 막는 것).
- 진단법: origin 직접(--resolve 119.205.197.76)=302정상 vs Cloudflare경유=403 → origin이 CF IP 차단 확정.
- **해결**: ① cafe24 나의서비스관리>디렉토리 접속 설정>디렉토리 설정현황에서 **wp-admin 항목 삭제**(국내제한 해제. 단일IP만 입력가능해 CF 대역등록 불가) ② Cloudflare Security>Security rules(구 WAF)에 **Custom rule "wp-admin KR only"**: `URI Path contains /wp-admin AND Country ne KR → Block`. 실제 방문자IP 기준이라 cafe24 국내제한을 더 정확히 대체.
- 긴급복구: A레코드를 잠깐 DNS only로 토글하면 wp-admin 즉시 접속(origin 직접). 고친 뒤 Proxied 복구.

## ★HTML 엣지캐싱 (TTFB 개선 본론)
- **Super Page Cache**(구 wp-cloudflare-page-cache, Themeisle) 플러그인 = origin에 s-maxage 헤더 + 자동퍼지 담당. 단 **Page Rule 자동생성이 Permission Error로 실패**(플러그인 권한체크 이슈, 실제 토큰권한은 정상).
- **우회=API로 Page Rule 직접 생성**(먹혔음): `POST/PUT zones/{zid}/pagerules` — target `*themony.com/*`, actions `cache_level=cache_everything` + **`edge_cache_ttl=7200`(2시간)**. ruleID `9b10c284a38017f9a2bfa24e85f23fba`. 검증: 홈 curl MISS→HIT.
- edge_cache_ttl=7200으로 origin s-maxage(1년) override → **발행/수정 후 최대 2h 자동갱신**(퍼지 불필요). Free플랜 edge_cache_ttl 최소=7200.
- **API 토큰**: WordPress 템플릿(Cache Purge·Zone Settings·Zone·DNS·Analytics·Account Settings) + Page Rules:Edit. 토큰은 대화노출됨→필요시 재발급. PS5.1은 curl.exe --data JSON 깨짐→**Invoke-RestMethod + TLS12** 사용.

## ★네임서버 이전 후 GSC 필수 후속(260715 발견)
- 네임서버를 Cloudflare로 바꾸면 **GSC 도메인 소유권(DNS TXT) 유실** → GSC가 재확인 요구. 해결=GSC 팝업 "확인 시작"→Cloudflare 자동연동 승인(수동 TXT 불필요).
- ★더 중요: **사이트맵 연결 끊김** → "감지된 사이트맵 없음"→글이 "Google에 알려지지 않은 URL". **검색 유입 부족의 실제 원인일 수 있음**. 해결=GSC Sitemaps에 `sitemap_index.xml`(Rank Math) 재제출 → 성공·**197 URL 발견**. RSS(feed/·rss)도 제출됨. 색인은 며칠~2주 점진.

## GEO(P2) FAQ schema — 진행상황(미완)
- harness/geo_enhancer.py(FAQ 파싱→JSON-LD, 토큰0)+apply_geo_batch.py 작성. 기존 168글 중 **78글 FAQ 보유**(자동발행 `<strong>Q. …</strong><br/>답변` 일관 템플릿).
- ★REST content로 `<script>` 삽입=KSES 제거됨(무효). → **functions.php에서 출력**해야. 현재 `rank_math/json_ld` 필터 방식(GEO-FAQ-260715). 
- ★미해결 버그: FAQPage가 **@graph에 2개 중복 출력**(wp_head는 1회 정상=gtag 1개 확인, rank-math script 1개인데 FAQPage 2개). static/define/필터 다 시도했으나 환경특이(cafe24 opcache validate_timestamps=0+Super Page Cache) 미해소. 리치결과 테스트는 크롤실패(오늘 CF이전 직후 일시추정, curl로 Googlebot 200=차단아님). **다음 세션서 안정적 재설계(REST로 Rank Math FAQ 메타 직접주입 등) 필요**.
- 계획문서=01_docs/growth_strategy/(마스터로드맵·PRD Phase0/1/2·스키마감사표·UTM규칙·스레드소재뱅크). 상위전략=THEMONY_성장전략_OSMU_260715.md.

## 미결/선택
- 자동발행 "즉시" 반영 원하면 harness/wp_poster에 Cloudflare Cache Purge 호출 추가(토큰 cache_purge 권한 있음). 현재는 2h TTL로 커버.
- Super Page Cache Permission Error는 무시(규칙은 API로 직접 관리). Disk cache는 유지.
- 충돌주의: 캐시 플러그인은 하나만. LiteSpeed Cache·WP Super Cache 비활성(Super Page Cache만). JS/CSS/폰트 최적화는 Autoptimize 담당→Super Page Cache Files탭 전부 No.
