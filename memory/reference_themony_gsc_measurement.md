---
name: reference_themony_gsc_measurement
description: THEMONY GSC 색인상태 라이브 실측 방법(서비스계정·URL인코딩 함정·재크롤 촉진)
metadata: 
  node_type: memory
  type: reference
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
  modified: 2026-08-01T10:21:58.536Z
---

THEMONY(themony.com) 구글 색인상태를 코드로 실측하는 방법 (260801 확립). AdSense 검토요청 타이밍을 "날짜 아닌 데이터"로 판정하기 위함.

## 접속 (재사용 서비스계정)
- 키 = `03_projects/260608_MATO/_internal/credentials.json` (SA `google-blog-check@gen-lang-client-0821571318.iam.gserviceaccount.com`). **Search Console API 이미 활성화**됨. themony GSC 속성에 소유자로 추가 완료.
- 속성 = `sc-domain:themony.com` (도메인 속성). google-auth + requests, scope 읽기=`.../auth/webmasters.readonly`, 사이트맵제출=`.../auth/webmasters`.
- 라이브러리 이미 설치됨(`import google.oauth2.service_account`).

## ★★함정: URL 인코딩 (안 지키면 전부 "unknown"으로 오판)
- 구글은 한글 permalink를 **원문 UTF-8 + trailing slash** 형태로 색인함. `urlInspection.index.inspect`에 넣는 inspectionUrl도 **반드시 원문 UTF-8+슬래시**여야 매칭됨.
- WP REST `link` 필드는 **퍼센트인코딩**으로 옴 → 그대로 조회하면 전 URL이 "Google에 알려지지 않은 URL"로 나옴(오판). 반드시 `urllib.parse.unquote(path)` + 슬래시 보장 후 조회.
- 스크립트 정본: 스크래치패드 `gsc_inspect_v2.py`(norm() 함수), `recrawl_promote.py`(사이트맵 제출+색인요청 URL목록).

## 260801 실측 결과 (소수정예 직후)
- 리라이트 30개: 29 색인됨(2097만 미색인)·**07-31 이후 재크롤 0/30**(전부 07-04~07-23 크롤=개선 전). → 구글은 아직 옛 버전만 봄.
- 숨김 51개: **49 아직 색인 잔존**(404지만 미재크롤). → deindex 대기.
- 판정: **검토요청 아직 NO**. 트리거 = 리라이트 크롤일 08-01↑ 갱신 + 숨김 49 색인제외.

## 260801 촉진 조치 완료 (재측정 대기)
- 사이트맵: Rank Math Sitemap Settings에서 값 변경 후 "변경사항 저장"으로 강제 재생성 → **post-sitemap 157→58**(숨김 빠짐·리라이트 32개 07-31 lastmod). 정리된 사이트맵 API 재제출 완료.
- 우선 12개 URL 색인요청(GSC UI) 완료(오늘 12건 통과 — "하루10건"은 미확인 추정이었음). 나머지 17개는 `색인요청_URL목록_260731.txt`.
- **다음 세션 = 며칠 뒤 재측정**: `gsc_inspect_v2.py` 재실행 → 리라이트 크롤일 08-01↑ & 숨김 색인제외 확인되면 AdSense 검토요청.

## 재크롤 촉진 (일반 페이지)
- **강제 색인요청 API 불가**(구글 Indexing API는 채용공고/방송 전용, 일반페이지는 정책위반→안 씀).
- 가능: **사이트맵 API 재제출**(PUT `webmasters/v3/sites/{prop}/sitemaps/{feed}`) — 구글 마지막 fetch가 07-15였음(방치). 재제출로 재크롤 유도.
- 정석: GSC UI **URL검사 → 색인 생성 요청**(하루 ~10건, 사용자 수동). + 사이트맵 정리(Rank Math Save).

## 연계
- 사이트맵 stale = Rank Math 사이트맵 캐시가 07-11 고정(WP-Cron 죽음). REST/훅/wp-cron 트리거로 원격 재생성 실패 → wp-admin Rank Math Save 필요. [[project_themony_adsense_niche_focus]] [[project_themony_cloudflare]]
