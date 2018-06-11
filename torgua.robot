*** Settings ***
Library    Selenium2Screenshots
Library    String
Library    DateTime
Library    torgua_service.py
Library    DebugLibrary

*** Variables ***
${locator.tenderId}                                    xpath=//*[@testval="tenderId"]
${locator.title}                                         xpath=//*[@testval="title"]
${locator.description}                             xpath=//*[@testval="description"]
${locator.auctionUrl}                                xpath=//*[@testval="auctionUrl"]

${locator.value.amount}                                 xpath=//*[@testval="value_amount"]
${locator.value.currency}                             xpath=//*[@testval="value_currency"]
${locator.value.valueAddedTaxIncluded}    xpath=//*[@testval="value_valueAddedTaxIncluded"]

${locator.minimalStep.amount}                xpath=//*[@testval="minimalStep.amount"]
${locator.minimalStep.currency}                xpath=//*[@testval="minimalStep.currency"]

${locator.tenderPeriod.startDate}                xpath=//*[@testval="tenderPeriod_startDate"]
${locator.enquiryPeriod.startDate}         xpath=//*[@testval="enquiryPeriod_startDate"]
${locator.enquiryPeriod.endDate}         xpath=//*[@testval="enquiryPeriod_endDate"]
${locator.auctionPeriod.startDate}         xpath=//*[@testval="auctionPeriod_startDate"]
${locator.auctionPeriod.endDate}         xpath=//*[@testval="auctionPeriod_endDate"]
${locator.tenderPeriod.endDate}            xpath=//*[@testval="tenderPeriod_endDate"]
${locator.items[0].deliveryDate.startDate}            xpath=//*[@testval="items_deliveryDate_startDate"][1]
${locator.items[0].deliveryDate.endDate}            xpath=//*[@testval="items_deliveryDate_endDate"][1]
${locator.items[0].description}        xpath=//*[@testval="items_description"][1]
${locator.items[0].classification.scheme}        xpath=//*[@testval="items_classification_scheme"][1]
${locator.items[0].classification.id}                xpath=//*[@testval="items_classification_id"][1]
${locator.items[0].classification.description}             xpath=//*[@testval="items_classification_description"][1]
${locator.items[0].additionalClassifications[0].scheme}     xpath=//*[@testval="items_additionalClassifications_scheme"][1]
${locator.items[0].additionalClassifications[0].id}             xpath=//*[@testval="items_additionalClassifications_id"][1]
${locator.items[0].additionalClassifications[0].description}             xpath=//*[@testval="items_additionalClassifications_description"][1]

${locator.items[0].deliveryLocation.latitude}                 xpath=//*[@testval="items_deliveryLocation_latitude"][1]
${locator.items[0].deliveryLocation.longitude}                xpath=//*[@testval="items_deliveryLocation_longitude"][1]

${locator.items[0].deliveryAddress.countryName}        xpath=//*[@testval="items_deliveryAddress_countryName"][1]
${locator.items[0].deliveryAddress.region}                xpath=//*[@testval="items_deliveryAddress_region"][1]
${locator.items[0].deliveryAddress.locality}                xpath=//*[@testval="items_deliveryAddress_locality"][1]
${locator.items[0].deliveryAddress.postalCode}                xpath=//*[@testval="items_deliveryAddress_postalCode"][1]
${locator.items[0].deliveryAddress.streetAddress}                xpath=//*[@testval="items_deliveryAddress_streetAddress"][1]

${locator.procuringEntity.name}                 xpath=//*[@testval="procuringEntity_name"][1]

${locator.items[0].quantity}                 xpath=//*[@testval="items_quantity"][1]
${locator.items[0].unit.code}                xpath=//*[@testval="items_unit_code"][1]
${locator.items[0].unit.name}                xpath=//*[@testval="items_unit_name"][1]
${locator.questions[0].title}                xpath =//*[@testval="questions_title"][1]
${locator.questions[0].description}    xpath =//*[@testval="questions_description"][1]
${locator.questions[0].date}                 xpath = //*[@testval="questions_date"][1]
${locator.questions[0].answer}             xpath=//*[@testval="questions_answer"][1]

${locator.awards[0].complaintPeriod.endDate}             xpath=//*[@testval="awards_complaintPeriod_endDate"]
${locator.document.title}             xpath=//*[@testval="document_title"]

${locator.plan.tender.procurementMethodType}    xpath=//*[@testval="plan.tender.procurementMethodType"]
${locator.plan.budget.amount}    xpath=//*[@testval="plan.budget.amount"]
${locator.plan.budget.description}    xpath=//*[@testval="plan.budget.description"]
${locator.plan.budget.currency}    xpath=//*[@testval="plan.budget.currency"]
${locator.plan.budget.id}    xpath=//*[@testval="plan.budget.id"]
${locator.budget.project.id}    xpath=//*[@testval="budget.project.id"]
${locator.budget.project.name}    xpath=//*[@testval="budget.project.name"]
${locator.plan.procuringEntity.identifier.scheme}    xpath=//*[@testval="plan.procuringEntity.identifier.scheme"]
${locator.plan.procuringEntity.identifier.id}    xpath=//*[@testval="procuringEntity.identifier.id"]
${locator.plan.procuringEntity.identifier.legalName}    xpath=//*[@testval="plan.procuringEntity.identifier.legalName"]
${locator.plan.classification.description}    xpath=//*[@testval="plan.classification.description"]
${locator.plan.classification.scheme}    xpath=//*[@testval="plan.classification.scheme"]
${locator.plan.classification.id}    xpath=//*[@testval="plan.classification.id"]
${locator.plan.tender.tenderPeriod.startDate}    xpath=//*[@testval="plan.tender.tenderPeriod.startDate"]
${locator.plan.items[0].description}    xpath=//*[@testval="plan.items[0].description"]
${locator.plan.items[0].quantity}    xpath=//*[@testval="plan.items[0].quantity"]
${locator.plan.items[0].deliveryDate.endDate}    xpath=//*[@testval="plan.items[0].deliveryDate.endDate"]
${locator.plan.items[0].unit.code}    xpath=//*[@testval="plan.items[0].unit.code"]
${locator.plan.items[0].unit.name}    xpath=//*[@testval="plan.items[0].unit.name"]
${locator.plan.items[0].classification.description}    xpath=//*[@testval="plan.items[0].classification.description"]
${locator.plan.items[0].classification.scheme}    xpath=//*[@testval="plan.items[0].classification.scheme"]
${locator.plan.items[0].classification.id}    xpath=//*[@testval="plan.items[0].classification.id"]
${locator.plan.procuringEntity.name}    xpath=//*[@testval="plan.procuringEntity.name"]














*** Keywords ***

Підготувати дані для оголошення тендера
    [Arguments]    @{ARGUMENTS}
    Log Many    @{ARGUMENTS}
    [return]    ${ARGUMENTS[1]}

Підготувати клієнт для користувача
    [Arguments]    @{ARGUMENTS}
    [Documentation]    Відкрити браузер, створити об’єкт api wrapper, тощо
    ...            ${ARGUMENTS[0]} ==    username
    Open Browser
    ...            ${USERS.users['${ARGUMENTS[0]}'].homepage}
    ...            ${USERS.users['${ARGUMENTS[0]}'].browser}
    ...            alias=${ARGUMENTS[0]}
    Set Window Size             @{USERS.users['${ARGUMENTS[0]}'].size}
    Set Window Position     @{USERS.users['${ARGUMENTS[0]}'].position}
    Click Element    xpath=//a[contains(@href,'signin')]
    #Wait Until Page Contains Element    xpath= //main[@class="_1b7uc56"]
    Input text    xpath=//*[@testval="login"]    ${USERS.users['${ARGUMENTS[0]}'].login}
    Input text    xpath=//*[@testval="password"]   ${USERS.users['${ARGUMENTS[0]}'].password}
    Click Element    //*[@testval="signin"]
    Sleep    5
    Run Keyword If  '${ARGUMENTS[0]}' == 'torgua_Owner'  Run Keyword And Ignore Error        Wait Until Page Contains Element    xpath= //*[@testval="notifications"]    timeout=100

    Run Keyword If  '${ARGUMENTS[0]}' == 'torgua_Owner'  Run Keyword And Ignore Error        Click Element    //*[@testval="accept"]

