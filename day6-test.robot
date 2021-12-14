*** Settings ***
Library  SeleniumLibrary
Resource   common.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]
${dropdown_acc}     //*[@id="dt_core_account-info_acc-info"]
${demo_tab}     dt_core_account-switcher_demo-tab
${demo_acc}     //*[contains(@id,"dt_VRTC")]
${chart_load}     //*[@class="chart-container__loader"]
${market_btn}     //*[@class="cq-symbol-select-btn"]
${synthetic_indices}     //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]
${volatility10}     //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
${purchase_rise}     //*[@id="dt_purchase_call_button"]
${forex}    //*[text()="Forex" and contains(@class,"sc-mcd__filter__item")]
${AUD/USD}     //*[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${contract_type}     //*[@id="dt_contract_dropdown"]
${higher/lower}     //*[@id="dt_contract_high_low_item"]
${days_input}     //*[@class="dc-input__field"]
${payout_btn}     //*[@id="dc_payout_toggle_item"]
${payout_amount}     //*[@id="dt_amount_input"]
${purchase_lower}     //*[@id="dt_purchase_put_button"]
${barrier}     //*[@id="dt_barrier_1_input"]
${volatility50}     //*[@class="sc-mcd__item sc-mcd__item--R_50 "]
${multiplier}   //*[@id="dt_contract_multiplier_item"]
${takeprofit}     //*[@id="dc_take_profit-checkbox_input"]
${stoploss}     //*[@id="dc_stop_loss-checkbox_input"]
${dealcancelation}     //*[@id="dt_cancellation-checkbox_input"]


*** Test Cases ***
Open Deriv
   Login    ${my_email}     ${my_pw}
   Switch demo acc [Task1]
   Buy rise contract [Task2]
   Buy lower contract [Task3]
   Check relative barrier error [Task4]
   Check multiplier contract parameter [Task5]












