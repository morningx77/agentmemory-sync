# agentmemory-sync 자동화 설치 (회사 PC에서 1회 실행)
# 1) Claude Code SessionEnd 훅 추가 (세션 종료마다 동기화)
# 2) Task Scheduler 30분 간격 등록 (안전망)
$ErrorActionPreference = "Stop"
$repo = "C:\Users\yscho\260610_ISPARK\.agentmemory-sync"

Write-Host "[1/2] SessionEnd 훅 추가..."
$env:PYTHONUTF8 = "1"
python "$repo\_install_hook.py"

Write-Host "[2/2] Task Scheduler 30분 간격 등록..."
$act  = New-ScheduledTaskAction -Execute "powershell.exe" `
        -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$repo\sync-push.ps1`""
$base = New-ScheduledTaskTrigger -Once -At (Get-Date)
$rep  = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 30)
$base.Repetition = $rep.Repetition
Register-ScheduledTask -TaskName "agentmemory-sync" -Action $act -Trigger $base `
        -Description "agentmemory 30분 동기화 push" -Force | Out-Null

Write-Host ""
Write-Host "[완료] SessionEnd 훅 + 30분 스케줄러 등록됨"
Write-Host "  - 훅 적용은 Claude Code 재시작 후부터"
Write-Host "  - 스케줄러 확인: Get-ScheduledTask -TaskName agentmemory-sync"
