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

Switch demo acc [Task1]
   wait until page does not contain element     dt_core_header_acc-info-preloader   60
   click element    ${dropdown_acc}
   click element    ${demo_tab}
   click element    ${demo_acc}
   reload page

Buy rise contract [Task2]
   wait until page does not contain element     ${chart_load}   60
   wait until page contains element     ${market_btn}     30
   click element    ${market_btn}
   wait until page contains element     ${synthetic_indices}    60
   click element    ${synthetic_indices}
   sleep    5
   click element    ${volatility10}
   wait until element is enabled     ${purchase_rise}     20
   click element    ${purchase_rise}
   sleep    10

Buy lower contract [Task3]
   wait until page contains element     ${market_btn}    30
   click element    ${market_btn}
   click element    ${forex}
   sleep    5
   click element    ${AUD/USD}
   wait until element is enabled    ${contract_type}    10
   click element    ${contract_type}
   click element    ${higher/lower}
   press keys    ${days_input}     BACKSPACE
   input text    ${days_input}      ${2}
   click element    ${payout_btn}
   click element    ${payout_amount}
   press keys   ${payout_amount}      CTRL+A    DELETE
   input text   ${payout_amount}    ${15.50}
   wait until element is enabled    ${purchase_lower}   10
   click element    ${purchase_lower}

Check relative barrier error [Task4]
   sleep    10
   click element    ${barrier}
   press keys   ${barrier}   CTRL+A    DELETE
   input text   ${barrier}   +0.3
   click element    ${payout_amount}
   press keys   ${payout_amount}      CTRL+A    DELETE
   input text   ${payout_amount}    ${10}
   sleep    5
   element should be disabled   ${purchase_lower}
   page should contain element    //*[text()="Contracts more than 24 hours in duration would need an absolute barrier."]

Check multiplier contract parameter [Task5]
   sleep   5
   wait until page contains element     ${market_btn}     30
   click element    ${market_btn}
   wait until page contains element     ${synthetic_indices}    60
   click element    ${synthetic_indices}
   sleep    5
   click element    ${volatility50}
   wait until element is enabled    ${contract_type}    10
   click element    ${contract_type}
#   page should contain  //*[@class="notification-messages"]
#   click element    //*[@class="notification__close-button"]
   click element    ${multiplier}
   page should contain  Stake
   page should not contain  Payout
   click element    ${takeprofit}//parent::label
   checkbox should be selected   ${takeprofit}
   click element    ${stoploss}//parent::label
   checkbox should be selected   ${stoploss}
   click element    ${dealcancelation}//parent::label
   checkbox should be selected   ${dealcancelation}
   click element    //*[@id="dropdown-display"]


