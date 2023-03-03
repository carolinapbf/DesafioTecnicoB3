*** Settings ***
Documentation      Site dos correios
Resource           correios_resources.robot
Test Setup         Abrir o navegador
#Test Teardown      Fechar o navegador  
*** Test Cases ***

Caso de teste 01 - Desafio tecnico ID Check
    [Documentation]    Este teste verifica não encontrar um cep invalido no site dos correios
    Entre no site dos correios
    Procure pelo CEP '80700000'
    Verificar que o CEP não existe

Caso de teste 02 - 
    [Documentation]    Este teste verifica encontrar um cep valido no site dos correios
    Entre no site dos correios
    Procure pelo CEP '01013-001'
    Verificar que o resultado seja em 'Rua Quinze de Novembro' em 'São Paulo/SP'


Caso de teste 03 - 
    [Documentation]    Este teste verifica não encontrar um objeto com numero de rastreio invalido no site dos correios
    Entre no site dos correios
    Procurar no rastreamento de código o número 'SS987654321BR'
    Verificar se foi direcionado para a pagina de 'Rastreamento' 


#Caso de teste 02 - Desafio tecnico xpath Check

#Caso de teste 03 - Desafio tecnico css Check

