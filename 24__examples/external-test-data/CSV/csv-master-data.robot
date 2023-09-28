*** Settings ***
Library                Collections
Library                QWeb
Library                CSVLibrary
Suite Setup            Open Browser                about:blank                 chrome
Suite Teardown         Close All Browsers

*** Test Cases ***
TC01 Read csv file to a dict example test
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}resources${/}data2.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary                @{dict}                testCaseNumber=TC01
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column3]
    Log                ${dict[${${index}}]}[column4]
    Log                ${dict[${${index}}]}[column5]
    Log                ${dict[${${index}}]}[column6]
    Log                ${dict[${${index}}]}[column7]
    Log                ${dict[${${index}}]}[column8]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]
    Log To Console     ${dict[${${index}}]}[column4]
    Log To Console     ${dict[${${index}}]}[column5]
    Log To Console     ${dict[${${index}}]}[column6]
    Log To Console     ${dict[${${index}}]}[column7]
    Log To Console     ${dict[${${index}}]}[column8]


TC02 Read csv file to a dict example test
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}resources${/}data2.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary                @{dict}                testCaseNumber=TC02
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column3]
    Log                ${dict[${${index}}]}[column4]
    Log                ${dict[${${index}}]}[column5]
    Log                ${dict[${${index}}]}[column6]
    Log                ${dict[${${index}}]}[column7]
    Log                ${dict[${${index}}]}[column8]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]
    Log To Console     ${dict[${${index}}]}[column4]
    Log To Console     ${dict[${${index}}]}[column5]
    Log To Console     ${dict[${${index}}]}[column6]
    Log To Console     ${dict[${${index}}]}[column7]
    Log To Console     ${dict[${${index}}]}[column8]


TC03 Read csv file to a dict example test
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}resources${/}data2.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary                @{dict}                testCaseNumber=TC03
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column3]
    Log                ${dict[${${index}}]}[column4]
    Log                ${dict[${${index}}]}[column5]
    Log                ${dict[${${index}}]}[column6]
    Log                ${dict[${${index}}]}[column7]
    Log                ${dict[${${index}}]}[column8]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]
    Log To Console     ${dict[${${index}}]}[column4]
    Log To Console     ${dict[${${index}}]}[column5]
    Log To Console     ${dict[${${index}}]}[column6]
    Log To Console     ${dict[${${index}}]}[column7]
    Log To Console     ${dict[${${index}}]}[column8]


TC04 Read csv file to a dict example test
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}resources${/}data2.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary                @{dict}                testCaseNumber=TC04
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column3]
    Log                ${dict[${${index}}]}[column4]
    Log                ${dict[${${index}}]}[column5]
    Log                ${dict[${${index}}]}[column6]
    Log                ${dict[${${index}}]}[column7]
    Log                ${dict[${${index}}]}[column8]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]
    Log To Console     ${dict[${${index}}]}[column4]
    Log To Console     ${dict[${${index}}]}[column5]
    Log To Console     ${dict[${${index}}]}[column6]
    Log To Console     ${dict[${${index}}]}[column7]
    Log To Console     ${dict[${${index}}]}[column8]


*** Keywords ***

Get Test Case Data Index From Dictionary
    [Documentation]    Loops through dictionary to find corresponding data with test case number, for that we need to identify the index
    [Arguments]        @{Dict}                     ${testCaseNumber}
    ${COUNTER}=        Set Variable                0
    ${INDEX}=          Set Variable                0
    ${TESTCASE}=       Set Variable                ${testCaseNumber}
    FOR                ${key_value_tuple}          IN                          @{dict}
        IF             '${dict[${COUNTER}]}[TC_Number]' == '${TESTCASE}'
            ${INDEX}=                              Set Variable                ${COUNTER}
        END
        # Log to console                           ${INDEX}
        ${COUNTER}=    Evaluate                    ${COUNTER} + 1
    END
    [Return]           ${INDEX}
