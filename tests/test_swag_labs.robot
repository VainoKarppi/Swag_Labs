*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}           https://juv1ska.github.io/Swag_Labs/swag_labs.html
${USERNAME}      standard_user
${PASSWORD}      secret_sauce

*** Test Cases ***
Login To Swag Labs
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
    Maximize Browser Window
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=product-page    timeout=5s

Add Products To Cart
    [Setup]    Login To Swag Labs
    Click Button    xpath=(//button[contains(text(), 'Add to Cart')])[1]
    Click Button    xpath=(//button[contains(text(), 'Add to Cart')])[2]
    Wait Until Element Is Visible    id=cart-count    timeout=5s
    Element Should Contain    id=cart-count    2

Proceed To Checkout
    Click Element    class=cart-icon
    Wait Until Page Contains Element    id=checkout-page    timeout=5s
    Input Text    id=first-name    John
    Input Text    id=last-name    Doe
    Input Text    id=postal-code    12345
    Click Button    xpath=//button[contains(text(), 'Complete Purchase')]
    Wait Until Page Contains    Thank You For Your Order!

Logout From Swag Labs
    Click Button    class=logout-btn
    Wait Until Page Contains Element    id=login-page    timeout=5s
    Close Browser
