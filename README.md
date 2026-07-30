# agentmemory-sync

회사 PC의 **agentmemory 작업 기록**을 GitHub 비공개 저장소로 주기 동기화하여, **집(또는 다른 PC)에서 검토**하기 위한 저장소입니다.

> 예: 집에서 "회사 기획 클로드가 오늘 아침 OOO 작업한 내역 확인해줘" → 로컬 Claude가 동기화된 기록을 읽어 요약.

---

## 1. 개념 (왜 이 방식인가)

- **agentmemory는 로컬 서버**(localhost:3111, iii 엔진)로 동작하고 데이터는 **계정이 아니라 PC에 저장**됩니다. → 다른 PC에서 이어 보려면 데이터를 옮겨야 합니다.
- agentmemory에는 **import(복원) 도구가 없고** 스냅샷도 기본 비활성입니다. 그래서 **`export`(JSON)를 GitHub에 쌓아두고, 검토하는 PC에서 그 JSON을 직접 읽는 방식**(=방식1)이 가장 견고합니다.
- `mesh_sync`(P2P)는 두 PC가 항상 켜져·연결돼 있어야 하므로 "회사 PC가 꺼져 있어도 검토" 요건에 맞지 않아 제외했습니다.

**동기화 흐름**
```
[회사 PC]  세션 종료 시 / 30분마다
  ① GET localhost:3111/agentmemory/export  → exports/am_export_<시각>.json (누적)
  ② ~/.claude/projects/<project>/memory/*   → memory/ (미러)
  ③ git commit + push
        │  GitHub 비공개 repo (morningx77/agentmemory-sync)
        ▼
[집 PC]   git pull → Claude가 exports/·memory/ 를 읽어 별칭·날짜로 조회
```

---

## 2. 저장소 구조

| 경로 | 설명 |
|---|---|
| `exports/` | `agentmemory export` 결과 JSON (파일명에 시각, 누적 저장) |
| `memory/` | Claude 네이티브 장기기억 미러 (`MEMORY.md` + `*.md`) |
| `sync-push.ps1` | export + memory 미러 + commit + push (회사 PC 실행 본체) |
| `install-automation.ps1` | SessionEnd 훅 + 30분 스케줄러 등록 (1회 설치) |
| `_install_hook.py` | `install-automation.ps1`이 호출 — settings.json에 SessionEnd 훅 추가 |
| `README.md` | 이 문서 |

> export JSON 1건 ≈ 수십 KB. 오래된 파일은 필요 시 주기적으로 정리(prune)하세요.

---

## 3. 회사 PC 설치 (송신 측 — 처음부터)

### 3-1. 사전 준비
- Git 설치 · agentmemory 데몬 실행 중(localhost:3111) · Python(선택, 훅 설치용).
- 개인 GitHub 계정에 **비공개 repo** `agentmemory-sync` 생성.
- **Fine-grained PAT** 발급: 대상 repo 1개만 / **Contents = Read and write**.

### 3-2. 로컬 저장소 연결
```powershell
cd "C:\Users\yscho\260610_ISPARK\.agentmemory-sync"
git init -b main
git config user.name  "morningx77"
git config user.email "morningx77@users.noreply.github.com"   # 개인 신원(로컬 한정)
git add -A
git commit -m "init: agentmemory-sync"
git remote add origin "https://<PAT>@github.com/morningx77/agentmemory-sync.git"
git push -u origin main
```
> `<PAT>` 자리에 발급한 토큰을 넣습니다. 토큰은 로컬 `.git/config`에만 저장되고 커밋되지 않습니다.

### 3-3. 첫 동기화 검증
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\yscho\260610_ISPARK\.agentmemory-sync\sync-push.ps1"
```
→ GitHub에서 `exports/`·`memory/`가 올라왔는지 확인.

### 3-4. 자동화 등록 (1회)
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\yscho\260610_ISPARK\.agentmemory-sync\install-automation.ps1"
```
- **SessionEnd 훅**: Claude 세션 종료마다 자동 동기화 (분리 프로세스로 실행 → 종료 지연 없음).
- **Task Scheduler `agentmemory-sync`**: 30분 간격 안전망.
- ⚠️ **훅은 Claude Code 재시작 후부터 적용**됩니다.
- 확인: `Get-ScheduledTask -TaskName agentmemory-sync`

---

## 4. 집 PC 설치 (수신·검토 측 — 1회)

```powershell
git clone "https://<PAT>@github.com/morningx77/agentmemory-sync.git" "C:\경로\agentmemory-sync"
```
- **검토 전 최신화**: `git pull` (매번). 자동화하려면 집 workspace `.claude/settings.json`의 `SessionStart` 훅에 `git pull` 추가.
- **조회**: Claude에게 이 폴더 경로를 알려주고 —
  > "회사 기획 클로드가 오늘 아침 OOO 작업한 내역 확인해줘"

  Claude가 `exports/*.json`(세션별 관측·narrative·별칭 태그)과 `memory/*.md`를 읽어 **별칭(기획/오피스/피그마)·날짜**로 필터·요약합니다. (import·restore 불필요)

---

## 5. 사용법 요약

| 상황 | 동작 |
|---|---|
| 회사에서 작업 | 세션 종료·30분마다 자동 push (무조작) |
| 수동 동기화 | `sync-push.ps1` 실행 |
| 집에서 검토 | `git pull` → Claude에게 질문 |

---

## 6. 토큰 재발급 (권장 주기·유출 시)

1. GitHub → 해당 Fine-grained 토큰 → **Regenerate token** → 새 토큰 복사
2. 각 PC에서 remote 교체:
   ```powershell
   cd <repo>
   git remote set-url origin "https://<새PAT>@github.com/morningx77/agentmemory-sync.git"
   git push
   ```
- 재발급하면 옛 토큰은 자동 무효화됩니다.

---

## 7. 트러블슈팅

| 증상 | 원인·해결 |
|---|---|
| `warning: LF will be replaced by CRLF` | 무해(Windows 줄바꿈 경고). 무시. |
| push 시 인증 실패(403) | PAT 만료·권한 부족. 재발급 후 `git remote set-url`. |
| export가 비어 있음 | agentmemory 데몬(localhost:3111) 미실행. 데몬 확인 후 재시도. |
| 최근 작업이 안 보임 | export는 **실행 시점 최근 워킹셋** 위주. 세션 종료 후/다음 30분 주기에 반영됨. 전체 이력은 git 커밋 히스토리·`memory/*.md` 참조. |
| 훅이 안 도는 것 같음 | Claude Code **재시작** 필요. settings.json의 `SessionEnd` 확인. |

---

## 8. 보안 주의

- 이 저장소에는 **업무 내용**이 담기므로 **반드시 비공개(private)** 유지.
- PAT는 **repo 단독 · Contents 권한만** 부여(최소 권한). 로컬 `.git/config`에만 보관, 커밋 금지(`.gitignore`로 `*.token`·`.env` 차단).
- 토큰이 노출되면 즉시 재발급(6번).

---

## 참고

- 설계·구축 계획서: `05_notes/04_claude/_WORK_PLAN_agentmemory_sync_260729.md`
- agentmemory export 엔드포인트: `GET http://localhost:3111/agentmemory/export`
