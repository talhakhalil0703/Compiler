#include "errorhandler.hpp"

ErrorHandler::ErrorHandler(){};

void ErrorHandler::NonRecoverableError(std::string message)
{
    std::cerr << message;
    exit(EXIT_FAILURE);
}

void ErrorHandler::Warning(std::string message)
{
    std::cerr << message;
    warning_count++;
    if (warning_count >= 10)
    {
        NonRecoverableError("Too many warnings, encountered!");
    }
}