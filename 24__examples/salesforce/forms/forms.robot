# # NOTE: readme.txt contains important information you need to take into account
# # before running this suite.

# *** Settings ***
# Library                         Collections
# Library                         String
# Resource                        ../common.robot
# Test Setup                      Run Keywords                Setup Browser               Login
# Test Teardown                   End suite
# Force Tags                      Protocol

# *** Test Cases ***

# New Protocol Dialog Verify Record Types
#     LaunchApp                   Protocols
#     # ClickText                   New
#     # Verify Dialog Title New Protocol
#     # Tried to overcome some flakyness, solved by Login for every test in Test Setup
#     Wait Until Keyword Succeeds                             60 sec                      5 sec                       Click New Protocol
#     Verify Record Type Electronic Form Protocol
#     Verify Record Type Training Effectiveness
#     Log Screenshot
#     Click Cancel

# Enter Form New Protocol Electronic Form/Protocol individual fields
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     # Verify Dialog Title New Protocol
#     # Verify Record Type Electronic Form Protocol
#     ClickText                   Electronic Form/Protocol    anchor=An electronic protocol designed to replace paper forms and protocols for execution
#     ClickText                   Next
#     Verify Dialog Title New Protocol Electronic Form Protocol
#     Enter Protocol Name         unique name
#     Enter Additional Protocol Name                          unique additional name
#     Log Screenshot
#     Click Cancel

# Enter Form New Protocol Electronic Form/Protocol only mandatory fields
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Electronic Form Protocol
#     ClickText                   Electronic Form/Protocol    anchor=An electronic protocol designed to replace paper forms and protocols for execution
#     ClickText                   Next
#     Verify Dialog Title New Protocol Electronic Form Protocol
#     Enter Form New Protocol Electronic Form Protocol        unique name                 General                     With Shadow
#     Log Screenshot
#     Click Save

# Enter Form New Protocol Electronic Form/Protocol mandatory and optional fields
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Electronic Form Protocol
#     ClickText                   Electronic Form/Protocol    anchor=An electronic protocol designed to replace paper forms and protocols for execution
#     ClickText                   Next
#     Verify Dialog Title New Protocol Electronic Form Protocol
#     ${unique_string}=	Generate Random String	12	[LOWER]        
#     Enter Form New Protocol Electronic Form Protocol        ${unique_string}                 General                     With Shadow                 unique additional name      Form                        rich description            20                          70                          on                          ${0.1}                      on                          Share With Password         External                1
#     Log Screenshot
#     Click Save

# Enter Form New Protocol Training Effectiveness only mandatory fields
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Training Effectiveness
#     ClickText                   Training Effectiveness      anchor=An electronic protocol designed as an exam, can be used as a verification for training effectiveness.
#     ClickText                   Next
#     Verify Dialog Title New Protocol Training Effectiveness
#     Enter Form New Protocol Training Effectiveness          unique name                 General                     20                          With Shadow                 0                           70
#     Log Screenshot
#     Click Save

# Enter Form New Protocol Training Effectiveness mandatory and optional fields
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Training Effectiveness
#     ClickText                   Training Effectiveness      anchor=An electronic protocol designed as an exam, can be used as a verification for training effectiveness.
#     ClickText                   Next
#     Verify Dialog Title New Protocol Training Effectiveness
#     Enter Form New Protocol Training Effectiveness          unique name                 General                     20                          With Shadow                 0                           70                          rich description            additional protocol name    0.1                         on                          on                          on                          5                       External                1
#     Log Screenshot
#     Click Save

# Verify Form Picklist Values New Protocol Electronic Form/Protocol
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Electronic Form Protocol
#     ClickText                   Electronic Form/Protocol    anchor=An electronic protocol designed to replace paper forms and protocols for execution
#     ClickText                   Next
#     Verify Dialog Title New Protocol Electronic Form Protocol
#     Verify Business Unit PickList Values
#     Log Screenshot
#     Click Cancel

