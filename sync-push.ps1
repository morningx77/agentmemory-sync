# agentmemory sync-push
# agentmemory export(JSON) + Claude 네이티브 memory(md) 미러 -> git commit/push
# 트리거: Claude Code Stop 훅(세션 종료) + Task Scheduler(30분 안전망)
$ErrorActionPreference = "SilentlyContinue"

$repo   = "C:\Users\yscho\260610_ISPARK\.agentmemory-sync"
$memSrc = "C:\Users\yscho\.claude\projects\c--Users-yscho-260610-ISPARK\memory"
$ts     = Get-Date -Format "yyyyMMdd_HHmm"

Set-Location $repo

# 1) agentmemory 전체 export (localhost, 인증 없음)
curl.exe -s "http://localhost:3111/agentmemory/export" -o "$repo\exports\am_export_$ts.json"

# 2) Claude 네이티브 장기기억(md) 미러 (완전·소량)
if (Test-Path $memSrc) {
    Copy-Item "$memSrc\*" "$repo\memory\" -Recurse -Force
}

# 3) 변경분 있으면 commit + push
$changes = git status --porcelain
if ($changes) {
    git add -A
    git commit -m "sync $ts" | Out-Null
    git push origin main | Out-Null
}
