---
name: reference-cnote-screen-links
description: CNOTE 프로토타입 화면별 Figma·스토리북 링크(추적 허브) — ID명 규칙 자동매핑
metadata: 
  node_type: memory
  type: reference
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
---

CNOTE 프로토타입 우측 패널에 화면별 🎨Figma·📚Storybook 링크(추적 허브: 기획→화면설계→디자인→컴포넌트). 2026-06-26 구축.

- 데이터: `data/_screen_links.json` — `figma{fileUrl, nodes{SCR_X: "node-id"}}` · `storybook{base, stories[]}`.
- **스토리북**: ID 규칙 자동변환 `SCR_X|state → pages-{scr-x}--{state}`(SCR_ 유지·소문자·`_`→`-`, normal=default). 즉 스토리 title=`Pages/SCR_HOME` → `pages-scr-home--default`(프로토타입·Figma·스토리북 ID 전부 SCR_X로 통일). `storybook.stories` 목록(sync-links가 `index.json`에서 추출)에 있는 화면만 활성.
- **Figma**: 프레임 이름 = 화면 ID(`SCR_X`) 규칙. MCP `get_metadata(fileKey, nodeId)`로 SCR_ 프레임 node-id 자동 추출 → `nodes` 기록. 둘 다 "있으면 활성, 없으면 흐림(.slink.off)".
- 빌더: `build_prototype.mjs`가 `/*SCREEN_LINKS*/` 주입 + memoScr 다음 `#screenLinks` 렌더(변환은 클라 JS). CSS `.slink`/`.slink.off`.
- **Figma CDS**: fileKey `OEqJJI0oCGgGZ28exd866d`. 페이지=Cover(0:1) 단일, 그 안 섹션. **정본=550 영역**(SCR_SIGNUP=550-302). 258-2 섹션엔 기존 SCR_ 37개(미사용). "Figma 매핑 갱신"=MCP로 550 섹션 SCR_ 프레임 스캔→nodes 자동 채움.
- 스토리북 base=`https://next.sgate.biz/v1/design/storybook` (deploy-sftp `storybook` 타겟 → /upload/storybook).

**자동 갱신(권장)**: `scripts/sync-links.mjs` — Figma REST API(`.deploy.local.json`의 `figma.token`)로 CDS 전체에서 SCR_ 프레임 node-id 추출 + 스토리북 `{base}/index.json`에서 pages-* 스토리 → `_screen_links.json` 자동 갱신. "링크 갱신해줘"(sync-links + build). MCP 수동 스캔·URL 복사 불필요. **정본 페이지 필터**: `figma.page="📱Templets"`(공유용)만 스캔, `📱Templets-초안`은 제외(같은 SCR_HOME 중복 방지). CDS 페이지=Cover·Design System·Screens·Components·📱Templets-초안·📱Templets 등 다수. 현재 정본 2개(SCR_HOME 550-385·SCR_SIGNUP 550-302) — 공유용 페이지에 화면 추가 후 재실행하면 자동 매핑.
- (대안) MCP get_metadata(fileKey, nodeId)로 개별 스캔도 가능.

[[reference-cnote-ops]] [[project-cnote-screen-changes]]
