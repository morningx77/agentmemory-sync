---
name: project-cnote-midfi-meta-nav
description: CNOTE mid-fi의 설계 메타(P1·◆·→·hidden·issue-panel)는 UI 아님 + 탐색 구조(상세·과정=탭바 숨김). Figma 재구축 필수 분리
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
---

CNOTE mid-fi를 Figma/스토리북으로 재구축할 때 반드시 지킬 두 규칙. 관련 [[project-cnote-recording-entry]], [[reference-cds-harness]].

**① 메타 분리 (설계 메타 ≠ 실제 UI)**: mid-fi의 아래 5종은 설계 소통용 주석이며 **실제 UI로 옮기면 안 됨** — (a)`P1/P2/P3` 배지(`.pri`) (b)`◆ 디자인기획/델타` 주석(`data-delta`) (c)`→ 목적지` 안내 화살표 (d)`hidden` UX 주의문 (e)`issue-panel`(우측 논의 패널). **우선순위는 배지가 아니라 순서(위=중요)·크기강조(primary vs 경량)·의미라벨("먼저 처리할 일")·주행동 1개로** 표현. 설계 추적이 필요하면 화면 미노출 `data-priority` 속성으로 보존(배지로 그리지 말 것). 하네스 플레이북 DoD "설계 주석 제거" 규율을 이 전수 5종으로 확장. (issue-panel은 build_prototype이 device만 추출해 프로토타입엔 이미 미포함 — Figma/스토리북 재구축 시만 주의.)

**② 탐색 구조 (상세·과정 = 탭바 숨김)**: mid-fi는 baseline이라 전 화면에 하단 탭바(bottomnav)를 넣어뒀으나, 실제/Figma에선 **1차 대메뉴(홈·사람·할일·설정메인)에만 탭바**. 상세·입력 화면 = 탭바 숨김 + 뒤로가기/닫기만. **과정성 화면(녹음중·정리중 로딩 SCR_MEETING_PROCESSING·정리결과 확인 SCR_NOTE_RESULT) = 모달/독점**(탭바 완전 숨김, 취소/나중에만) — 무심코 이탈 시 상태 불일치·저장 유실 방지.

**⚠️ 검토 보고서 ID 부정확**: `01_docs/260707_미드파이_설계_검토_보고서.md`의 PART1 화면 ID는 **화면명 기반 역생성으로 가공됨**(SCR_MY_ACCOUNT·SCR_PERM_SETTINGS·SCR_CONN_EMAIL 등 실존 안 함, SCR_CADENCE_SETTINGS·SCR_BACKUP_RESET·SCR_CONN_* 세분화는 **존재않는 화면 지어냄**). 실제 정본 `data-screen` 기준 사용. 실제 설정 화면 8개=SCR_SETTINGS_ACCOUNT/PERMISSION/EMAIL/CALENDAR/SMS_CALL/DATA/NOTI/MEETING. PART2 메타 진단은 정확. 보고서 해결책(data-meta-·meta-/guide-·template)은 기존 data-* 컨벤션(data-screen/aux/component/delta)과 통합 필요.

**범위**: 비서(SCR_DELEGATE_*)는 1차 MVP 제외(2차). **피그마 세션 전달 완료(260707)** — 위 ①②를 검증본으로 공지.

**진입 고립 화면 발견·수정(260707)**: SCR_NOTIFICATIONS(알림 인박스)·SCR_SEARCH(통합검색)가 **어느 화면에서도 진입 hotspot 없이 고립**(도달 불가)이던 것 발견. 홈 헤더(오늘의 브리핑) 우측에 알림·검색 진입 추가(5개 홈상태, data-link) + flows 홈normal hotspot 추가 → 도달 가능. Figma는 벨·돋보기 아이콘으로(하단5탭 유지, 헤더 아이콘). **★게이트 사각: build_prototype "미커버0"은 진입 고립을 못 잡음**(flow 첫 step이면 커버로 카운트되나 타 화면에서 오는 진입 hotspot 부재 가능). SCR_RELATION_INBOX(챙길일)=홈 챙길일카드 단일진입. SCR_RELATION_INBOX(챙길일)=홈 챙길일카드 단일진입.

**고립 화면 전수점검·개선(260707)**: 검토보고서 PART3(01_docs/260707_미드파이_설계_검토_보고서.md)가 "고립 12개" 주장했으나 **실측 재검증 결과 진짜 도달불가(진입0)는 SCR_SETTINGS 1개뿐**. 나머지=연쇄(설정하위7=SCR_SETTINGS 경유진입 有, 허브만 풀면 해결)·경로개선(캘린더=홈→브리핑 간접有/직접만없음, 임시저장=미팅흐름중 진입有/재진입만제한, 노트상세=인물상세 진입有/단일). SCR_SETTINGS_EMAIL은 관계인박스서도 진입=고립아님. **PART3는 연쇄+진입있는것 포함해 12개로 부풀림**. 근본 3개 해소: ①설정(홈 flows "설정" hotspot, 하단탭이 UI담당) ②캘린더(홈 미팅브리핑카드 "일정 전체 보기" 링크→SCR_CALENDAR) ③임시저장(홈 "작성 중인 노트" 상황카드→SCR_DRAFT_REENTRY). 원칙=홈 진입허브·하단5탭 유지. 게이트·재빌드·재배포. 노트상세 다중진입은 편의라 후속. 피그마 전달완료.

**P배지 정리 완료(기획, 260707)**: mid-fi 정본의 `P1/P2/P3` 배지 30개(2midfi_01·02·03·04·06)를 `<span class="pri">PN</span>` → `<!--meta-pri:PN-->` 주석으로 일괄 전환(sed). 화면 미노출·우선순위 추적 유지. 게이트 통과·재빌드·재배포. **단 `<span class="pri">추천</span>`(SCR_ONBOARD_001)은 P번호 아닌 실제 UI 라벨이라 유지**(pri 슬롯 겸용: P번호=메타 버림/추천=라벨 살림). 피그마엔 P배지 재현 불필요(순서·강조·라벨로).

**나머지 메타 정리 완료(기획, 260707)**: (a)`→ 목적지 안내` 8개 제거(홈7·comm·components / 회색 `color:#9a9a9a` div) — 단 `원문 보기 → 대표만 열람 가능`(comm)은 목적지 아닌 **실제 권한 안내라 유지**. (b)화면 노출 `◆ 디자인기획(현행화)` 라벨 1개 제거. (c)`hidden` 주의문 8개(pb-hidden·wgt-hidden)를 `<!--meta hidden:…-->` 주석 전환. **유지=issue-panel(77개, 리뷰 집계 export-screen-changes 소스·프로토타입 이미 device만 추출)·data-delta 속성·◆ 델타주석 2개(델타 이력)**. 게이트 통과·재빌드·재배포. → **mid-fi 메타 5종 정리 전부 완료**: 화면 노출 메타(P배지·→·◆라벨·hidden) 제거/주석화, 설계 데이터(issue-panel·data-delta) 유지.