# Create New Protocol Training Effectiveness and Verify Details
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Training Effectiveness
#     ClickText                   Training Effectiveness      anchor=An electronic protocol designed as an exam, can be used as a verification for training effectiveness.
#     ClickText                   Next
#     Verify Dialog Title New Protocol Training Effectiveness
#     Enter Form New Protocol Training Effectiveness          unique name                 General                     20                          With Shadow                 0                           70                          rich description            additional protocol name    0.1                         on                          on                          on                          5                       External                1
#     Log Screenshot
#     Click Save
#     Click Details
#     ${protocol_number}         Get Text    xpath\=//span[text()\='Protocol Number']/following-sibling::div/lightning-formatted-text
#     Log to Console      ${protocol_number}
#     Verify Text                ${protocol_number}      anchor=Protocol Number
#     Verify Text                Training Effectiveness      anchor=Record Type           
#     Log screenshot

# Create New Protocol Training Effectiveness and Verify History
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Training Effectiveness
#     ClickText                   Training Effectiveness      anchor=An electronic protocol designed as an exam, can be used as a verification for training effectiveness.
#     ClickText                   Next
#     Verify Dialog Title New Protocol Training Effectiveness
#     Enter Form New Protocol Training Effectiveness          unique name                 General                     20                          With Shadow                 0                           70                          rich description            additional protocol name    0.1                         on                          on                          on                          5                       External                1
#     Log Screenshot
#     Click Save
#     ClickText                        History
#     # Bug found
#     # Add verify table here
#     Log Screenshot

# Verify New Protocol Training Effectiveness Mandatory Field Messages
#     LaunchApp                   Protocols
#     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
#     ClickText                   New
#     Verify Dialog Title New Protocol
#     Verify Record Type Training Effectiveness
#     ClickText                   Training Effectiveness      anchor=An electronic protocol designed as an exam, can be used as a verification for training effectiveness.
#     ClickText                   Next
#     Verify Dialog Title New Protocol Training Effectiveness
#     Enter Protocol Name         ${EMPTY}
#     Verify Protocol Name        ${EMPTY}                    On
#     Enter Elements Per Page     ${EMPTY}
#     Verify Elements Per Page    ${EMPTY}                    On
#     Log Screenshot
#     Click Save
#     ClickText                        History
#     # Bug found
#     # Add verify table here
#     Log screenshot


# # Create New Protocol Training Effectiveness, Edit and Verify Fields
# #     LaunchApp                   Protocols
# #     # Wait Until Keyword Succeeds                           60 sec                      5 sec                       Click New Protocol
# #     ClickText                   New
# #     Verify Dialog Title New Protocol
# #     Verify Record Type Training Effectiveness
# #     ClickText                   Training Effectiveness      anchor=An electronic protocol designed as an exam, can be used as a verification for training effectiveness.
# #     ClickText                   Next
# #     Verify Dialog Title New Protocol Training Effectiveness
# #     Enter Form New Protocol Training Effectiveness          unique name                 General                     20                          With Shadow                 0                           70                          rich description            additional protocol name    0.1                         on                          on                          on                          5                       External                1
# #     Log Screenshot
# #     Click Save
# #     ClickText                        Edit                        anchor=Export
    
# #     VerifyInputStatus                Record-Type                 ReadOnly
# #     Log screenshot

# *** Keywords ***

# Click New Protocol
#     ClickText                   New                         anchor=Change Owner
#     Verify Dialog Title New Protocol

#     # Let's start with entering the fields - on individual field basis
#     # Why? From a test point of view you want to offer flexibility
#     # Each tests can call individual field keywords or when you
#     # decide to fill in the form entirely, using grouped keyword, that
#     # can be done too

# Enter Protocol Name
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol mandatory
#     [Arguments]                 ${protocol_name}
#     Use Modal                   On
#     TypeText                    *Protocol Name              ${protocol_name}
#     Use Modal                   Off

# Verify Protocol Name
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol mandatory
#     ...                         check_complete_this_field argument is off by default
#     ...                         use in combination with Enter Protocol Name with value ${protocol_name} being ${EMPTY}
#     [Arguments]                 ${protocol_name}            ${check_complete_this_field}=Off
#     Use Modal                   On
#     IF                          '${check_complete_this_field}'=='On'
#         ClickText                   *Protocol Name
#         VerifyText                  Complete this field         anhor=*Protocol Name
#     END
#     VerifyInputValue            *Protocol Name              ${protocol_name}
#     Use Modal                   Off

