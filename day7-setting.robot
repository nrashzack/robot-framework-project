*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keywords ***
Login
    [arguments]  ${email}   ${pw}
    Open Browser  https://app.deriv.com  chrome
    maximize browser window
    wait until page does not contain element     dt_core_header_acc-info-preloader 60
    wait until page contains element    ${login_btn}    60
    click element   ${login_btn}
    wait until page contains element    ${email_field}     15
    input text  ${email_field}  ${email}
    input text  ${pw_field}   ${pw}
    click element   ${login_oauth_btn}

Manage account settings
    wait until page does not contain element     dt_core_header_acc-info-preloader   60
    click element   ${managesettings}
    sleep   10
    click element   ${apitoken}

Select scopes
    wait until page does not contain element    //*[@class="initial-loader account__initial-loader"]  60
    click element   ${read}//parent::label
    checkbox should be selected     read
    click element   ${trade}//parent::label
    checkbox should be selected     trade
    click element   ${payments}//parent::label
    checkbox should be selected     payments
    click element   ${admin}//parent::label
    checkbox should be selected     admin
    click element   ${tradinginfo}//parent::label
    checkbox should be selected     trading_information
    sleep   5
    click element   ${read}//parent::label
    checkbox should not be selected     read
    click element   ${trade}//parent::label
    checkbox should not be selected    trade
    click element   ${payments}//parent::label
    checkbox should not be selected   payments
    click element   ${admin}//parent::label
    checkbox should not be selected     admin
    click element   ${tradinginfo}//parent::label
    checkbox should not be selected     trading_information

Token name
    click element   ${trade}//parent::label
    checkbox should be selected     trade
    page should contain element     ${tokeninput}
    click element   ${tokeninput}
    input text      ${tokeninput}   hi

Empty input
    press keys  ${tokeninput}   CTRL+A  DELETE
    ${textlength}=  get element attribute   ${tokeninput}   value
    Should be empty     ${textlength}
    page should contain     Please enter a token name.
    element should be disabled  ${create_btn}

Less than 2
    input text      ${tokeninput}   n
    page should contain     Length of token name must be between 2 and 32 characters.
    element should be disabled  ${create_btn}

Special case
    input text      ${tokeninput}   !@
    page should contain     Only letters, numbers, and underscores are allowed.
    element should be disabled  ${create_btn}












