@echo off
REM ============================================================
REM compile_all.bat — 一键编译三份说明书
REM 用法：双击运行，或命令行执行 compile_all.bat
REM ============================================================

echo ===== 开始编译三份课程设计说明书 =====
echo.

echo [1/3] 正在编译 成员1 说明书...
xelatex -interaction=nonstopmode main_member1.tex > nul 2>&1
xelatex -interaction=nonstopmode main_member1.tex > nul 2>&1
if exist main_member1.pdf (
  echo   ✓ main_member1.pdf 生成成功
) else (
  echo   ✗ main_member1.pdf 生成失败
)

echo.
echo [2/3] 正在编译 成员2 说明书...
xelatex -interaction=nonstopmode main_member2.tex > nul 2>&1
xelatex -interaction=nonstopmode main_member2.tex > nul 2>&1
if exist main_member2.pdf (
  echo   ✓ main_member2.pdf 生成成功
) else (
  echo   ✗ main_member2.pdf 生成失败
)

echo.
echo [3/3] 正在编译 成员3（安家乐）说明书...
xelatex -interaction=nonstopmode main_member3.tex > nul 2>&1
xelatex -interaction=nonstopmode main_member3.tex > nul 2>&1
if exist main_member3.pdf (
  echo   ✓ main_member3.pdf 生成成功
) else (
  echo   ✗ main_member3.pdf 生成失败
)

echo.
echo ===== 全部编译完成！生成的PDF文件：=====
echo   main_member1.pdf  — 成员1说明书
echo   main_member2.pdf  — 成员2说明书
echo   main_member3.pdf  — 成员3（安家乐）说明书
echo.
echo 按任意键打开输出目录...
pause > nul
start "" "C:\Users\An\Desktop\文件\课程作业\机械CAD课设\说明书\latex"
