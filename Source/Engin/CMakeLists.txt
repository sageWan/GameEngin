


# 使用 glob 扫描源码 (开发阶段方便，生产环境建议手动列出)
file(GLOB_RECURSE SOURCES
    "*.cpp"
    "*.h"
)

# 一行代码定义模块
gameEngin_add_module(Engine
    SOURCES ${SOURCES}
    DEPENDS Core fmt::fmt # 依赖 Core 和 fmt
)
