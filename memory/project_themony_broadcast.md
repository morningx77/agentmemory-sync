---
name: project_themony_broadcast
description: THEMONY 연예/방송 자동발행(broadcast_autoposter) 기획·실현성 검토
metadata: 
  node_type: memory
  type: project
  originSessionId: 63c9e211-8ced-483f-97b7-62165ccf21bd
---

THEMONY 신규 대메뉴 **연예/방송**(하위 방송·연예·별스타) 자동발행 기획. 방송 먼저(나는솔로 등), 연예·별스타(인스타)는 이후. 실현성 검토 완료(2026-07-05) — **기술적으로 가능**, 사용자 방침=ⓐ 리캡·변형 중심(저작권 안전).

**기반기술(이미 구현·검증, 260220_BLOG_AUTO_V2)**: `backend/app/services/collector/youtube.py`(YouTubeFrameCrawler) — 영상검색(RSS·API·오픈) + 방송12채널 레지스트리(channels.json: KBS/SBS/JTBC/tvN…) → 자막(youtube-transcript-api) → 인물 타임코드+얼굴탐지 → yt-dlp 구간다운 → FFmpeg 프레임 → Pillow 출처워터마크. 인물일치 80%. 환경: ffmpeg 설치됨, yt-dlp는 260220 .venv에 존재.

**샘플 리캡 DNA(blog.naver.com/dearwinterrain)**: 제목=방송/인물+반전근황 후킹. ~1,650자·짧은문단·존댓말. 방송내용을 **인물 발언 중심 시간순 재구성**("~라고 말했습니다/털어놨습니다")+반응("폭소케")+"한편" 전환. 발언 사이 인물 스크린샷 6~10장. = 변형적 요약 리캡(영상 재현 아님).

**설계 방향(broadcast_autoposter, gov/mrt/coupang/budongsan 형제)**: ①yt-dlp 트렌딩 영상발굴 ②자막추출(없으면 Whisper) ③Claude CLI 리캡 생성(봄봄 DNA 스타일) ④인물프레임6~8장(타임코드+얼굴탐지) ⑤발언사이 삽입+하단 YouTube임베드 ⑥WP발행(하네스). Claude=CLI구독, WP=하네스재사용.

**⚠️저작권/정책**: 방송 프레임+애드센스=침해소지, YouTube약관상 다운로드 위반(임베드는 허용). 완화=요약·해설중심(변형)·스크린샷최소·출처워터마크·채널명시·하단공식임베드. 사업리스크 판단(사용자 진행 결정함).

**문서(작성완료 260705, 실측검토 반영 260706)**: 설계서 `03_dev/_WORK_PLAN_broadcast_autopost_260705.md`(⓪원칙~⑦컴포넌트) + 실행계획 `03_dev/_IMPL_PLAN_broadcast_autopost_260705.md`(Task0~8). ⚠️경로=**03_dev**(01_docs 아님).

**★2026-07-06 구현 실측검토(문서 상세 갱신 완료)**:
- 판정=**구현 가능**(전 단계 헤드리스, 안티그래비티식 세션비밀 블로커 없음). 기반기술 `260220 collector/youtube.py`(30KB) **실재 확인**(Glob이 15,000파일 때문에 놓쳤을 뿐, Test-Path로 확인).
- **핵심 격차=런타임 미설치**: THEMONY python(3.12.10)에 yt-dlp·youtube-transcript-api·opencv(cv2) 미설치 + ffmpeg·yt-dlp 바이너리 PATH 없음(260220 .venv도 없음). Pillow·requests·claude만 있음. → **Task 0가 실제 최대 관문**(계획서 초안 "설치됨" 오판을 정정).
- **`/watch` 스킬 재사용**(claude-video `~/.claude/plugins/cache/claude-video/watch/0.1.3`): setup.py가 ffmpeg·yt-dlp 설치 + download/frames/transcribe 빌딩블록. 단 인물중심 프레임선택 없음(시간샘플)→얼굴탐지는 260220 cv2 이식.
- **결정(사용자)**: ①우선 문서만 상세갱신·구현 착수 보류 ②**Whisper 미사용=자막 있는 클립만 발행**(무과금; Groq/OpenAI 유료·로컬whisper 부하 모두 배제, 한국 방송클립은 대부분 자동자막).
- **다음=Task0(환경설치)부터 착수 — 사용자 go 대기.**
관련: [[project-themony-harness-v2]] [[project_themony_budongsan_autopost]] [[themony-claude-cli-only]]
