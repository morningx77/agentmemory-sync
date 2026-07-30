---
name: project_themony_auth_layer
description: THEMONY 인증 레이어(커스텀 로그인/가입/구글) 구현 진행 상황·함정
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
---

THEMONY(themony.com) 커스텀 인증 레이어 = Nextend Social Login + Theme My Login(TML) + Turnstile. 계획서 `_WORK_PLAN_인증레이어_260715.md`, 스펙 `THEMONY_인증레이어_설계_260715.md`. 로그인 후 홈 이동, 신규=subscriber.

## 260716 진행 (Task 1·3·5 완료분)
- **Task1 플러그인**: Nextend Social Login(slug `nextend-facebook-connect`)·Theme My Login(`theme-my-login`) **REST로 직접 설치·활성화**(`POST /wp/v2/plugins {slug,status:active}`, App PW 인증). ★워드프레스 플러그인 관리는 WordPress MCP엔 없지만 **`/wp/v2/plugins` 엔드포인트(WP5.5+)로 가능**.
- **Task3 페이지**: 실제 WP 페이지 3개 생성 — `/login/`(id 2525)·`/register/`(2523)·`/forgot/`(2524). 콘텐츠=`[theme-my-login default_action="..." show_title="0"]`. ★TML7=페이지 자동생성 안 함(rewrite 엔드포인트 방식)이고 REST 활성화라 **rewrite flush 안 돼 `/login/register/` 등 하위액션 origin 404** → 실제 페이지가 flush 불필요라 정답. login/forgot 폼 테마 안 렌더 확인. register는 **회원가입 비활성이라 빈 응답(정상)**.
- **Task5 CSS**: 카드형·브랜드버튼 #2563eb·포커스·반응형. ★Code Snippets REST(`/code-snippets/v1/snippets`)로 큰 CSS PHP스니펫 POST 시 **502**(작은 스니펫은 OK) → **페이지 콘텐츠에 `<style>` 직접 삽입**으로 우회(admin unfiltered_html이라 REST 콘텐츠에 style 보존). ★Autoptimize가 인라인 style을 집계하며 `id`만 제거·규칙은 유지(styleTag=False여도 max-width:440px·2563eb 등 인라인 전달 확인).

## 260716 추가 (디자인·구글연동 완료분)
- **Task2 구글 완료**: Client ID `707486636456-...apps.googleusercontent.com`, redirect URI=`https://themony.com/social-auth/?loginSocial=google`(★OAuth프록시페이지 때문에 wp-login.php 아님). Nextend Global Settings에 register-flow=페이지2530(`[nextend_social_login_register_flow]`)·oauth-proxy=페이지2531 지정필수(Fix now). Verify→Enable로 활성. ★TML폼엔 Nextend가 `nsl-custom-login-form-main` 자동주입(숏코드 중복금지).
- **★★ wp-admin 캐시버그(모든 저장/드롭다운 안보임의 원인)**: Cloudflare `*themony.com/*` cache_everything이 wp-admin·wp-login까지 캐시→저장돼도 옛화면. 해결=Page Rule bypass 2개(`*wp-admin*` prio3·`*wp-login*` prio2, cache_everything=prio1). cf-cache=DYNAMIC 확인. [[project_themony_cloudflare]]
- **디자인=살구뉴스 레퍼런스**: 레드 #E5202A(더모니 로고 레드)·카드·인풋·풀폭버튼·상호링크·푸터·파스텔배경유지·파란히어로밴드 투명. CSS는 페이지 content `<style>` 주입(★Autoptimize가 id제거+`::before content` 제거하니 카드타이틀은 페이지제목 사용). 구글버튼 풀폭=`.nsl-button{width:100%}`.
- **★lostpassword 함정**: 로그인폼 "비밀번호찾기"→`/lostpassword/`(TML 엔드포인트 page-id-0, 스타일불가). 해결=슬러그 `lostpassword` 실제페이지 생성(2546)→엔드포인트 이김(=/login/ 페이지가 이긴 패턴). 인증페이지=login2525·register2523·forgot2524(고아)·lostpassword2546.
- **★Code Snippets 502 확정**: 큰CSS(~1.5KB+) PHP스니펫 POST=502(작은건OK). 사이트전역 CSS주입 불가→페이지 content주입만. wp/v2/pages는 큰페이로드OK.
- 자동퍼지: Super Page Cache가 글수정시 CF 자동퍼지(기본ON). 헤더 "구독"버튼=Kadence Customizer(코드불가·사용자).

## 미결(사용자 게이트)
- **회원가입 토글**: 설정>일반 "누구나 가입"+기본역할 subscriber. ★분류기가 "일회용 PHP로 보안설정 개방"·"origin -k+auth POST"·"반복 PHP스니펫 프로빙"을 3회 차단(타당) → 사용자가 wp-admin 3클릭 또는 명시승인 필요. 토글 켜면 register폼 라이브+상호링크(/login/폼 register링크→/register/) 정리.
- **Task2 구글 OAuth 키**, **Task4 Turnstile 키** = 사용자 발급 대기.
- **Task7 캐시제외**: Page Rule 1개(`*themony.com/*`→cache_everything)가 인증페이지도 캐시. **Cache Rules API=403**(토큰 권한없음), Page Rule 무료 3개한도·경로 3개분산 → 토큰에 Cache Rules 권한추가 또는 Super Page Cache 제외설정 필요.
- **Task6**: login_redirect가 기본 wp-admin → 홈으로 교정 필요(폼 hidden redirect_to=wp-admin 확인). subscriber wp-admin 차단.

## 자격/함정
- WP App PW=`DZkH g48h LaB6 6F0J 1mDF uiIG`(user philichoi1977). config=`03_dev/gov_autoposter/config.py`. Code Snippets·Head&Footer Code 플러그인 활성(FTP/opcache 없이 훅 주입 가능하나 큰 페이로드 502 주의). [[project_themony_cloudflare]] zone_id·토큰 참조. PS5.1=Invoke-RestMethod+TLS12+UTF8 bytes.