# Verify Protocol Number
#     [Documentation]             Training Effectiveness empty field read only
#     [Arguments]                 ${protocol_number}
#     Use Modal                   On
#     VerifyField                 Protocol Number             ${protocol_number}
#     Use Modal                   Off

# Enter Additional Protocol Name
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${additional_protocol_name}
#     Use Modal                   On
#     TypeText                    Additional Protocol Name    ${additional_protocol_name}
#     Use Modal                   Off

# Verify Additional Protocol Name
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     ...                         Accepts ${EMPTY} to verify field is empty
#     [Arguments]                 ${additional_protocol_name}
#     Use Modal                   On
#     VerifyInputValue            Additional Protocol Name    ${additional_protocol_name}
#     Use Modal                   Off

# Select Business Unit
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol mandatory
#     [Arguments]                 ${business_unit}
#     Use Modal                   On
#     PickList                    *Business Unit              ${business_unit}
#     Use Modal                   Off

# Verify Business Unit
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol mandatory
#     [Arguments]                 ${business_unit}
#     Use Modal                   On
#     Verify Text                 General
#     Use Modal                   Off

# Select Classification
#     [Documentation]             Electronic Form/Protocol optional
#     [Arguments]                 ${classification}
#     Use Modal                   On
#     PickList                    Classification              ${classification}
#     Use Modal                   Off

# Enter Rich Description
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${rich_description}
#     Use Modal                   On
#     ScrollText                  Rich Description
#     ${result}=                  Run Keyword And Return Status                           Click Item                  textbox                     timeout=5
#     # Log to console            ${result}
#     Run Keyword If              '${result}' == 'False'      Click Element               xpath\=//div[contains(@class,'slds-rich-text-area__content')]
#     WriteText                   ${rich_description}
#     Use Modal                   Off

# Verify Rich Description
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${rich_description}
#     Use Modal                   On
#     ScrollText                  Rich Description
#     Verify Element Text         xpath\=//div[contains(@class,'slds-rich-text-area__content')]                       ${rich_description}
#     Use Modal                   Off

# Verify Record Type
#     [Documentation]             Training Effectiveness empty field read only
#     [Arguments]                 ${record_type}
#     Use Modal                   On
#     VerifyField                 Record Type                 ${record_type}
#     Use Modal                   Off

# Enter Elements Per Page
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${elements_per_page}
#     Use Modal                   On
#     ${result}=                  Run Keyword And Return Status                           TypeText                    *Elements Per Page          ${elements_per_page}        timeout=5
#     # Log to console            ${result}
#     Run Keyword If              '${result}' == 'False'      TypeText                    Elements Per Page           ${elements_per_page}
#     Use Modal                   Off

# Verify Elements Per Page
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${elements_per_page}    ${check_complete_this_field}=Off
#     Use Modal                   On
#     IF                          '${check_complete_this_field}'=='On'
#         ClickText                   Protocol Name
#         ${result}=                  Run Keyword And Return Status                           VerifyField                    *Elements Per Page          ${elements_per_page}        timeout=5
#         Log to console            ${result}
#         Run Keyword If              '${result}' == 'False'      VerifyField                    Elements Per Page           ${elements_per_page}
#     END
    
#     Use Modal                   Off


# Enter Version
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${version}
#     Use Modal                   On
#     TypeText                    Version                     ${version}
#     Use Modal                   Off

# Select Right to Left
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     ...                         checkbox accepts argument value on or off
#     [Arguments]                 ${right_to_left}
#     Use Modal                   On
#     ClickCheckbox               Right to Left               ${right_to_left}
#     Use Modal                   Off

# Select Protocol Execution Style
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol mandatory
#     [Arguments]                 ${protocol_execution_style}
#     Use Modal                   On
#     PickList                    *Protocol Execution Style                               ${protocol_execution_style}
#     Use Modal                   Off

# Enter Execution Limit
#     [Documentation]             Training Effectiveness mandatory
#     [Arguments]                 ${execution_limit}
#     Use Modal                   On
#     TypeText                    *Execution Limit            ${execution_limit}
#     Use Modal                   Off