Створити тендер
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    tender_data
    ${title}=                 Get From Dictionary     ${ARGUMENTS[1].data}                             title
    ${description}=     Get From Dictionary     ${ARGUMENTS[1].data}                             description
    ${procurementMethodType}=     Convert To String        belowthreshold


    ${value_amount}=                Get From Dictionary     ${ARGUMENTS[1].data.value}                 amount
    ${value_amount}=                            Format         ${value_amount}

    ${value_currency}=                Get From Dictionary     ${ARGUMENTS[1].data.value}                 currency
    ${minimalStep_amount}=         Get From Dictionary     ${ARGUMENTS[1].data.minimalStep}     amount
    ${minimalStep_amount}=         Convert To String         ${minimalStep_amount}

    #${minimalStep_currency}=         Get From Dictionary     ${ARGUMENTS[1].data.minimalStep}     currency
    ${items}=                 Get From Dictionary     ${ARGUMENTS[1].data}                             items
    ${items_description}=     Get From Dictionary     ${items[0]}                 description
    ${items_unit_quantity}=     Get From Dictionary     ${items[0]}                 quantity
    ${items_unit_code}=     Get From Dictionary     ${items[0].unit}                 code
    #Період поставки товару (початкова дата)
    #${items_items_deliveryDate_startDate}=     Get From Dictionary     ${items[0].unit}                 code
    #Період поставки товару (кінцева дата)
    ${items_items_deliveryDate_startDate}=     Get From Dictionary     ${items[0].deliveryDate}                 startDate
    ${items_items_deliveryDate_startDate}=                Convert Date To String     ${items_items_deliveryDate_startDate}

    ${items_items_deliveryDate_endDate}=     Get From Dictionary     ${items[0].deliveryDate}                 endDate
    ${items_items_deliveryDate_endDate}=                Convert Date To String     ${items_items_deliveryDate_endDate}

    ${items_deliveryAddress_postalCode}=     Get From Dictionary     ${items[0].deliveryAddress}                 postalCode
    ${items_deliveryAddress_countryName}=     Get From Dictionary     ${items[0].deliveryAddress}                 countryName
    ${items_deliveryAddress_region}=     Get From Dictionary     ${items[0].deliveryAddress}                 region
    ${items_deliveryAddress_locality}=     Get From Dictionary     ${items[0].deliveryAddress}                 locality
    ${items_deliveryAddress_streetAddress}=     Get From Dictionary     ${items[0].deliveryAddress}                 streetAddress

    ${items_deliveryLocation_latitude}=     Get From Dictionary     ${items[0].deliveryLocation}                 latitude
    ${items_deliveryLocation_latitude}=         Convert To Number         ${items_deliveryLocation_latitude}
    ${items_deliveryLocation_latitude}=         Format         ${items_deliveryLocation_latitude}
    ${items_deliveryLocation_longitude}=     Get From Dictionary     ${items[0].deliveryLocation}                 longitude
    ${items_deliveryLocation_longitude}=         Convert To Number         ${items_deliveryLocation_longitude}
    ${items_deliveryLocation_longitude}=         Format         ${items_deliveryLocation_longitude}

    ${enquiryPeriod_startDate}=                Get From Dictionary        ${ARGUMENTS[1].data.enquiryPeriod}                 startDate
    ${enquiryPeriod_startDate}=                Convert Date To String     ${enquiryPeriod_startDate}
    ${enquiryPeriod_endDate}=                Get From Dictionary        ${ARGUMENTS[1].data.enquiryPeriod}                 endDate
    ${enquiryPeriod_endDate}=                Convert Date To String     ${enquiryPeriod_endDate}

    ${tenderPeriod_startDate}=     Get From Dictionary        ${ARGUMENTS[1].data.tenderPeriod}                 startDate
    ${tenderPeriod_startDate}=                Convert Date To String     ${tenderPeriod_startDate}
    ${tenderPeriod_endDate}=     Get From Dictionary        ${ARGUMENTS[1].data.tenderPeriod}                 endDate
    ${tenderPeriod_endDate}=                Convert Date To String     ${tenderPeriod_endDate}
    #${quantity}=            Get From Dictionary     ${items[0]}                 quantity
    #${countryName}=     Get From Dictionary     ${ARGUMENTS[1].data.procuringEntity.address}             countryName
    #${delivery_end_date}=            Get From Dictionary     ${items[0].deliveryDate}     endDate
    #${delivery_end_date}=            convert_date_to_slash_format     ${delivery_end_date}
    ${cpv_id}=                Get From Dictionary     ${items[0].classification}                 id
    ${cpv_description}=                     Get From Dictionary     ${items[0].classification}                 description


	#${enquiry_end_date}=     Get From Dictionary                 ${ARGUMENTS[1].data.enquiryPeriod}     endDate
	#${enquiry_end_date}=     convert_date_to_slash_format     ${enquiry_end_date}
	#${end_date}=            Get From Dictionary     ${ARGUMENTS[1].data.tenderPeriod}     endDate
	#${end_date}=            convert_date_to_slash_format     ${end_date}

    Змінити персональні дані        ${ARGUMENTS[1]}

    Selenium2Library.Switch Browser         ${ARGUMENTS[0]}

    #Wait Until Page Contains Element    id=content

    Sleep    10
    Wait Until Page Contains Element    //*[@testval='myTenders']    timeout=100
    Click Element    xpath=//*[@testval='myTenders']
    Click Element    xpath=//*[text()='Додати закупівлю']

    Click Element         //*[text()='Тип закупівлі']/following-sibling::div/div[1]/button
    Click Element         //*[@testval='${procurementMethodType}']

    Input text                                                    //*[@testval="title"]        ${title}
    Input text                                                    //*[@testval="description"]        ${description}

    Input text                                                    //*[@testval="value_amount"]     ${value_amount}
    Input text                                                    //*[@testval="minimalStep_amount"]     ${minimalStep_amount}

    #Dates
    Input text                                                    //*[@testval="enquiryPeriod_startDate"]/descendant::input[1]     ${enquiryPeriod_startDate}
    Input text                                                    //*[@testval="enquiryPeriod_endDate"]/descendant::input[1]     ${enquiryPeriod_endDate}

    Input text                                                    //*[@testval="tenderPeriod_startDate"]/descendant::input[1]     ${tenderPeriod_startDate}
    Input text                                                    //*[@testval="tenderPeriod_endDate"]/descendant::input[1]     ${tenderPeriod_endDate}
    #EndDates

    Click Element                                             //*[@testval="btnadd"]

    Input text                                                    //*[@testval="items_description"]        ${items_description}
    Click Element                                             //*[@testval="codeclassification"]
    #Debug
    Sleep    2
        Wait Until Page Contains Element    //*[@testval='searchclassification']    timeout=100
        Input text                                                 //*[@testval='searchclassification']        ${cpv_description}
        Click Element                                             //*[@testval='btnsearchclassification']
        Sleep    2
        Click Element                                             //*[@testval='${cpv_id}']
        Click Element                                             //*[@testval='btncheck']

    # Select Код одиниці виміру (має відповідати стандарту UN/CEFACT, наприклад - KGM)
    #debug
    Click Element         //*[@testval="btn_unit_code"]/descendant::button[1]
    Click Element         //*[@testval='${items_unit_code}']
    #debug
    Input text                                                    //*[@testval="items_unit_quantity"]        ${items_unit_quantity}

    Input text                                                    //*[@testval='items_deliveryAddress_postalCode']        ${items_deliveryAddress_postalCode}
    Input text                                                    //*[@testval='items_deliveryAddress_countryName']        ${items_deliveryAddress_countryName}
    Input text                                                    //*[@testval='items_deliveryAddress_region']        ${items_deliveryAddress_region}
    Input text                                                    //*[@testval='items_deliveryAddress_locality']        ${items_deliveryAddress_locality}
    Input text                                                    //*[@testval='items_deliveryAddress_streetAddress']     ${items_deliveryAddress_streetAddress}
    Input text                                                    //*[@testval='items_deliveryLocation_latitude']        ${items_deliveryLocation_latitude}
    Input text                                                    //*[@testval='items_deliveryLocation_longitude']        ${items_deliveryLocation_longitude}

    Input text                                                    //*[@testval="items_items_deliveryDate_startDate"]/descendant::input[1]        ${items_items_deliveryDate_startDate}
    Input text                                                    //*[@testval="items_items_deliveryDate_endDate"]/descendant::input[1]        ${items_items_deliveryDate_endDate}

    Click Element                                             //*[@testval='btnsave']
    Wait Until Page Contains Element    xpath= //*[@testval="btntenderkat"]    timeout=100
    Click Element                                             //*[@testval="btntenderkat"][1]
    Wait Until Page Contains Element    xpath= //*[@testval="btnaccept"]    timeout=100
    Click Element                                             //*[@testval="btnaccept"]
    #Execute Javascript                                 window.scroll(9999,9999)
    Sleep    30

    ${tender_UAid}=    Get Text                     //*[@testval="tender_UAid"][1]
    #text()="${ARGUMENTS[1]['data']['title']}"]
    [return]    ${tender_UAid}

