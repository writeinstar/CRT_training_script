*** Settings ***
Library    Process

*** Test Cases ***

Initialize Suite 
    Run Process	   pip install PyYAML    	shell=yes