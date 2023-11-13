# Exercise 7 - Using Variables!

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

4. Add the following variables to your suite:

	a. UI_suite_only
	
	b. UI_suite_robot
	
	c. UI_suite_robot_project
	
5. Give each variable the value "This is a suite level value"


## Robot

1. Open Robot Details

2. View Robot Variables and Execution Parameters

3. Add variables here specific to an environment / robot. (This may be done from Exercise 04) These variables can be accessed by all suites under the robot

4. Add the following variables to your robot:

    a. UI_robot_only

	b. UI_robot_project

	c. UI_suite_robot

	d. UI_suite_robot_project

5. Give each variable from Step 4 the value "This is a robot level value"

> **Note:** We recommend to create seperate robots for each environment. Considering environment specific report capabilities and dashboards.

## Project

1. Manage Project (hover the breadcrumb below the search, a blue container appears with the button)

2. View Project Variables and Execution Parameters

3. Add variables here for the entire project. These variables can be accessed by robots and suites in the project.

    a. UI_project_only

	b. UI_robot_project

	c. UI_suite_robot_project

4. Give each variable from Step 3 the value "This is a project level value"

# Use Variables that were set on the CRT UI

1. Open empty suite **exercise 7 using variables**

2. Create a folder in the root named **07__exercise-using-variables**

3. In this folder, create file ui-variables.robot and copy the contents from here [ui-variables.robot](ui-variables.robot)

4. Click **Execute** button displayed just above the test case name **Variables Section**

5. Exit QEditor and locate your test execution

6. Open the **Execution Logs** in the top right of **Suite Run Results** to see your UI variables in action!

# Set variables using the Variables section

1. Open empty suite **exercise 7 using variables**

2. Create a folder in the root named **07__exercise-using-variables**

3. In this folder, create file variable-files.robot and copy the contents from here [variables-section.robot](variables-section.robot)

4. Click **Live Test** button displayed just above the test case name **Variables Section** 

# Create and use variable files

1. Open empty suite **exercise 7 using variables**

2. Open folder in the root named **07__exercise-using-variables**

3. In this folder, create file variable-files.robot and copy the contents from here [variable-files.robot](variable-files.robot)

4. In this folder, create file PythonVariables.py and copy the contents from here [PythonVariables.py](PythonVariables.py)

5. In this folder, create file YamlVariables.yaml and copy the contents from here [YamlVariables.yaml](YamlVariables.yaml)

6. In this folder, create file DynamicVariables.py and copy the contents from here [DynamicVariables.py](DynamicVariables.py)

7. In this folder, create file EnvVariables.py and copy the contents from here [EnvVariables.py](EnvVariables.py)

8. Specific to YAML, In the **root** folder, create file requirements.txt and copy the contents from here [requirements.txt](../requirements.txt)

9. Open variable-files.robot and Click Live Test button displayed just above the test cases to see them in action!

# Set variables using keywords

1. Open empty suite **exercise 7 using variables**

2. Open folder in the root named **07__exercise-using-variables**

3. In this folder, create file set-variables-keywords.robot and copy the contents from here [set-variables-keywords.robot](set-variables-keywords.robot)

4. Click **Live Test** button displayed just above the test case names and learn about **scope of variables** using different keywords.