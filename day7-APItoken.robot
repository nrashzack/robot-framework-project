*** Settings ***
Library  SeleniumLibrary
Resource   day7-setting.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]
${managesettings}     //*[@class="account-settings-toggle"]
${apitoken}     dc_api-token_link
${read}     //*[text()="Read"]
${trade}    //*[text()="Trade"]
${payments}     //*[text()="Payments"]
${admin}    //*[text()="Admin"]
${tradinginfo}  //*[text()="Trading information"]
${tokeninput}     token_name
${create_btn}   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]






*** Test Cases ***
Open Deriv
   Login    ${my_email}     ${my_pw}
   Manage account settings
   Select scopes
   Token name
   Empty input
   Less than 2
   Special case












