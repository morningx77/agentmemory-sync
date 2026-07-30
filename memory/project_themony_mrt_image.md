---
name: project-themony-mrt-image
description: THEMONY MCP 프로젝트 — MRT 파트너 Open API로 상품 이미지 수집·WP 업로드 파이프라인 완성 (search API 현장 사진 전용)
metadata: 
  node_type: memory
  type: project
  originSessionId: f7cab873-9bfb-4d06-824d-c00b89223abf
---

## 핵심 사실

MRT 공식 파트너 Open API로 여행 상품 이미지를 가져와 WordPress 포스트 대표 이미지로 설정하는 파이프라인이 완성되어 운영 중이다.

**Why:** MRT 공개 웹사이트는 CloudFront WAF로 headless 브라우저 403 차단. playwright-stealth/patchright 모두 실패. 공식 파트너 API(bearer 인증)만 작동.

**How to apply:** 다음 세션에서 MRT 이미지 관련 작업 시 이 파이프라인을 바로 사용한다.

---

## 이미지 소스 결정 원칙 (중요)

| 상황 | 이미지 소스 | 이유 |
|---|---|---|
| 일반 포스팅 (국가/도시) | `search API imageUrl` | 실제 현장 사진 |
| 단일 상품(gid) 포스팅 | `search API imageUrl` | detail.description HTML 이미지는 광고성 배너 → 사용 금지 |

> `detail` API의 `description` 필드는 HTML 7700자짜리 상품 소개문이며, 내부 이미지는 광고성 배너임. 반드시 `search` API의 `imageUrl` 사용.

---

## API 스펙 (핵심)

- **서버**: `https://partner-ext-api.myrealtrip.com`
- **인증**: `Authorization: Bearer {MRT_OPEN_API_KEY}` (X-API-KEY 아님!)
- **이미지 검색**: `POST /v1/products/tna/search`
  - 필수 body: `{"city":"도쿄", "keyword":"투어", "page":1, "size":5}`
  - `keyword` 필드 필수 — 없으면 400 오류
- **응답 이미지 필드**: `data.items[].imageUrl`
- **이미지 CDN**: `https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/...`
  - 직접 다운로드 가능 (Referer: https://www.myrealtrip.com/ 헤더 권장)

---

## 코드 위치

| 역할 | 파일 |
|---|---|
| API 키·자격증명 | `03_dev/mrt_autoposter/config.py` |
| 일반 포스팅 이미지 모듈 | `03_dev/mrt_autoposter/mrt_image_fetcher.py` |
| 일반 포스팅 메인 | `03_dev/mrt_autoposter/main.py` (6단계: SEO 메타 포함) |
| 단일 상품 포스팅 | `03_dev/mrt_autoposter/post_single_product.py` (7단계: fetch_image_urls_by_search 사용) |
| SEO 메타 설정 | `03_dev/mrt_autoposter/wp_poster.py` → `set_seo_meta()` |
| 상세 가이드 | `01_docs/마이리얼트립_API_이미지_활용_가이드.md` |

---

## 주요 함수

```python
# 일반 포스팅 (국가별 이미지)
from mrt_image_fetcher import attach_image_to_post
ok = attach_image_to_post(post_id=123, country="japan", alt_text="도쿄 투어")

# 단일 상품 포스팅 (여행지+키워드로 현장 사진 검색)
from post_single_product import fetch_image_urls_by_search
urls = fetch_image_urls_by_search(city="세부", keyword="스노클링", limit=8)

# SEO 메타 자동 설정
from wp_poster import set_seo_meta
set_seo_meta(post_id=401, seo_meta={
    "focusKeyword": "세부 스노클링",
    "seoTitle": "세부 스노클링 추천 | ...",
    "metaDescription": "세부 스노클링 최고의 선택! ..."
})
```

---

## 주의 함정

1. HTTP 헤더 `Content-Disposition: filename=` 에 한글 불가 → ASCII만 사용
2. `keyword` 파라미터 없으면 400 오류 (`city`만으론 안 됨)
3. 기존 API 키는 파트너센터 UI에서 마스킹 표시 — 재발급 필요 시 `_mrt_final_key.py` 실행
4. `detail` API description HTML 이미지 = 광고성 배너 → 절대 사용 금지, search API imageUrl 사용

[[project-themony-wp]]
