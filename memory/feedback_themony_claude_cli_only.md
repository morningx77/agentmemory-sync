---
name: themony-claude-cli-only
description: THEMONY 자동포스팅의 Claude 호출은 API(SDK+키)가 아닌 claude CLI(구독)로 — API 과금 금지
metadata: 
  node_type: memory
  type: feedback
  originSessionId: f7cab873-9bfb-4d06-824d-c00b89223abf
---

THEMONY 자동 포스팅(gov/mrt/coupang)의 모든 Claude 호출은 `claude -p` CLI(구독 요금)로 해야 한다. Anthropic SDK+API 키 호출 금지.

**Why:** API는 토큰당 과금. 사용자는 Max 구독이라 CLI 호출은 추가 비용 0. 260703 이전 코드는 SDK+키(mrt·coupang claude_generator에 하드코딩, gov는 gov_collector의 load_dotenv 부수효과로 env 키 로드)로 매일 과금 중이었고, 사용자가 CLI 전환을 지시함.

**How to apply:** `03_dev/harness/cli_client.py` 사용 — `cli_json()`(생성·심사), `install_anthropic_shim()`(sys.modules['anthropic'] 자체를 CLI 심으로 교체, harness import 시 자동 실행). ⚠️ 함정: content_strategist·post_generator는 **함수 내부에서 `import anthropic`**를 하므로 모듈 전역만 바꾸는 patch_sdk_module로는 우회 안 됨 → 반드시 sys.modules 교체 방식(install_anthropic_shim)을 v1 모듈 import 전에 걸어야 실제 API 과금이 차단됨. 훅 오염 방지: 워크스페이스 밖 중립 cwd + JSON 강제 + 필수 키 검증 재시도, 실행 env에서 ANTHROPIC_API_KEY 제거. CLI는 구독이므로 생성 모델 기본 sonnet. 관련: [[project-themony-harness-v2]]
