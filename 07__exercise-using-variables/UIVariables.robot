*** Test Cases ***

Exercise 7 - Test UI Level Variables
    Log To Console    Variables stored at project level are for general use
    Log To Console    \n
    Log To Console    UI_project_only value: ${UI_project_only}
    Log To Console    \n

    Log To Console    Variables stored at robot level are usually more specific
    Log To Console    These variables often correspond to an environment or general testing credential
    Log To Console    Robot level variables will overwrite project level variables
    Log To Console    \n
    Log To Console    UI_robot_only value   : ${UI_robot_only}
    Log To Console    UI_robot_project value: ${UI_robot_project}
    Log To Console    \n

    Log To Console    Variables stored at suite level are usually specifc to a use case
    Log To Console    These variables often correspond to data inputs, unique credentials, and similar driving data
    Log To Console    Suite level variables will overwrite project and robot level variables
    Log To Console    \n
    Log To Console    UI_suite_only value         : ${UI_robot_only}
    Log To Console    UI_suite_robot value        : ${UI_robot_project}
    Log To Console    UI_suite_robot_project value: ${UI_suite_robot_project}
    Log To Console    \n