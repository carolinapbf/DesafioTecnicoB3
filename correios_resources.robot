*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    Dialogs
Library    XML

*** Variables ***
${BUSCA_OBJETO}                  css:input#objetos+button
${BUSCA_CEP}                     css:input#relaxation+button
${CAMPO_BUSCA_CEP}               //input[@name='relaxation']
${CAMPO_BUSCA_OBJETO}            //input[@name='objetos']
${CODIGO_RASTREIO}   
${FECHAR_AJUDANTE_VIRTUAL}       css:#header-balao #carol-fecha
${MENU_INICIAL}                  input[id=objetos]
${MESSAGE}                       Dados não encontrado
${RESULTADO_ALERTA}              id=mensagem-resultado-alerta
${RESULTADO_TABELA}              css:#resultado-DNEC 
${URL}                           https://www.correios.com.br/
 

*** Keywords ***
Abrir o navegador
    Open Browser  browser= chrome
    Maximize Browser Window
    
Fechar o navegador
   Close Browser
Entre no site dos correios
    Go To    ${URL}
    Click Element      ${FECHAR_AJUDANTE_VIRTUAL}
    Execute Javascript  window.scrollTo(0,1500)
    
Procure pelo CEP '${CEP}'
    Wait Until Element Is Visible    ${CAMPO_BUSCA_CEP}
    Input Text    ${CAMPO_BUSCA_CEP}    ${CEP}
    Wait Until Element Is Enabled    ${BUSCA_CEP}
    Click Element  ${BUSCA_CEP}
    Switch Window  NEW
   
Verificar que o CEP não existe
   
    Wait Until Element Is Visible    ${RESULTADO_ALERTA}
    Element Text Should Be    ${RESULTADO_ALERTA}    ${MESSAGE}
    
Verificar que o resultado seja em '${ENDEREÇO}' em '${CIDADE}'
        
        Wait Until Element Is Visible    ${RESULTADO_TABELA}
        Table Should Contain    ${RESULTADO_TABELA}    ${ENDEREÇO}
        Table Should Contain    ${RESULTADO_TABELA}    ${CIDADE}

Procurar no rastreamento de código o número '${CODIGO_RASTREIO}'
    Wait Until Element Is Visible    ${CAMPO_BUSCA_OBJETO}
    Input Text    ${CAMPO_BUSCA_OBJETO}    ${CODIGO_RASTREIO}
    Wait Until Element Is Enabled    ${BUSCA_OBJETO}
    Click Element  ${BUSCA_OBJETO}
    Switch Window  NEW

Verificar se foi direcionado para a pagina de '${TITULO_PAGINA}' 
    Element Text Should Be    id=titulo-pagina    ${TITULO_PAGINA}
    Element Should Contain     id=objeto    ${CODIGO_RASTREIO}
