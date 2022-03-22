import subprocess
from os import listdir
from os.path import isfile

dir_containing_tests = "Tests/"

with open("results.md", "w") as output_file:
    input_files = listdir(dir_containing_tests)
    input_files.sort()

    differences_count = 0
    output_string = ""
    for test_file in input_files:
        file_path = dir_containing_tests + test_file
        if(isfile(file_path)):
            output_string += f"### {test_file}" + "\n"
            compiler = subprocess.run(["./main", file_path], capture_output=True, text=True)
            output_string += "#### Mine\n"
            output_string += "```\n"
            output_string += compiler.stdout
            output_string += compiler.stderr
            output_string += "```\n"
            reference_compiler = subprocess.run(["/home/profs/aycock/411/TEST/reference/main", "-psemantic", file_path], capture_output=True, text=True)
            output_string += "#### Professors\n"
            output_string += "```\n"
            output_string += reference_compiler.stdout
            output_string += reference_compiler.stderr
            output_string += "```\n"

            if compiler.returncode != reference_compiler.returncode:
                output_string += "\n****************** FILE: " + test_file + " FAILED. ******************\n"
                output_string += "Expected a " + str(reference_compiler.returncode) + ", but recieved a " + str(compiler.returncode) + "\n"
                differences_count += 1
        output_string += "\n"

    
    output_file.write(f"## TEST RESULT: {len(input_files)-differences_count}/{len(input_files)}" + "\n\n")
    output_file.write(output_string)