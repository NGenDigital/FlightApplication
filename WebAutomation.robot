*** Settings ***
Library           SeleniumLibrary
Resource          Commonlyusedkeywords.txt
Library           ExcelLibrary

*** Variables ***
${Keywordtimeout1}    ${EMPTY}
${time}           ${EMPTY}

*** Test Cases ***
OpenBrowser
    [Timeout]
    Open Browser    https://facebook.com    Chrome
    Maximize Browser Window
    Sleep    2
    Input Text    xpath://*[@id="email"]    ngendigital
    Sleep    2
    Input Text    xpath://*[@id="pass"]    abcd
    Sleep    2
    Close Browser
    ${/}

AdvanceXpaths
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    xpath://input[@value='merc']/preceding-sibling::input[@value = 'bmw']
    Sleep    4
    [Teardown]    close browser

AdvanceCSSSelector
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    css:fieldset>select :nth-child(2)
    Sleep    4
    Close Browser

TextboxDemo
    Set Selenium Implicit Wait    5
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstName']    It has \ failed    Warn
    Sleep    2
    Input Text    xpath://input[@name='FirstName']    NgenDigital
    Sleep    2
    Textfield Value Should Be    xpath://input[@name='FirstName']    NgenDigital
    Sleep    2
    clear element text    xpath://input[@name='FirstName']
    Sleep    2
    [Teardown]    Close Browser

ListElementDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain List    css:#FromCity
    Sleep    2
    @{cities}    Get List Items    css:#FromCity
    : FOR    ${City}    IN    @{cities}
    \    LOG    ${City}
    Sleep    4
    List Selection Should Be    css:#FromCity    Toronto
    Sleep    2
    Select From List By Index    css:#FromCity    1
    Sleep    2
    Select From List    css:#FromCity    Chicago
    Sleep    2
    [Teardown]    Close \ Browser

CheckboxDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain Checkbox    //input[@value='bmw']    Checkbox not found    Info
    Sleep    2
    Select Checkbox    //input[@value='bmw']
    Sleep    3
    Checkbox Should Be Selected    //input[@value='bmw']
    Sleep    2
    Unselect Checkbox    //input[@value='bmw']
    Sleep    3
    [Teardown]    Close Browser

RadiobuttonDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Page Should Contain Radio Button    xpath://input[@value='flight']
    sleep    2
    Select Radio Button    flight    flighthotel
    sleep    2
    Radio Button Should Be Set To    flight    flighthotel
    sleep    3
    [Teardown]    Close Browser

ButtonExample
    Maximize Browser Window
    Input Text    css:#email    demo
    sleep    1
    Input Text    css:#pass    demo1
    sleep    1
    Click Button    xpath://input[@value='Log In']
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
    [Teardown]    Close Browser

Tableexample
    [Setup]
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

Imagedemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Click Image    xpath://*[@id="header_stickynav14598"]/nav/div[2]/div[1]/div/a/img
    sleep    3
    [Teardown]    close browser

Flight Application
    Set Selenium Speed    1
    Open Browser    https://ngendigital.com/demo-application    chrome
    sleep    1
    Select Frame    id=iframe-014
    Wait Until Keyword Succeeds    1 min    5s    Login to flight application
    sleep    2
    [Teardown]    close browser
