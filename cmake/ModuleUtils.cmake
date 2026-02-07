function(gameEngin_add_module target_name)
    # 解析参数：SOURCES (源文件), DEPENDS (依赖)
    cmake_parse_arguments(ARG "" "" "SOURCES;DEPENDS" ${ARGN})

    # 创建库
    add_library(${target_name} SHARED ${ARG_SOURCES})

    # 统一设置 Include 路径
    target_include_directories(${target_name} 
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
    )

    # 统一设置编译选项 (Generator Expressions)
    target_compile_options(${target_name} PRIVATE
        $<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>       # Windows: 高警告
        $<$<CXX_COMPILER_ID:GNU>:-Wall -Wextra>  # Linux: 高警告
    )

    # 处理依赖
    if(ARG_DEPENDS)
        target_link_libraries(${target_name} PUBLIC ${ARG_DEPENDS})
    endif()

    # 定义导出宏 (Windows DLL 必需)
    string(TOUPPER ${target_name} UPPER_NAME)
    target_compile_definitions(${target_name} PRIVATE ${UPPER_NAME}_EXPORTS)
    
    # 简单的安装规则
    install(TARGETS ${target_name} 
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
    )
endfunction()