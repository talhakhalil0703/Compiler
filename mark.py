import os
from os import listdir
from os.path import isfile, join
import subprocess
import ctypes
from subprocess import PIPE, DEVNULL, Popen

# Only change these:
DEFAULT_TIMEOUT_S = 20
SHOW_DIFF_OUTPUT = True 
mark_dir = "./MARKING"
test_compiler = "./main"


# Ignore hereforth
test_dir = os.path.expanduser("~aycock/411/TEST/final")
spim = "~aycock/411/bin/spim"

tests = [f for f in listdir(test_dir) if not f.endswith(".s") and not f.endswith(".out")]
tests.sort()

for test in tests:
    full_test_path = join(test_dir, test)
    if not isfile(full_test_path):
        continue

    print(f"Testing {test}: ", end='')

    test_compiler_run = subprocess.run(" ".join([test_compiler, full_test_path]), capture_output=True, text=True, shell=True)

    assert test_compiler_run.returncode == 0, f"Failed to compile for test: {test}"

    test_compiler_asm = test_compiler_run.stdout

    s_file = mark_dir + "/" + test + ".s"
    out_file = mark_dir + "/" + test + ".out"

    with open(s_file, "w") as fd:
        fd.write(test_compiler_asm)

    stdin_buffer = bytes(ctypes.c_int(-1))
    if test in {"gen.t13", "gen.t33", "gen.t18"}:
        if test == "gen.t13":
            stdin_buffer = "123456789\n".encode()
        elif test == "gen.t33":
            stdin_buffer = b"asdfasdf\n1111111111\n" + bytes(ctypes.c_int(-1))
        elif test == "gen.t18":
            stdin_buffer = "1 + 1\n (1 + 2) * (3 + 4)\n(1 + 2 * 3 / 4 * 100 / 4 * 3 - 2 + 1)\n\r\n".encode()
        else: raise Exception()

    test_spim_output = None
    try:

        path = s_file
        input_buffer = stdin_buffer            
        p = Popen(" ".join([spim, "-f", path]), stdin=PIPE, stdout=PIPE, stderr=DEVNULL, shell=True, close_fds=True)
        test_spim_output, _ = p.communicate(input_buffer, timeout=DEFAULT_TIMEOUT_S)

        # save spim output
        with open(out_file, "wb") as fd:
            fd.write(test_spim_output)
    except subprocess.TimeoutExpired:
        with open(out_file, "wb") as fd:
            out, _ = p.communicate()
            fd.write(out)
        print('\033[91m' + "FAIL (TIMEOUT)" + '\033[0m')        
       
        continue
