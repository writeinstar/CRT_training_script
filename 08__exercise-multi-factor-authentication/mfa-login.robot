*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Exercise 7 - Multi Factor Authentication
    [tags]                    Lead                        Git Repo Exercise
    Appstate                  Home
    LaunchApp                 Sales