Завантажити документ
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    ${filepath}
    ...            ${ARGUMENTS[2]} ==    ${TENDER_UAID}
    Selenium2Library.Switch Browser        ${ARGUMENTS[0]}
    torgua.Пошук тендера по ідентифікатору в кабінеті     ${ARGUMENTS[0]}     ${ARGUMENTS[2]}     "btnEditTender"
    #debug
    Wait Until Page Contains Element    xpath=//*[@testval='btnAddDocument']    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element                                             //*[@testval='btnAddDocument']
    Завантажити документ до тендеру     ${ARGUMENTS[1]}
    Input Text                                                    //*[@testval='docdescription']         Test text
    #debug
    Click Element                                             //*[@testval='btnsave']
    Wait Until Page Contains Element    xpath= //*[@testval="btntenderkat"]    timeout=100
    Click Element                                             //*[@testval="btntenderkat"][1]
    Wait Until Page Contains Element    xpath= //*[@testval="btnaccept"]    timeout=100
    Click Element                                             //*[@testval="btnaccept"]
    Sleep  30
    torgua.Пошук тендера по ідентифікатору     ${ARGUMENTS[0]}     ${ARGUMENTS[2]}
    Sleep  5

Завантажити документ до тендеру
    [Arguments]     ${file}
    Choose File             //*[@testval='btnAddFile']         ${file}

Додати документ до тендеру
    [Arguments]     ${file}
    #debug
    Click Element                                             //*[text()='Додати файл']
    Завантажити документ до тендеру     ${file}
    Input Text                                                    //*[@name='document:description[]']         Test text

Змінити персональні дані
    [Arguments]     ${ARG}

    ${country} =    Get From Dictionary        ${ARG.data.procuringEntity.address}                 countryName
    ${locality} =    Get From Dictionary        ${ARG.data.procuringEntity.address}                 locality
    ${region} =    Get From Dictionary        ${ARG.data.procuringEntity.address}                 region
    ${streetAddress} =    Get From Dictionary        ${ARG.data.procuringEntity.address}                 streetAddress
    ${postalCode} =    Get From Dictionary        ${ARG.data.procuringEntity.address}                 postalCode

    ${procuringEntity_name} =    Get From Dictionary        ${ARG.data.procuringEntity}                 name

    ${contactPointName} =    Get From Dictionary        ${ARG.data.procuringEntity.contactPoint}                 name
    ${contactPointTelephone} =    Get From Dictionary        ${ARG.data.procuringEntity.contactPoint}                 telephone

    #Click Element     //*[@class = 'log']
    Click Element     //*[@testval='btnUserInfo']
    Sleep    8
    Click Element     //*[@testval='btnEditUserInfo']

    #Click Element                                                    //*[@testval='listCountry']
    #Click Element                                                    //*[@class='autotest-CountryUa' and @val='${country}']

    #Click Element                                                    //*[@name='RegionUa']
    #Click Element                                                    //*[@value='${region}']

    Input text                                                    //*[@testval='locality']        ${locality}

    Input text                                                    //*[@testval='procuringEntity_name']        ${procuringEntity_name}
    #Input text                                                    //*[@name='RegionUa']        ${region}
    Input text                                                    //*[@testval='streetAddress']        ${streetAddress}
    Input text                                                    //*[@testval='postalCode']        ${postalCode}

    #Input text                                                    //*[@name='ContactPhoneNumber']        ${contactPointName}

    Input text                                                    //*[@testval='contactPointTelephone']        ${contactPointTelephone}
    Input text                                                    //*[@testval='contactPointTelephoneFax']        ${contactPointTelephone}
    Input text                                                    //*[@testval='contactPointTelephoneMobile']        ${contactPointTelephone}

    Click Element     //*[@testval = 'btnSave']
    #Click Element     //*[@class='log']

Внести зміни в тендер
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} =    username
    ...            ${ARGUMENTS[1]} =    ${TENDER_UAID}
    Selenium2Library.Switch Browser         ${ARGUMENTS[0]}
#    debug
    torgua.Пошук тендера по ідентифікатору в кабінеті     ${ARGUMENTS[0]}     ${ARGUMENTS[1]}     "btnEditTender"
    ${value}=  Run keyword if  '${ARGUMENTS[2]}' == 'tenderPeriod.endDate'  Convert Date To String     ${ARGUMENTS[3]}   ELSE   CONVERT TO STRING    ${ARGUMENTS[3]}
    ${prop}=  Evaluate  '${ARGUMENTS[2]}'.replace(".", "_")

    Run keyword if  '${ARGUMENTS[2]}' == 'tenderPeriod.endDate'  Input text                                                    //*[@testval="tenderPeriod_endDate"]/descendant::input[1]     ${value}   ELSE   Input text                                                //*[@testval='${prop}']     ${value}
    Click Element                                             //*[@testval='btnsave']
    Wait Until Page Contains Element    xpath= //*[@testval="btntenderkat"]    timeout=100
    Click Element                                             //*[@testval="btntenderkat"][1]
    Wait Until Page Contains Element    xpath= //*[@testval="btnaccept"]    timeout=100
    Click Element                                             //*[@testval="btnaccept"]
    Sleep    20
    torgua.Пошук тендера по ідентифікатору     ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Sleep  5

