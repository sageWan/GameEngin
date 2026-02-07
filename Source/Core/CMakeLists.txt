


# 1. 查找 Python 解释器
find_package(Python3 REQUIRED COMPONENTS Interpreter)

# 2. 定义生成文件的路径 (在 build 目录中，不污染源码)
set(VERSION_HEADER "${CMAKE_CURRENT_BINARY_DIR}/generated/version.h")

# 3. 添加自定义命令：构建时运行 Python
add_custom_command(
    OUTPUT ${VERSION_HEADER}
    COMMAND Python3::Interpreter "${CMAKE_SOURCE_DIR}/scripts/gen_version.py" "${VERSION_HEADER}" "${PROJECT_VERSION}"
    DEPENDS "${CMAKE_SOURCE_DIR}/scripts/gen_version.py" # 如果脚本变了，重新生成
    COMMENT "Generating version header..."
)

# 4. 定义 Core 库
add_library(PhoenixCore STATIC
    MathUtils.cpp
    ${VERSION_HEADER} # 将生成的文件加入源列表
)

# 5. 设置包含路径
target_include_directories(PhoenixCore
    PUBLIC 
        include # 公共头文件
        ${CMAKE_CURRENT_BINARY_DIR}/generated # 让库能找到生成的 version.h
)

# 6. 安装规则 (Deploy)
install(TARGETS PhoenixCore DESTINATION lib)