# Select Show Exam Summary
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     ...                         checkbox accepts argument value on or off
#     [Arguments]                 ${show_exam_summary}
#     Use Modal                   On
#     ClickCheckbox               Show Exam Summary           ${show_exam_summary}
#     Use Modal                   Off

# Select External Sharing
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${external_sharing}
#     Use Modal                   On
#     PickList                    External Sharing            Share Without Password
#     Use Modal                   Off

# Enter Passing Score
#     [Documentation]             Training Effectiveness mandatory
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${passing_score}
#     Use Modal                   On
#     ${result}=                  Run Keyword And Return Status                           TypeText                    *Passing Score              ${passing_score}            timeout=5
#     # Log to console            ${result}
#     Run Keyword If              '${result}' == 'False'      TypeText                    Passing Score               ${passing_score}
#     Use Modal                   Off

# Select Take Only Once
#     [Documentation]             Training Effectiveness optional
#     ...                         checkbox accepts argument value on or off
#     [Arguments]                 ${take_only_once}
#     Use Modal                   On
#     ClickCheckbox               Take Only Once              ${take_only_once}
#     Use Modal                   Off
# Enter Number of Days
#     [Documentation]             Training Effectiveness optional
#     [Arguments]                 ${number_of_days}
#     Use Modal                   On
#     TypeText                    Number of Days              ${number_of_days}
#     Use Modal                   Off

# Search Account
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${account}
#     Use Modal                   On
#     ComboBox                    Search Accounts...          ${account}
#     Use Modal                   Off

# Search Supplier
#     [Documentation]             Training Effectiveness optional
#     ...                         Electronic Form/Protocol optional
#     [Arguments]                 ${supplier}
#     Use Modal                   On
#     ComboBox                    Search Suppliers...         ${supplier}
#     Use Modal                   Off

#     # Now that we have all fields to fill in the form, let's use them for a group
#     # Start with mandatory fields as arguments first, followed by optional ones

# Enter Form New Protocol Electronic Form Protocol

#     [Documentation]             Use this keyword to enter the entire form, first arguments are mandatory fields followed by optional ones
#     ...                         checkbox accepts argument value on or off
#     [Arguments]                 ${protocol_name}            ${business_unit}            ${protocol_execution_style}                             ${additional_protocol_name}=${EMPTY}                    ${classification}=${EMPTY}                              ${rich_description}=${EMPTY}                            ${elements_per_page}=${EMPTY}                           ${passing_score}=${EMPTY}                           ${right_to_left}=${EMPTY}    ${version}=${EMPTY}    ${show_exam_summary}=${EMPTY}    ${external_sharing}=${EMPTY}    ${account}=${EMPTY}    ${supplier}=${EMPTY}

#     # Mandatory fields and arguments first
#     Enter Protocol Name         ${protocol_name}
#     Select Business Unit        ${business_unit}
#     Select Protocol Execution Style                         ${protocol_execution_style}

#     # Now the optional fields, default value is ${EMPTY}, let's skip these when not provided
#     IF                          '${additional_protocol_name}'!='${EMPTY}'
#         Enter Additional Protocol Name                      ${additional_protocol_name}
#     END

#     IF                          '${classification}'!='${EMPTY}'
#         Select Classification                               ${classification}
#     END

#     IF                          '${rich_description}'!='${EMPTY}'
#         Enter Rich Description                              ${rich_description}
#     END

#     IF                          '${elements_per_page}'!='${EMPTY}'
#         Enter Elements Per Page                             ${elements_per_page}
#     END

#     IF                          '${passing_score}'!='${EMPTY}'
#         Enter Passing Score     ${${passing_score}}
#     END

#     IF                          '${right_to_left}'!='${EMPTY}'
#         Select Right to Left    ${right_to_left}
#     END

#     IF                          '${version}'!='${EMPTY}'
#         Enter Version           ${version}
#     END

#     IF                          '${show_exam_summary}'!='${EMPTY}'
#         Select Show Exam Summary                            ${show_exam_summary}
#     END

#     IF                          '${external_sharing}'!='${EMPTY}'
#         Select External Sharing                             ${external_sharing}
#     END

#     IF                          '${account}'!='${EMPTY}'
#         Search Account          ${account}
#     END

