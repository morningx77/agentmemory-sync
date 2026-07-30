---
name: project_cnote_dynamiclayer_library
description: CNOTE 디자인 레퍼런스 — Dynamic Layer 컴포넌트 라이브러리 로컬 사전(40+21)
metadata: 
  node_type: memory
  type: project
  originSessionId: 3881ad54-4586-461b-a1a3-e2a5dabeec12
---

dynamiclayer.io/docs 의 디자인시스템을 로컬에 구조화한 참고용 사전을 구축했다(2026-06-23 수집).

위치: `03_projects/260610_C-Level_note/02_design/component_library_dynamiclayer/`
- `README.md` — 카테고리별 인덱스 + AI 사용 가이드(진입점)
- `01_components/*.md` 컴포넌트 40종 (props/variants/state + Figma·SwiftUI·Compose·Flutter 코드)
- `02_foundations/*.md` 파운데이션/토큰 21종 (colors·typography·spacing·shadow·dark-mode 등)
- `manifest.json` 머신 인덱스, `_scraper.py`(curl+pandoc 재수집)·`_build_index.py`(README 재생성)

활용 원칙: 원본 API는 Flutter(`Dl*` prefix) 위주 → React/Storybook 1:1 이식이 아니라 구조·네이밍·variant 설계 레퍼런스로 사용.
CNOTE 정본 화면은 [[project_cnote_ia_source_of_truth]], 컴포넌트 동기화는 [[project_cnote_figma_storybook_sync]] 참조.
