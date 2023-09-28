*** Settings ***
Library                   QWeb
Library                   InitializeArgumentFileLib.pyy

*** Test Cases ***

Examples - Load argument file variables
    Log Variables
    Load Config File      ${CURDIR}${/}..${/}config${/}env.config
    Log Variables
    Open Browser          ${url}                ${browser}
    Close All Browsers
