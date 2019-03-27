*** Settings ***
Library           ExcelLibrary

*** Variables ***
@{count1}
${Count}          ${EMPTY}
${VAR1}           ${EMPTY}

*** Test Cases ***
ExcelTC01
    Open Excel    C:/Robot Projects/DemoProject/Demo.xls
    Put Number To Cell    sample123    1    0    10
    Save Excel    Demo2.xls

ReadExcelDemo
    Open Excel    C:/Robot Projects/DemoProject/Demo.xls
    Check Cell Type    Sheet1    2    1
    ${Count}    Get Column Count    Sheet1
    @{Count1}    Get Column Values    Sheet1    2
    :FOR    ${VAR1}    IN    @{Count1}
    \    LOG    ${VAR1}
    ${Count}    Get Sheet Names
    ${VAR1}    Read Cell Data By Coordinates    Sheet1    1    1
    ${Count}    Read Cell Data By Name    Sheet1    E2
