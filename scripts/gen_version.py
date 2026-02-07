import sys
import datetime

# 参数：[1] 输出文件路径 [2] 版本号
output_path = sys.argv[1]
version = sys.argv[2]
timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

content = f"""
#pragma once
namespace GameEngin {{
    constexpr const char* VERSION = "{version}";
    constexpr const char* BUILD_TIME = "{timestamp}";
}}
"""

with open(output_path, "w") as f:
    f.write(content)