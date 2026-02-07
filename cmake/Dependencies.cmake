include(FetchContent)

message(STATUS "Configuring dependencies...")

FetchContent_Declare(
	fmt
	GIT_REPOSITORY git@github.com:fmtlib/fmt.git
	GIT_TAG 12.1.0
	GIT_SHALLOW ON
)

# 自动下载源码，执行配置和生成步骤
FetchContent_MakeAvailable(fmt)

if(BUILD_TESTS)
	FetchContent_Declare(
		googletest
		GIT_REPOSITORY git@github.com:google/googletest.git
		GIT_TAG v1.17.0
		GIT_SHALLOW ON
	)

	# 防止 GTest 覆盖我们的编译器设置（Windows下常见坑）
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
    FetchContent_MakeAvailable(googletest)
endif()