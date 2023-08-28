*** Settings ***

Documentation               Accounts
Library                     QWeb
Suite Setup                 Open Browser                about:blank           chrome
Suite Teardown              Close All Browsers

*** Test Cases ***

regression - accounts Test Case 1
    Log    Regression - Accounts Test Case 1   

regression - accounts Test Case 2
    Log    Regression - Accounts Test Case 2