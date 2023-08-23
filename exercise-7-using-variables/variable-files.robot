*** Settings ***
Variables    PythonVariables.py
Variables    YamlVariables.yaml
Variables    DynamicVariables.py

*** Test Cases ***
Access Python Variables
    Log   ${TestEnv.ip}
    Log    ${TestEnv.roles}
    Log Many   @{TestEnv.roles}
    Log    ${my_var}
    Log Many   @{my_list}
    Log Many   &{my_dict}
    FOR    ${item}    IN    @{my_list}
        Log    ${item}
    END

Access Yaml Variables
    Log        ${base_url}
    Log Many   @{yaml_list}
    Log        ${yaml_dict}
    Log        ${yaml_dict}[key_1]

Access Dynamic Variables
    # Log   ${USER}
    Log   ${RANDOM_INT}
    Log   ${CURRENT_TIME}
    Log   ${AFTERNOON}
    Log   ${AREA1}
    Log   ${AREA2}

Use variable file with argument value dev
    [Tags]         include-example
    Import Variables	${CURDIR}/vars.py    dev
    Log Variables
    Log            ${scalar}        level=WARN
    Log            ${list}    level=WARN
    
    ${the_var}=    Get Variable Value    ${extra}
    IF    "${the_var}" != "None"
        Log            ${extra}         level=WARN
    END

Use variable file with argument value uat
    [Tags]         include-example
    Import Variables	${CURDIR}/vars.py    uat
    Log Variables
    Log            ${scalar}        level=WARN
    Log            ${list}    level=WARN
    
    ${the_var}=    Get Variable Value    ${extra}

    IF    "${the_var}" != "None"
        Log            ${extra}         level=WARN
    END