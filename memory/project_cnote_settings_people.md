---
name: project_cnote_settings_people
description: CNOTE CDS 설정담당 세션 — ★설정9+사람6 전량 완료(WORKSTAGE2 정렬). 크롬 이원화·PersonHeroCard·프리11 래퍼흰색·섹션 상대좌표
metadata: 
  node_type: memory
  type: project
  originSessionId: bccc86de-297c-4b84-91df-91629bde597f
---

CNOTE CDS 하네스 "설정담당" 세션(사람 카테고리 담당) 진행 상태(2026-07-08). 병렬=[[reference_cds_parallel_harness]]. 정책 [[project_cds_nav_meta_policy]]. fileKey=OEqJJI0oCGgGZ28exd866d, 페이지 CNOTE·Templets(549:301), 조립존 x4840.

**완료(재빌드 금지·양모드 눈검증·게이트통과)**: 설정 9화면(ACCOUNT/NOTI/PERMISSION/EMAIL/CALENDAR/SMS_CALL/DATA/MEETING/CALL_MEMO) + **사람 6화면 전량**(①PERSON_LIST 메인탭 1945:4122 ②PERSON 1965:4418 ③TODAY_PEOPLE 1999:4612 ④INFO_INCOMPLETE 2010:4642 ⑤NOTE_DETAIL 8프레임 2034:4825 ⑥MEETING_BRIEF 2045:4968). 노드ID 전체=`_cds_claims.json`.

**★위치**: 완료 화면 전부 **WORKSTAGE2 섹션(1954:4909)** 에 2행 정렬 — row1=설정9, row2=사람6. (조립은 x4840 밴드→게이트→WORKSTAGE2 이동. 섹션 자식=상대좌표 [[reference-figma-section-relative-coords]]).

**설정담당 배정 스코프(설정+사람) 완료.** 남은 MVP=소통·미팅흐름(피그마 담당). 새 카테고리 배정 시 동일 하네스 반복.

**핵심 표준(누적)**:
- 크롬 이원화: 메인탭=ScreenBackground 글로우+5탭 BottomNav(active)+FAB / 상세·입력 서브=탭바·글로우 없음·백버튼만(기획② A·사용자확정). mid-fi 리터럴 bottomnav 무시(원칙 우선).
- 히어로/리스트 정본(사용자확정)=**PersonHeroCard(1441:2283)로 1명 강조+내장 "외 N명 더 보기" 접기**(3행 나열 아님).
- 프리플라이트(assembler.md): P11 **모든 깊이 래퍼 프레임 fill 투명**(RAW 흰색 금지·다크 붕괴·CALL_MEMO 사고) / P12 카드 pB=pT=16 / P13 라이트 heavy섀도우 금지 / P4 라이트 글로우 op0.
- 카드류=v1.5 구조컨테이너(정본 부재), 원자=인스턴스, 파운데이션 consume-only. 양모드 이중플립(2:1→2:0·105:1→105:0).
- policyVersion 5 동기화. 파운데이션 큐 대기: 3옵션 세그먼트·Timeline 확장.

**교훈**: [[feedback_visual_verification]] — 텍스트 흐림/색 이상 시 텍스트 fill만 보지 말고 뒤 래퍼/부모 fill까지 실측(CALL_MEMO 래퍼흰색을 거짓양성으로 잘못 기각한 역함정).
