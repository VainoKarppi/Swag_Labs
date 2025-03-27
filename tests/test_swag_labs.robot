*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Example Site
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://juv1ska.github.io/Swag_Labs/swag_labs.html
${BROWSER}    Chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Login Test
    Go To    ${URL}
    Sleep    2s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    Login
    Sleep    5s

Add To Cart
    Click Button    xpath=//button[contains(@onclick, "addToCart(1)")]
    Sleep    2s
    Click Button    xpath=//button[contains(@onclick, "addToCart(2)")]
    Sleep    2s
    Click Button    xpath=//button[contains(@onclick, "addToCart(3)")]
    Sleep    2s
    Click Button    xpath=//button[contains(@onclick, "addToCart(4)")]
    Sleep    5s

Checkout
    Click Element    class=cart-icon
    Sleep    5s
    Click Button    xpath=//button[contains(@onclick, "removeFromCart(0)")]
    Sleep    2s
    Input Text    id=first-name    John
    Input Text    id=last-name    Doe
    Input Text    id=postal-code    12345
    Sleep    2s
    Click Button    xpath=//button[contains(@onclick, "completeCheckout()")]
    Sleep    2s
    Wait Until Page Contains    Thank You For Your Order!    timeout=10s

*** Keywords ***
Open Browser To Example Site
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
    Maximize Browser Window