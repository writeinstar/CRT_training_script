# # NOTE: readme.txt contains important information you need to take into account
# # before running this suite.

# *** Settings ***
# Documentation                   Example / MyMTAInfo Automation
# Library                         RequestsLibrary             # import library "RequestsLibrary" for REST API testing
# Library                         DateTime                    # imported for date conversion in second test
# Library                         QWeb
# Library                         QForce
# Library                         JSONLibrary
# Resource                        ../resources/common.resource
# Suite Setup                     OpenBrowser                 about:blank                 chrome


# *** Variables ***
# ${EMPLID}                       1286619
# ${STREET}                       200 W Douglas Dr
# ${CITY}                         Edison
# ${STATE}                        NJ
# #${POSTAL}                      08817-4812



# *** Test Cases ***

# Verify Employee details
#     [Documentation]             Verify Employee Information
#     [tags]                      GET

#     # Information with regards to the endpoint
#     # Example URL: https://wwwuat.mymta.info/PSIGW/RESTListeningConnector/HC92UAT/ExecuteQuery.v1/PUBLIC/B_HOME_ADDRESS_4EMP/JSON/NONFILE?isconnectedquery=N&maxrows=1&prompt_psqueryname=&prompt_uniquepromptname=BIND1&prompt_fieldvalue=1286619&json_resp=true
#     # BaseUrl: https://wwwuat.mymta.info
#     # Endpoint relative to the BaseUrl: /PSIGW/RESTListeningConnector/HC92UAT/ExecuteQuery.v1/PUBLIC/B_HOME_ADDRESS_4EMP/JSON/NONFILE
#     # QueryParams: ?isconnectedquery=N&maxrows=1&prompt_psqueryname=&prompt_uniquepromptname=BIND1&prompt_fieldvalue=1286619&json_resp=true
             
#     # Set the Headers
#     ${headers}=         Create Dictionary
#     ...                  Authorization=Basic${SPACE}U0VSVklDRU5PV19VU0VSOlBBU1RHMDgyM0BtdGE\=
#     ...                  Connection=keep-alive
#     ...                  User-Agent=PostmanRuntime/7.34.0
#     ...                  Accept=*/*
#     ...                  Accept-Encoding=gzip, deflate, br

#     # Create a session using Create Session
#     # Use BaseUrl here
#     ${var}=                     Create Session              openMyMTA                   https://wwwuat.mymta.info     headers=${headers}      verify=True


#     ${queryParams}=         Create Dictionary
#     ...                  isconnectedquery=N
#     ...                  maxrows=1
#     ...                  prompt_psqueryname=${EMPTY}
#     ...                  prompt_uniquepromptname=BIND1
#     ...                  prompt_fieldvalue=1286619
#     ...                  json_resp=true

#     # Call the Endpoint with Query Parameters
#     ${resp} =                   Get On Session              openMyMTA                   /PSIGW/RESTListeningConnector/HC92UAT/ExecuteQuery.v1/PUBLIC/B_HOME_ADDRESS_4EMP/JSON/NONFILE       params=${queryParams}
    
#     # Check and log status code from the response
#     Should Be Equal As Strings                              ${resp.status_code}         200
#     Log                         ${resp.text}
#     Log to Console              ${resp.text}
    
#     ${emp_info}                 Evaluate    ${resp.text}  
#     Log                         ${emp_info}
#     Log to Console              ${emp_info}

#     # JSONLibrary returns a list of values
#     ${STREET_LIST}=	                Get Value From Json	                        ${emp_info}                         	$..STREET
#     Log to Console              ${STREET_LIST}    
#     Should Contain Match        ${STREET_LIST}                        200 W Douglas Dr
#     ${STREET}=                  Get From List             ${STREET_LIST}                         0  
#     Should Be Equal As Strings                              ${STREET}                   200 W Douglas Dr

#     # # parse returned data to variables using helper keyword from resources
#     # ${emp_info}=                Get Field Value From Json                               ${resp.text}                STREET
#     # Log                         ${emp_info}
#     # ${EMPLID}=                  Get From Dictionary         ${resp.text}                 EMPLID
#     # ${STREET}=                  Get From Dictionary         ${emp_info}                 STREET
#     # ${CITY}=                    Get From Dictionary         ${emp_info}                 CITY
#     # # ${POSTAL}                 Get From Dictionary         ${emp_info}                 POSTAL
#     # # Log                       ${POSTAL}
#     # #${POSTAL}=                 Get From Dictionary         ${POSTAL}                   POSTAL

#     # # Verify returned information against known values
#     # Should Be Equal As Strings                              ${EMPLID}                   ${EMPLID}
#     # Should Be Equal As Strings                              ${STREET}                   ${STREET}
#     # Should Be Equal As Strings                              ${CITY}                     ${CITY}
#     # #Should Be Equal As Strings                             ${POSTAL}                   ${POSTAL}



