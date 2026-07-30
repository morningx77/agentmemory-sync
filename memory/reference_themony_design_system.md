---
name: reference_themony_design_system
description: THEMONY 디자인 레퍼런스 = tworld.co.kr(SKT). 앞으로 모든 디자인 페이지에 이 느낌 반영
metadata: 
  node_type: memory
  type: reference
  originSessionId: 63c9e211-8ced-483f-97b7-62165ccf21bd
---

**THEMONY 디자인 정본 레퍼런스 = tworld.co.kr (SKT, renewal 디자인)**. 사용자 지시(2026-07-07): "앞으로 디자인 페이지는 모두 해당 사이트를 레퍼런스로 디자인 느낌 반영". 관련: [[project_themony_calculators_ux]].

**Tworld에서 추출한 토큰(renewal_common.css 실측)** — 이걸 THEMONY 디자인에 적용:
- **여백/간격(핵심·사용자 강조)**: 넉넉·정돈. 섹션 패딩 ~36, 섹션 마진 30~72, 컴포넌트 16~24, 필드 간 18~20. (빽빽함 금지)
- **타이포 스케일(큼)**: 본문 16, 캡션 12~14, 소제목 18~20, 제목 24~30(+48까지), 결과/핵심 숫자는 히어로(28~30). 행간 1.6~1.75. 폰트=system + **Noto Sans KR**.
- **코너 = 샤프 2px**(Tworld 시그니처, 사용자 채택 Q2-a). 둥근 라운드 지양.
- **그레이 스케일**: 텍스트 잉크 **#35343c**(따뜻한 근검정), 뮤트 #666666·#909090, 보더 #e6e6e6·#d9d9d9, 배경 #f5f5f7·#f4f4f4.
- **그림자 = 절제**: `0 5px 15px rgba(0,0,0,.06)`(카드). 과한 그림자 금지.
- **경고색**: #ff404e(레드) 계열.

**★브랜드색은 Tworld 퍼플(#3617ce) 대신 THEMONY 파랑 #2563eb/#1d4ed8 유지**(사용자 결정 Q1-b — 여백·타이포·그레이만 가져오고 브랜드색은 THEMONY). 즉 "룩앤필(여백·타이포·그레이·샤프·그림자)"은 Tworld, "브랜드 accent"는 THEMONY 파랑.

**적용 완료 1호**: 계산기 12종 + 허브(891) `calculator_base.css`·`hub.html`에 반영·배포(2026-07-07). 이후 신규 디자인 페이지도 동일 토큰 적용.
