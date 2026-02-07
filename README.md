# 查看下载的依赖
ls build/_deps/

cmake --graphviz=deps.dot build
dot -Tpng deps.dot -o deps.png  # 需要安装 Graphviz

cmake --build build --verbose
# 你会看到类似这样的编译命令：
# g++ ... -I/path/to/build/_deps/fmt-src/include ...

cmake --build build --target help
# 输出会包含：
# ... fmt
# ... Core
# ... Engine