*** Settings ***
Documentation    Login functionality with different browsers
Library    SeleniumLibrary
Library    XML
*** Variables ***
${URL}    https://www.saucedemo.com/
${Browser}    chrome

*** Test Cases ***
login functionality with correct username and password
    [Documentation]    opening the URL in Chrome, entering the correct username, password and closing the URL
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Go To    https://www.saucedemo.com/inventory.html
    Page Should Contain    Swag Labs
    Close Browser

login functionality with incorrect username and password
    [Documentation]    opening the URL, entering the incorrect username, password 

    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    locked_out_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.
    Close Browser

login with firefox Browser
    [Documentation]    opening the URL in Firefox, entering the correct username, password and closing the URL    

    Open Browser    ${URL}    firefox
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    problem_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Go To    https://www.saucedemo.com/inventory.html
    Page Should Contain    Swag Labs
    Close Browser   

*** Keywords ***