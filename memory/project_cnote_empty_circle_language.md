---
name: project_cnote_empty_circle_language
description: CNOTE 빈상태 히어로 8종 = 원(Circle) 시각 언어 재해석(HeroIllust EmptyMark)
metadata: 
  node_type: memory
  type: project
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-08-03T00:49:21.852Z
---

★260803 빈상태 히어로 8종을 **구상 아이콘(벨·클립보드·트레이·캘린더 등) 폐기**하고 **원(Circle) 시각 언어**로 원점 재설계. 근거=DESIGN_PRINCIPLES ㉒-ⓐ(빈상태 모티프=순수 브랜드 일러스트 도메인=㉑ 원 언어 순수 준수: 원만·명시적 기하규칙(동심/시리즈/수렴/그리드/방사)·fill=주체/outline=맥락·opacity=깊이·primary 1톤).

**HeroIllust EmptyMark 8종**(components/HeroIllust/index.tsx, 각 화면 의미=배치 규칙):
NotifMark(동심pulse)·TaskMark(수직시리즈)·InboxMark(수렴)·CalendarMark(그리드+오늘)·ReplyMark(동심포함)·PersonMark(방사대칭72°)·TodayMark(단일동심)·NewsMark(대각시리즈).
- 공통 셸 **EmptyMarkShell** = glow(blur40·primary op.10) + 동심 점선 무대링(r58 op.32). 내부 오브젝트는 **절제 크기·중심 집중·무대링과 여백 확보**(사용자 원칙: 내부 크면 품질↓, 링에 붙으면 안 됨).
- 폐기: 구상 NotifBell/TaskBoard/InboxTray + NewsSeedMark + 페이지 로컬 ReplyEmptyMark/PersonEmptyMark/TodayEmptyMark. 온보딩 히어로(WelcomeCardMark·ReconnectMark)는 범위 밖 유지.
- 각 화면 empty는 [[project_cnote_empty_state_commonization]]의 ScreenEmpty(Module)에 illust로 주입.

시안 승인=Artifact 갤러리(원 언어 8종 비교). 프로세스 교훈 [[feedback_design_holistic_not_piecemeal]]. 원 언어 정본=`02_design/CDS_circle_visual_language_guide.md`, [[project_cnote_circle_language_clarity]].
