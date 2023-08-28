*** Settings ***

Documentation               Create a new Salesforce Trail
Library                     QWeb
Library                     DateTime
Library                     String
Suite Setup                 Open Browser                about:blank           chrome
Suite Teardown              Close All Browsers

*** Test Cases ***

Create Salesforce Trial Org
    GoTo                    https://www.salesforce.com/form/signup/freetrial-sales-pe/