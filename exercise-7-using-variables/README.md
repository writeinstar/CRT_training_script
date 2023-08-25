# Welcome to Exercise 7 - Using Variables!

Welcome to **Exercise 7**. Let's practice all the ins and outs related to Variables.

# Purpose

The purpose of this exercise is to learn how to create and use variables in multiple ways.

# Prerequisite(s)

- Access to a Salesforce Trial Org. is required. (exercise 4)
- Access to a Copado Robotic Testing Organization is required
- Access to a Project
- Robot created

# Learning Objectives

- Create variables in the CRT UI
- Set variables using the Variables section
- Create and use variable files
- Set variables using keywords

# Create variables in the CRT UI

## Suite

1. Create a new empty suite **exercise 7 using variables**

2. Open Suite Details

3. View Suite Variables and Execution Parameters

4. Add variables here specific to your suite

## Robot

1. Open Robot Details

2. View Robot Variables and Execution Parameters

3. Add variables here specific to an environment / robot. These variables can be accessed by all suites under the robot

> **Note:** We recommend to create seperate robots for each environment. Considering environment specific report capabilities and dashboards.

## Project

1. Manage Project (hover the breadcrumb below the search, a blue container appears with the button)

2. View Project Variables and Execution Parameters

3. Add variables here specific to an project, or robot. These variables can be accessed by robots and suites in the project.

# Set variables using the Variables section

1. Open empty suite **exercise 7 using variables**

2. Create a folder in the root named **exercise-7-using-variables**

3. In this foler, create file variable-files.robot and copy the contents from here [variables-section.robot](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/1573e4efbfb394d865ef6dd64b1f3d6836563ca1/exercise-7-using-variables/variables-section.robot)

4. Click **Live Test** button displayed just above the test case name **Variables Section** 

# Create and use variable files

1. Open empty suite **exercise 7 using variables**

2. Open folder in the root named **exercise-7-using-variables**

3. In this foler, create file variable-files.robot and copy the contents from here [variable-files.robot](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/1573e4efbfb394d865ef6dd64b1f3d6836563ca1/exercise-7-using-variables/variable-files.robot)

4. In this foler, create file PythonVariables.py and copy the contents from here [PythonVariables.py](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/1573e4efbfb394d865ef6dd64b1f3d6836563ca1/exercise-7-using-variables/PythonVariables.py)

5. In this foler, create file YamlVariables.yaml and copy the contents from here [YamlVariables.yaml](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/1573e4efbfb394d865ef6dd64b1f3d6836563ca1/exercise-7-using-variables/YamlVariables.yaml)

6. In this foler, create file DynamicVariables.py and copy the contents from here [DynamicVariables.py](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/1573e4efbfb394d865ef6dd64b1f3d6836563ca1/exercise-7-using-variables/DynamicVariables.py)

7. Specific to YAML, In the **root** folder, create file requirements.txt and copy the contents from here [requirements.txt](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/1573e4efbfb394d865ef6dd64b1f3d6836563ca1/requirements.txt)

8. Open variable-files.robot and Click Live Test button displayed just above the test cases to see them in action!

# Set variables using keywords

# Files Used

## exercise-6-salesforce-testing/salesforce.robot

		*** Settings ***
		Resource                      ../resources/common.robot
		Suite Setup                   Setup Browser
		Suite Teardown                End suite


		*** Test Cases ***
		Entering A Lead
			[tags]                    Lead                        Git Repo Exercise
			Appstate                  Home
			LaunchApp                 Sales

			ClickText                 Leads
			VerifyText                Recently Viewed             timeout=120s
			ClickText                 New                        anchor=Import
			VerifyText                Lead Information
			UseModal                  On                          # Only find fields from open modal dialog

			Picklist                  Salutation                  Ms.
			TypeText                  First Name                  Tina
			TypeText                  Last Name                   Smith
			Picklist                  Lead Status                 Working
			TypeText                  Phone                       +12234567858449             First Name
			TypeText                  Company                     Growmore                    Last Name
			TypeText                  Title                       Manager                     Address Information
			TypeText                  Email                       tina.smith@gmail.com        Rating
			TypeText                  Website                     https://www.growmore.com/

			ClickText                 Lead Source
			ClickText                 Advertisement
			ClickText                 Save                        partial_match=False
			UseModal                  Off
			Sleep                     2
			
			ClickText                 Details                    anchor=Chatter
			VerifyText               Ms. Tina Smith
			VerifyText               Manager                     anchor=Title
			VerifyField               Phone                       +12234567858449
			VerifyField               Company                     Growmore
			VerifyField               Website                     https://www.growmore.com/
			
			ClickText                 Leads
			VerifyText                Tina Smith
			VerifyText                Manager
			VerifyText                Growmore

		Delete Tina Smith's Lead
			[tags]                    Lead                        Git Repo Exercise
			LaunchApp                 Sales
			ClickText                 Leads
			VerifyText                Recently Viewed             timeout=120s
			
			Wait Until Keyword Succeeds   1 min   5 sec   ClickText    Tina Smith
			ClickText                    Show more actions
			ClickText                    Delete
			ClickText                    Delete
			ClickText                    Close

## resources/common.robot

		*** Settings ***
		Library                         QWeb
		Library                         QForce
		Library                         String


		*** Variables ***
		${browser}                      chrome
		${username}                     YOUR USERNAME HERE
		${login_url}                    https://YOURDOMAIN.my.salesforce.com                    # Salesforce instance. NOTE: Should be overwritten in CRT variables
		${home_url}                     ${login_url}/lightning/page/home


		*** Keywords ***
		Setup Browser
			Set Library Search Order    QWeb                        QForce
			Open Browser                about:blank                 ${browser}
			SetConfig                   LineBreak                   ${EMPTY}                    #\ue000
			SetConfig                   DefaultTimeout              20s                         #sometimes salesforce is slow


		End suite
			Set Library Search Order    QWeb                        QForce
			Close All Browsers


		Login
			[Documentation]             Login to Salesforce instance
			Set Library Search Order    QWeb                        QForce
			GoTo                        ${login_url}
			TypeText                    Username                    ${username}                 delay=1
			TypeText                    Password                    ${password}
			ClickText                   Log In
			
			# Uncommment with Exercise 8 MFA

			# MFA is only required for unknown devices or browsers, once verified it is not asked for. 
			# To enforce MFA in your SF trial, Setup -> Identity -> Identity Verification -> Require MFA for all direct UI logins to your Salesforce org
			
			# ${MFA_needed}=              Run Keyword And Return Status                           Should Not Be Equal         ${None}         ${MY_SECRET}
			# Log To Console              ${MFA_needed} # When given ${MFA_needed} is true, see Log to Console keyword result
			
			# IF                          ${MFA_needed}
			#     ${mfa_code}=            GetOTP                      ${username}                 ${MY_SECRET}
			#     TypeSecret              Verification Code           ${mfa_code}
			#     ClickText               Verify
			# END

		Home
			[Documentation]             Navigate to homepage, login if needed
			Set Library Search Order    QWeb                        QForce
			GoTo                        ${home_url}
			${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                  2
			Run Keyword If              ${login_status}             Login
			ClickText                   Home
			VerifyTitle                 Home | Salesforce