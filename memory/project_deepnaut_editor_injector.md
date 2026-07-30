---
name: project_deepnaut_editor_injector
description: ★DEEPNAUT 확장 end-to-end 완성(260723) — claude.ai 자동생성(L0~L6)→네이버 자동삽입(제목·세로호흡본문·이미지15장·저작권·태그) 원클릭. chrome.debugger 신뢰입력·SmartEditor ONE 조작 정본
metadata: 
  node_type: memory
  type: project
  originSessionId: 16f5b3a6-0f22-4d44-9fd8-10a80439ef67
  modified: 2026-07-26T06:41:19.977Z
---

**대상**: `03_projects/260722_DEEPNAUT/03_dev/naver_chrome_extension` (별칭 딥노트). 네이버 글쓰기 화면 우측 패널 → 원클릭으로 자동생성 HTML(이미지 포함)을 SmartEditor ONE에 삽입. **260722 MVP 완성**(더미데이터). 파일: manifest·content.js(로그인)·editor-inject.js·background.js·dummy-post.js. 설계서=01_docs/설계_명세/DEEPNAUT_editor_injector_설계_260722.md.

**★SmartEditor ONE 조작 정본(실측 확정, 재사용):**
1. **에디터=iframe `#mainFrame`**(src `/PostWriteForm.naver`, blog.naver.com 동일출처) → 상단프레임 스크립트가 `mainFrame.contentDocument`로 직접 접근.
2. **합성 paste 거부**: `new ClipboardEvent('paste',{clipboardData})` dispatch는 `isTrusted:false`라 SE가 무시. → **chrome.debugger(CDP Input)로 신뢰된 입력** 필수(권한 "debugger", 상단 '디버깅 중' 배너 감수, ★F12 DevTools 열려있으면 attach 실패).
3. **이미지 = 반드시 실제 https `<img src>` URL**. `data:base64`는 "허용되지 않는 형식" 거부(구 test_clipboard_paste 결론). 실URL은 SE가 paste 시 네이버 서버에 **자동 업로드**(사용자 실측: 타 사이트 Ctrl+C→V로 이미지 들어옴). → `__IMG_N__`앵커·Blob개별삽입 전부 불필요, 본문HTML에 inline `<img>`면 한방.
4. **삽입 시퀀스(정본 editor_service.py와 동일)**: ①제목칸 `.se-title-text` **신뢰 클릭(CDP mouse)** →클립보드(제목)→신뢰 Ctrl+V ②**신뢰 Enter 1회**로 제목→본문 캐럿 이동 ③클립보드(본문HTML)→신뢰 Ctrl+V. ★JS `el.focus()`로는 SE 캐럿이 안 옮겨짐(제목/본문 모두 신뢰 클릭 or Enter 필요). CDP 좌표=iframe.getBoundingClientRect()+요소 rect.
5. **본문HTML 양식**=html_renderer.py 생존규칙(font-size/weight/align/color/br+구조 인라인, background/border/margin 등 제거됨).
6. **레이아웃**: 패널 겹침방지=html margin 무효(네이버 안 밀림)→ **`#mainFrame` iframe width를 `calc(100vw-380px)` 직접 축소**. 패널=Shadow DOM(adoptedStyleSheets CSP회피). 접기=플로팅 핸들(패널 밖으로 translateX(100%)+항상보이는 핸들).
7. background=CDP 세션 1회 유지(attach→제목클릭·붙여넣기·Enter·본문붙여넣기→1.5s후 detach, 배너1회). 이미지 fetch→dataURL은 프리뷰 표시용(CORS 우회).

