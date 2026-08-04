---
name: project_cnote_delegate_role_split
description: CNOTE 비서 위임 역할 분리·계정 모델(v0.16.0·MVP2 C-1)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-08-04T00:12:37.757Z
---

★260804 v0.16.0 [MVP2 C-1] **비서 위임 역할 분리·계정 모델 정돈**. delegate(2midfi_06_delegate.html·`이후`/2차 스테이지) 검토 중 발견한 역할 혼재·미확정 5건 확정. 정본=`01_docs/기획/비서위임_역할분리_설계_v0.1_260804.md`. [[project_cnote_mvp2_ia_audit]] 동료·위임 통합 모델 D4 보강.

**계정 모델(사용자 확정)**: 단일 계정·**다중 컨텍스트** — 비서도 앱 일반 사용자(본인 홈 보유), 위임받으면 **본인↔비서 모드 전환**(별도 로그인 아님). 전환 진입=**마이 컨텍스트 스위처**. **대표:비서=1:N**(데이터·구조 처음부터 1:N 전제·리스트). 비서→1대표(MVP). 비서→N대표·다중조직·담당배분=후행.

**역할 분리(현 mid-fi 혼재 해소)**: 초대·비서관리·완료승인·맡기기=**대표측**. 비서모드(비서 nav)=큐·받은요청·처리·활동. **비서는 초대 안 함.**

**반영 5건**:
- **신규 SCR_DELEGATE_MANAGE**(대표측 위임·비서 관리 허브·대표 nav): 확인 대기(→SCR_CONFIRM_INBOX)·내 비서 목록 N명(활성/초대중)·[비서 초대](→INVITE).
- SCR_DELEGATE_HOME: '비서 초대' 버튼 제거·'순차 처리 시작'.
- SCR_CONFIRM_INBOX: 체크 선택→"선택 N건 승인"(일괄)+행 탭 상세 단건. 필터=필터전용·섹션=상태그룹.
- SCR_DELEGATE_INBOX: "처리 시작"→"순차 처리 시작"(비서 일=건별·일괄 아님).
- SCR_DELEGATE_INVITE: 권한 '업무 완료 보고'(필수 규약·항상ON) 제거→안내문구("✓ 완료 시 자동 보고 기본 규약"). 진짜 선택권한 '**자동 발송 권한**'(고신뢰 비서·대표 승인 없이 발송) 대체. 비서 nav→대표 nav. **권한 축=작업 범위+승인 수준**.

**v0.16.1 재정렬+전환화면**: delegate 파일 화면 순서=**대표 시점(MANAGE·INVITE·CONFIRM_INBOX·ACTIVITY·BS_DELEGATE_CONFIRM)→비서 시점(ACCOUNT_SWITCH·DELEGATE_HOME·DELEGATE_INBOX·TASK_DETAIL)** 그룹 정렬(████ 배너). **신규 SCR_ACCOUNT_SWITCH**=비서 본인 마이 컨텍스트 스위처("내 모드·이소연 ↔ 비서 모드·김도현 대표 보좌"·OPT_MY_MODE/OPT_DELEGATE_MODE→SCR_DELEGATE_HOME). 앞서 모델만 있고 빠졌던 전환 화면 보강.

**주의**: delegate=`이후`(2차)라 프로토타입/flows 미포함(1차 억지 배선 금지). ★**실제 1차 진입 배선(설정/마이→위임관리·마이 비서모드 스위처)·device 반영=2차 개발 착수 시**. 지금은 mid-fi/설계 정본화. 게이트 회귀0·눈검증 5화면 PASS.
