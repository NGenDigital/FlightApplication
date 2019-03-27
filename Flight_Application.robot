*** Settings ***
Test Teardown     close browser
Library           SeleniumLibrary
Resource          Commonkeywords.txt
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC01-Login screen - objects on the page
    Loginandnavigatetourl
    Change to iframe
    Objectonwebpage
    [Teardown]    close browser

TC02_Login screen - default text for username and password
    Loginandnavigatetourl
    Change to iframe
    Defaultvalueusernamepassword
    [Teardown]

TC03_User doesn't enter email
    Loginandnavigatetourl
    Change to iframe
    EmptyUsername

TC04_User doesn't enter password
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    Change to iframe
    Emptypassword

TC05_User doesn't enter email or password
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    Change to iframe
    emptyusernamepassword

TC06_User enters invalid email format
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    Invalidemailformat

TC07_User logs in with valid username and password
    Loginandnavigatetourl
    Change to iframe
    Login
    Select Frame    id=iframe-114
    verifyafterlogin

TC08_Book a Flight - Round Trip between To and From Destinations_Verify 'From' cities
