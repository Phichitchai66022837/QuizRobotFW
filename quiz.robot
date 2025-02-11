*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://automationexercise.com
${NAME}  TestUser
${EMAIL}  testuser45132@gmail.com
${PASSWORD}  TestPassword123
${DOB_DAY}  1
${DOB_MONTH}  January
${DOB_YEAR}  2000
${FIRST_NAME}  Test
${LAST_NAME}  User
${COMPANY}  TestCompany
${ADDRESS}  123 Test Street
${ADDRESS2}  Suite 456
${COUNTRY}  United States
${STATE}  California
${CITY}  Los Angeles
${ZIPCODE}  90001
${MOBILE}  1234567890

*** Test Cases ***
User Registration And Deletion
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains  Home  timeout=10s
    Click Element  xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Page Contains  New User Signup!  timeout=10s
    Input Text  name=name  ${NAME}
    Input Text  xpath=//*[@id="form"]/div/div/div[3]/div/form/input[3]  ${EMAIL}
    Click Button  xpath=//button[contains(text(),'Signup')]
    Wait Until Page Contains  ENTER ACCOUNT INFORMATION  timeout=10s
    Wait Until Element Is Visible  id=id_gender1  timeout=5s
    Click Element  //*[@id="form"]/div/div/div/div[1]/form/div[1]/div[1]/label
    Input Text  //*[@id="password"]  ${PASSWORD}
    Select From List By Label  id=days  ${DOB_DAY}
    Select From List By Label  id=months  ${DOB_MONTH}
    Select From List By Label  id=years  ${DOB_YEAR}
    Click Element  id=newsletter
    Click Element  id=optin
    Input Text  id=first_name  ${FIRST_NAME}
    Input Text  id=last_name  ${LAST_NAME}
    Input Text  id=company  ${COMPANY}
    Input Text  id=address1  ${ADDRESS}
    Input Text  id=address2  ${ADDRESS2}
    Select From List By Label  id=country  ${COUNTRY}
    Input Text  id=state  ${STATE}
    Input Text  id=city  ${CITY}
    Input Text  id=zipcode  ${ZIPCODE}
    Input Text  id=mobile_number  ${MOBILE}
    Click Button  id=submitAccount
    Wait Until Page Contains  ACCOUNT CREATED!  timeout=10s
    Click Button  xpath=//a[contains(text(),'Continue')]
    Wait Until Page Contains  Logged in as  timeout=10s
    Click Element  xpath=//a[contains(text(),'Delete Account')]
    Wait Until Page Contains  ACCOUNT DELETED!  timeout=10s
    Click Button  xpath=//a[contains(text(),'Continue')]
    Close Browser