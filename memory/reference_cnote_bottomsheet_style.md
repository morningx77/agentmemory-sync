---
name: reference-cnote-bottomsheet-style
description: CNOTE BottomSheet(1056:362) 시안 통일 스타일 표준 — 전 변종 공통 스펙. 사용자 확정 정본
metadata: 
  node_type: memory
  type: reference
  originSessionId: bccc86de-297c-4b84-91df-91629bde597f
---

CNOTE BottomSheet 컴포넌트세트 **1056:362**(CNOTE·Component 314:2)는 사용자(디자인 오너) 지시로 **시안 스타일 전면 통일**됨(260708, policyV7, 설정담당). 정본 시안=SHEET_CAPTURE_CHOICE. [[reference_cds_harness]] 파운데이션.

**통일 스펙(전 변종 공통·앞으로 신규 BottomSheet도 준수)**:
- 컨테이너: fill=color/surface(2:13) **순백**(틴트/파랑 금지)·top corner radius **20**(tl=tr=20)·padding **14/18/28/18**·itemSpacing **12**·VERTICAL·counterAxisAlignItems=**CENTER**·width 360. explicitVariableMode 미설정(라이트 기본·인스턴스 상속).
- 핸들: 40x4 r2, fill=color/border(2:20), 상단 중앙.
- 타이틀: **18 Bold CENTER**, text-primary(2:16). 서브/설명: **13 Medium CENTER**, text-secondary(2:17).
- 액션 버튼: **풀폭(FILL)·h55·r4**, 컴포넌트 [Primary=300:3 / Outline=300:19 / Ghost(취소·닫기)=681:2 / Danger=1235:128], 텍스트 14 Medium.
- **OR 선택지(상호배타) = Radio(363:31 off/363:32 on) + 라벨** 행, 상하 충분한 여백. (aftercontact·private-person·connect-source·fix-relation-link·card-actions·cadence)
- **action-menu(note-menu) = 아이콘+라벨 중앙정렬 풀폭 버튼**(공유=ShareNetwork44:5813/PDF=FilePdf44:45384 Outline·삭제=Trash44:49782 Danger 흰라벨105:11·취소 Ghost).
- confirm(source-delete/source-manage/delegate/note-delete): 타겟박스·경고(danger 2:34 중앙) 보존 + 위 셸/버튼 통일.
- 신규 변종 **capture-sheet**(2065:5048, group=action-choice)=음성녹음(Primary)/텍스트로·명함으로(Outline)/닫기(Ghost).

**함정**: ①시트 인스턴스는 화면 하단 오버레이면 마스터 높이변경 시 y 재정렬 필요(y=wrapperH-sheetH). ②구 인스턴스에 수동 아이콘 오버레이 넣었으면 마스터 개선 후 고아 제거. ③변수조회 FULL id("VariableID:2:13"). ④danger 버튼 흰 라벨이 red-on-red로 안 보이는 듯해도 소형 크롭 오독 주의([[feedback-visual-verification]]—재확인 후 판정). ⑤gap12·r20은 정확 토큰 부재로 raw(시안 정본도 raw).
