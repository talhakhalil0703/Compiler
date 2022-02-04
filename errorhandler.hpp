#ifndef ERRORHANDLER
#define ERRORHANDLER
#include <string>
#include <cstring>
#include <iostream>

class ErrorHandler
{
public:
    ErrorHandler();
    ~ErrorHandler() = default;

    void NonRecoverableError(std::string message);
    void Warning(std::string message);

private:
    int warning_count = 0;
};
#endif