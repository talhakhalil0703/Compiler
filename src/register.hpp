#ifndef REGISTER_HPP
#define REGISTER_HPP
#include <string>
#include <list>
#include "errorhandler.hpp"

enum class SingleRegister
{
    $T0,
    $T1,
    $T2,
    $T3,
    $T4,
    $T5,
    $T6,
    $T7,
    $T8,
    $T9,
    $S0,
    $S1,
    $S2,
    $S3,
    $S4,
    $S5,
    $S6,
    $S7,
    $V0
};

inline std::string get_register_name(SingleRegister reg)
{
    switch (reg)
    {
    case SingleRegister::$T0:
        return "$t0";
    case SingleRegister::$T1:
        return "$t1";
    case SingleRegister::$T2:
        return "$t2";
    case SingleRegister::$T3:
        return "$t3";
    case SingleRegister::$T4:
        return "$t4";
    case SingleRegister::$T5:
        return "$t5";
    case SingleRegister::$T6:
        return "$t6";
    case SingleRegister::$T7:
        return "$t7";
    case SingleRegister::$T8:
        return "$t8";
    case SingleRegister::$T9:
        return "$t9";
    case SingleRegister::$S0:
        return "$s0";
    case SingleRegister::$S1:
        return "$s1";
    case SingleRegister::$S2:
        return "$s2";
    case SingleRegister::$S3:
        return "$s3";
    case SingleRegister::$S4:
        return "$s4";
    case SingleRegister::$S5:
        return "$s5";
    case SingleRegister::$S6:
        return "$s6";
    case SingleRegister::$S7:
        return "$s7";    
    case SingleRegister::$V0:
        return "$v0";
    default:
        return "";
    }
}


class RegisterPool{
public:

    std::list<SingleRegister> unused = {};
    std::list<SingleRegister> used = {};

    RegisterPool(){
        unused.push_front(SingleRegister::$T0);
        unused.push_front(SingleRegister::$T1);
        unused.push_front(SingleRegister::$T2);
        unused.push_front(SingleRegister::$T3);
        unused.push_front(SingleRegister::$T4);
        unused.push_front(SingleRegister::$T5);
        unused.push_front(SingleRegister::$T6);
        unused.push_front(SingleRegister::$T7);
        unused.push_front(SingleRegister::$T8);
        unused.push_front(SingleRegister::$T9);
        unused.push_front(SingleRegister::$S0);
        unused.push_front(SingleRegister::$S1);
        unused.push_front(SingleRegister::$S2);
        unused.push_front(SingleRegister::$S3);
        unused.push_front(SingleRegister::$S4);
        unused.push_front(SingleRegister::$S5);
        unused.push_front(SingleRegister::$S6);
        unused.push_front(SingleRegister::$S7);

    }

    SingleRegister get_register(){
        if (unused.empty()){
            ErrorHandler().NonRecoverableError("error: Cannot get another register\n");
        }

        SingleRegister to_use = unused.back();
        unused.pop_back();
        used.push_front(to_use);
        return to_use;
    }

    void free_register(SingleRegister reg){
        used.remove(reg);
        unused.push_back(reg);
    }
};

#endif