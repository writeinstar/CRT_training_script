*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        Git Repo Exercise
    Appstate                  Home
    LaunchApp                 Sales