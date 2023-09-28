# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                        common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite
Library                         QVision
Library                         OperatingSystem
Library                         Collections
Library                         QImage
Force Tags                      single-test

*** Variables ***
${BASE_IMAGE_PATH}          ${CURDIR}

*** Test Cases ***

Compare Images
    Log Variables
    Login
        LaunchApp            Document Revisions
    ClickText            CMD-TEST I RONN
    Sleep                20s
    SetConfig                         SearchMode            None   #Turns off highlighting element        
    CaptureIcon          xpath\=//span[text()\='Document Revision Name']    filename=element.png
    SetConfig                         SearchMode            debug   #Turns on highlighting element
                
    ${takenimage}=                    LogScreenshot         # returns full path to saved image file
    QVision.VerifyIcon                ${CURDIR}/images/element.png          screenshot=${takenimage}  

    @{region_tuples}=                       QVision.Hover Text      text=Document
    ${x}=	Get From List	${region_tuples}	0
    ${y}=   Get From List	${region_tuples}	1     
    QVision.SetConfig                 region                        ${x}    ${y}    180    638
    QVision.Log Screenshot #element capture screen, store that in git
    QVision.VerifyIcon                
    CompareImages            ${takenimage}                   ${CURDIR}/docrevision.png   tolerance=0.950       

    CompareImages            ${takenimage}                   ${CURDIR}/docrevision.png   tolerance=0.950
    CompareImages            ${takenimage}                   ${CURDIR}/docrevision.png       mask_img=${CURDIR}/images/docrevisionmask.png    tolerance=0.995
