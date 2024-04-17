*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary

*** Variables ***
${Shop_page_load}           css:.nav-link
${country_location}         //a[text()='India']



*** Keywords ***

Enter the Country and select the terms
    [arguments]      ${country_name}
    input text      country     ${country_name}
    Wait Until element passed is located on Page        //a[text()='${country_name}']
    click element       //a[text()='${country_name}']
    Sleep           2
    click element       css:.checkbox label


Purchase the Product and Confirm the Purchase
    click button    css:.btn-success
    page should contain     Success!