Задати питання до лоту
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} = username
    ...            ${ARGUMENTS[1]} = tenderUaId
    ...            ${ARGUMENTS[2]} = lot_id
    ...            ${ARGUMENTS[3]} = question
    Selenium2Library.Switch Browser        ${ARGUMENTS[0]}
    torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Click Element    xpath=//a[text()='Обговорення']
    Click Element     xpath=//select[@name='questionOf']//option[@value='lot']
    Input text    name=title    ${ARGUMENTS[3]}
    Input text    name=description    ${ARGUMENTS[3]}
    Click Element    name=add-question

Відповісти На Питання
    [Arguments]    @{ARGUMENTS}
    ${answer}=         Get From Dictionary    ${ARGUMENTS[3].data}    answer
    torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Click Element                                                 xpath=//*[text()='Обговорення ']
    Sleep         4
    #Click Element                                                 xpath=//a[contains(@id, 'add_answer_btn_0')]
    #Sleep         4
    Input Text                                                        xpath=//*[@class='media well'][1]//*[@name='answer']                ${answer}
    Click Element                                                 xpath=//*[@class='media well'][1]//*[text()='Відповісти']

Задати запитання на тендер
    [Arguments]    @{ARGUMENTS}
    ${title}=                Get From Dictionary    ${ARGUMENTS[2].data}    title
    ${description}=    Get From Dictionary    ${ARGUMENTS[2].data}    description
    Selenium2Library.Switch Browser        ${ARGUMENTS[0]}
    torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Sleep   10
    Wait Until Page Contains Element    xpath=//*[@testval='btnQuestions']    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element                                                 xpath=//*[@testval='btnQuestions']
    Wait Until Page Contains Element    xpath=//*[@testval='questionTitle'][1]    timeout=100
    Input text                                                    xpath=//*[@testval='questionTitle']                                 ${title}
    Input text                                                    xpath=//*[@testval='questionText']                                 ${description}
    Click Element                                             xpath=//*[@testval='btnAddQuestion']
    Sleep  10
    torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}

Подати цінову пропозицію
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    ${TENDER_UAID}
    ...            ${ARGUMENTS[2]} ==    ${test_bid_data}
    #debug
    ${amount}=        Get From Dictionary         ${ARGUMENTS[2].data.value}                 amount
    ${amount}=        Convert To String         ${amount}
    torgua.Пошук тендера по ідентифікатору     ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Sleep  10
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element     xpath=//*[@testval='btnProvider']
    Sleep  10
    Input text        xpath=//*[@testval='proposition']                                    ${amount}
    Click Element     xpath=//*[@testval='btnApply']
    Wait Until Page Contains Element    xpath=//*[@testval='btnBidKat']    timeout=100
    Click Element     xpath=//*[@testval='btnBidKat'][1]
    Sleep  5
    Click Element     xpath=//*[@testval='btnActivate'][1]
    Sleep  20
    #torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    #Sleep  10

Змінити цінову пропозицію
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    ${TENDER_UAID}
    ...            ${ARGUMENTS[2]} ==    ${fieldname}
    ...            ${ARGUMENTS[3]} ==    ${fieldvalue}
    #debug
    #torgua.Пошук тендера по ідентифікатору     ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Wait Until Page Contains Element    xpath=//*[@testval='btnProfile']    timeout=100
    Click Element                                             //*[@testval='btnProfile']
    Wait Until Page Contains Element    xpath=//*[@testval='btnMyBids']    timeout=100
    Click Element                                             //*[@testval='btnMyBids']
    Sleep  10
    Click Element                                             //*[@testval='btnBidKat'][1]
    Sleep  5
    Click Element     xpath=//*[@testval='btnEditBid'][1]
    ${ARGUMENTS[3]}=  Convert to String  ${ARGUMENTS[3]}
    Sleep  10
    Input text        xpath=//*[@testval='proposition']                ${ARGUMENTS[3]}
    Click Element     xpath=//*[@testval='btnApply']
    Sleep  5
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Wait Until Page Contains Element    xpath=//*[@testval='btnBidKat']    timeout=100
    Click Element     xpath=//*[@testval='btnBidKat'][1]
    Sleep  5
    #Click Element     xpath=//*[@testval='btnActivate'][1]
    #Sleep  20

Відповісти на запитання
    [Arguments]    @{ARGUMENTS}
    torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Click Element                                                 xpath=//*[@testval='btnQuestions']
    Wait Until Page Contains Element    xpath=//*[@testval='textAnswer'][1]    timeout=100
    Input Text   xpath=//*[@testval="textAnswer"]          ${ARGUMENTS[2].data.answer}
    Click Element                                                 xpath=//*[@testval='btnAnswer']

Скасувати цінову пропозицію
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    ${TENDER_UAID}
    Click Element     //*[text()='Видалити'][1]

Завантажити документ в ставку
    [Arguments]    @{ARGUMENTS}
    [Documentation]
        ...        ${ARGUMENTS[0]} ==    username
        ...        ${ARGUMENTS[1]} ==    file
        ...        ${ARGUMENTS[2]} ==    tenderId
    Selenium2Library.Switch Browser         ${ARGUMENTS[0]}
    Wait Until Page Contains Element    xpath=//*[@testval='btnProfile']    timeout=100
    Click Element                                             //*[@testval='btnProfile']
    Wait Until Page Contains Element    xpath=//*[@testval='btnMyBids']    timeout=100
    Click Element                                             //*[@testval='btnMyBids']
    Sleep  10
    Click Element                                             //*[@testval='btnBidKat'][1]
    Sleep  10
    Click Element     xpath=//*[@testval='btnEditBid'][1]
    Sleep  10
    Click Element     //*[@testval='btnAddFile']
    Sleep  10
    Choose File                                 //*[@testval='btnChooseFile']                    ${ARGUMENTS[1]}
    Sleep  10
    Click Element     xpath=//*[@testval='btnApply']
    Sleep  10
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Wait Until Page Contains Element    xpath=//*[@testval='btnBidKat']    timeout=100
    Click Element     xpath=//*[@testval='btnBidKat'][1]
    #Sleep  10
    #Click Element     xpath=//*[@testval='btnActivate'][1]
    #Sleep  20

Змінити документ в ставці
    [Arguments]    @{ARGUMENTS}
    [Documentation]
        ...        ${ARGUMENTS[0]} ==    username
        ...        ${ARGUMENTS[1]} ==    tenderId
        ...        ${ARGUMENTS[2]} ==    amount
        ...        ${ARGUMENTS[3]} ==    amount.value
    Selenium2Library.Switch Browser         ${ARGUMENTS[0]}
    Wait Until Page Contains Element    xpath=//*[@testval='btnProfile']    timeout=100
    Click Element                                             //*[@testval='btnProfile']
    Wait Until Page Contains Element    xpath=//*[@testval='btnMyBids']    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element                                             //*[@testval='btnMyBids']
    Sleep  10
    Click Element                                             //*[@testval='btnBidKat'][1]
    Sleep  10
    Click Element     xpath=//*[@testval='btnEditBid'][1]
    Sleep  10
    Click Element     xpath=//*[@testval='btnAddFile']
    Sleep  10
    Choose File                                 //*[@testval='btnChooseFile']                    ${ARGUMENTS[2]}
    Click Element     //*[@testval='btnApply']
    Sleep  10
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Wait Until Page Contains Element    xpath=//*[@testval='btnBidKat']    timeout=100
    Click Element     xpath=//*[@testval='btnBidKat'][1]
    Sleep  10
    #Click Element     xpath=//*[@testval='btnActivate'][1]
    #Sleep  20


