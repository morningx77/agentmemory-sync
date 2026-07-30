---
name: reference_api_keys
description: 전 세션 공통 API 키 레지스트리 위치 및 주요 키 요약
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4d194bdc-7af1-4509-b5db-9275add71ef1
---

# API 키 중앙 레지스트리

**정본 파일**: `03_projects/000000_INFO/API_KEYS.md`

새 세션에서 API 키가 필요하면 반드시 이 파일을 먼저 열어 확인한다.

## 주요 키 요약

| 서비스 | 키/값 |
|---|---|
| 네이버 Client ID | `478i_m9D_J6jNUc_3Jlj` |
| 네이버 Client Secret | `ZBy38DKO2h` |
| Pixabay API Key | `54734773-088e51dd1d891716abda5f3d1` |
| Gemini API Key | `AIzaSyA4depdezS-r-8MSqaigUfSKYLJg6L90Yw` |
| WordPress (themony.com) App PW | `DZkH g48h LaB6 6F0J 1mDF uiIG` |
| 쿠팡 파트너 코드 | `AF6035118` |
| Anthropic API Key | `sk-ant-api03-JnGFGECwkVgNiKVog0u5kLx0h1...` (전체는 정본 파일) |
| Supabase DB URL | `postgresql://postgres.wezlfbzroccsryepytat:...` (전체는 정본 파일) |

## 원본 env 파일 위치

```
03_projects/260627_THEMONY_MCP/03_dev/260220_BLOG_AUTO_V2/personal/env.txt
```

**Why:** 키가 여러 프로젝트에 흩어져 있어 세션마다 찾는 데 시간이 낭비됨.  
**How to apply:** 새 세션에서 키 질문 시 정본 파일 경로를 먼저 안내하고, 직접 키 값이 필요하면 파일을 Read한다.
