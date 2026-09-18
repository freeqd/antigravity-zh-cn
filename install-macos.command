#!/usr/bin/env bash
# ========================================================
# Antigravity 2.0 汉化安装工具（简体 / 繁体可选）
# ========================================================

# 切換到腳本所在目錄
cd "$(dirname "$0")" || exit 1

echo ""
echo "========================================================"
echo "  Antigravity 2.0 汉化安装工具"
echo "========================================================"
echo ""

# 前置檢查：Node.js
echo "[前置檢查] 檢查 Node.js 環境..."
if ! command -v node &> /dev/null; then
    echo ""
    echo "[錯誤] 找不到可用的 Node.js。"
    echo "  請前往 https://nodejs.org/ 安裝 LTS 版本，"
    echo "  並確認 node 已加入系統 PATH。"
    echo ""
    read -r -p "按下 Enter 鍵結束..."
    exit 1
fi

# 前置檢查：本地 @electron/asar CLI
if [ ! -f "./node_modules/@electron/asar/bin/asar.js" ]; then
    echo ""
    echo "[錯誤] 找不到本地 @electron/asar CLI。"
    echo "  請先在專案根目錄執行："
    echo "    npm install"
    echo "  完成後再重新執行本安裝腳本。"
    echo ""
    read -r -p "按下 Enter 鍵結束..."
    exit 1
fi

echo "[前置檢查] Node.js 與 asar CLI 均已就緒。"
echo ""

# ===== 选择汉化语言 =====
echo "请选择汉化语言 / Select localization language:"
echo "  [1] 简体中文（中国大陆）"
echo "  [2] 繁體中文（台灣）"
echo ""
read -r -p "请输入数字并回车，默认 2 / Enter number (default 2): " LANG_CHOICE
if [ "$LANG_CHOICE" = "1" ]; then
    LANG_ARG="--lang zh-CN"
else
    LANG_ARG="--lang zh-TW"
fi

echo ""
echo "[1/3] 正在偵測並關閉 Antigravity 程序..."
pkill -f Antigravity > /dev/null 2>&1
sleep 2

echo ""
echo "[2/3] 正在套用本地化..."
node localization_engine.js "$LANG_ARG" "$@"

echo ""
echo "[3/3] 套用完成！"
echo ""
echo "[注意] 請手動重新啟動 Antigravity 以生效。"
echo ""
read -r -p "按下 Enter 鍵結束..."
