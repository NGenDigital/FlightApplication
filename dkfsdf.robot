*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Library           Collections
Library           DateTime

*** Variables ***
${stestcaseNo}    ${EMPTY}
${ssheetname}     ${EMPTY}
${sColumnname}    ${EMPTY}
${columncount}    ${EMPTY}
${y}              ${EMPTY}
${Header}         ${EMPTY}
${Columnnum}      ${EMPTY}
${itotalrows}     ${EMPTY}
${irownumber}     ${EMPTY}
${Ssearcheddata}    ${EMPTY}
${TC_Num}         ${EMPTY}
${Sheetname}      ${EMPTY}
${TestcCasename}    ${EMPTY}
${TestCaseColumn}    ${EMPTY}
${sData}          ${EMPTY}
@{cities}
@{sublist}        Toronto    Chicago
${Response}       Economy \ Business First

*** Test Cases ***
tc01
    Open Browser    https://ngendigital.com/demo-application    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Input Text    xpath://input[@type='email']    support@ngendigital.com
    Input Text    xpath://input[@type='password']    abc123
    Wait Until Keyword Succeeds    5    2    Click Element    xpath://div[contains(text(),'Sign In')]
    Select Frame    id=iframe-114
    Click Element    xpath://button[contains(text(),'Manage Booking')]
    Wait Until Keyword Succeeds    1    1    Page Should Contain List    xpath://select[@id='FromCity']
    Wait Until Keyword Succeeds    1    1    Page Should Contain List    xpath://select[@id='ToCity']
    Wait Until Page Contains Element    xpath://input[@id='goDate']    2    INFO
    Wait Until Page Contains Element    xpath://input[@id='returnDate']    2    INFO
    Wait Until Keyword Succeeds    1    1    Page Should Contain List    xpath://select[@id='Class']
    Wait Until Keyword Succeeds    1    1    Page Should Contain Checkbox    xpath://input[@name='roundtrip']
    Wait Until Keyword Succeeds    1    1    Page Should Contain Radio Button    xpath://input[@value='flight']
    Wait Until Keyword Succeeds    1    1    Page Should Contain Radio Button    xpath://input[@value='flighthotel']
    @{cities}    Get List Items    xpath://select[@id='Class']
    : FOR    ${City}    IN    @{cities}
    \    Should Contain    ${Response}    ${City}
    Radio Button Should Not Be Selected    flight
    Select Radio Button    flight    flight
    Run Keyword And Expect Error    STARTS:Selection of radio button    Radio Button Should Be Set To    flight    flighthotel
    ${sData}    Get Current Date
    ${sData}    Convert Date    ${sData}    result_format=%m%d%Y
    sleep    4
    Input Text    xpath://input[@id='goDate']    ${sData}
    Click button    xpath://button[contains(text(),'Get Fare')]
    Click button    xpath://button[contains(text(),'Confirm Booking')]
    Page Should Contain    SUCCESS !! Your flight is booked
    [Teardown]

tc02

*** Keywords ***
