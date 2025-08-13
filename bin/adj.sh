#!/bin/bash

# 检查参数
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    echo "Convert all PNG images in directory to JPG (width: 1280px, quality: medium-high)"
    exit 1
fi

# 检查目录是否存在
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist"
    exit 1
fi

# 进入目标目录
cd "$1" || exit 1

# 统计PNG文件数量
png_count=$(ls -1 *.png 2>/dev/null | wc -l)

if [ "$png_count" -eq 0 ]; then
    echo "No PNG files found in '$1'"
    exit 0
fi

echo "Found $png_count PNG files to convert..."

# 转换每个PNG文件
for png_file in *.png; do
    # 检查文件是否存在（避免通配符未匹配的情况）
    if [ -f "$png_file" ]; then
        # 获取不带扩展名的文件名
        base_name="${png_file%.png}"
        jpg_file="${base_name}.jpg"
        
        echo "Converting: $png_file -> $jpg_file"
        
        # 使用ffmpeg转换
        # -i: 输入文件
        # -vf scale: 设置宽度为1280，高度自动保持比例(-1)
        # -q:v: 设置质量（2-5为高质量，这里用3表示中高质量）
        ffmpeg -i "$png_file" \
               -vf "scale=1280:-1" \
               -q:v 3 \
               "$jpg_file" \
               -y \
               -loglevel error
        
        if [ $? -eq 0 ]; then
            echo "  ✓ Converted successfully"
        else
            echo "  ✗ Failed to convert $png_file"
        fi
    fi
done

echo "Conversion complete!"