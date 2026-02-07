#include "Logger.h"

void Logger::Info(const std::string& msg)
{
    fmt::print(fg(fmt::color::green), "[INFO] {}\n", msg);
}

void Logger::Error(const std::string& msg)
{
    fmt::print(fg(fmt::color::red), "[ERROR] {}\n", msg);
}