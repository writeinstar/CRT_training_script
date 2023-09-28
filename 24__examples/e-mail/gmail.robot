# *** Settings ***
# Library                     QForce
# Library                     String
# Library                     Collections
# Library                     ../libraries/GMailLib.py
# Test Setup                  Open Browser  about:blank  chrome
# Test Teardown               Close All Browsers
# # imap.gmail.com:993

# *** Variables ***
# # https://support.google.com/mail/answer/185833?hl=en
# ${app_password}    xxx
# ${email}           xxx        # firstname.lastname@gmail.com etc.
# ${subject}         Jouw afleverbon   # Arriving Email subject line
# ${textInBody}      aankoop

# *** Test Cases ***
# Email Verification
#     [Documentation]    Sample test to read links from email message in Gmail
    
#     @{links}=          Get Email Links Html        email=${email}       pwd=${app_password}    subject=${subject}    inbody=${textInBody}
#     FOR                ${link}                     IN                   @{links}
#         Log To Console                             located a link: ${link}
#         OpenWindow
#         GoTo           ${link}
#         # add steps here..
#     END
    
#     @{bodies}=   Get Email Bodies    email=${email}   pwd=${app_password}   subject=${subject}

#     FOR  ${body}  IN  @{bodies}
#         Log To Console   located a body: ${body}
#         # add steps here..
#     END

#     @{soups}=   Get Email Soup    email=${email}   pwd=${app_password}   subject=${subject}
    
#     FOR  ${soup}  IN  @{soups}
#         Log To Console   located a soup: ${soup}
#         # add steps here..
#     END

#     @{links}=   Get Email Links    email=${email}   pwd=${app_password}   subject=${subject}

#     FOR  ${link}  IN  @{links}
#         Log To Console   located a link: ${link}
#         GoTo  ${link}
#         # add steps here..
#     END