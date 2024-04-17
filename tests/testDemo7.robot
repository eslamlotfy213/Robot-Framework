*** Settings ***
Library       Collections
Library       RequestsLibrary

*** Variables ***
${base_url}         https://rahulshettyacademy.com
${book_id}
${book_name}        RobotFramework

*** Test Cases ***
Play around with Dictinoary
    [Tags]      API
    &{data}=    Create Dictionary      name=rahulshetty     course=robot       website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key     ${data}     name
    log     ${data}[name]
    ${url}=     Get From Dictionary     ${data}     website
    log   ${url}


Add Book into Library DataBase
        [Tags]      API
      &{req_body}=  Create Dictionary    name=${book_name}        isbn=947303     aisle=324534        author=rahulshetty
       ${response}=     POST        ${base_url}/Library/Addbook.php     json=${req_body}    expected_status=200
        log      ${response.json()}
        Dictionary Should Contain Key     ${response.json()}     ID
         ${book_id}=    Get From Dictionary     ${response.json()}    ID
         Set Global Variable    ${book_id}
         log  ${book_id}
         Should be equal as Strings     successfully added      ${response.json()}[Msg]
         status should be       200     ${response}

Get the Book Details which got added
       [Tags]      API
      ${get_response}=   GET     ${base_url}/Library/GetBook.php     params=ID=${book_id}      expected_status=200
      log    ${get_response.json()}
      Should be Equal as Strings     ${book_name}    ${get_response.json()}[0][book_name]


Delete the Book from database
        [Tags]      API
        &{delete_req}=      Create Dictionary       ID=${book_id}
       ${delete_resp}=   POST    ${base_url}/Library/DeleteBook.php      json=${delete_req}      expected_status=200
       log      ${delete_resp.json()}
       Should be Equal as Strings   book is successfully deleted    ${delete_resp.json()}[msg]






















