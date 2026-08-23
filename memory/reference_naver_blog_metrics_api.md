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
- **커버리지 11/11(전 블로그)** · **상위 10건 고정**(itemCount·page·limit 무효)
- ⚠️★**날짜 지정 불가.** `date` `startDate/endDate` `period` `days` 전부 **무시**(260823 실측: 응답 동일)
- ⚠️★★**실시간 카운터가 아니다 — 주기적 배치값.** 같은 날 11:01 / 21:59 두 번 받았는데 **세 글 모두 증감 0**.
  값의 뜻은 "지금까지의 조회수"가 아니라 **어떤 집계 기간의 누적**이다. ★**"당일 조회수"는 내 블로그(cv-ranks)만 가능**
- ※방문자·이웃(`PostList.naver`)은 반대로 **실시간**이다(같은 날 13,822→13,897). 조회수와 혼동 금지
- ⚠️★**약 1주일 지연.** 08-23 시점에 12곳 어디에도 **08-16 이후 발행글이 TOP10에 없다** → 지금 보이는 건 대략 **08-08~08-16 주간** 기준.
  판정할 때 이 시차를 빼고 읽으면 안 된다(내 글 효과는 발행 ~2주 뒤에야 남의 API에 보인다)
- 순위 창 ≠ 발행일 창 — k-manyo TOP10엔 **05-25 글**도 있다. "최근 기간 조회수" 순위라 오래된 글도 들어온다
- ⚠️ **`readCount` 는 함정** — 같은 응답에도 post-list 에도 있지만 타인 블로그는 **항상 null/0**. 조회수는 오직 `viewCount`
- 10건 한계는 **매일 수집으로 넘는다**(증분 + TOP10 신규 진입이 신호)

## ★★② 조회수 추정 — 방문자로 푼다 (260823 확정)
```
조회수 ÷ 방문수 = 1.38   (내 블로그 15일 실측 · 1.32~1.45 · 변동계수 2.9%)
조회수 ÷ 순방문(UV) = 1.42                    체류 224~277초로 동반 안정
```
- ★**`dayVisitorCount`(PostList.naver, 전 블로그 무인증)가 위젯 API 값과 완전 일치**(3곳 전부 차이 0)
  → **위젯 공개 여부와 무관하게 모든 블로그의 일별 방문자를 얻을 수 있다.** `NVisitorgp4Ajax` 는 굳이 필요 없다
- ★그래서 **1주 지연 배치값(popular-post-list)을 기다릴 필요가 없다** — 매일 21시 `dayVisitorCount` 를 찍고 ×1.38
- ⚠️1.38은 **내 블로그 값**. 글 길이·내부링크 구조에 따라 블로그마다 다를 수 있어 **블로그 간 절대비교엔 오차**.
  단 **같은 블로그의 시계열 비교엔 비율이 얼마든 무관** — 실무 목적엔 충분
- ⚠️**누적방문 델타를 24시간 환산하면 +30% 과대**(낮 시간대만 재서). 2곳에서 +28%/+31% 일관.
  → 환산하지 말고 `dayVisitorCount` 를 쓸 것
- ★크리에이터 어드바이저 내부값 대조: `view-count`(조회) / `visit-count`(방문) / `uv-count`(순방문) / `average-duration`(체류).
  **외부 `dayVisitorCount` = 내부 `visit-count`** (8/22 둘 다 5,874 정확 일치)

## ③ 일별 방문자 5일치
```
GET https://blog.naver.com/NVisitorgp4Ajax.naver?blogId={id}
→ <visitorcnt id="20260820" cnt="244609" />
```
- 커버리지 **2/11** — 블로거 테마·위젯 설정에 따라 공개. 발견 경로 = PC HTML 의 `visitorgp_vars.req_url`

## ④ 오늘/누적 방문자 + 이웃
```
GET https://m.blog.naver.com/PostList.naver?blogId={id}&tab=1
→ "dayVisitorCount" "totalVisitorCount" "subscriberCount"
```
- ⚠️ **방문자다. 조회수(페이지뷰)가 아니다.** 내 블로그 통계 '조회수'와 같은 축 비교 금지

## ⑤ 글목록+공감/댓글
`GET /api/blogs/{id}/post-list?categoryNo={n}&itemCount=30&page={p}`
- ⚠️ **`PostTitleListAsync.naver` 는 categoryNo 를 무시**(cat0=cat42 동일 반환). 카테고리 수집에 쓰면 조용히 전체가 섞인다
- ⚠️ **부모 카테고리는 자식 글을 그대로 반환** — yeji2552 cat38(부모)·cat45(자식) 60편 100% 동일

## ★지표 함정
- **공감수를 성과 지표로 쓰지 말 것** — 이웃 수 교란. 이웃 7,379→공감 106 / 이웃 711→공감 42 인데 **방문자는 1,318 vs 6,376 정반대**
- 태그 위치가 블로그마다 다름: 본문 `.__se-hash-tag` vs `BlogTagListInfo.naver` API. 본문만 보면 빈 값
- 정규식 `(\d{4})\.\s*(\d{2})` 는 `2026. 6.` 를 못 잡음 → `\d{1,2}`

## ★수집기 함정 (260823 실사고 — 두 달간 조용히 실패 중이었음)
`tools/blog_watch/` Task `BLOGWATCH-collect`(09/21시)가 **매 실행 실패**하고 있었다. 둘 다 수정 완료.
1. **스케줄러 인자의 `	`가 탭 문자로 변환** → `blog_watch<TAB>ask_collect.py` = 파일 없음(결과코드 2).
   등록 시 `-Argument ('"{0}"' -f $path)` 로 따옴표 감싸서 재등록해야 한다
2. `collect.py` 가 `sys.stdout.buffer` 를 감싸는데 진입점 `task_collect.py` 가 stdout을 **StringIO로 교체** → `AttributeError`.
   → `if hasattr(sys.stdout,"buffer"):` 가드 추가
★교훈 = **결과코드 0이어도 데이터 파일 mtime을 봐라.** 1번 고친 뒤 0이 떴지만 2번 때문에 여전히 아무것도 안 썼다.
※ 실행 직후 결과코드 **267009 = 아직 실행 중** — 성급히 실패로 읽지 말 것

## 도구
- 감시기 `03_dev/260220_BLOG_AUTO_V2/tools/blog_watch/` — Task `BLOGWATCH-collect` 09/21시 자동
- 추출기 `backend/extract_blog_category.py` — `--with-images` `--from/--to` `--dedupe-prefix`
- 정본 문서 = [[project_hongkija_success_pattern]] 의 §1

관련: [[project_hongkija_success_pattern]] [[reference_themony_gsc_measurement]]
