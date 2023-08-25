*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    Go To                     "https://docs.copado.com/articles/#!copado-robotic-testing-publication/all-qwords"
    Go To                     "https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QWeb.html"
    Go To                     "https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QForce.html"
    Go To                     "https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QVision.html"
    Go To                     "https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QMobile.html"
    Go To                     "https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QS4Hana.html"
    Go To                     "https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QNow.html"
    Go To                     "https://robotframework.org/?tab=builtin#resources"