**★260723 end-to-end 완성** (claude.ai 자동생성→네이버 자동삽입 원클릭). 신규 파일: claude-inject.js.
8. **claude.ai 자동화**(claude-inject.js): 프로젝트 채팅 입력창 `[data-testid=chat-input]` 신뢰클릭→CDP insertText(프롬프트)→Enter→완료대기(`data-is-streaming=false`+`【L5/L6】·발행대장` 마커 2회안정)→추출→이미지검색·다운로드→`chrome.storage.local['deepnaut_post']`저장+`deepnaut_autorun`플래그→`chrome.tabs.create`로 네이버 글쓰기 탭 자동오픈→editor-inject가 플래그보고 자동 runAll. 프롬프트=`L0~L6`.
9. **추출 파싱(claude 응답 DOM)**: `.standard-markdown` children 순회. ★헤딩 전각`【L4】` 대응. 제목=`제목:`라인 or `.jpg`끝나는 첫줄(clean=선행"제목"제거+감싼따옴표쌍만제거, 훅 여는따옴표 보존). ★**L4 부실(플레이스홀더 생략) 감지→L6 링크삽입본문에서 본문 추출**(parseBody 공용: L4 굵은소제목 / L6 짧은줄+다음이🔍마커=소제목). L3태그·L6표(쿼리컬럼) 추출.
10. **이미지=다운로드후 삽입(핫링크 금지)**: L6 문맥키워드(인물명+앵커, 서사위치 비례)로 네이버검색→background fetch(host_perm `http(s)://*/*` 필수)→**PNG canvas변환**→클립보드image/png→신뢰Ctrl+V(Chrome clipboard.write는 image/png만 허용). 15장 균등분산(소제목+본문). URL중복회피.
11. **순차 블록 삽입**: 제목→Enter→블록(text=HTML/image=blob) 순차 신뢰Ctrl+V로 끝에 append(위치계산 불필요). ★긴루프중 `clipboard.write` "Document is not focused"→background `chrome.tabs.update active`+`windows.update focused` 재포커스 후 재시도.
12. **임시저장 복구 팝업**("작성 중인 글이 있습니다", iframe 내): ★JS click 무시됨→**CDP 신뢰클릭** 필요. 팝업텍스트+버튼 있는 **가장 작은 컨테이너**의 취소만(오탐 방지), iframe오프셋 보정. Escape 폴백.
13. **줄바꿈**=문장=문단(문장내부 `<br>`, 문단사이만 SP 빈줄). ZWSP=네이버여백. **저작권+태그 푸터**(맨끝): blogId(storage)+연도, 저작권3줄은 `<br>`로 공백없이, 태그=L3.
14. **이미지 검색 엔드포인트**(BlogAuto v2 백엔드 신규): `POST localhost:8000/api/v1/images/search {query,count}` — 네이버 이미지API 직접(무AI·Gemini미사용). CORS `*`. 파일=backend/app/api/v1/endpoints/images.py.
15. **프롬프트 수정**(spoen1217 4곳: ClaudeProject/GeminiGem 02_레이어프롬프트·Opal 05·07·통합설계서_LLM): L2 제목 결과부 사건나열금지·70자엄수 / L4 본문 플레이스홀더생략금지(전문출력).

**★260725 생성품질 개선(v1.6.0)**: 홍기자 5문제 개선 — 02_레이어프롬프트 대개정(L1 이벤트카드 6하+[T1확정/T2보도된설] 2층사실모델·3-1 열애설아카이브 / L2 역추적테스트 의무(제목 힌트만으로 후보≥3명, 미달시 실명 수식어화) / L4 서식=**문장묶음 세로호흡 18~25자×2~3줄 붙임·빈줄은 묶음사이만**(구 11~15자 전줄빈줄 폐기, 사용자 오버라이드) + 이벤트 장면화(6하 3요소 필수) / L6 구글→**다음** 링크). 이미지 자동수집도 다음 전환: worker.js에 카카오 이미지검색 API(`source: auto=다음우선→네이버폴백/daum/naver`), Secret 3종. 확장: background source 전달(storage `imageSearchEngine`)·claude-inject **innerText 문장묶음 정규화**(textContent는 <br>서 단어붙음)·다운로드 실패시 thumbnail 폴백. ★★함정: **wrangler deploy가 대시보드 일반 환경변수(vars)를 삭제**(NAVER 키 증발 사고) → 키는 반드시 `wrangler secret`으로. wrangler login OAuth=3분 타임아웃 부적합 → **CLOUDFLARE_API_TOKEN** 환경변수(토큰·카카오키=000000_INFO/API_KEYS.md). 계획서=_WORK_PLAN_spoen1217_생성품질개선_260725. ★**2차 개정(같은날·거절 대응)**: 웹 클로드가 실존인물 파이프라인 거절(신원은닉 낚시+T2 루머 재유통+"헌신짝" 자극어휘로 판독) → 우회 아닌 정책 재설계: 01 최상단 편집원칙(공개보도+본인발언·회복/응원·회고퀴즈)·T2=인정/공식입장/무대응만(부인종결 제외·무대응은 "입장없음"까지만, 사실암시 금지)·깎아내리는 어휘 제거·L5 검사 추가. **재실증=새 대화에서**(거절 대화 설득 반복 금지)·기만 우회 안함.

