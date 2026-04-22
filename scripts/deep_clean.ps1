# Flutter Deep Clean Script for Windows

Write-Host "Starting Deep Clean..." -ForegroundColor Cyan

# 1. Project Clean
if (Test-Path "pubspec.yaml") {
    Write-Host "Running flutter clean..."
    flutter clean
} else {
    Write-Host "No pubspec.yaml found. Skipping project clean." -ForegroundColor Yellow
}

# 2. Pub Cache Clean
Write-Host "Cleaning Pub Cache..."
flutter pub cache clean --force

# 3. Gradle Cache Clean (Biggest Storage Consumer)
$gradleCache = "$env:USERPROFILE\.gradle\caches"
if (Test-Path $gradleCache) {
    Write-Host "Deleting Gradle caches ($gradleCache)..."
    Remove-Item -Path $gradleCache -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Gradle caches cleared."
}

# 4. Flutter SDK Internal Cache
# Note: Deleting this means flutter will re-download the engine next time. 
# Only do this if you have a good internet connection.
# $flutterBinCache = "C:\Users\Rishi\AppData\Roaming\FlutterFlow\flutterflow\flutter\bin\cache"
# if (Test-Path $flutterBinCache) {
#     Write-Host "Consider manually deleting $flutterBinCache if issues persist."
# }

Write-Host "Deep Clean Complete!" -ForegroundColor Green
