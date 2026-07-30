---
name: project_deepnaut_youtube_frames
description: DEEPNAUT 유튜브 영상 프레임 이미지 백엔드 — 방송 리캡용 프레임 추출+워터마크+원클릭 자동실행
metadata: 
  node_type: memory
  type: project
  originSessionId: 16f5b3a6-0f22-4d44-9fd8-10a80439ef67
  modified: 2026-07-24T06:37:59.382Z
---

★사용자 시나리오 별칭(팝업 이미지소스 토글 라벨): **홍기자 스타일**=spoen1217(연예계소식)=네이버 검색(아카이브 사진) / **더할 스타일**=dearwinterrain(방구석 리뷰어)=유튜브 프레임(방송 영상). 글 쓸 때 팝업 소스만 해당 별칭으로 맞춤.

★260723 P1·P2 완료. dearwinterrain(방송 리캡, 영상58%) 이미지 소스=영상 프레임. 기존 완성엔진 `youtube.py`(YouTubeFrameCrawler, 260220_BLOG_AUTO_V2/backend) 재사용. [[project_deepnaut_editor_injector]]의 이미지 소스 확장(네이버 Worker와 2-백엔드 공존).

**백엔드(P1)**: `youtube.py`에 `collect_from_url(video_url,keyword,limit)` 추가 — 검색 스킵·특정 영상 직접. `images.py`에 `POST /api/v1/images/youtube-frames`(base64 dataURL 반환, 확장이 바로 삽입). 자막(youtube-transcript-api)에서 인물명 언급 타임코드→프레임, 없으면 균등샘플, 최종 썸네일 폴백. oEmbed로 채널명→"출처: {채널}" 워터마크(Pillow).

**★함정1 (프레임 추출)**: `yt-dlp --download-sections`(ffmpeg 구간다운로드)가 av1/avc1 **모두 60s+ 스톨**(YouTube가 JS런타임 deno 요구). 정답=**`yt-dlp -g`로 progressive 직접 URL(fmt 22/18) → `ffmpeg -ss(입력앞) -i URL -frames:v 1`**(~1초/프레임). DASH 1080p 입력시킹은 46s 실패. **화질=360p 확정**(progressive 상한), 사용자 360p 그대로 승인. 고화질 필요시 image_service.upscale_image.

**★함정2 (자동실행)**: `Register-ScheduledTask`가 **관리자 권한 요구(Access denied 0x80070005)**→ **시작프로그램 폴더(`[Environment]::GetFolderPath('Startup')`) .vbs** 방식(관리자 불필요). vbs=`WScript.Shell.Run("python.exe run_server.py",0,False)`.

**★함정3 (숨김 실행)**: `pythonw.exe`는 콘솔 없어 run_server.py `print()` 실패→즉사. 정답=**python.exe + vbs Run(...,0)** 숨김창(콘솔 존재→print OK, 창 안보임). 절대 pythonw로 run_server.py 돌리지 말 것.

**설치(P2→260724 자립형 재작성)**: ★기존은 BLOG_AUTO_V2 .venv/backend 경로에 의존→집PC 등 다른환경서 "경로 불일치" 설치실패. **해결=자립형 미니서버로 분리**: `backend-installer/server/`(app.py=FastAPI+크롤러 자체포함, run.py=uvicorn **포트8777**, requirements.txt). install-backend.ps1=부트스트랩(Python탐지 py/python/python3→없으면winget→backend-installer/.venv 생성→pip install→ffmpeg PATH없으면 gyan essentials zip 자동다운로드 bin/ffmpeg.exe→Startup vbs→wscript기동→health폴링). BLOG_AUTO_V2 트리 무관, 확장폴더만 복사하면 됨. app.py find_ffmpeg=PATH→bin/→FFMPEG_PATH. **PS5.1 한글 .ps1은 BOM 필수**([[reference_ps51_bom]]). 확장 DEFAULT_BACKEND=localhost:8777. 실증완료(venv생성+pip+8777 health+프레임2장).

**P3 완료(260723)**: 확장 UI 이미지 소스 토글. manifest v1.3.0. popup 셀렉트(네이버검색/유튜브프레임)+storage `imageSource`. background: `DEEPNAUT_youtubeFrames`(POST /api/v1/images/youtube-frames)+`DEEPNAUT_backendHealth`(/docs)+`getBackendUrl`(기본 localhost:8000). claude-inject: doExtract가 L0소스카드서 YouTube URL 정규식 추출(data.videoUrl)+인물 정규식 `주인공|인물`, assemble이 imageSource=youtube면 health→youtubeFrames 1회→프레임 대표컷+슬롯 순서배분. **3중폴백**(URL없음/백엔드다운/0장→네이버검색). node --check 통과.

**남음**: 사용자 end-to-end 눈검증(확장 재로드 v1.3.0→팝업 소스=유튜브프레임→dearwinterrain 영상소재 생성+추출→방송프레임 삽입). 계획서=01_docs/계획_핸드오프/_WORK_PLAN_youtube_frame_backend_260723.md
