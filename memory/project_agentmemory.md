---
name: project-agentmemory
description: agentmemory 설치 현황 + ★사고 2건(260813 미영속·260903 좀비행+cwd상속)·판별식·복구. 보조 기억이지 1차 사료 아님
metadata: 
  node_type: memory
  type: project
  originSessionId: 0979483c-0fe2-4450-9354-df9925c6f50a
  modified: 2026-09-03T01:50:43.768Z
---

워크스페이스에 **agentmemory**(rohitg00/agentmemory v0.9.27)를 설치해 Claude Code 작업을 자동 기록한다. 2026-06-17 설치.

**구성**
- CLI: `@agentmemory/agentmemory` (npm 전역) · 엔진 `iii.exe` → `~/.local/bin/iii.exe`
- 데몬: REST `:3111` · Viewer `:3113` · 엔진 ws `:49134`. **프로필 무관 단일 프로세스** — 회사·개인 창이 전부 같은 서버를 본다(계정 바꿔도 보이는 내용 동일)
- 자동시작: 작업 스케줄러 **`AgentMemory-Daemon`** → `~/.agentmemory/start-daemon.ps1`
- 백업: 작업 스케줄러 **`agentmemory-sync`** → `260610_ISPARK/.agentmemory-sync/exports/` 에 **30분마다 전체 JSON 덤프**

## ★★260813 전량 유실 사고 — 사실상 한 번도 영속된 적이 없었다

**증상**: 09:27 데몬 재시작 후 전 세션이 과거 맥락을 못 찾음. `lessons 0` · 6월~8/12 데이터 전무.

**근본 원인 3단**
1. 예약작업 `AgentMemory-Daemon` 의 **`WorkingDirectory` 공란** → cwd = `C:\Windows\System32`
2. `start-daemon.ps1` 의 `Start-Process` 에 **`-WorkingDirectory` 없음** → 자식 node 가 그대로 상속
3. `dist/iii-config.yaml` 의 **상대경로** `file_path: ./data/state_store.db` → `C:\Windows\System32\data\` 로 해석(부재 확인) → 미영속

★**즉 "쓰던 걸 잃은" 게 아니라 처음부터 안 쌓였다.** 데몬 살아 있는 동안만 유지.

**판별식(재발 시 이대로)**: ⓐ`health.uptimeSeconds` 와 **데이터 최초 시각이 일치**하면 미영속 ⓑ`memory_timeline(과거일)` → `anchorIndex 0` ⓒ`memory_diagnose` → **lessons 0**·summaries/semantic/procedural 전부 0 ⓓ `dir /s /b state_store.db` 로 저장소 실재 확인

**조치**: 예약작업 `WorkingDirectory = %USERPROFILE%\.agentmemory` **적용됨**(→ `~/.agentmemory/data/state_store.db` 에 기록 시작 확인).
★**복구 순서 불변**: 영속화 → 재시작 → **재시작 2회 생존 검증** → `POST /agentmemory/import` → 재검증. **검증 없이 import 하면 "고쳤다"고 믿게 만드는 최악**.

## ★★260903 — 두 번째 사고. 예고된 잔여가 그대로 터졌다

이 문서가 *"잔여: start-daemon.ps1 미보강 — 다른 cwd 에서 수동 기동하면 재발한다"* 라고 적어둔 그것을, **복구하러 들어간 세션이 직접 밟았다.**

**증상**: `memory_sessions`·`memory_audit`·`memory_recall` **전부 빈 결과**인데 디스크엔 29.5MB·166파일이 멀쩡히 있음.

### 실패모드 A — 좀비 행(hang) · ★260813과 다른 새 유형
- 데몬(111시간)이 **포트 3111/3112/3113을 LISTEN 한 채 응답만 안 함**. 3113→502, 3111→연결거부
- 원인: `Summarize chunk parse failed` → `too_many_chunks_skipped` **무한 재시도**가 엔진을 물고 늘어짐(noop provider 정책의 부작용)
- ★**증폭 장치** = `start-daemon.ps1` 의 가드가 `Test-NetConnection 3111 -Quiet` 였다. **LISTEN이면 "이미 정상"으로 보고 exit 0** → 좀비가 재기동을 3일간 막았다
- **마지막 정상 기록 08-31 07:44 → 3일치 관측 유실**(파일 자료는 무사)

### 실패모드 B — cwd 상속 (260813 메커니즘 재현)
- 복구하려고 `start-daemon.ps1` 을 `260610_ISPARK` cwd 에서 실행 → `./data/` 상대경로가 **거기 빈 저장소를 새로 만듦** → `/memories total=0`
- ★**"재시작했더니 데이터가 사라졌다"의 정체가 이것**이다. 정본은 늘 그대로 있다

### ★판별식 (260903 추가)
- **LISTEN ≠ 정상.** 반드시 `curl http://127.0.0.1:3113/health` 로 **응답**을 본다
- 데이터 실재는 `GET :3113/memories`(`total`)·`GET :3113/sessions`(건수)로. 정상값 기준 **memories 45 · sessions 122**(260903 시점)
- 저장소가 갈라졌는지: `Test-Path <cwd>\data\state_store.db` — 정본 밖에 있으면 cwd 사고

### 조치(완료)
1. `data/` 백업 → `C:\Users\yscho\agentmemory-backup-260903.zip` (4.8MB·171엔트리)
2. 좀비 종료 → 잘못 생긴 `260610_ISPARK\data` **격리**(`_data_잘못생성_260903`)
3. **cwd = `~/.agentmemory` 고정**해 재기동 → memories 45·sessions 122 복구 확인
4. ★**`start-daemon.ps1` 보강**(잔여 해소) — ⓐ`-WorkingDirectory $AM` 고정 ⓑ가드를 **LISTEN → `/health` 응답**으로 교체 ⓒ무응답이면 좀비 정리 후 재기동. 구버전 = `start-daemon.ps1.bak-260813`
   ※한글 주석이 들어가므로 **UTF-8 BOM 필수**([[reference-ps51-bom]])

**관할 = `vs마스터`** (260813 사용자 판정). 개인 세션은 데몬·예약작업에 접근하지 않는다.

## ★agentmemory 는 보조 기억이다

사고에도 **직전일 작업 상태가 무손실 복원**됐다. 복원해 준 것은 **협업 저널·배분대장·트랜스크립트·git**. → 루트 `CLAUDE.md` 세션시작 절차에 **④ 저장소사고 판별 + 1차 사료 폴백**을 명문화했다(260813). ★*"recall 이 비면 조용히 넘어간다"* 는 규칙이 **사고를 정상으로 위장**했던 것이 개정 사유.

**주의**
- LLM 압축은 **의도적으로 OFF**(API 키 없음·noop provider·BM25 only). ★따라서 `mem::summarize` 실패 카운트가 쌓이는 것은 **결함이 아니라 이 정책의 부작용**이다 — 세션 요약이 안 생기는 것도 설계대로. 켜려면 `~/.agentmemory/.env` 에 키. **`AGENTMEMORY_ALLOW_AGENT_SDK` 는 무한 재귀 위험으로 금지**
- hook 은 세션 시작 시 로드 → 플러그인 변경 후 **Claude Code 재시작해야 캡처**
- 관련: [[project-workspace-automation]] · [[reference-claude-profile-split-company-personal]]
