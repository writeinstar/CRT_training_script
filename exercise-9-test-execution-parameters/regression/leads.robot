*** Settings ***

Documentation               Leads
Library                     QWeb
Suite Setup                 Open Browser                about:blank           chrome
Suite Teardown              Close All Browsers

*** Test Cases ***

regression - leads Test Case 1
    Log    Regression - Leads Test Case 1   

regression -l leads Test Case 2
    Log    Regression - Leads Test Case 2