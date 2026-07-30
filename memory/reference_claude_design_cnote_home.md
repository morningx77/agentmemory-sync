---
name: reference-claude-design-cnote-home
description: claude.ai Design 프로젝트(CNOTE Home 시안) + DS 적용 HTML 산출물 위치
metadata: 
  node_type: memory
  type: reference
  originSessionId: fd1f7717-700d-4890-a9c2-57f0f188989c
---

CNOTE Home 화면 시안이 claude.ai Design 프로젝트에 있고, 우리 디자인시스템으로 재구현한 HTML이 로컬에 있음.

**claude_design MCP**: 도구명 `DesignSync`(method 디스패치: list_files/get_file/list_projects/finalize_plan/write_files…). claude.ai 로그인이 자동으로 design 권한(user:design:read/write)으로 업그레이드됨 — `/design-login` 불필요했음. 프로젝트ID=`d979ef70-03a9-4e47-a471-3295bb261e3d`. 시안 파일: "CNOTE Home - Editorial Layered/Angular Premium/Today's Briefing/Style Explorations.dc.html"(.dc.html=Claude Design 포맷, <x-dc>+data-props). 시안 원본은 Pretendard+인라인SVG+하드코딩색.

**DS 적용 산출물** (2026-06-22, `02_design/screen_design/`):
- `home_editorial_DS적용.html` — Editorial Layered 3방향(A 레이어드스택·B 에디토리얼히어로·C 카운트다운링)
- `home_angular_premium_DS적용.html` — 앵귤러(R2~3, 샤프+키라인)만. 라운드 화면은 Today's Briefing 방향A와 중복이라 제거함
- `home_todaysbriefing_DS적용.html` — 3방향(A 카드스택·B 요약대시보드·C 단일포커스), 할일 클릭 토글 인터랙션
- `home_editorial_minimal_DS적용.html` — Style Explorations의 "04 에디토리얼 미니멀"(화이트+스위스, 샤프 모서리, 블랙 룰=text-primary, 큰 타이포 위계) 단일 화면
- (Style Explorations 나머지 7종 미구현: 01 다크럭스·02·03·05~08)

**적용 규칙**: 단독 HTML, :root에 tokens.css 값 인라인, 폰트=Noto Sans KR+Inter(숫자), 아이콘=Phosphor 웹폰트 CDN(`@phosphor-icons/web`, `<i class="ph ph-house">`), 색=var(--color-*)(primary #2A3FEC 일치), 시니어 UX(본문≥16px·핵심≥20px·터치 48dp+), P1 미팅1+P2 할일1, 감시성 게이지 없음. 폰 프레임 390×844.

**Figma로 옮기기 (2026-06-22, generate_figma_design HTML→Figma 캡처)**: 8화면(4파일)을 CNOTE Design System 파일(OEqJJI0oCGgGZ28exd866d) "Design" 페이지(508:519)에 캡처. 절차: ①`python -m http.server`로 로컬 서빙 ②캡처용 임시사본(_cap_*.html)에 capture.js(head) 주입 ③generate_figma_design(fileKey,nodeId 508:519)로 captureId 발급 ④`start <url>#figmacapture=<id>&figmaendpoint=...&figmadelay=6000` 브라우저 오픈 ⑤폴링. **함정1**: 여러 탭 동시 오픈하면 백그라운드 throttling으로 포그라운드 1개만 캡처됨 → **한 번에 하나씩 포그라운드**로. **함정2(중요)**: Phosphor를 아이콘 **웹폰트**(`<i class>`)로 쓰면 캡처 시 Figma에 폰트 없어 **아이콘 전부 누락** → 캡처 직전 `<i>`를 **인라인 SVG로 치환**하는 스크립트(icons_swap.js: unpkg `@phosphor-icons/core/assets/{weight}/{name}.svg` fetch 후 교체, fill=computed color) 주입 + figmadelay 충분히(5~6s). 결과 프레임: today 520:2·editorial 518:2·angular 516:2·minimal 519:2. 캡처는 raw frame(컴포넌트 인스턴스 아님). [[project_cnote_figma_componentization]]
