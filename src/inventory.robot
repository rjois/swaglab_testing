*** Settings ***
Documentation    cart functionality 
Library    SeleniumLibrary
Library    XML
*** Variables ***
${URL}    https://www.saucedemo.com/
${Browser}    chrome

*** Test Cases ***
Add to cart
    [Documentation]    login to the URL with the correct username and password, and add an item to the cart

    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Go To    https://www.saucedemo.com/inventory.html
    Page Should Contain    Swag Labs
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Sleep    3s
    Close Browser

Product sorting options
    [Documentation]    clicking on the product sort container

    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Go To    https://www.saucedemo.com/inventory.html
    Page Should Contain    Swag Labs
    Click Element    //*[@class="product_sort_container"]
    Click Element    //*[@value="lohi"]
    Sleep    3s
    Close Browser

    
cart credentials
    [Documentation]    Verify address details in checkout page 

    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window       
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    secret_sauce
    Press Keys    //*[@id="login-button"]    return
    Go To    https://www.saucedemo.com/inventory.html
    Page Should Contain    Swag Labs
    Click Element    //*[@id="shopping_cart_container"]
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    standard
    Input Text    //*[@id="last-name"]    user
    Input Text    //*[@id="postal-code"]    1111
    Click Button    //*[@id="continue"]
    Click Button    //*[@id="finish"]
    Click Button    //*[@id="back-to-products"]
    Click Element   //*[@id="react-burger-menu-btn"]
    Sleep    3s
    Click Element    //*[@id="logout_sidebar_link"]
    Close Browser

*** Keywords ***