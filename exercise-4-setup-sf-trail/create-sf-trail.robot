*** Settings ***

Documentation               Create a new Salesforce Trail
Library                     QWeb
Library                     DateTime
Library                     String
Suite Setup                 Open Browser                about:blank           chrome
Suite Teardown              Close All Browsers


*** Variables ***

${email}                    youremailaddress


*** Test Cases ***

Exercise 4 - Create Salesforce Trial Org
    GoTo                    https://www.salesforce.com/form/signup/freetrial-sales-pe/
    VerifyText              Start your free sales trial

    Evaluate                random.seed()               random
    ${exampleFirstName}=    Convert To String           guest1
    ${randomString}=        Generate Random String      length=3-5            chars=0123456789
    ${FirstName}=           Format String               {}{}                  ${exampleFirstName}    ${randomString}


    TypeText                First name                  ${FirstName}
    TypeText                Last name                   user
    TypeText                Job title                   Learner
    ClickText               Next

    DropDown                Employees                   21 - 200 employees
    TypeText                Company                     xyz
    ClickText               Next


    TypeText                Phone                       9999999999
    TypeText                Email                       ${email}
    ClickElement           //div[@class\="checkbox-ui"]                   

    ClickText               Submit