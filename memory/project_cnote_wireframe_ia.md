---
name: project-cnote-wireframe-ia
description: CNOTE v2 와이어프레임 IA 산출물 — Figma 파일·분할 이미지·IA 엑셀 위치
metadata: 
  node_type: memory
  type: project
  originSessionId: 1155fb66-1081-4d5c-b16c-4ac6ae92163c
---

기획 v2_260615 기반으로 CNOTE 전체 IA + 와이어프레임을 정리한 산출물 (2026-06-16 작성).

**핵심 사실**: v2 기획서 부록 '주요화면'의 와이어프레임에는 기획자 공식 화면 ID가 인쇄되어 있고, 이 체계가 §26 화면 목록(15개)보다 세분화된 **36화면**이다. 와이어프레임 ID를 IA의 정답으로 채택했다. (각 원본 PNG는 화면 2개 합성이라 좌/우로 분할함)

**산출물 위치**
- IA 엑셀: `03_projects/260610_C-Level_note/01_docs/CNOTE_IA_v2_draft_260616.xlsx` (3시트: CNOTE IA 44행 / 와이어프레임 인덱스 37 / 범례)
- 분할 와이어프레임: `03_projects/260610_C-Level_note/02_design/wireframes/WF{01~37}_{화면ID}.png` (화면 ID 파일명)
- 재생성 스크립트: `06_downloads/build_cnote_ia.py`, `split_wireframes.py`, `wf_namemap.json`

**Figma 파일** (Ispark 팀)
- "CNOTE Wireframe IA (v2)" — fileKey `tXrzbF3xbn1LxToZzwLtVd`
- 8개 섹션(여정 흐름순) 오토레이아웃 보드, 루트 nodeId `39:2`, 36화면+플로우차트
- 기존 디자인시스템 파일([[project-cnote]] 참조, `BfnyTberxu459jerIUeKxY`)과는 별개

**구축 단계** (§24 "무엇부터 만들까" — 먼저 만드는 순서일 뿐 출시 차수/MVP 차수 아님. 1·2·3단계 모두 만들 계획, '보류'만 제외): 1=미팅 흐름 / 2=새 요청(이메일 먼저) / 3=채널 확장. 가장 먼저 만드는 묶음 = 미팅 흐름(가입→녹음→정리결과→인물연결→홈/할일). ※주의: §24 단계(구축 순서)와 메인 PRD §10 "1차 MVP/1.5차/2차"(출시 차수)는 다른 축 — 섞지 말 것. 새 요청은 §24 2단계이나 §10.1(1차 MVP 포함)에 누락돼 있음 → '보류' 아님·제외도 아니므로 1차 포함으로 정합 권고. 두 문서 매핑은 IA 엑셀 '단계·차수 매핑' 시트에 정리됨.

**§27 최종 IA 트리 전 항목 반영 완료**. 와이어프레임 이미지가 없는 화면은 Figma 점선 플레이스홀더 + 엑셀 △로 표시(후속 디자인 필요):
- 온보딩: SCR_CARD_SCAN(명함OCR)·SCR_SELF_TIMELINE(회사정보③)·SCR_ONBOARD_001(재접촉정리⑤A)·SCR_FOLLOWUP_001(후속정리⑤B)
- 미팅: SCR_FOLLOWUP_TEXT(텍스트정리)·SCR_CALL_MEMO(통화메모)·SCR_LINK_CALENDAR(캘린더 미팅 연결)
- 설정: SCR_SETTINGS_ACCOUNT(계정)·SCR_SETTINGS_PERMISSION(권한연동)·SCR_SETTINGS_EMAIL(이메일연결)·SCR_SETTINGS_CALENDAR(캘린더연결)·SCR_SETTINGS_SMS_CALL(문자전화)
할일·사람 필터(전체/약속/답장 등)는 화면 내 탭이라 별도 화면 아님 — 해당 목록 화면 구성요소로 관리.

