*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Library         Collections
Test Setup       Open the browser with the Mortgage payment url
#Test Teardown    Close Browser session
Resource         resource.robot


*** Variables ***
${error_message}    css:.alert-danger
${Shop_page_load}   css:.nav-link

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login Form    ${user_name}    ${Invalid_password}
    Wait Until Element Is located in the page  ${error_message}
    verify if error message is correct

validate cards display in the shopping Page
     Fill The Login Form    ${user_name}   ${valid_password}
     Wait Until Element Is located in the page  ${Shop_page_load}
     Verify Card titles in the Shop page
     Select The Card       BlackBerry



Select form and navigate to child window
    Fill the Login Details and select the Admin User






*** Keywords ***
Fill the login Form
    [Arguments]     ${username}       ${password}
    Input Text      id:username       ${username}
    Input Password  id:password       ${password}
    Click Button    id:signInBtn


Wait Until Element Is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible   ${element}

verify if error message is correct
     ${result}=  Get Text     ${error_message}
     Should Be Equal As Strings    ${result}    Incorrect username/password.
     Element Text Should Be     ${error_message}   Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList}=  Create List   iphone X  Samsung Note 8   Nokia Edge   Blackberry
    @{elements}=  Get Webelements   css:.card-title
    @{actualList} =   Create List


     FOR  ${element}  IN      @{elements}
       Log    ${element.text}
       Append To List    ${actualList}     ${element.text}
     END


     Lists Should Be Equal     ${expectedList}          ${actualList}


Select the card
    [arguments]     ${cardName}
    @{elements}=    Get WebElements     css:.card-title
    ${index}        Set Variable        0
        FOR     ${element}   IN  @{elements}
            Exit For Loop If    '${cardName}' == '${element.text}'
            ${index}=   Evaluate    ${index} + 1
        END
    Click Button    xpath:(//div[@class='card-footer'])[${index}]/button




Fill the Login Details and select the Admin User
    Input Text        id:username   rahulshettyacademy
    Input Password    id:password   learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    xpath://div[@class='modal-body']
    Click Button     xpath://button[@id='okayBtn']
    Click Button     xpath://button[@id='okayBtn']
    Wait Until Element Is Not Visible    xpath://div[@class='modal-body']
    Select From List By Value    css:select.form-control    teach
    Select Checkbox     xpath://input[@id='terms']
    Checkbox Should Be Selected     xpath://input[@id='terms']