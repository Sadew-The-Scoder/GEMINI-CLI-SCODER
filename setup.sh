#!/usr/bin/env bash

# Function to check if last command was successful
check_success() {
  if [ $? -ne 0 ]; then
    echo "
    
    [✘] $1 failed. Exiting.
    
    "
    exit 1
  else
    echo "
    
    [✔] $1 successful.
    
    "
  fi
}

echo "

Updating package list...

"
pkg update -y && pkg upgrade -y
check_success "System update"

# Install Node.js
echo "

Installing Node.js...

"
pkg install -y nodejs
check_success "Node.js installation"

echo "Node.js version: $(node -v)"
echo "NPM version: $(npm -v)"

# Install Python3
echo "

Installing Python3...

"
pkg install -y python
check_success "Python3 installation"

echo "

Python version: $(python3 --version)

"

echo "

✅ All packages installed successfully.

"



# Condition for installation G.CLI

echo "Choose a method to install Gemini CLI (npx / npm):"
read -r method

if [ "$method" = "npx" ]; then
  echo "Installing Gemini CLI using: $method..."
  npx https://github.com/google-gemini/gemini-cli
  echo "Success ✅"
else
  echo "Installing Gemini CLI using: $method..."
  npm install -g @google/gemini-cli
gemini
  echo "Success ✅"


fi