#     IF                          '${supplier}'!='${EMPTY}'
#         Search Supplier         ${supplier}
#     END

# Enter Form New Protocol Training Effectiveness
#     [Documentation]             Use this keyword to enter the entire form, first arguments are mandatory fields followed by optional ones
#     ...                         checkbox accepts argument value on or off
#     [Arguments]                 ${protocol_name}            ${business_unit}            ${elements_per_page}        ${protocol_execution_style}                             ${execution_limit}          ${passing_score}            ${rich_description}=${EMPTY}                            ${additional_protocol_name}=${EMPTY}                    ${version}=${EMPTY}         ${right_to_left}=${EMPTY}                           ${show_exam_summary}=${EMPTY}    ${take_only_once}=${EMPTY}    ${number_of_days}=${EMPTY}    ${account}=${EMPTY}    ${supplier}=${EMPTY}

#     # Mandatory fields and arguments first
#     Enter Protocol Name         ${protocol_name}
#     Select Business Unit        ${business_unit}
#     Enter Elements Per Page     ${elements_per_page}
#     Select Protocol Execution Style                         ${protocol_execution_style}
#     Enter Execution Limit       ${execution_limit}
#     Enter Passing Score         ${passing_score}

#     # Now the optional fields, default value is ${EMPTY}, let's skip these when not provided
#     IF                          '${rich_description}'!='${EMPTY}'
#         Enter Rich Description                              ${rich_description}
#     END

#     IF                          '${additional_protocol_name}'!='${EMPTY}'
#         Enter Additional Protocol Name                      ${additional_protocol_name}
#     END

#     IF                          '${version}'!='${EMPTY}'
#         Enter Version           ${version}
#     END

#     IF                          '${right_to_left}'!='${EMPTY}'
#         Select Right to Left    ${right_to_left}
#     END

#     IF                          '${show_exam_summary}'!='${EMPTY}'
#         Select Show Exam Summary                            ${show_exam_summary}
#     END

#     IF                          '${take_only_once}'!='${EMPTY}'
#         Select Take Only Once                               ${take_only_once}
#     END

#     IF                          '${number_of_days}'!='${EMPTY}'
#         Enter Number of Days    ${number_of_days}
#     END

#     IF                          '${account}'!='${EMPTY}'
#         Search Account          ${account}
#     END

#     IF                          '${supplier}'!='${EMPTY}'
#         Search Supplier         ${supplier}
#     END

#     # Which verification keywords can be leverage from on this screen?

# Verify Dialog Title New Protocol
#     Use Modal                   On
#     Verify Text                 New Protocol
#     Use Modal                   Off
# Verify Dialog Title New Protocol Electronic Form Protocol
#     Use Modal                   On
#     Verify Text                 New Protocol: Electronic Form/Protocol
#     Use Modal                   Off

# Verify Dialog Title New Protocol Training Effectiveness
#     Use Modal                   On
#     Verify Text                 New Protocol: Training Effectiveness
#     Use Modal                   Off

# Verify Record Type Electronic Form Protocol
#     Use Modal                   On
#     Verify Text                 Electronic Form/Protocol
#     Verify Text                 An electronic protocol designed to replace paper forms and protocols for execution
#     Use Modal                   Off

# Verify Record Type Training Effectiveness
#     Use Modal                   On
#     Verify Text                 Training Effectiveness      partial_match=true
#     Verify Text                 An electronic protocol designed as an exam, can be used as a verification for training effectiveness.
#     Use Modal                   Off

# Verify Business Unit PickList Values
#     Use Modal                   On
#     VerifyText                  General
#     ${options}=                 GetPicklist                 *Business Unit              delay=5
#     Log to Console              ${options}
#     List Should Contain Value                               ${options}                  --None--
#     List Should Contain Value                               ${options}                  General
#     List Should Contain Value                               ${options}                  Archive
#     List Should Contain Value                               ${options}                  Restricted
#     # OR
#     Verify PickList             *Business Unit              General                     Archive                     Restricted
#     Use Modal                   Off


#     # And custom keywords for the buttons.

# Click Cancel
#     ClickText                   Cancel                      partial_match=true

# Click Save and New
#     ClickText                   Save                        partial_match=true

# Click Save
#     ClickText                   Save                        partial_match=false