*** Settings ***
Library                         QWeb
Library                         QForce
Library                         String
Library                         Collections


# *** Variables ***
# ${browser}                      chrome
# ${username}                     YOUR USERNAME HERE
# ${login_url}                    https://YOURDOMAIN.my.salesforce.com                    # Salesforce instance. NOTE: Should be overwritten in CRT variables
# ${home_url}                     ${login_url}/lightning/page/home

*** Variables ***
${browser}                      chrome
${username}                     ea9mlm8la81a5l-pmcd@force.com
${login_url}                    https://energy-force-4969.my.salesforce.com                    # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home
${password}		      TrialSF01!


*** Keywords ***
Setup Browser
    Set Library Search Order    QWeb                        QForce
    Open Browser                about:blank                 ${browser}
    SetConfig                   LineBreak                   ${EMPTY}                    #\ue000
    SetConfig                   DefaultTimeout              20s                         #sometimes salesforce is slow


Close All Browser Sessions
    Close All Browsers


Login
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In
    
    # Uncommment with Exercise 8 MFA

    # MFA is only required for unknown devices or browsers, once verified it is not asked for. 
    # To enforce MFA in your SF trial, Setup -> Identity -> Identity Verification -> Require MFA for all direct UI logins to your Salesforce org
    
    # ${MFA_needed}=              Run Keyword And Return Status                           Should Not Be Equal         ${None}         ${MY_SECRET}
    # Log To Console              ${MFA_needed} # When given ${MFA_needed} is true, see Log to Console keyword result
    
    # IF                          ${MFA_needed}
    #     ${mfa_code}=            GetOTP                      ${username}                 ${MY_SECRET}
    #     TypeSecret              Verification Code           ${mfa_code}
    #     ClickText               Verify
    # END

Login As
    [Documentation]       Login As different persona. User needs to be logged into Salesforce with Admin rights
    ...                   before calling this keyword to change persona.
    ...                   Example:
    ...                   LoginAs    Chatter Expert
    [Arguments]           ${persona}
    ClickText             Setup
    ClickText             Setup for current app
    SwitchWindow          NEW
    TypeText              Search Setup                ${persona}             delay=2
    ClickText             User                        anchor=${persona}      delay=3    # wait for list to populate, then click
    VerifyText            Freeze                      
    ClickText             Login                       anchor=Freeze          delay=1      

Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                  2
    Run Keyword If              ${login_status}             Login                   
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

Sales
    [Documentation]             Navigate to homepage, login if needed
    LaunchApp                   Sales
    VerifyText                  Sales