---
name: project_deepnaut_naver_login_ext
description: "★DEEPNAUT 네이버 블로그 자동로그인 크롬확장 — 로그인폼 [패스키 로그인]+[로그인] 두 버튼 함정, 캡차=봇탐지 우회불가·세션유지가 정답"
metadata: 
  node_type: memory
  type: project
  originSessionId: 16f5b3a6-0f22-4d44-9fd8-10a80439ef67
  modified: 2026-07-22T05:30:56.889Z
---

**프로젝트**: `03_projects/260722_DEEPNAUT/03_dev/naver_chrome_extension` (세션 별칭 **딥노트**). MV3 크롬확장 — 네이버 로그인 자동입력 + 블로그 글쓰기 원클릭 진입. 계정=morningx77, blog=finsurelab.

**★근본버그(260722 해결)**: 네이버 로그인폼에 **버튼 2개**가 나란히 있음 — 회색 **[패스키 로그인]** + 초록 **[로그인]**(비밀번호). content.js의 버튼탐색이 `text.includes("로그인")`으로 매칭 → "패스키**로그인**"도 걸려 **패스키 버튼을 클릭** → WebAuthn(`navigator.credentials.get`) 발동 → OS "암호 키 선택" 창 → `login.js [passkey] auth failed NotAllowedError` → 로그인 실패. ID/PW는 정상 채워졌는데 마지막에 엉뚱한 버튼을 눌러 실패한 것.

**수정**: content.js 버튼선택을 `isPasskeyBtn()`(텍스트 "패스키"·className/id의 passkey/webauthn/fido 제외) 필터 + **정확히 `text==="로그인"`인 초록버튼 우선**(4단계 폴백 전부 패스키 제외)으로 교체. 클릭 대상 진단로그 추가. manifest v1.1.1.

**폐기된 오답(fix#1)**: "네이버가 패스키 강제 → passkey-block.js(MAIN world에서 PublicKeyCredential 삭제)"는 **잘못된 가설**. 패스키 차단하니 네이버가 "패스키 로그인에 실패했어요. 다시 시도해 주세요" 에러만 띄우고 비번 폴백 안 함. 진짜 원인은 버튼 오클릭이었음 → passkey-block 삭제·되돌림.

**★캡차(봇탐지)**: 버튼 고친 뒤 비번제출 성공 → 네이버가 "자동입력 방지" 캡차(영수증 총액 계산 등) 띄움. **반복 테스트로 위험점수 급등이 주원인**. 캡차 자동해결은 안 함(우회=계정잠김·ToS위반, 만들어도 기기등록·2차인증 벽 계속). 사람이 1회 풀면 통과.

**★정답 아키텍처 = 세션유지**: 자동로그인은 태생적으로 네이버 봇탐지와 싸움(패스키→캡차→기기등록 벽 연쇄). 안정경로 = **"로그인 상태 유지" 체크로 사람이 가끔 1회 로그인 → NID_AUT/NID_SES 세션쿠키 수주 지속 → 이후 팝업의 "블로그 쓰기 바로가기"(이미 로그인 가정, 캡차 안뜸)로 무한 자동진입**. 팝업 세션배지(로그인됨/필요)가 이걸 위한 장치. 완전 무인로그인이 목표면 확장이 아니라 chrome.debugger/CDP(isTrusted 우회)로 아키텍처 변경 필요.

관련: [[feedback_visual_verification]](눈검증·스크린샷이 원인 특정에 결정적이었음), [[project_chrome_ex]](네이버 자동화 CDP 접근).
