# Welcome to Exercise 6 - Salesforce Testing!

Welcome to **Exercise 6**. Let's create our first Salesforce tests!

# Purpose

The purpose of this exercise is to learn how to create and run your first test against Salesforce using CRT.

# Prerequisite(s)

- Access to a Salesforce Trial Org. is required. (exercise 4)
- Access to a Copado Robotic Testing Organization is required
- Access to a Project
- Robot created

# Learning Objectives

- Create your first Salesforce Test
- Login to Salesfore
- Create Test Case Enter a Lead
- Create Test Case Delete a Lead

# Learn how to requests a Salesforce Trial Org.

1. Create a new empty suite **exercise 6 salesforce testing**

2. Create a folder in the root named **exercise-6-salesforce-testing**

3. In this foler, create file salesforce.robot and copy the contents from here [salesforce.robot](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/09baec6c0a5766831b6ba7e4f6a37f3e3a09e043/exercise-6-salesforce-testing/salesforce.robot)

4. Create a folder in root named **resources**

5. In this foler, create file common.robot and copy the contents from here [common.robot](https://bitbucket.org/copado-robotic-testing/training-exercises/raw/09baec6c0a5766831b6ba7e4f6a37f3e3a09e043/resources/common.robot

6. Open common.robot inside the folder

7. Update the username variable and login_url variable with your saved username and url (exercise 4)

8. Exit the QEditor

9. Navigate your your robot Settings

10. Add a new variable named **password** and provide your saved password (exercise 4)

11. Go back to the QEditor

12. Click Live Test button displayed just above the test case name **Entering A Lead** to watch lead creation.

13. Click Live Test button displayed just above the test case name **Delete Tina Smith's Lead** to watch lead deletion.


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