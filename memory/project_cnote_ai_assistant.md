---
name: project_cnote_ai_assistant
description: CNOTE(TieMing) AI 비서(대화형·3계층) SCR_ASSISTANT 신설(v0.15.0·MVP2)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-08-05T04:21:43.048Z
---

★260803 v0.15.0 [MVP2] **AI 비서(대화형·3계층)** 신설. 기획 3계층 IA의 상시 대화형 AI 비서(SCR_ASSISTANT_001)를 MVP2로 앞당겨 활성화(원래 1.5차/후행). 정본 설계=`01_docs/기획/AI비서_대화형_설계_v0.1_260803.md`.

**개념·범위(사용자 확정)**: 앱 데이터(인맥·미팅·일정·할일) **그라운디드 대화형 비서**(범용 GPT 아님). **조회 + 간단 액션**(일정 등록·할일 추가·브리핑 요청, 실행 전 항상 승인). **결과 카드 포함**(인물→SCR_PERSON·일정→SCR_CALENDAR). **단일 대화**(세션리스·히스토리 없음). 음성 1급+텍스트. 명칭="AI 비서". **새 창(전체화면)**.

**신규 파일 2midfi_13_assistant.html·SCR_ASSISTANT 4상태**:
- **empty**: 🤖 인사+추천 질문 칩 4종(CHIP_Q_BRIEF/CARE/PERSON/SCHEDULE)+큰 음성 버튼. 60대는 뭘 물을지 모르니 추천 칩이 핵심.
- **normal**: 사용자 말풍선(우측)+비서 답변(텍스트+결과 카드 RESULT_PERSON·RESULT_SCHEDULE).
- **action-confirm**: ACTION_CONFIRM_CARD(일정 요약)+[네 등록할게요]fill→SCR_CALENDAR/[취소]→normal. 승인게이트(60대 안전·위임 모델 정합).
- **listening**: OVERLAY_LISTENING 음성 인식(마이크·파형·완료). 흐린 대화 배경.
- 헤더=BTN_CLOSE(×)+AI 비서+BTN_NEW_CHAT(↻). 입력바=BTN_VOICE(큰 원형)+INPUT_MSG+BTN_SEND. 화면당 fill 1개.

**배선**: flows 신규 그룹 **⑫ AI 비서**(assistant·13번째 그룹). nav_map SCR_ASSISTANT|BTN_CLOSE→SCR_HOME(임시). deploy midfi files에 신규 파일 등록. 게이트 178키·13카테고리·미커버0·눈검증(4상태) PASS.

**★진입점 확정(260805·IA 정책)**: 전 탭 헤더 우상단 **🤖 AI비서 상시 아이콘**(BTN_HEADER_ASSISTANT). 미정 해소.

**★대화 모드(v0.21.0·260805·Gemini Live 참조)**: 입력바 제일 오른쪽 **〰️ BTN_LIVE_MODE**→**SCR_ASSISTANT|live**(5번째 상태). 자동 청취 루프 음성 연속 대화 — AI 음성 답변(🔊)+**모든 주고받음 채팅 버블 기록**(결과 카드 포함·종료 후 로그 유지). 하단 BAR_LIVE_CONTROL(파형+상태라벨+음소거+✕종료→normal). 🎙(listening·1회 입력)과 역할 구분. 개발=연속 STT/TTS·barge-in·무음 타임아웃.

**개발 메모**: 데이터 그라운딩(조회 API)+STT(음성노트 파이프 재활용)+LLM(도메인 프롬프트). 환각 방지(근거 표기·모르면 모른다)·액션 항상 승인.

★device 반영·스토리북 카테고리 ⑫ 추가·실제 진입 배선=스토리북2(catch-up 백로그 6번째). [[project_cnote_mvp2_ia_audit]] [[project_cnote_pinned_briefing]]
