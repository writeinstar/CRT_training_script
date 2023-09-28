# *** Settings ***
# Library               QForce
# # Library               DataDriver                  file=fields.csv             #include=tc02    #exclude=tagtoexclude
# Resource              ../resources/common.robot
# Suite Setup           Run Keywords     Setup Browser    Login
# # Test Template         Verify Fields In Object Manager
# Suite Teardown        End suite
# Force Tags            Objects


# *** Test Cases ***
# Verify Fields In Object Manager with ${label} ${api_name} ${type} ${description} ${field_label} ${field_name} ${data_type} ${controlling_field} ${indexed}

# *** Keywords ***
# Verify Fields In Object Manager
#     [Arguments]       ${label}                    ${api_name}                 ${type}         ${description}           ${field_label}    ${field_name}    ${data_type}    ${controlling_field}    ${indexed}
#     ClickText         Setup
#     ClickText         Opens in a new tab
#     SwitchWindow      NEW
#     ClickText         Object Manager              anchor=Press Spacebar to reorder.
#     VerifyText        Quick Find                  anchor=Schema Builder
    
#     TypeText          Quick Find                  ${label}\n
#     Use Table         ${label}
#     VerifyText        ${label}                    partial_match=False
#     ${row}            GetTableRow                 ${label}                    ${api_name}     skip_header=True
#     VerifyTable       r${row}c1                   ${api_name}
#     VerifyTable       r${row}c2                   ${type}
#     VerifyTable       r${row}c3                   ${description}
#     Log Screenshot
#     ClickText         ${label}                    partial_match=False

#     # Manual Run for debugging
#     # TypeText        Quick Find                  Account\n
#     # Use Table       Account
#     # VerifyText      Account                     partial_match=False
#     # ${row}          GetTableRow                 Account                     Account         skip_header=True
#     # VerifyTable     r${row}c1                   Account
#     # VerifyTable     r${row}c2                   Standard Object
#     # VerifyTable     r${row}c3                   ${EMPTY}
#     # ClickText       Account                     partial_match=False

#     Click Text        Fields & Relationships


#     Use Table         ${field_label}
#     ${row}            GetTableRow                 ${field_label}              ${data_type}    skip_header=True
#     VerifyTable       r${row}c1                   ${field_label}
#     VerifyTable       r${row}c2                   ${field_name}
#     VerifyTable       r${row}c3                   ${data_type}
#     VerifyTable       r${row}c4                   ${controlling_field}
#     ${value}          GetCellText                 r${row}c5
#     VerifyTable       r${row}c5                   ${indexed}
#     Log Screenshot

#     # Manual Run for debugging
#     # Use Table       Account Name
#     # ${row}          GetTableRow                 Account Name                Text(255)       skip_header=True
#     # VerifyTable     r${row}c1                   Account Name
#     # VerifyTable     r${row}c2                   Name
#     # VerifyTable     r${row}c3                   Text(255)
#     # VerifyTable     r${row}c4                   ${EMPTY}
#     # ${value}        GetCellText                 r${row}c5
#     # VerifyTable     r${row}c5                   False

#     Back
#     Back