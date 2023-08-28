*** Settings ***

Documentation               Leads
Library                     QWeb
Suite Setup                 Open Browser                about:blank           chrome
Suite Teardown              Close All Browsers

*** Test Cases ***

regression - leads Test Case 1
    [Tags]     Regression    Leads
    Log    Regression - Leads Test Case 1   

regression - leads Test Case 2
    [Tags]     Regression    Leads    US-00001
    Log    Regression - Leads Test Case 2