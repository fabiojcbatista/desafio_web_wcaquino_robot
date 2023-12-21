** Settings **
Library         SeleniumLibrary
Library         FakerLibrary    locale=pt_BR
Test Teardown   Close Browser

** Variables **
 
 

** Keywords **
Popula usuário
  ${NOMEFAKE}=              FakerLibrary.Name
  ${EMAILFAKE}=             FakerLibrary.Email
  ${SENHAFAKER} =           FakerLibrary.Password
 
  Set suite variables  ${NOMEFAKE}
  Set suite variables  ${EMAILFAKE}
  Set suite variables  ${SENHAFAKE}
  
  
Abrir Site
    Open Browser  https://seubarriga.wcaquino.me/login  chrome

** Test Cases **
Cenário 1: Registrando usuário com sucesso
    Abrir Site
    maximize browser window
    Click Element                xpath://*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/a
    Input Text                      id:nome    João Pedro 
    Input Text                      id:email   emaildasilva@gmail.com.br45
    Input Text                      id:senha  456
    Click Element                xpath://*[contains(@value,"Cadastrar")] 
    wait until element is visible  xpath://*[contains(text(),"Usuário inserido com sucesso")]
    Capture Page Screenshot

Cenário 2: Registrando usuário com falha usuário já cadastrado
    Abrir Site
    maximize browser window
    Click Element                xpath://*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/a
    Input Text                      id:nome    João Pedro 
    Input Text                      id:email    emaildasilva@gmail.com.br
    Input Text                      id:senha    123
    Click Element                xpath://*[contains(@value,"Cadastrar")] 
    wait until element is visible  xpath://*[contains(text(),"Endereço de email já utilizado")]
    Capture Page Screenshot