**의사결정 보드** (Figma 섹션 "8. 의사결정 필요" node 46:2 / 엑셀 "의사결정" 그룹): 현재 진짜 미결 1종 — **자체 캘린더 범위**(트리거만/심플/풀뷰). 캘린더 연동·일정 등록과 직결돼 MVP 설계 중 결정 필요. 나머지는 MVP 방향이 이미 정해져 의사결정 항목에서 제외: 답장 초안 자동발송(§3·§17·§28.2 "안 함·확인 후 사용"), 문자·통화 원문 접근(§24 보류·1.5차 이후), 카톡(§24 공유분만·깊은 연동 후순위).
★캘린더 핵심: v2는 **자체 일/주/월 캘린더 뷰를 설계하지 않음** — 외부 캘린더 연동 "트리거 레이어"(미팅 사전 브리핑·사후 정리·일정 후보)로만 정의. 일정 등록·수정용 "자체 심플 캘린더"는 필요하다고 명시됐으나 범위 미결(§22·§3·회의 AI #24).

**추가 발견 화면** (`02_design/wireframes/EX01~11_*.png`): 주요화면 부록에 없던 상세 화면 11개를 하위 플로우 문서에서 발굴 — 비서 시점 3(받은 요청·작업 처리·활동 기록), 관계관리 2(연락 후 메모·연락 주기 설정), 미팅 사전 브리핑, 정리 노트 상세, 재접촉 인트로, 관계 스캔, 정보 보완, 회사 정보·뉴스. **별도 섹션으로 빼지 않고 각 흐름 섹션에 통합**(온보딩←SELF_TIMELINE·RECONTACT_INTRO·RELATION_SCAN / 미팅흐름←MEETING_BRIEF·NOTE_DETAIL / 사람←AFTERCONTACT·CADENCE·INFO_INCOMPLETE / 비서←DELEGATE_INBOX·TASK_DETAIL·ACTIVITY). 하위 문서 이미지는 **구버전 UI(하단 4탭+플로팅 마이크) 혼재** → 카드 상/하단을 회색 마스킹 박스로 덮고 "⚠️ 하위 문서 시안" 배지 + "최신 네비 기준" 표기로 정본(WF, 마스킹 없음)과 시각 구분. 최신 시안 재작성이 필요한 백로그.

**보드 상단 전략 섹션** (Figma 0번 플로우차트 다음): ① "🎯 1차 디자인 착수 범위 — 왜 1단계부터인가"(결론 배너 + 근거 4: 일정 제약/가치 검증/§24 근거/수직 슬라이스 + 포함·제외 범위), ② "★ 디자인 착수 전 — 핵심 이슈 & 액션"(6대 이슈: 버전 혼재·비서 시점 부재·§10↔§24 정합성·미작성 12화면·자체 캘린더 미결·화면 ID 체계, 각 현황+▶액션). 1단계 화면 27개에는 흐름 섹션 카드에 "🎯 1단계 디자인 착수" 초록 배지. **목표: 7월 2주차 테스트 앱 → 1단계(미팅 흐름) 수직 관통 우선.**

**위젯·알림 (진입 표면 §23)** — Figma 섹션(온보딩 다음) + 엑셀 "위젯·알림" 그룹 / `02_design/wireframes/WGT01~07_*.png`: 잠금/홈 위젯·라이브 위젯·푸시 알림(아침/미팅사전/후속/결과) 7화면. 출처 하위문서 image1·13·23·27·34. OS 표면이라 하단 네비 없어 마스킹 불필요. §23 "진입은 푸시·위젯" 핵심인데 누락됐던 것을 화면으로 추가. 단 위젯 크기·시간대·데이터별 케이스·알림 예산은 미정(이슈 카드).

**디자인 착수 전 이슈** — Figma "★ 핵심 이슈 & 액션" 섹션 11건(IA 레벨 6 + 화면 케이스 5: 케이스 매트릭스 부재·위젯/알림 IA 미반영·상태 E/L/Err 명세·카드 유형별 분기·베리언트 Props 미확정). 상세는 `02_design/CNOTE_디자인착수전이슈_기획v2_260617.md`(전 화면 30+ 이슈, CMN 공통 + 영역별 ONB/REC/HOME/PPL/TASK/INBOX/SEC/CTRL/SET/WGT, 착수 게이트 체크리스트). 홈 전용 깊이는 `02_design/화면설계서_홈화면.md`(B-/W- 이슈 + 베리언트 Props 초안). **핵심: 기획이 방향·개념은 정의했으나 케이스별 구현 명세가 없어, 케이스 매트릭스→Props 확정 후 베리언트 착수해야 재작업 없음. 위젯·알림은 §23 핵심 진입인데 화면 계층 미설계.**

**How to apply:** CNOTE 화면 구현·Figma 작업 시 이 와이어프레임 IA를 참조. 화면 ID는 와이어프레임 체계를 우선. 정본=주요화면 36(🎯 배지=1단계 착수 대상), 추가발견 11(EX·마스킹)은 버전 혼재 주의·최신 재작성 백로그.

**신규 컴포넌트 설계계획 (2026-06-21):** 와이어프레임 8섹션 전체를 시각 분석(병렬 에이전트)해 DS 24종에 없는 신규 UI 컴포넌트를 추출·설계·계획. 결과 문서: `03_projects/260610_C-Level_note/02_design/CNOTE_신규컴포넌트_설계계획_260621.md`. 핵심: 기반원자(Banner/Spinner/Stepper/Tag/Divider) · 구조(Timeline/SettingsGroup+SettingRow/ChecklistItem) · 복합카드 통합설계(ActionCard·PersonCard·NotificationCard) · 특수(녹음 스위트 4종·위젯 스위트 3종·SocialLoginButton) · 기존확장(BottomSheet grabber·EmptyState success·BottomNav docked-FAB·destructive variant). 우선순위 P0=1단계 미팅흐름(Banner·Spinner·Stepper·ActionCard·PersonCard·녹음스위트). 와이어프레임이 이미지라 치수는 화면 확정 시 결정.

**✅ P0 코드 구현 완료 (2026-06-21, TDD)**: Banner·Spinner·Stepper·ActionCard(Card+Badge+Button 조합, result/proposal/briefing)·PersonCard(Avatar+Button, 연결/확인/위임)·녹음스위트 4종(AudioWaveform·RecordControls(FAB+IconButton)·RecordTimer·ProcessingStepList(Spinner 재사용))·EmptyState success variant. 컴포넌트 24→33종, 114 테스트 통과·tsc 클린. **✅ P0 Figma 반영 완료 (2026-06-21)**: P0 신규 9종을 `🧩 Component Sets`(OEqJJI0oCGgGZ28exd866d, 314:2) 하단(x≈-400, y≈15328, "🆕 P0 신규 컴포넌트" 헤더 아래)에 COMPONENT로 추가. 토큰 바인딩+Noto+기존 인스턴스 재사용(RecordControls=FAB+IconButton, PersonCard=Avatar, ActionCard=Badge). **✅ P1·P2 완료 (2026-06-22, 자율 진행)**: 코드 11종 신규(Tag·ChecklistItem·Divider·Timeline·SettingRow·SettingsGroup·NotificationCard·QuickActionTile·WidgetCard·LiveActivityCard·SocialLoginButton) + BottomSheet grabber 확장. 컴포넌트 33→44종, 136 테스트 통과·tsc 클린. Figma도 11종 DS 쇼케이스 포맷(번호 34~44, y=21500~25500)으로 반영. 권한: settings.local.json에 defaultMode=acceptEdits + Bash/Figma MCP allow 추가(자율 진행용). P0/P1/P2 모두 완료 — 와이어프레임 신규 컴포넌트 계획 전체 구현됨. **✅ Tooltip 추가 + Figma 정리 (2026-06-22)**: Wanted DS(3GglyS7d32oZoZGKPR2U3d) 참고. Tooltip 신규(다크 말풍선·position 4종·size 2종·arrow·shortcut 칩·hover/focus, 코드+6테스트, Figma 번호45 459:64). 컴포넌트 44→45종, 142 테스트 통과. **Figma 카드류 단일박스 통합 (Wanted式)**: 분리돼 있던 카드 6종 프레임을 모두 삭제하고 **하나의 「DS · Card 패밀리」 박스(464:60)**로 통합. 박스 body에 카드별 라벨 서브블록(Card 4변형/ActionCard 3/PersonCard 3/Notification/Widget/Live) + 구분선. Tooltip(459:64) 다음 y=22723에 배치. 페이지 41개 요소 x=0 정렬. **Tooltip 화살표 = 원티드式 차용(최종)**: 다이아몬드(45° 사각형)는 모양 부적합 → 폐기. 원티드(get_design_context 16764:137794) 분석 결과 화살표는 **납작한 삼각형**(medium 20×8 / small 14×6, 옆방향 8×20)이 말풍선에 flush 부착. Figma 화살표 최종해법=**명시적 경로 Vector**: Figma 정다각형(createPolygon)은 밑변이 바운딩박스 모서리에 정확히 안 닿아(내접/회전 방식) 화살표 레이어 안쪽 말풍선 닿는 면에 미세 여백 발생 → itemSpacing 음수로도 안 사라짐(사용자 발견). 해결: createVector + vectorPaths(예 down=`M 0 0 L 20 0 L 10 8 Z`, up/right/left 동일 패턴)로 밑변을 박스 모서리에 정확히 배치(회전 불필요·인셋0). wrap itemSpacing=-0.5. 코드: CSS border-triangle(borderLeft/Right transparent+borderTop solid), top:'calc(100% - 1px)'. shortcut은 칩 아님 → **흐린 텍스트 opacity 0.61**(원티드 동일). 말풍선=text-primary 솔리드·radius8·padding12/8·14 Medium. **말풍선↔화살표 간격 0 필수**(사용자 요구). 남은 백로그: Figma 변수 바인딩 정밀화·나머지 카드 variant 확장.

Spinner는 ellipse arcData 3/4링. **공통 DS 쇼케이스 포맷 적용 완료**: 9종 모두 "DS · {Name}" 프레임(1200폭, 액센트바+번호 25~33(Poppins SemiBold)+제목(Poppins Bold32)+타입(Noto)+설명박스(surface-subtle)+라벨(Poppins Medium)+컴포넌트)으로 래핑, y=16400~21000 세로 스택. 기존 24종 포맷과 동일. 검증 정상. (FAB/Switch/IconButton은 기존부터 Figma 존재라 제외. RecordControls 내 IconButton 인스턴스는 기본 mic 아이콘 표시 — 미세 차이.) 남은 계획: P1(Timeline·SettingsGroup·NotificationCard·Tag·ChecklistItem·BottomSheet grabber)·P2(위젯스위트·SocialLoginButton·Divider). 설계계획 문서 `02_design/CNOTE_신규컴포넌트_설계계획_260621.md` 참조. 섹션 노드ID: 온보딩39:18·위젯알림81:2·미팅39:40·홈39:77·새요청39:124·비서39:156·통제39:183·설정39:215. [[project_cnote_figma_storybook_sync]]
