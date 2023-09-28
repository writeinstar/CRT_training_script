# # NOTE: readme.txt contains important information you need to take into account
# # before running this suite.

# *** Settings ***
# Resource                        ../../resources/common.robot
# Suite Setup                     Setup Browser
# Suite Teardown                  End suite
# Library                         QVision
# Library                         OperatingSystem
# Library                         Collections
# Library                         QImage
# Force Tags                      single-test

# *** Variables ***
# ${BASE_IMAGE_PATH}          ${CURDIR}

# *** Test Cases ***
# Image Verification and Comparions (to be updated)
#     Log Variables
#     Home
    
#     Sleep                20s
#     SetConfig                         SearchMode            None   #Turns off highlighting element        
#     CaptureIcon          xpath\=//span[text()\='Document Revision Name']    filename=element.png
#     SetConfig                         SearchMode            debug   #Turns on highlighting element
                
#     ${takenimage}=                    LogScreenshot         # returns full path to saved image file
#     QVision.VerifyIcon                ${CURDIR}/images/element.png          screenshot=${takenimage}  

#     @{region_tuples}=                       QVision.Hover Text      text=Document
#     ${x1}=	Get From List	${region_tuples}	0
#     ${x1}=   Get From List	${region_tuples}	1
#     ${y1}=                 Evaluate         ${x1}-300
#     ${y2}=                 Evaluate         ${y1}-300
#     ${x2}=                 Evaluate         ${x1}+500
#     ${y2}=                 Evaluate         ${y1}+500
#     QVision.SetConfig                 region                        ${x1}    ${y1}    ${x2}    ${y2}
#     ${takenimageuseregion}=                    QVision.Log Screenshot        #element capture screen, store that in git
#         SetConfig                         SearchMode            None   #Turns off highlighting element      
#      CaptureIcon          xpath\=//a[text()\='Related Records']    filename=element2.png
#      QVision.VerifyIcon                ${CURDIR}/screenshots/element2.png          screenshot=${takenimageuseregion}  


#     CompareImages            ${takenimage}                   ${CURDIR}/docrevision.png   tolerance=0.950    
#     SetConfig                         SearchMode            debug   #Turns on highlighting element   

#     CompareImages            ${takenimage}                   ${CURDIR}/docrevision.png   tolerance=0.950
#     CompareImages            ${takenimage}                   ${CURDIR}/docrevision.png       mask_img=${CURDIR}/images/docrevisionmask.png    tolerance=0.995

         
    
#     QVision.VerifyIcon
#     # Log to Console              ${CURDIR}
#     # Log to Console                       ${EXECDIR}
#     # @{items} =	                 List Directory	 ${CURDIR}	
#     # @{items2} =                 List Directory	${CURDIR}${/}images
#     # # Computer vision and OCR related configs
#     # QVision.SetConfig    ignore_case                sentence
#     # QVision.SetConfig    ignored_chars              _
#     # QVision.SetConfig    ocr_scale                  1.0
#     # QVision.SetConfig    search_direction           right
#     # QVision.SetConfig    tolerance_icon             0.9
#     # QVision.SetConfig    tolerance_text             0.8
#     # QVision.VerifyIcon          ${CURDIR}${/}images${/}openedpendingreview.png              screenshot=${file}
#     # Log                         ${CURDIR}/images/Test2.png

#     # CaptureIcon          xpath\=//span[text()\='Document Revision Name']    filename=custom_screenshot_name_123.png
#     # List Directory       ${CURDIR}/screenshots/custom_screenshot_name_123.png
#     # Log to Console       ${CURDIR}
#     # Log to Console       <img src='https://www.dotcompliance.com/wp-content/uploads/2021/01/dot-logo-new.png' />
#     # CaptureIcon          xpath\=//flexipage-tab2[@role\='tabpanel' and @aria-labelledby\='customTab__item']    filename=fullsection.png
#     # List Directory       ${CURDIR}


# # root folder in execution
# # /home/executor/execution/Test-with-Patrick

# # root folder in live testing
# #/home/service/suite/#root