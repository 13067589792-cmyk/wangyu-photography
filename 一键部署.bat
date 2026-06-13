@echo off
chcp 65001 >nul
echo ============================================
echo   王宇摄影集 - 一键部署到 GitHub Pages
echo ============================================
echo.

:: 刷新 PATH
set "PATH=%PATH%;C:\Program Files\Git\bin;C:\Program Files\Git\cmd;%LOCALAPPDATA%\Programs\GitHub CLI"

echo [1/3] 推送网站到 GitHub...
git push -u origin main
if %errorlevel% neq 0 (
    echo 推送失败，尝试通过 gh CLI...
    gh auth setup-git
    git push -u origin main
)
echo.

echo [2/3] 启用 GitHub Pages...
gh api -X POST /repos/13067589792-cmyk/wangyu-photography/pages -f "source[branch]=main" -f "source[path]=/"
echo.

echo [3/3] 完成！
echo.
echo ============================================
echo   网站地址:
echo   https://13067589792-cmyk.github.io/wangyu-photography/
echo   (首次部署需要等待 1-2 分钟生效)
echo.
echo   仓库地址:
echo   https://github.com/13067589792-cmyk/wangyu-photography
echo ============================================
echo.
pause
