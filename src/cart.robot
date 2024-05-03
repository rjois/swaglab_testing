*** Settings ***
Documentation    Adding and removing elements from cart 
Library    SeleniumLibrary
Library    XML
*** Variables ***
${URL}    https://www.saucedemo.com/
${Browser}    chrome

*** Test Cases ***

removing 1st and 2nd element
    [Documentation]    Adding and removing item from the cart, using id
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Go To    https://www.saucedemo.com/inventory.html
    Page Should Contain    Swag Labs
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Button    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Sleep    3s
    Click Element    //*[@id="shopping_cart_container"]
    Sleep    3s
    Click Element    //*[@id="remove-sauce-labs-backpack"]
    Click Element    //*[@id="remove-sauce-labs-bike-light"]
    Sleep    3s
    Close Browser
remove element using indexing
    [Documentation]    Adding and removing items from the cart, selecting a particular item
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Go To    https://www.saucedemo.com/inventory.html
    Page Should Contain    Swag Labs
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Button    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Sleep    3s
    Click Element    //*[@id="shopping_cart_container"]
    Sleep    3s
    Element Should Contain    //*[@id="item_4_title_link"]    Sauce Labs Backpack
    Click Element    //*[@id="remove-sauce-labs-backpack"]
    Sleep    3s
    Element Should Contain    //*[@id="item_5_title_link"]    Sauce Labs Fleece Jacket
    Click Element    //*[@id="remove-sauce-labs-fleece-jacket"]  
    Close Browser
    
*** Keywords ***