---
name: reference_themony_image_optimization
description: "THEMONY 이미지 최적화 표준·공용로직·전파이프라인 강제·전수검수(SEO/LCP, 260713 구축)"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
---

THEMONY 모든 이미지는 업로드 전 최적화 필수(SEO·모바일 LCP·전송량). 정본 모듈=`03_dev/harness/image_optimizer.py`.

**표준(SSOT, 코드 상수)**: 최대폭 1600px / JPEG progressive·optimize / 품질 82→78→72→66 단계감축(목표 ≤200KB) / EXIF strip / RGBA·P→흰배경 RGB 평탄화. WebP는 LiteSpeed Cache 서빙 위임(과결합 회피).

**공용 함수**:
- `optimize_bytes(data)` — bytes→최적화 bytes(JPEG). 업로드 지점에 한 줄 삽입용. 실패·작은파일이면 원본 반환(회귀0).
- `optimize_image(src,dst)` — 파일 최적화.
- `optimize_inplace(path)` — ★**포맷·확장자 유지**(JPEG→JPEG, PNG→PNG 리사이즈+optimize). 전수검수 FTP in-place용(URL 불변).
- `needs_optimization(path)` — 검수(>200KB or >1600px).

**전 파이프라인 업로드 강제(260713)**: gov(wp_poster `_to_webp_bytes`·wp_patch=이미 WebP 1200px)·budongsan(gov재사용)=기존최적화. **coupang(wp_poster·orchestrator)·mrt(mrt_image_fetcher·add_images_inline·post_single_product) 5곳에 optimize_bytes 삽입**(최적화시 ct/ext=jpg 정합, 폴백=원본). 백업 .bak_260713img. ★수동 REST 업로드(gap-filling·필러글)는 파이프라인 밖이라 별도 최적화 필요.

**전수검수 완료(260713)**: 868개 중 201개 초과(127MB). ①FTP in-place 최적화 196개(포맷유지·URL불변, 40MB절감) ②JPEG 2차 폭1280 53개(3MB) ③★**WebP 전환 96개**(사용PNG46+잔여실사용50=PNG2·JPEG47). **최종 정확판정(full URL+featured id) 실사용 200KB초과 = 0개**. FTP=philichoi1977.mycafe24.com/philichoi1977/morningx77:21 PASV, url→`/www/wp-content/`+rel. 배치후 LiteSpeed 캐시 purge(wp_cache_clear MCP).
- ★**WebP가 최적**(사용자 지침): JPEG보다 25~35%↓·투명지원·gov 이미 WebP. `optimize_webp_bytes(data)`=이미지→WebP bytes. PNG/JPEG→WebP 전환 시 URL 변경(png→webp)→**본문 src replace + featured_media id 교체** 필요(webp_map.json/webp_map2.json). 기존 원본은 방치(미참조 고아화, 안전).
- ★**재스캔 함정**: stem 매칭(`/img-34.`)은 전환된 `img-34.webp`까지 오탐→실사용 판정은 **full URL(확장자포함) exact + 썸네일 `-WxH.ext` 정규식 + featured id**로. 오탐 74→정확 0.
- 고아정리 완료: 미참조 이미지 109개(webp전환 원본 img-N46·mrt55·coupang8) 영구삭제(force, 사용자 명시승인). ★대량삭제는 자동분류기 차단→사용자 명시승인 필요. 시스템이미지 보호필터(logo·icon·cropped) + 정밀 미참조판정(full url+썸네일정규식+featured id, 참조중0 확인). 렌더검증 깨짐0·webp정상. 미디어 868→855.

**featured 중복(별건, 해결)**: gov 정규 자동발행은 URL회피(`_used_img_urls.json`)로 featured 유일 보장. 오늘 중복은 gap-filling이 정규경로 안 타고 기존media 재사용한 것 → 10글 주제별 고유+최적화 교체로 해소(중복0 재확인). ★재발방지=gap-filling도 fetch_pixabay_for_type 정규로직 사용.

계획서=`04_ops/_WORK_PLAN_image_optimization_260713.md`. [[project_themony_topic_cluster]] [[project_themony_adsense_remediation]] [[reference_themony_credentials]]
