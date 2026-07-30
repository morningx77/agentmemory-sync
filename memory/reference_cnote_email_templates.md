---
name: reference_cnote_email_templates
description: CNOTE 트랜잭션 이메일 템플릿 — 공통 OTP 인증폼 위치·구조·재사용 범위
metadata: 
  node_type: memory
  type: reference
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-20T07:09:19.473Z
---

CNOTE 트랜잭션 이메일(앱 화면 SCR_* 아님·별도 산출물). 정본 위치 **`02_design/email_templates/`**.

**공통 OTP 인증폼** = `cnote_email_otp_verify.html`. 현대차 Pleos Account 인증메일 table 레이아웃 계승(이메일 클라이언트 호환·인라인스타일·시스템 폰트스택), 브랜드만 교체: 헤더 워드마크=**CNOTE**(배경 primary `#4127D1` 흰 텍스트), 푸터 저작권=**© Ispark**. 불릿=CSS 원(`#6549FF`, 구형 Outlook은 사각 폴백 허용).

★**M1~M3 공통 커버**(하나의 폼): ①회원가입 인증(SCR_SIGNUP_VERIFY) ②재전송(BTN_RESEND_CODE) ③이메일 변경(SCR_SETTINGS_ACCOUNT/EMAIL). 6자리 코드·10분 유효.

**치환 변수**(파일 상단 주석 명시): `SERVICE_NAME`·`GUIDE_TEXT`(목적별 안내문)·`CODE`·`VALID_MINUTES`·`EXPIRE_AT`(UTC+9)·`COMPANY`. 로고 이미지 확정 시 헤더 `<span>` 워드마크→`<img src>` 배너 교체.

**미제작(보류)**: M4 비서초대(SCR_DELEGATE_INVITE, IA 행40 "초대장 이메일 전송")=버튼/링크형 변형. M5 비번재설정·M6 환영·M7 보안알림=IA 근거 없는 관례 확장. 사용자 결정=OTP만(260720).

**IA 반영**: `CNOTE_IA_v2_draft_260616.xlsx` 행89 신규 유형 "메일"·그룹 "⓪ 공통(트랜잭션 메일)" — 화면ID **`SCR_MAIL_OTP_VERIFY`**(★validate-data가 screen ID에 `^SCR_` 강제→SCR_ 접두어 필수, MAIL_ 단독 불가). 발송 트리거 감사 지점=SIGNUP_VERIFY·DELEGATE_INVITE·SETTINGS_EMAIL. 브랜드 팔레트는 [[project_cnote_palette_violet_gold]].

**⓪ 공통 카테고리(파이프라인 표준)**: 앱 화면(SCR_) 외 공통·트랜잭션 산출물의 표준 자리. lo-fi `1lofi_00_common.html`·mid-fi `2midfi_00_common.html`(phone 프레임 안 반응형 이메일=모바일 뷰)·flows `common` 그룹(⓪, 맨 앞)·prototype 자동추출. ★신규 midfi는 `.deploy.local.json` sftp.targets.midfi.files에 추가해야 배포. 앞으로 공통화면(약관·안내메일 등)도 여기 편입.
