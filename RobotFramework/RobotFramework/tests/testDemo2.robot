*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser session
Resource        ../PO/Generic.robot


*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link


*** Test Cases ***
Validate UnSuccesful Login
    [Tags]      SMOKE
    Fill the login Form     ${user_name}    ${invalid_password}
    wait until Element is located in the page     ${Error_Message_Login}
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login Form     ${user_name}    ${valid_password}
    wait until Element is located in the page     ${Shop_page_load}
    Verify Card titles in the Shop page
    Select the Card     Nokia Edge


Select the Form and navigate to Child window

    Fill the Login Details and Login Form


*** Keywords ***

Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn


wait until Element is located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}


verify error message is correct
   ${result}=   Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}     Incorrect username/password.
   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.

Verify Card titles in the Shop page
   @{expectedList} =    Create List     iphone X    Samsung Note 8      Nokia Edge       Blackberry
   ${elements} =  Get WebElements     css:.card-title
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      Log   ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   Lists Should Be Equal   ${expectedList}    ${actualList}


Select the Card
    [arguments]     ${cardName}
    ${elements} =  Get WebElements     css:.card-title
    ${index}=   Set Variable    1
     FOR  ${element}  IN      @{elements}
         Exit For Loop If      '${cardName}' == '${element.text}'
         ${index}=  Evaluate   ${index} + 1
     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button


Fill the Login Details and Login Form

    Input Text          id:username     rahulshettyacademy
    Input Password      id:password     learning
    Click Element       css:input[value='user']
    Wait Until Element Is Visible       css:.modal-body
    Click Button        id:okayBtn
    Click Button        id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value       css:select.form-control       teach
    Select Checkbox     terms
    Checkbox Should Be Selected     terms




































