Feature: Testando site de Idrugs

    Background:
        * configure driver = { type: 'geckodriver', showDriverLog: true }

    Scenario: Cadastrar Departamento
        Given driver baseUrl + 'Departments'
        * maximize()
        When click('.Departments_control_modal__uDIbf > button')
        And input('#department', 'CATEGORIA TESTE')
        And click('.SubmitButton_btn__wj8d3')
        And waitFor(".Message_message__GR0sF")
        Then match text('.Message_message__GR0sF') == 'Departamento Adicionado com Sucesso!'

    Scenario: Listar todos produtos e clicar no primeiro
        Given driver baseUrl + 'Products'
        * maximize()
        And waitFor(".Products_control_list__XejrX")
        When click('/html/body/div[1]/div/div/div/div/div[1]')

    Scenario: Cadastrar Funcionarios
        Given driver baseUrl + 'Employees'
        * maximize()
        And input('#name', 'FUNCIONARIO')
        And input('#last_name', 'TESTE')
        And input('#office', 'TESTER')
        And input('#photo_link', 'https://64.media.tumblr.com/505b4fb7212d5cc3750f46cf63b67aeb/f24dcb023f60eb17-63/s1280x1920/f316acd33aba4c5b826977125539a9a7482f2919.png')
        And input('#email', 'functester@idrugs.com')
        And input('#password', '123456')
        And click('.SubmitButton_btn__wj8d3')
        And waitFor(".Message_message__GR0sF")
        Then match text('.Message_message__GR0sF') == 'Funcionário Adicionado com Sucesso!'

    Scenario: Editar Funcionario
        Given driver baseUrl + 'Employees'
        * maximize()
        * waitFor(".EmpCard_emp_card__uWyRK")
        * def l = locate('.EmpCard_emp_card__uWyRK').parent.lastChild
        When l.locate('button').parent.children[0].click()
        * waitFor(".Modal_control_modal__oBMdY")
        And clear('/html/body/div[2]/div[2]/div/form/div[1]/input')
        And input('/html/body/div[2]/div[2]/div/form/div[1]/input', 'FUNCIONARIO editado')

        And clear('/html/body/div[2]/div[2]/div/form/div[2]/input')
        And input('/html/body/div[2]/div[2]/div/form/div[2]/input', 'TESTE editado')

        And clear('/html/body/div[2]/div[2]/div/form/div[3]/input')
        And input('/html/body/div[2]/div[2]/div/form/div[3]/input', 'TESTER editado')

        And clear('/html/body/div[2]/div[2]/div/form/div[6]/input')
        And input('/html/body/div[2]/div[2]/div/form/div[6]/input', '123456editado')

        And click('/html/body/div[2]/div[2]/div/form/div[7]/button')
        And waitFor(".Message_message__GR0sF")
        Then match text('.Message_message__GR0sF') == 'Funcionário Modificado com Sucesso!'

    Scenario: Excluir Funcionario
        Given driver baseUrl + 'Employees'
        * maximize()
        * waitFor(".EmpCard_emp_card__uWyRK")
        When click('/html/body/div[1]/div/div/div[1]/div/div[4]/div[2]/button[2]')
        And click('/html/body/div[2]/div[2]/div/button[2]')
        And waitFor(".Message_message__GR0sF")
        Then match text('.Message_message__GR0sF') == 'Funcionário Removido com Sucesso!'

