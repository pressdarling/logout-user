#!/bin/env zsh

# Test script for logout-user function

# Source the plugin file
source $CUSTOM/plugins/logout-user/logout-user.plugin.zsh

# Test cases
echo "Running tests for logout-user function..."

# Test 1: Display help
echo "Test 1: Display help"
logout-user -h
echo "----------------------------------------"

# Test 2: Dry run with valid username
echo "Test 2: Dry run with valid username"
logout-user -n "$(whoami)"
echo "----------------------------------------"

# Test 3: Attempt to log out root user
echo "Test 3: Attempt to log out root (dry run)"
logout-user -n root
echo "----------------------------------------"

# Test 4: Attempt to log out root user
echo "Test 3: Attempt to log out root user"
logout-user root
echo "----------------------------------------"

# Test 5: Log out non-existent user
echo "Test 5: Log out non-existent user"
logout-user non_existent_user
echo "----------------------------------------"

# Test 6: Log out current user (dry run)
echo "Test 6: Log out current user (dry run)"
logout-user -n "$(whoami)"
echo "----------------------------------------"

# Test 7: Log out current user (actual run)
# This is commented out for obvious reasons
# echo "Test 7: Log out current user (actual run)"
# logout-user "$(whoami)"
# echo "----------------------------------------"

echo "Tests completed."
