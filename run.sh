#!/bin/bash

# Change to the directory where the script is located
cd "$(dirname "$0")"

# Compile all C++ files in the workspace
g++ *.cpp -o output_executable_name

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    # Open a new Terminal window and run the compiled program
    osascript <<EOF
tell application "Terminal"
    do script "cd \"$(pwd)\"; ./output_executable_name"
    activate
end tell
EOF
else
    echo "Compilation failed."
fi
