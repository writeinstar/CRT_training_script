*** Settings ***
Library                   RequestsLibrary
Library                   QWeb
Library                   Process
Library                   JSONLibrary
Library                   Collections
Library                   OperatingSystem
Library                   CSVLibrary
Suite Setup               Open Browser                about:blank                 chrome
Suite Teardown            CloseAllBrowsers

*** Test Cases ***

Retrieve All Jobs in a Project
    ${headers}=           Create Dictionary
    ...                   X-Authorization=CRT PAT token
    ...                   Content-Type=application/json

    ${var}=               Create Session              CRT                         https://api.robotic.copado.com                    headers=${headers}        verify=True

    ${resp}=              Get On Session              CRT                         /pace/v4/projects/52836/jobs
    # Log to Console      ${resp.text}
    ${json}=              Evaluate                    json.loads('''${resp.text}''')                          json
    ${joblist}=           Get Value From Json         ${json}                     $..id
    Log to Console      ${joblist}
    Set Suite Variable    ${joblist}                  ${joblist}

Retrieve All Runs and Results of each job or suite

    ${headers}=           Create Dictionary
    ...                   X-Authorization=CRT PAT token
    ...                   Content-Type=application/json

    ${var}=               Create Session              CRT                         https://api.robotic.copado.com                    headers=${headers}        verify=True

    ${fullRunList}=       Create List

    @{columns}=           Create List                 id                          createdAt                   status                duration       name       failures       errors       passes       skip       tests

    Create File           ${CURDIR}${/}data.csv
    Append To Csv File    ${CURDIR}${/}data.csv       ${columns}
    List Directory        ${CURDIR}

    ${csvcontent}=        Get File                    ${CURDIR}${/}data.csv
    # Log To Console      ${csvcontent}
    Empty Csv File       ${CURDIR}${/}data.csv

    FOR                   ${job}                      IN                          @{joblist}
        ${resp}=          Get On Session              CRT                         /pace/v4/projects/52836/jobs/${job}/builds
        # Log to Console                              ${resp.text}
        ${json}=          Evaluate                    json.loads('''${resp.text}''')                          json
        ${runlist}=       Get Value From Json         ${json}                     $..id
        # Log to Console                              ${runlist}

        FOR               ${run}                      IN                          @{runlist}
            Append To List                            ${fullRunList}              ${run}
            ${createdAt}=                             Get Value From Json         ${json}                     $..data[?(@.id == ${run})].createdAt
            ${createdAt}=                             Get From List               ${createdAt}                0
            ${status}=    Get Value From Json         ${json}                     $..data[?(@.id == ${run})].status
            ${status}=    Get From List               ${status}                   0
            ${duration}=                              Get Value From Json         ${json}                     $..data[?(@.id == ${run})].duration
            ${duration}=                              Get From List               ${duration}                 0
            ${name}=      Get Value From Json         ${json}                     $..data[?(@.id == ${run})].xunitReport.testsuite.total.name
            ${contains}=  Evaluate   "'" in """${name}"""
            ${name}=      Run Keyword If    ${${contains}}                Get From List               ${name}                     0  
            ${failures}=                              Get Value From Json         ${json}                     $..data[?(@.id == ${run})].xunitReport.testsuite.total.failures
            # ${failures}=                              Get From List               ${failures}                 0
            ${errors}=    Get Value From Json         ${json}                     $..data[?(@.id == ${run})].xunitReport.testsuite.total.errors
            # ${errors}=    Get From List               ${errors}                   0
            ${passes}=    Get Value From Json         ${json}                     $..data[?(@.id == ${run})].xunitReport.testsuite.total.passes
            # ${passes}=    Get From List               ${passes}                   0
            ${skip}=      Get Value From Json         ${json}                     $..data[?(@.id == ${run})].xunitReport.testsuite.total.skip
            # ${skip}=      Get From List               ${skip}                     0
            ${tests}=     Get Value From Json         ${json}                     $..data[?(@.id == ${run})].xunitReport.testsuite.total.tests
            # ${tests}=     Get From List               ${tests}                    0

            ${items}=     Create List                 ${run}                      ${createdAt}                ${status}             ${duration}    ${name}    ${failures}    ${errors}    ${passes}    ${skip}    ${tests}
            Log to Console                            ${runlist}
            Append To Csv File                        ${CURDIR}${/}data.csv       ${items}
        END
    END

    ${csvcontent}=        Get File                    ${CURDIR}${/}data.csv
    Log To Console        ${csvcontent}
    ${result1}=           Run Process                 mkdir -p ./output/reports           alias=manager               shell=True
    ${result1}=           Run Process                 cp ${CURDIR}${/}data.csv ./output/reports                       alias=manager         shell=True
    ${result2}=           Run Process                 zip -r reports.zip .         alias=manager               shell=True
    ${result3}=           Run Process                 cp reports.zip ./output/reports                              alias=manager         shell=True
    Log To Console        ${fullRunList}
    Set Suite Variable    ${fullRunList}              ${fullRunList}