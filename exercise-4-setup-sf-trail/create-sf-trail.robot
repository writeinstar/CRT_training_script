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

Exercise 4 - Create online mailbox
    GoTo                    https://www.mailinator.com/
    ${unique_mail_address}=	 Generate Random String	14	[NUMBERS]temponlinemail
    Type Text               Enter Public Mailinator Inbox    ${unique_mail_address}
    Click Text              GO
    Set Suite Variable      ${email_address}            ${unique_mail_address}@mailinator.com
    Log to Console          ${email_address}
              


Exercise 4 - Create Salesforce Trial Org
    Open Window
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
    TypeText                Email                       ${email_address}
    ClickElement           //div[@class\="checkbox-ui"]                   

    ClickText               Submit

Exercise 4 - Read Mail
    Switch Window           1
    ClickItemUntil          Welcome to Salesforce         GO    timeout=180
    ClickText               Welcome to Salesforce 
    ScrollText              Again, welcome to Salesforce
    ${sftrial_url}=         Get Attribute   login-href    class  tag=a
    ${sftrial_username}=         Get Attribute   span-user-name    class    tag=span
    ClickText               Verify Account
    Switch Window           3
    Set Suite Variable         ${password}        TrialSF01!            
    TypeText                New Password                       ${password}
    TypeText                Confirm New Password               ${password}
    TypeText                Answer               Krypton
    ClickText                Change Password
    Log Many               ${email_address}      ${sftrial_url}    ${sftrial_username}    ${password}
    ClickText    Close this window

