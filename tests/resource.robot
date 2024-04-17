*** Settings ***
Documentation    A  resource file with resalable keywords
...              this helpful file
Library          SeleniumLibrary
Library          OperatingSystem

*** Variables ***
${user_name}               rahulshettyacademy
${Invalid_password}        learning12345
${valid_password}          learning
${url}                     https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
Open the browser with the Mortgage payment url
    Create webdriver    Chrome  options.add_experimental_option("detach", True)
    GO TO               ${url}

#Close Browser session
#    Close Browser