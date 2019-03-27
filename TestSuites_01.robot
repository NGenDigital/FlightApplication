*** Settings ***
Force Tags
Default Tags
Resource          Userdefinedkeywords.txt    # This is my first resource file
Library           SeleniumLibrary
Library           ExcelLibrary

*** Variables ***
${var1}           4    # This is my first scaler variable
@{USER}           Bharat    Bharat1
&{Credentials}    username=bharat    password=bharat
${textfield}      ${EMPTY}
@{listvar1}
${num12}          ${EMPTY}
@{cities}
${City}           ${EMPTY}

*** Test Cases ***
TC01
    [Documentation]    This is my first test case.It is used to compare \ two variables.
    ...    *Testcase01* \ _This will be initalic_
    ...    Link is http://www.google.com
    Open Browser    https://ngendigital.com/flight-application/    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-114
    Click element    xpath://button[@name='Booking']
    sleep    3
    [Teardown]    Close Browser

TC02
    [Tags]    LOGIN
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    @{USER}[0]    @{USER}[1]
    [Teardown]    Teardowndemo

TC03
    Should Be Equal As Strings    &{Credentials}[username]    &{Credentials}[password]
    Set Tags    @{Bharat}

TC04
    [Tags]    LOGIN
    [Setup]
    [Template]
    [Timeout]
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    sleep    2
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    sleep    2
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    ${textfield}    Get Text    xpath://tbody/tr[4]/td[1]
    Log To Console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    [Teardown]    close Browser

TC05
    [Template]
    [Timeout]
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    sleep    2
    Click Image    xpath://*[@id="header_stickynav14598"]/nav/div[2]/div[1]/div/a/img
    sleep    4
    [Teardown]    close browser

TC06
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    sleep    4
    Select Radio Button    flight    flighthotel
    sleep    4
    Radio Button Should Be Set To    flight    flighthotel
    sleep    4
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    Table not found    INFO
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    sleep    1
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    sleep    2
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    sleep    1
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    ${textfield}    Get Text    xpath://tbody/tr[4]/td[1]
    Log To Console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    sleep    2
    [Teardown]    close browser

OpenBrowser1
    [Timeout]
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    4
    @{listvar1}    Get List Items    css:#FromCity
    : FOR    ${num12}    IN    @{listvar1}
    \    LOG    ${num12}
    List Selection Should Be    css:#FromCity    Toronto
    Page Should Contain List    css:#FromCity
    sleep    4
    Select From List By Index    css:#FromCity    1
    sleep    4
    Select From List    css:#FromCity    Chicago
    sleep    3
    Select From List By Index    css:#FromCity    3
    sleep    4
    sleep    5
    Select From List By Index    //select[@name='cars']    1
    sleep    5
    [Teardown]    Close Browser

tc07
    Open Browser    https://ngendigital.com/demo-application    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    sleep    2
    Login    demo    demo
    sleep    2
    Close Browser

tc08
    Open Browser    https://ngendigital.com/demo-application    chrome
    Open Browser    https://ngendigital.com/demo-application    chrome
    Input Text    xpath://input[@type='email']    sdfsd
    Input Text    xpath://input[@type='password']    xpath://input[@type='email']

Assign Id to Element
    Set Selenium Speed    0.5
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    Assign Id To Element    xpath://tbody/tr[4]/td[3]    pm
    ${num12}    Get Text    pm
    Log    ${num12}
    Capture Page Screenshot
    [Teardown]    close browser

Miscelanous 1
    [Template]
    Set Selenium Speed    0.5
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    Current Frame Should Contain    Select Example
    Element Attribute Value Should Be    xpath://input[@value='bmw']    name    car
    [Teardown]    close browser

Disabled Element
    Set Selenium Speed    0.5
    Open Browser    https://www.cineplex.com/    chrome
    Maximize Browser Window
    Element Should Be Disabled    xpath://div[@class='selectize-input items not-full disabled locked']//input[@title='Type or Select Movie']
    [Teardown]    close browser

Count Elements
    Set Selenium Speed    0.5
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    ${var1}    Get Element Count    //input[@name='car']
    Should Be True    ${var1}==3
    [Teardown]    Close browser

Go back
    Open Browser    https://ngendigital.com/practice    Chrome
    sleep    2
    Go To    https://www.cineplex.com/
    Go Back

URL Verify
    Open Browser    https://ngendigital.com/    chrome
    Location Should Be    https://ngendigital.com/    it is not the same url
    Close Browser
    Open Browser    https://www.gmail.com/    Chrome
    Log Location
    Log Source
    Log Title
    Close browser
    [Teardown]

*** Keywords ***
SetupDemo
    Log To Console    This is Setup method

Teardowndemo
    Log To Console    This is teardown
