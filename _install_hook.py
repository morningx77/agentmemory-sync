import json, shutil, io

S = r"c:/Users/yscho/260610_ISPARK/.claude/settings.json"
shutil.copyfile(S, S + ".bak_260729")          # 백업
d = json.load(io.open(S, encoding="utf-8"))

# 세션 종료 시 sync-push.ps1을 분리(숨김) 프로세스로 실행 → 세션 종료 지연 없음
cmd = r'''powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -WindowStyle Hidden -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-File','C:\Users\yscho\260610_ISPARK\.agentmemory-sync\sync-push.ps1'"'''

h = d.setdefault("hooks", {})
h["SessionEnd"] = [{"hooks": [{"type": "command", "command": cmd,
                               "timeout": 15, "statusMessage": "agentmemory sync push"}]}]

json.dump(d, io.open(S, "w", encoding="utf-8"), ensure_ascii=False, indent=2)

# 재검증
d2 = json.load(io.open(S, encoding="utf-8"))
assert "sync-push.ps1" in d2["hooks"]["SessionEnd"][0]["hooks"][0]["command"]
print("[OK] SessionEnd 훅 추가 완료 (백업: settings.json.bak_260729)")
print("hook events:", list(d2["hooks"].keys()))
