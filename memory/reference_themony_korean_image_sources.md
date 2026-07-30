---
name: reference-themony-korean-image-sources
description: THEMONY 콘텐츠용 한국인/시니어 인물사진을 구할 때 쓸 무료 이미지 소스 비교 및 팁
metadata: 
  node_type: memory
  type: reference
  originSessionId: 2d769983-1263-48d4-a3cb-24676a48ec5c
---

THEMONY(themony.com) 블로그/계산기 페이지에 들어갈 인물사진(특히 "한국인 시니어" 같은 특정 인종·연령 조건)을 찾을 때 참고.

- **Pixabay**: "korean"으로 검색하면 김치·불고기 등 음식 사진만 잔뜩 나옴. "asian elderly/senior" 계열도 베트남(논라 전통모자)·태국·인도 사람이 대부분이라 한국인 대체용으로 부적합한 경우가 많음. 인물 다양성이 약함.
- **Pexels**: 인물 다양성이 Pixabay보다 훨씬 좋음. "korean senior", "seoul elderly" 등으로 검색하면 실제 서울·수원 등 한국 현지에서 촬영된 사진(alt 텍스트에 지명 명시)이 다수 나옴 — 시니어 관련해서는 Pexels를 먼저 시도할 것. API 키는 [[reference_api_keys]] 참조(03_projects/000000_INFO/API_KEYS.md, 무료 월 20,000건, 저작자 표시 불필요·상업적 이용 가능). 요청 시 User-Agent 헤더 필수(없으면 Cloudflare가 403 "error code 1010"으로 차단함).
- **지디웹 나눔무료이미지** (https://www.gdweb.co.kr/sharing/index.asp) — 사용자가 260714 직접 제공한 리소스. "자유롭게 사용 가능"이라고 안내받음. 아직 실제 스크래핑/구조 확인은 안 해봄 — 다음에 한국 특화 이미지 필요할 때 이것도 시도해볼 것.

**팁**: 시니어 인물사진 요청 시 "밝은 표정"을 원하면 Pexels에서 "seoul elderly smiling park", "korean senior citizen happy" 같은 지명+감정 조합 검색이 잘 먹힘 (예: 서울 공원 벤치에 앉아 엄지척하는 시니어 그룹 사진, 수원 자전거 타는 시니어 사진 등 실제 성공 사례 있음 — post 57 보험 상담 안내 글에 적용됨).
