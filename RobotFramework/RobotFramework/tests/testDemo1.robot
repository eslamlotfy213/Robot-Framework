*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown   Close Browser


*** Variables ***
${Error_Message_Login}      css:.alert-danger


*** Test Cases ***
Validate UnSuccesful Login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/Users/rahulshetty/Documents/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text          id:username     rahulshettyacademy
    Input Password      id:password     12345678
    Click Button        signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Message_Login}

verify error message is correct
   ${result}=   Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}     Incorrect username/password.
   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.
















