*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${error_message}   css:.alert-danger

*** Test Cases ***
Validate UnSucessful Login
    open the browser with the Mortage payment url
    Fill the login Form
    wait until it checks and display error message
    verify if error message is correct

*** Keywords ***
open the browser with the Mortage payment url
    Create webdriver    Chrome  options.add_experimental_option("detach", True)
    GO TO  https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text      id:username   rahulshettyacademy
    Input Password  id:password   learning12345
    Click Button    id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message}

verify if error message is correct
     ${result}=  Get Text     ${error_message}
     Should Be Equal As Strings    ${result}    Incorrect username/password.
     Element Text Should Be     ${error_message}   Incorrect username/password.



