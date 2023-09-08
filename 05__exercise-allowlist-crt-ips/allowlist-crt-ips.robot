*** Settings ***
Resource               ../resources/common.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Variables ***
@{NorthAmericaIPs}=    Create List                 3.216.108.92                52.7.118.168     75.101.241.39
@{EuropeIPs}=          Create List                 18.203.104.35               18.202.59.38     52.212.32.52
@{AustraliaIPs}=       Create List                 13.238.101.70               54.79.113.39     54.66.15.135
@{SingaporeIPs}=       Create List                 3.0.203.255                 54.151.254.16    52.76.148.77

*** Test Cases ***
Entering A Lead
    [tags]             Lead                        Git Repo Exercise
    Appstate           Home

    ClickText          Setup                       anchor=Salesforce Help
    ClickText          Opens in a new tab
    SwitchWindow       NEW
    TypeText           Quick Find                  Network Access
    ClickText          Network Access

    Log                @{NorthAmericaIPs}=                     # ['one', 'two', 'three']
    FOR                ${item}                     IN                          @{LIST}
        ClickText      New
        TypeText       Start IP Address            52.7.118.168
        TypeText       End IP Address              52.7.118.168
        TypeText       Description                 NA
        ClickText      Save
    END
