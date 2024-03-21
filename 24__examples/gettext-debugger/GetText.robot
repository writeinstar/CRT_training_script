*** Settings ***
Resource                ../../resources/common.robot
Resource                ../../resources/leads.robot
Library                 QVision
Suite Setup             Setup Browser
Suite Teardown          Close All Browser Sessions

*** Comments ***
This file was built to demonstrate how text can be captured through the use of GetText and xpath
The test cases contained within leverage a Salesforce Sales Trial org.
W3Schools tutorials on xpath: https://www.w3schools.com/xml/xpath_intro.asp
W3Schools reference for xpath functions: https://www.w3schools.com/xml/xsl_functions.asp

They will cover the following strategies for capturing text:

- Generic Text Capture using GetText. 
https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QWeb.html#Get%20Text
This strategy requires the use of either xpath or html attributes to identify html nodes

- QForce's GetFieldValue keyword.
https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QForce.html#Get%20Field%20Value
This stratgey is a simplified way to capture text, but relies on Salesforce's standard for page layouts


*** Test Cases ***
Generic Text Capture using GetText
    Set Library Search Order    QForce    QWeb    QVision
    Home
    VerifyText          Seller Home

    #Grabbing the App Title by a attribute-based xpath.
    #This will look for any element(//*),
    #that matches the criteria ([]),
    #where the "title" attribute (@title) equals "Sales"
    ${App_Title}=       GetText                     //*[@title\="Sales"]
    Log To Console      ${App_Title}

    #Move to a more complex view
    ClickText           Leads
    ClickText           Tina Smith

    #Grab the text for Tina's company, "Growmore".
    #A good way to find xpath for elements in Salesforce is to search for unique text first.
    #Then "anchor" to that unique text and path to your target. AVOID ids in Salesforce.
    #ids in Salesforce are refreshed on page load, and will invalidate xpath

    #This xpath will look for any element (//*),
    #that matches the criteria ([]),
    #where the inner text of the element (text())
    #contains (contains( , ))
    #the text "Company"
    ${Company_Field_Title}=    GetText                     //*[contains(text(),"Company")]
    Log To Console      ${Company_Field_Title}
    
    #The company field's value is still not found, but we now have our anchor
    #From the anchorpoint, we need to traverse to the parent element (/..).
    #This occurs three times in order to reach the point of divergence in html, where
    #one tree will bring you back to the anchor point and others will become unique sections in the page,
    #such as the field's value "Growmore" vs the field's title of "Company"
    #From the point of divergence, we go down one element (/dd) into the tree 
    #containing the field's value "Growmore"
    ${Company_Name_Tree}=    GetText                     //*[contains(text(),"Company")]/../../../dd
    Log To Console      ${Company_Name_Tree}
    #Notice that the GetText captured ALL text in this element tree.

    #Now we can travel down the html to the field value we want
    ${Company_Name}=    GetText                        //*[contains(text(),"Company")]/../../../dd/div/span                 
    Log To Console      ${Company_Name}

Leveraging QForce's GetFieldValue Keyword
    Home
    ClickText    Leads
    ClickText    Tina Smith
    
    #For Salesforce record fields specifically, we can simplify the above solution into the following keyword:
    ${Company_Name_Alternate}=    GetFieldValue    Company
    Log To Console      ${Company_Name_Alternate}