Пошук тендера по ідентифікатору
    [Arguments]    @{ARGUMENTS}
        [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    tenderId
        Switch browser     ${ARGUMENTS[0]}
    Go To    ${USERS.users['${ARGUMENTS[0]}'].homepage}
    Wait Until Page Contains Element    xpath=//*[@testval='nav_procurements']    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element    xpath=//*[@testval='nav_procurements']
    Sleep    20
    Click Element    xpath=//*[@testval='nav_procurement']
    Sleep    10
    Input text    //*[@testval='searchtender']    ${ARGUMENTS[1]}
    Press Key    //*[@testval='searchtender']    \\13
    Sleep    10
    Wait Until Page Contains Element    xpath=//*[@testval='tenderinfo'][1]    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element    xpath=//*[@testval='tenderinfo'][1]
    #Wait Until Page Contains Element    id=content
    Sleep    5

Пошук тендера по ідентифікатору в кабінеті
    [Arguments]    @{ARGUMENTS}
        [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    tenderId
    ...            ${ARGUMENTS[2]} ==    action
    Go To    ${USERS.users['${ARGUMENTS[0]}'].homepage}
    Wait Until Page Contains Element    xpath=//*[@testval='btnProfile']    timeout=100
    Click Element                                             //*[@testval='btnProfile']
    Wait Until Page Contains Element    xpath=//*[@testval='myTenders']    timeout=100
    Click Element                                             //*[@testval='myTenders']
    Input text    //*[@testval='searchTender']    ${ARGUMENTS[1]}
    Press Key    //*[@testval='searchTender']    \\13
    Wait Until Page Contains Element    xpath=//*[@testval="btntenderkat"]    timeout=100
    Click Element                                             //*[@testval="btntenderkat"][1]
    Wait Until Page Contains Element    xpath=//*[@testval=${ARGUMENTS[2]}]    timeout=100
    Click Element    //*[@testval=${ARGUMENTS[2]}]
    Sleep    10


Отримати інформацію із тендера
    [Arguments]  @{ARGUMENTS}
    [Documentation]
    ...      ${ARGUMENTS[0]} ==  tender_uaid
    ...      ${ARGUMENTS[1]} ==  field
    ${return_value}=  run keyword  Отримати інформацію про ${ARGUMENTS[2]}
    [return]  ${return_value}
Отримати інформацію із предмету
    [Arguments]  @{ARGUMENTS}
    ${return_value}=  run keyword  Отримати інформацію про items ${ARGUMENTS[3]}
    [return]  ${return_value}
Отримати інформацію із запитання
    [Arguments]  @{ARGUMENTS}
    #debug
    torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Wait Until Page Contains Element    xpath= //*[@testval="btnQuestions"]    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element                                             //*[@testval='btnQuestions']
    Sleep    5
    ${return_value}=  run keyword  Отримати інформацію про questions ${ARGUMENTS[3]}
    [return]  ${return_value}
Отримати інформацію із документа
    [Arguments]  @{ARGUMENTS}
    #debug
    ${return_value}=  run keyword  Отримати Інформацію Про document ${ARGUMENTS[3]}
    [return]  ${return_value}

Отримати інформацію із пропозиції
    [Arguments]  @{ARGUMENTS}
    ${return_value}=  Run keyword if  '${ARGUMENTS[2]}' == 'value.amount'  отримати інформацію із пропозиції про value.amount   ELSE   Отримати Інформацію Про ${ARGUMENTS[2]}

    #${return_value}=  run keyword  Отримати Інформацію Про ${ARGUMENTS[2]}
    [return]  ${return_value}
Отримати документ
    [Arguments]  @{ARGUMENTS}
    ${docName}=    Get Text         xpath=(//*[@testval='document_title'])
    ${docUrl}=     Get Element Attribute         xpath=(//*[@testval='document_title'])@docURL
    Download File From Url  ${docUrl}  ${OUTPUT_DIR}${/}${docName}
    [return]  ${docName}
Отримати Посилання На Аукціон Для Глядача
    [Arguments]    ${user}    ${tenderId}
    #${AuctionUrl}=     torgua.Отримати посилання на аукціон    ${user}    ${tenderId}
    torgua.Пошук тендера по ідентифікатору     ${user}     ${tenderId}
    ${AuctionUrl}=     Get Element Attribute         xpath=(//*[@testval='auctionUrl']/descendant::a[1])@href
    [return]    ${AuctionUrl}

Отримати посилання на аукціон для учасника
    [Arguments]    @{ARGUMENTS}
    torgua.Пошук тендера по ідентифікатору     ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    ${AuctionUrl}=     Get Element Attribute    xpath=(//*[@testval='auctionUrl']/descendant::a[1])@href
    [return]    ${AuctionUrl}

Отримати посилання на аукціон
    [Arguments]    ${user}    ${tenderId}
    torgua.Пошук тендера по ідентифікатору ${user} ${tenderId}
    ${AuctionUrl}=     Get Element Attribute         xpath=(//*[@testval='auctionUrl']/descendant::a[1])@href
    [return]    ${AuctionUrl}

Отримати Інформацію Про document title
    ${documentTitle}=     Отримати текст із поля і показати на сторінці     document.title
    [return]    ${documentTitle}
Оновити сторінку з тендером
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} = username
    ...            ${ARGUMENTS[1]} = tenderUaId

    Selenium2Library.Switch Browser        ${ARGUMENTS[0]}
    torgua.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Sleep  10
    Reload Page

Отримати текст із поля і показати на сторінці
    [Arguments]     ${fieldname}
    sleep    15
    ${return_value}=     Get Text    ${locator.${fieldname}}
    [return]    ${return_value}

Отримати Інформацію Про Title

    ${title}=     Отримати текст із поля і показати на сторінці     title
    [return]    ${title}
отримати інформацію про AuctionUrl
    ${auctionUrl}=     Отримати текст із поля і показати на сторінці     auctionUrl
    [return]    ${auctionUrl}

отримати інформацію про description
    ${description}=     Отримати текст із поля і показати на сторінці     description
    [return]    ${description}

отримати інформацію про tenderId
    ${tenderId}=    Отримати текст із поля і показати на сторінці  tenderId
    [return]    ${tenderId}

отримати інформацію про value.amount
    #Click Element                                             //*[@testval='btnBidKat'][1]
    #Sleep  5
    #Click Element     xpath=//*[@testval='btnEditBid'][1]
    ${valueAmount}=     Отримати текст із поля і показати на сторінці     value.amount
    #debug
    ${valueAmount}=      Convert To Number     ${valueAmount.split(' ')[0]}
    [return]    ${valueAmount}

отримати інформацію із пропозиції про value.amount
    Wait Until Page Contains Element    xpath=//*[@testval='btnProfile']    timeout=100
    Click Element                                             //*[@testval='btnProfile']
    Wait Until Page Contains Element    xpath=//*[@testval='btnMyBids']    timeout=100
    Click Element                                             //*[@testval='btnMyBids']
    Sleep  10
    Click Element                                             //*[@testval='btnBidKat'][1]
    Sleep  10
    Click Element     xpath=//*[@testval='btnEditBid'][1]
    ${valueAmount}=     Get Element Attribute         xpath=//*[@testval='proposition']@value
    #debug
    ${valueAmount}=      Convert To Number     ${valueAmount.split(' ')[0]}
    [return]    ${valueAmount}

отримати інформацію про minimalStep.amount
    ${minimalStepAmount}=     Отримати текст із поля і показати на сторінці     minimalStep.amount
    #debug
    ${minimalStepAmount}=      Convert To Number     ${minimalStepAmount.split(' ')[0]}
    [return]    ${minimalStepAmount}

Отримати інформацію про awards[0].complaintPeriod.endDate
    MyClick Element  'btnResultQualification'
    Sleep  10
    ${awardComplaintPeriodEndDate}=     Отримати текст із поля і показати на сторінці awards[0].complaintPeriod.endDate
    ${awardComplaintPeriodEndDate}=     parse_date     ${awardComplaintPeriodEndDate}
    [return]    ${awardComplaintPeriodEndDate}

отримати інформацію про enquiryPeriod.endDate
    ${enquiryPeriodEndDate}=     Отримати текст із поля і показати на сторінці     enquiryPeriod.endDate
    ${enquiryPeriodEndDate}=     parse_date     ${enquiryPeriodEndDate}
    [return]    ${enquiryPeriodEndDate}

отримати інформацію про tenderPeriod.endDate
    ${tenderPeriodEndDate}=     Отримати текст із поля і показати на сторінці         tenderPeriod.endDate
    ${tenderPeriodEndDate}=     parse_date        ${tenderPeriodEndDate}
    [return]    ${tenderPeriodEndDate}

отримати інформацію про items deliveryAddress.countryName
    ${countryName}=     Отримати текст із поля і показати на сторінці     items[0].deliveryAddress.countryName
    [return]    ${countryName}

отримати інформацію про items classification.scheme
    #${classificationScheme}=     Отримати текст із поля і показати на сторінці     items[0].classification.scheme
    [return]    ДК021

отримати інформацію про items additionalClassifications[0].id
    ${additionalClassificationsId}=     Отримати текст із поля і показати на сторінці         items[0].additionalClassifications[0].id
    [return]    ${additionalClassificationsId}

отримати інформацію про items additionalClassifications[0].description
    ${additionalClassificationsDescription}=     Отримати текст із поля і показати на сторінці        items[0].additionalClassifications[0].description
    [return]    ${additionalClassificationsDescription}

отримати інформацію про items additionalClassifications[0].scheme
    ${additionalClassificationsScheme}=     Отримати текст із поля і показати на сторінці     items[0].additionalClassifications[0].scheme
    [return]    ${additionalClassificationsScheme}

Отримати інформацію про questions title
    ${questionsTitle}=     Отримати текст із поля і показати на сторінці         questions[0].title
    [return]    ${questionsTitle}

Отримати інформацію про questions[0].title
    ${questionsTitle}=     Отримати текст із поля і показати на сторінці         questions[0].title
    [return]    ${questionsTitle}

Отримати інформацію про questions[0].description
    ${questionsDescription}=     Отримати текст із поля і показати на сторінці         questions[0].description
    [return]    ${questionsDescription}

отримати інформацію про questions description
    ${questionsDescription}=     Отримати текст із поля і показати на сторінці         questions[0].description
    [return]    ${questionsDescription}

отримати інформацію про questions date

    ${questionsDate}=     Отримати текст із поля і показати на сторінці         questions[0].date
    ${questionsDate}=     convert_date_for_compare         ${questionsDate}
    [return]    ${questionsDate}

отримати інформацію про questions answer
    Click Element                                             xpath=//*[@testval='btnQuestions']
    ${questionsAnswer}=     Отримати текст із поля і показати на сторінці         questions[0].answer
    [return]    ${questionsAnswer}

отримати інформацію про questions[0].answer
    Click Element                                             xpath=//*[@testval='btnQuestions']
    ${questionsAnswer}=     Отримати текст із поля і показати на сторінці         questions[0].answer
    [return]    ${questionsAnswer}

отримати інформацію про items deliveryDate.startDate
    ${deliveryDateStartDate}=     Отримати текст із поля і показати на сторінці         items[0].deliveryDate.startDate
    ${deliveryDateStartDate}=     parse_date        ${deliveryDateStartDate}
    [return]    ${deliveryDateStartDate}

отримати інформацію про items deliveryDate.endDate
    ${deliveryDateEndDate}=     Отримати текст із поля і показати на сторінці     items[0].deliveryDate.endDate
    ${deliveryDateEndDate}=     parse_date        ${deliveryDateEndDate}
    [return]    ${deliveryDateEndDate}

отримати інформацію про items classification.id
    ${classificationId}=     Отримати текст із поля і показати на сторінці     items[0].classification.id
    [return]    ${classificationId}

отримати інформацію про items classification.description
    ${classificationDescription}=     Отримати текст із поля і показати на сторінці         items[0].classification.description
    Run Keyword And Return If    '${classificationDescription}' == 'Картонки'        Convert To String    Cartons
    [return]    ${classificationDescription}

отримати інформацію про items quantity
    ${itemsQuantity}=     Отримати текст із поля і показати на сторінці         items[0].quantity
    ${itemsQuantity}=     Convert To Integer        ${itemsQuantity}
    [return]    ${itemsQuantity}

отримати інформацію про items unit.code
    ${unitCode}=     Отримати текст із поля і показати на сторінці         items[0].unit.code
    Run Keyword And Return If    '${unitCode}'== 'KGM (кілограми)'     Convert To String    KGM
    [return]    ${unitCode}

отримати інформацію про items unit.name
    ${unitName}=     Отримати текст із поля і показати на сторінці         items[0].unit.name
    Run Keyword And Return If    '${unitName}' == 'KGM (кілограми)'        Convert To String    кілограми
    [return]    ${unitName}

Отримати інформацію про value.currency
    ${valueCurrency}=     Отримати текст із поля і показати на сторінці         value.currency
    [return]    ${valueCurrency}

Отримати інформацію про value.valueAddedTaxIncluded
    ${valueAddedTaxIncluded}=     Отримати текст із поля і показати на сторінці         value.valueAddedTaxIncluded
    Run Keyword And Return If    '${valueAddedTaxIncluded}'=='з ПДВ'     Convert To boolean    True
    [return]    ${valueAddedTaxIncluded}

Отримати інформацію про items description
    ${itemsDescription}=     Отримати текст із поля і показати на сторінці         items[0].description
    [return]    ${itemsDescription}

отримати інформацію про procuringEntity.name
    ${procuringEntityName}=     Отримати текст із поля і показати на сторінці         procuringEntity.name
    [return]    ${procuringEntityName}

отримати інформацію про enquiryPeriod.startDate
    ${enquiryPeriodStartDate}=     Отримати текст із поля і показати на сторінці         enquiryPeriod.startDate
    ${enquiryPeriodStartDate}=     parse_date        ${enquiryPeriodStartDate}

    [return]    ${enquiryPeriodStartDate}

отримати інформацію про tenderPeriod.startDate
    ${tenderPeriodStartDate}=     Отримати текст із поля і показати на сторінці         tenderPeriod.startDate
    ${tenderPeriodStartDate}=     parse_date        ${tenderPeriodStartDate}
    [return]    ${tenderPeriodStartDate}

отримати інформацію про items deliveryLocation.longitude
    ${deliveryLocationLongitude}=     Отримати текст із поля і показати на сторінці         items[0].deliveryLocation.longitude
    ${deliveryLocationLongitude}=    Convert To Number   ${deliveryLocationLongitude}
    [return]    ${deliveryLocationLongitude}

отримати інформацію про items deliveryLocation.latitude
    ${deliveryLocationLatitude}=     Отримати текст із поля і показати на сторінці         items[0].deliveryLocation.latitude
    ${deliveryLocationLatitude}=    Convert To Number   ${deliveryLocationLatitude}
    [return]    ${deliveryLocationLatitude}

отримати інформацію про items[0].deliveryLocation.longitude
    ${deliveryLocationLongitude}=     Get Element Attribute         ${locator.items[0].deliveryLocation.longitude}@value
    ${deliveryLocationLongitude}=    Convert To Number   ${deliveryLocationLongitude}
    [return]    ${deliveryLocationLongitude}

отримати інформацію про items[0].deliveryLocation.latitude
    ${deliveryLocationLatitude}=     Get Element Attribute         ${locator.items[0].deliveryLocation.latitude}@value
    ${deliveryLocationLatitude}=    Convert To Number   ${deliveryLocationLatitude}
    [return]    ${deliveryLocationLatitude}


отримати інформацію про items deliveryAddress.postalCode
    ${deliveryAddressPostalCode}=     Отримати текст із поля і показати на сторінці         items[0].deliveryAddress.postalCode
    [return]    ${deliveryAddressPostalCode}

отримати інформацію про items deliveryAddress.locality
    ${deliveryAddressLocality}=     Отримати текст із поля і показати на сторінці         items[0].deliveryAddress.locality
    [return]    ${deliveryAddressLocality}

отримати інформацію про items deliveryAddress.streetAddress
    ${deliveryAddressStreetAddress}=     Отримати текст із поля і показати на сторінці         items[0].deliveryAddress.streetAddress
    [return]    ${deliveryAddressStreetAddress}

отримати інформацію про items deliveryAddress.region
    ${deliveryAddressRegion}=     Отримати текст із поля і показати на сторінці         items[0].deliveryAddress.region
    [return]    ${deliveryAddressRegion}

Отримати Інформацію Про Status
    #${status}=     Get Element Attribute     //*[@name='tender-status']@value
    ${status}=     Get Element Attribute         xpath=(//*[@testval='tender-status'])@value
    [return]    ${status}

MyClick Element
    [Arguments]    ${element}
    Wait Until Page Contains Element    xpath=//*[@testval=${element}]    timeout=100
    Click Element  xpath=//*[@testval=${element}]
    Sleep  5

Завантажити документ рішення кваліфікаційної комісії
    [Arguments]    @{ARGUMENTS}
    torgua.Пошук тендера по ідентифікатору в кабінеті     ${ARGUMENTS[0]}    ${ARGUMENTS[2]}    "btnQualification"
    Sleep  10
    MyClick Element  'btnAddDocument'
    MyClick Element  'typeDocument'
    MyClick Element  'itemResponseMessage'
    Input text    //*[@testval='descriptionDocument']    descriptionDocument
    Sleep  10
    Execute Javascript  $("input[type='file']").css('display', 'block')
    Sleep  20
    Choose File                                 //*[@testval='btnChooseDocument']/descendant::input[1]                    ${ARGUMENTS[1]}
    Sleep  10

Підтвердити постачальника
    [Arguments]  ${username}  ${tender_uaid}  ${award_num}
    MyClick Element  'btnWinner'
    MyClick Element  'checkboxWinner1'
    MyClick Element  'checkboxWinner2'
    Input text    //*[@testval='descriptionResult']    descriptionResult
    MyClick Element  'btnContinue'
    Sleep  30
    MyClick Element  'btnApproove'
    Sleep  20
    MyClick Element  'btnApprooveWinner'

Підтвердити підписання контракту
    [Arguments]    @{ARGUMENTS}
    torgua.Пошук тендера по ідентифікатору в кабінеті     ${ARGUMENTS[0]}    ${ARGUMENTS[1]}    "btnContract1"
    Sleep  10
    Input text    //*[@testval='contractNum']    ${ARGUMENTS[2]}
    MyClick Element  'btnSaveContract'
    Sleep  30
    MyClick Element  'btnApprooveContract'

#################          PLAN

Оновити сторінку з планом
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} = username
    ...            ${ARGUMENTS[1]} = planUaId

    Selenium2Library.Switch Browser        ${ARGUMENTS[0]}
    torgua.Пошук плану по ідентифікатору        ${ARGUMENTS[0]}     ${ARGUMENTS[1]}
    Sleep  10
    Reload Page



Пошук плану по ідентифікатору
    [Arguments]    @{ARGUMENTS}
        [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    planId
    Switch browser     ${ARGUMENTS[0]}
    Go To    ${USERS.users['${ARGUMENTS[0]}'].homepage}
    Click Element    xpath=//a[contains(@href,'signin')]
    Wait Until Page Contains Element    xpath=//*[@testval='nav_procurements']    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element    xpath=//*[@testval='nav_procurements']
    Sleep    20
    Click Element    xpath=//*[@testval='nav_plans']
    Sleep    10
    Input text    //*[@testval='searchplan']    ${ARGUMENTS[1]}
    Press Key    //*[@testval='searchplan']    \\13
    Sleep    10
    Wait Until Page Contains Element    xpath=//*[@testval='planinfo'][1]    timeout=100
    Wait Until Element Is Not Visible    xpath=//*[@testval='loader']    timeout=100
    Click Element    xpath=//*[@testval='planinfo'][1]
    #Wait Until Page Contains Element    id=content
    Sleep    5

Пошук плану по ідентифікатору в кабінеті
    [Arguments]    @{ARGUMENTS}
        [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    planId
    ...            ${ARGUMENTS[2]} ==    action
    Go To    ${USERS.users['${ARGUMENTS[0]}'].homepage}
    Click Element    xpath=//a[contains(@href,'signin')]
    Wait Until Page Contains Element    xpath=//*[@testval='btnProfile']    timeout=100
    Click Element                                             //*[@testval='btnProfile']
    Wait Until Page Contains Element    xpath=//*[@testval='myPlans']    timeout=100
    Click Element                                             //*[@testval='myPlans']
    Input text    //*[@testval='searchplan']    ${ARGUMENTS[1]}
    Press Key    //*[@testval='searchplan']    \\13
    Wait Until Page Contains Element    xpath=//*[@testval="btnplankat"]    timeout=100
    Click Element                                             //*[@testval="btnplankat"][1]
    Wait Until Page Contains Element    xpath=//*[@testval=${ARGUMENTS[2]}]    timeout=100
    Click Element    //*[@testval=${ARGUMENTS[2]}]
    Sleep    10

Створити план
    [Arguments]    @{ARGUMENTS}
    [Documentation]
    ...            ${ARGUMENTS[0]} ==    username
    ...            ${ARGUMENTS[1]} ==    plan_data
    ${procurementMethodType}=     Get From Dictionary        ${ARGUMENTS[1].data.tender}                 procurementMethodType
    ${budget_amount}=                Get From Dictionary     ${ARGUMENTS[1].data.budget}                 amount
    ${budget_amount}=                            Format         ${budget_amount}
    ${budget_description}=     Get From Dictionary     ${ARGUMENTS[1].data.budget}                             description
    ${budget_currency}=                Get From Dictionary     ${ARGUMENTS[1].data.budget}                 currency
    ${budget_id}=                Get From Dictionary     ${ARGUMENTS[1].data.budget}                 id
    ${project_id}=                Get From Dictionary     ${ARGUMENTS[1].data.budget.project}                 id
    ${project_name}=                Get From Dictionary     ${ARGUMENTS[1].data.budget.project}                 name

    ${items}=                 Get From Dictionary     ${ARGUMENTS[1].data}                             items
    ${cpv_id}=                Get From Dictionary     ${items[0].classification}                 id
    ${cpv_description}=                     Get From Dictionary     ${items[0].classification}                 description

    ${cpv_id_plan}=                Get From Dictionary     ${ARGUMENTS[1].data.classification}                 id
    ${cpv_description_plan}=                     Get From Dictionary     ${ARGUMENTS[1].data.classification}                 description

    ${tenderPeriod_startDate}=     Get From Dictionary        ${ARGUMENTS[1].data.tender.tenderPeriod}                 startDate
    ${tenderPeriod_startDate}=                Convert Date To String     ${tenderPeriod_startDate}

    ${items_description}=     Get From Dictionary     ${items[0]}                 description
    ${items_unit_quantity}=     Get From Dictionary     ${items[0]}                 quantity
    ${items_unit_code}=     Get From Dictionary     ${items[0].unit}                 code

    ${items_items_deliveryDate_endDate}=     Get From Dictionary     ${items[0].deliveryDate}                 endDate
    ${items_items_deliveryDate_endDate}=                Convert Date To String     ${items_items_deliveryDate_endDate}

    #Змінити персональні дані        ${ARGUMENTS[1]}

    Selenium2Library.Switch Browser         ${ARGUMENTS[0]}

    Sleep    10
    Wait Until Page Contains Element    //*[@testval='myPlans']    timeout=100
    MyClick Element    'myPlans'
    MyClick Element    'btnCreatePlan'

    MyClick Element         'procurementMethodType'
    MyClick Element         '${procurementMethodType}'

    Input text    //*[@testval="budget_description"]        ${budget_description}
    Input text    //*[@testval="budget_amount"]        ${budget_amount}

    MyClick Element         'budget_currency'
    MyClick Element         '${budget_currency}'

    Input text    //*[@testval="tenderPeriod_startDate"]/descendant::input[1]     ${tenderPeriod_startDate}

    #Main Classification
    Click Element                                             //*[@testval="codeclassification"][1]
    Sleep    2
    Wait Until Page Contains Element    //*[@testval='searchclassification'][1]    timeout=100
    Input text                                                 //*[@testval='searchclassification']        ${cpv_description_plan}
    Click Element                                             //*[@testval='btnsearchclassification']
    Sleep    2
    Click Element                                             //*[@testval='${cpv_id_plan}']
    Click Element                                             //*[@testval='btncheck']


    Click Element                                             //*[@testval="btnadd"]

    Input text                                                    //*[@testval="items_description"]        ${items_description}

    #Item classification
    Click Element                                             //*[@testval="codeclassification"][2]
    Sleep    2
    Wait Until Page Contains Element    //*[@testval='searchclassification']    timeout=100
    Input text                                                 //*[@testval='searchclassification']        ${cpv_description}
    Click Element                                             //*[@testval='btnsearchclassification']
    Sleep    2
    Click Element                                             //*[@testval='${cpv_id}']
    Click Element                                             //*[@testval='btncheck']

    # Select Код одиниці виміру (має відповідати стандарту UN/CEFACT, наприклад - KGM)
    Click Element         //*[@testval="btn_unit_code"]/descendant::button[1]
    Click Element         //*[@testval='${items_unit_code}']

    Input text                                                    //*[@testval="items_unit_quantity"]        ${items_unit_quantity}

    # It is Костыль (конфуз между ТЗ прозорро и ТЗ автотестов
    Execute Javascript  $("input[testval='project_id']").css('display', 'block')
    Execute Javascript  $("input[testval='project_name']").css('display', 'block')

    Input text    //*[@testval="project_id"]        ${project_id}
    Input text    //*[@testval="project_name"]        ${project_name}

    Click Element                                             //*[@testval='btnsave']
    Wait Until Page Contains Element    xpath= //*[@testval="btnplankat"]    timeout=100

    ${plan_UAid}=    Get Text                     //*[@testval="plan_UAid"][1]
    [return]    ${plan_UAid}

Отримати інформацію із плану
    [Arguments]  @{ARGUMENTS}
    [Documentation]
    ...      ${ARGUMENTS[0]} ==  plan_uaid
    ...      ${ARGUMENTS[1]} ==  field
    ${return_value}=  run keyword  Отримати інформацію про план ${ARGUMENTS[2]}
    [return]    ${return_value}


Отримати інформацію про план tender.procurementMethodType
        ${result}=     Отримати текст із поля і показати на сторінці     plan.tender.procurementMethodType
        [return]    ${result}


Отримати інформацію про план budget.amount
         ${result}=     Отримати текст із поля і показати на сторінці     plan.budget.amount
         ${result} =    Convert To Number   ${result.split(' ')[0]}
         [return]    ${result}

Отримати інформацію про план budget.description
         ${result}=     Отримати текст із поля і показати на сторінці     plan.budget.description
         [return]    ${result}

Отримати інформацію про план budget.currency
         ${result}=     Отримати текст із поля і показати на сторінці     plan.budget.currency
         [return]    ${result}

Отримати інформацію про план plan.budget.id
    Execute Javascript  $("input[testval='plan.budget.id']").css('display', 'block')
         ${result}=     Отримати текст із поля і показати на сторінці     plan.budget.id
         [return]    ${result}


Отримати інформацію про план budget.project.id
# It is Костыль (конфуз между ТЗ прозорро и ТЗ автотестов
    Execute Javascript  $("input[testval='budget.project.id']").css('display', 'block')
         ${result}=     Отримати текст із поля і показати на сторінці     budget.project.id
         [return]    ${result}

Отримати інформацію про план budget.project.name
# It is Костыль (конфуз между ТЗ прозорро и ТЗ автотестов
    Execute Javascript  $("input[testval='budget.project.name']").css('display', 'block')
         ${result}=     Отримати текст із поля і показати на сторінці     budget.project.name
         [return]    ${result}

Отримати інформацію про план procuringEntity.name
         ${result}=     Отримати текст із поля і показати на сторінці     plan.procuringEntity.name
         [return]    ${result}



Отримати інформацію про план procuringEntity.identifier.scheme
    Execute Javascript  $("input[testval='plan.procuringEntity.identifier.scheme']").css('display', 'block')
         ${result}=     Отримати текст із поля і показати на сторінці     plan.procuringEntity.identifier.scheme
         [return]    ${result}

Отримати інформацію про план procuringEntity.identifier.id
         ${result}=     Отримати текст із поля і показати на сторінці     plan.procuringEntity.identifier.id
         [return]    ${result}

Отримати інформацію про план procuringEntity.identifier.legalName
         ${result}=     Отримати текст із поля і показати на сторінці     plan.procuringEntity.identifier.legalName
         [return]    ${result}

Отримати інформацію про план classification.description
    Execute Javascript  $("input[testval='plan.classification.description']").css('display', 'block')
         ${result}=     Отримати текст із поля і показати на сторінці     plan.classification.description
         [return]    ${result}

Отримати інформацію про план classification.scheme
    Execute Javascript  $("input[testval='plan.classification.scheme']").css('display', 'block')
         ${result}=     Отримати текст із поля і показати на сторінці     plan.classification.scheme
         [return]    ${result}

Отримати інформацію про план classification.id
         ${result}=     Отримати текст із поля і показати на сторінці     plan.classification.id
         [return]    ${result}


отримати інформацію про план tender.tenderPeriod.startDate
    ${result}=     Отримати текст із поля і показати на сторінці         plan.tender.tenderPeriod.startDate
    ${result}=     parse_date        ${result}
    [return]    ${result}

Отримати інформацію про план items[0].description
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].description
         [return]    ${result}

Отримати інформацію про план items[0].quantity
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].quantity
         ${result} =    Convert To Integer  ${result}
         [return]    ${result}

Отримати інформацію про план items[0].deliveryDate.endDate
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].deliveryDate.endDate
         ${result}=     parse_date        ${result}
         [return]    ${result}

Отримати інформацію про план items[0].unit.code
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].unit.code
         [return]    ${result}

Отримати інформацію про план items[0].unit.name
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].unit.name
         [return]    ${result}

Отримати інформацію про план items[0].classification.description
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].classification.description
         [return]    ${result}

Отримати інформацію про план items[0].classification.scheme
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].classification.scheme
         [return]    ${result}

Отримати інформацію про план items[0].classification.id
         ${result}=     Отримати текст із поля і показати на сторінці     plan.items[0].classification.id
         [return]    ${result}