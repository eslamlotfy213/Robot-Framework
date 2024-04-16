*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Library         Collections
Test Setup       Open the browser with the Mortgage payment url
Test Teardown    Close Browser session
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

