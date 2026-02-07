# 1. 定义可执行文件
add_executable(GameEnginCLI
    main.cpp
)

# 2. 链接我们的引擎
# 只要链接了 Engine，因为 Engine 依赖 Core，CLI 也会自动获得 Core 的功能
target_link_libraries(GameEnginCLI PRIVATE PhoenixEngine)

# 3. 可以在这里设置调试工作目录 (Visual Studio 专用)
if(MSVC)
    set_target_properties(GameEnginCLI PROPERTIES 
        VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    )
endif()

# 4. 安装/发布
install(TARGETS GameEnginCLI RUNTIME DESTINATION bin)