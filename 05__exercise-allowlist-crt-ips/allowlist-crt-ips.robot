*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                Setup Browser
Suite Teardown             Close All Browser Sessions

*** Test Cases ***
# When you've used mailinator for creating your SF trail org,
#                         you run the full test in live testing
#                         but make sure you have the mailinator_url variable set on robot level
Exercise 5 - Allowlist IPs at Setup Network Access
    [tags]                 IPs
    ${mailinator_needed}=              Run Keyword And Return Status                           Should Not Be Equal         ${None}         ${mailinator_url}
    IF                         '${mailinator_needed}' == 'True'
        Login and Verify Code
    ELSE
        Login                  ${username}                        ${password}
    END  


    # When you've created your SF trial org with your own email addres, 
    #                        run selection in live testing up to here
    
    ClickText              Setup
    ClickText              Opens in a new tab
    SwitchWindow           NEW
    VerifyText             Setup    anchor=Object Manager
    TypeText               Quick Find   Network Access     tag=input                  anchor=Setup Home
    Verify Text            Network Access                  anchor=Security
    ClickText              Network Access

    @{NorthAmericaIPs}=    Create List                 3.216.108.92      52.7.118.168          75.101.241.39
    @{EuropeIPs}=          Create List                 18.203.104.35     18.202.59.38          52.212.32.52
    @{AustraliaIPs}=       Create List                 13.238.101.70     54.79.113.39          54.66.15.135
    @{SingaporeIPs}=       Create List                 3.0.203.255       54.151.254.16         52.76.148.77

    Log                    ${NorthAmericaIPs}
    FOR                    ${IP}                       IN                @{NorthAmericaIPs}
        Sleep              2s
        Log Screenshot
        ${ip_already_configured}=                      IsText            ${IP}
        IF                 '${ip_already_configured}' == 'False'
            ClickText          New
            TypeText           Start IP Address            ${IP}
            TypeText           End IP Address              ${IP}
            TypeText           Description                 North-America
            ClickText          Save
            VerifyText         ${IP}
        END
    END

    Log                    ${EuropeIPs}
    FOR                    ${IP}                       IN                @{EuropeIPs}
        Sleep              2s
        Log Screenshot
        ${ip_already_configured}=                      IsText            ${IP}
        IF                 '${ip_already_configured}' == 'False'
            ClickText          New
            TypeText           Start IP Address            ${IP}
            TypeText           End IP Address              ${IP}
            TypeText           Description                 Europe
            ClickText          Save
            VerifyText         ${IP}
        END
    END

    Log                    ${AustraliaIPs}
    FOR                    ${IP}                       IN                @{AustraliaIPs}
        ${ip_already_configured}=                      IsText            ${IP}
        Sleep              2s
        Log Screenshot
        IF                 '${ip_already_configured}' == 'False'
            ClickText          New
            TypeText           Start IP Address            ${IP}
            TypeText           End IP Address              ${IP}
            TypeText           Description                 Australia
            ClickText          Save
            VerifyText         ${IP}
        END
    END

    Log                    ${SingaporeIPs}
    FOR                    ${IP}                       IN                @{SingaporeIPs}
        Sleep              2s
        Log Screenshot
        ${ip_already_configured}=                      IsText            ${IP}
        IF                 '${ip_already_configured}' == 'False'
            ClickText          New
            TypeText           Start IP Address            ${IP}
            TypeText           End IP Address              ${IP}
            TypeText           Description                 Singapore
            ClickText          Save
            VerifyText         ${IP}
        END
    END

    Log Screenshot

*** Keywords ***

Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                  2
    Run Keyword If              ${login_status}             Login                   
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

Login
    [Documentation]             Login to Salesforce instance
    [Arguments]                 ${username}=${username}    ${password}=${password}
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In