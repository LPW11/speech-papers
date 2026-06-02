#!/bin/bash
# 每日语音研究论文报告
# 运行: bash ~/speech/daily_speech_report.sh

SEARCH_SCRIPT="$HOME/.openclaw/workspace/skills/smart-search/search.sh"
OUTPUT_DIR="$HOME/speech"
DATE=$(date +%Y-%m-%d)
OUTPUT_FILE="$OUTPUT_DIR/${DATE}.md"

mkdir -p "$OUTPUT_DIR"

echo "# Speech 领域最新研究论文与方向（${DATE}）" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "> 每日自动报告 · Smart Search (Exa MCP)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

bash "$SEARCH_SCRIPT" "speech领域最新研究论文方向 2025 2026" 2>&1 | while IFS= read -r line; do
    # 去掉 emoji 和 ANSI 颜色
    echo "$line" | sed 's/\x1b\[[0-9;]*m//g' | sed 's/[🔍✅⚠️🔥📄📊🎙️🏭📋📝📺🎓🏆🛠️🧪🔰🔧🚀⭐📖📐🎯💬🔌🧠🎛️🖥️📅🐙🔍]//g' >> "$OUTPUT_FILE"
done

echo "" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"
echo "*自动生成时间: $(date '+%Y-%m-%d %H:%M:%S') · 引擎: Smart Search v4.0 (Exa MCP)*" >> "$OUTPUT_FILE"

echo "$OUTPUT_FILE"
