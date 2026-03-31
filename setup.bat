@echo off
chcp 65001 >nul
echo ========================================
echo OpenCode 配置同步脚本 (Windows)
echo ========================================

set DOTFILES_DIR=%~dp0
set CONFIG_DIR=%APPDATA%\opencode
set AGENTS_DIR=%LOCALAPPDATA%\opencode\agents
set SKILLS_DIR=%USERPROFILE%\.config\opencode\skills

echo [1/4] 复制 opencode.json...
if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%"
copy /Y "%DOTFILES_DIR%opencode.json" "%CONFIG_DIR%"

echo [2/4] 复制 package.json...
copy /Y "%DOTFILES_DIR%package.json" "%CONFIG_DIR%"

echo [3/4] 复制 agents...
if not exist "%AGENTS_DIR%" mkdir "%AGENTS_DIR%"
xcopy /Y /E "%DOTFILES_DIR%agents\*" "%AGENTS_DIR%\"

echo [4/4] 复制 skills...
if not exist "%SKILLS_DIR%" mkdir "%SKILLS_DIR%"
xcopy /Y /E "%DOTFILES_DIR%skills\*" "%SKILLS_DIR%\"

echo.
echo ========================================
echo 同步完成！
echo ========================================
echo.
echo 请重启 OpenCode 使配置生效
pause