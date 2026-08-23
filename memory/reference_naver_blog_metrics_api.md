---
name: reference_naver_blog_metrics_api
description: 타인 네이버 블로그의 글별 조회수·일별 방문자를 무인증으로 얻는 API 3종 + 지표 함정
metadata: 
  node_type: memory
  type: reference
  originSessionId: 16f5b3a6-0f22-4d44-9fd8-10a80439ef67
  modified: 2026-08-23T02:05:08.509Z
---

**타인 블로그 성과를 무인증·무료로 얻는 경로 (260823 실측 확정).** "남의 블로그 조회수는 못 본다"는 통념은 **틀렸다** — 인기글 API에 실제 조회수가 있다.

## ★① 글별 조회수 — 유일한 경로
```
GET https://m.blog.naver.com/api/blogs/{blogId}/popular-post-list
    Referer: https://m.blog.naver.com/{blogId}
→ result.popularPostList[].viewCount  ★실제 조회수
```
- **커버리지 11/11(전 블로그)** · **상위 10건 고정**(itemCount·page·limit 무효) · 창은 최근 1~2주
- ⚠️ **`readCount` 는 함정** — 같은 응답에도 post-list 에도 있지만 타인 블로그는 **항상 null/0**. 조회수는 오직 `viewCount`
- 10건 한계는 **매일 수집으로 넘는다**(증분 + TOP10 신규 진입이 신호)

## ② 일별 방문자 5일치
```
GET https://blog.naver.com/NVisitorgp4Ajax.naver?blogId={id}
→ <visitorcnt id="20260820" cnt="244609" />
```
- 커버리지 **2/11** — 블로거 테마·위젯 설정에 따라 공개. 발견 경로 = PC HTML 의 `visitorgp_vars.req_url`

## ③ 오늘/누적 방문자 + 이웃
```
GET https://m.blog.naver.com/PostList.naver?blogId={id}&tab=1
→ "dayVisitorCount" "totalVisitorCount" "subscriberCount"
```
- ⚠️ **방문자다. 조회수(페이지뷰)가 아니다.** 내 블로그 통계 '조회수'와 같은 축 비교 금지

## ④ 글목록+공감/댓글
`GET /api/blogs/{id}/post-list?categoryNo={n}&itemCount=30&page={p}`
- ⚠️ **`PostTitleListAsync.naver` 는 categoryNo 를 무시**(cat0=cat42 동일 반환). 카테고리 수집에 쓰면 조용히 전체가 섞인다
- ⚠️ **부모 카테고리는 자식 글을 그대로 반환** — yeji2552 cat38(부모)·cat45(자식) 60편 100% 동일

## ★지표 함정
- **공감수를 성과 지표로 쓰지 말 것** — 이웃 수 교란. 이웃 7,379→공감 106 / 이웃 711→공감 42 인데 **방문자는 1,318 vs 6,376 정반대**
- 태그 위치가 블로그마다 다름: 본문 `.__se-hash-tag` vs `BlogTagListInfo.naver` API. 본문만 보면 빈 값
- 정규식 `(\d{4})\.\s*(\d{2})` 는 `2026. 6.` 를 못 잡음 → `\d{1,2}`

## 도구
- 감시기 `03_dev/260220_BLOG_AUTO_V2/tools/blog_watch/` — Task `BLOGWATCH-collect` 09/21시 자동
- 추출기 `backend/extract_blog_category.py` — `--with-images` `--from/--to` `--dedupe-prefix`
- 정본 문서 = [[project_hongkija_success_pattern]] 의 §1

관련: [[project_hongkija_success_pattern]] [[reference_themony_gsc_measurement]]