**★★260725 3차 — 이미지 오삽입 버그 근본해결(v1.6.1)**: 실증서 "완전히 엉뚱한 사진" 삽입. 근본원인=extractL6Keywords가 **고정 `tds[2]`를 쿼리로 가정**했으나 Claude가 표를 `|#|위치|시기|쿼리|네이버|다음|`(6칸)으로 생성→tds[2]='시기'(열애/이혼/근황)를 검색→무관 사진. handleFetchImage(다운로드)는 결백(받은URL 그대로). **수정=컬럼 인덱스 의존 제거**: ①헤더에서 '쿼리' 칸 탐색 ②실패시 인물명 든 셀 선택(쿼리엔 인물명 포함·시기/위치엔 미포함=방탄) ③최장 텍스트 셀. +kwAt 안전장치(쿼리에 인물명 없으면 prepend). 실측 교차검증: `열애`→블로그잡사진 / `김경란 김상민 열애`→2014~15 실제 열애보도 뉴스사진(카카오API 결백). 프롬프트도 요약표 6칸·쿼리에 인물명필수·헤더 '쿼리'표기 명시. ★교훈=마크다운 표 파싱은 고정 인덱스 금지·헤더/내용기반 탐색.

**★260726 4차 — GIF 우선 삽입 + 문장별 줄바꿈(v1.6.3)**: (1)줄바꿈: 확장 assemble의 flushFrag가 이미 문장 단위로 쪼갬(node재현으로 "…있습니다."/"열애설이…" 분리 확인)→네이버 결과는 이미 문장마다 블록. 사용자가 본 run-on은 옛버전 결과 추정. 프롬프트 L4를 "문장마다 블록(문장끝마다 빈줄1)"로 명시(구 1~2문장 묶음 폐기). (2)GIF: 다음웹UI filter=gif와 달리 **카카오 REST API엔 GIF필터 파라미터 없음**. ★해결=쿼리에 **"움짤"**(GIF 한국어 통칭) 붙이면 GIF 반환(`소지섭 움짤`=6/6 GIF, `gif`4/6, `짤`0). worker collect()=`{쿼리} 움짤`로 GIF먼저→부족분 일반쿼리(GIF우선·없으면 일반), prefer_gif기본on, is_gif플래그, GIF는 minWidth면제. 장면쿼리(김경란 김상민 열애)는 GIF0→일반폴백(정상). ★GIF 애니 보존: editor의 PNG캔버스변환(dataUrlToPngBlob)이 애니 죽임→**GIF는 HTML `<img src=원본URL>` writeClip으로 붙여넣어 SE가 원본 업로드**(정본 노트3: https img 자동업로드), 실패시 PNG폴백. claude-inject 이미지블록에 srcUrl·isGif 저장, GIF는 썸네일폴백 금지(썸네=정지). 배포=CLOUDFLARE_API_TOKEN(API_KEYS.md).

남음=claude.ai 재업로드·재실증(패널로그 🔑[김경란...] 확인·GIF 애니 실삽입 눈검증)·더할 이식.

**미결/다음**: 발행 자동화(publisher.py 이식), 다계정, L6 인라인 마커 위치 그대로 이미지배치(현재는 균등분산). 관련: [[project_deepnaut_naver_login_ext]](로그인·세션유지), [[feedback_visual_verification]].
