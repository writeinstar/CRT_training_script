*** Settings ***

Documentation           Test suite for Pace starter.
Library                 QWeb
Suite Setup             Open Browser        about:blank                            chrome
Suite Teardown          Close All Browsers
Test Setup              GoTo                https://qentinelqi.github.io/shop/
Test Teardown           GoTo                about:blank

*** Variables ***
${loginUrl}=    Test Env

*** Test Cases ***

${loginUrl} Default
    [Documentation]     Setup and teardown from setting section
    VerifyText          Find your spirit animal

Default 2 
    [Documentation]     Setup and teardown from setting section
    VerifyText          The animal friendly clothing company

Overridden Setup
    [Documentation]     Own setup, teardown from setting section
    [Setup]             GoTo                https://qentinelqi.github.io/shop/products/deer/
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

No teardown
    [Documentation]     Default setup, no teardown at all
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact
    [Teardown]

No teardown 2
    [Documentation]     Setup and teardown can be disabled also with special value NONE
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact
    [Teardown]          NONE