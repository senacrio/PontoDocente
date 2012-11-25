Imports Dados
Imports Estudantes
Imports Cripto


Partial Class Empresa
    Inherits System.Web.UI.Page

    Protected Sub ibtCriaConta_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtCriaConta.Click
        Session("EmpresaCNPJ") = txtIdentificadoCad.Text
        Session("EmpresaSENHA") = txtSenhaCad.Text


        Dim oEmpresa As New Empresas
        'Valido o CPF digitado pelo estudante: (True ou False)
        oEmpresa.PegaRegistro(txtIdentificadoCad.Text)


        If Session("Aprovado") = "False" Then
            lblAviso.Text = "Essa já foi cadastrada e está em análise, ative a aprovação."
        End If

        Session("cancelamento") = oEmpresa.Cancelamento(Session("EmpresaCNPJ"))
        If Session("cancelamento") = "True" Then

            lblAviso.Text = "Essa conta já foi cancelada."

        Else

            If ValidaCNPJ.CandidatoValidaCNPJ(txtIdentificadoCad.Text) Then


                If Not oEmpresa.Existe(Session("EmpresaCNPJ")) Then
                    oEmpresa.IncluiCNPJ(Session("EmpresaCNPJ"), Session("EmpresaSenha"))
                    Session("EmpresaModo") = "INSERT"
                    'Redireciona para tela intermediária da empresa "Como conheceu o click?"
                    SqlInsereEmpresa.Update()
                    Session("EmpresaID") = oEmpresa.ID(Session("EmpresaCNPJ"))
                    lblAviso.Text = "Conta foi criada com sucesso."
                    Sqlinsereempresa.insert()
                Else
                    Session("Aprovado") = oEmpresa.Registro("aprovado")
                    Session("cancelamento") = oEmpresa.Registro("cancelamento")
                    lblaviso.text = "Conta já foi criada"
                End If

            Else

                lblAviso.Text = "CNPJ inválido. Por favor, digite novamente."
            End If
        End If
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Len(Session("id_empresa")) > 0 And Session("cancelamento") = "True" Then
            lblAviso.Text = "Essa conta foi cancelada."
        Else
            lblAviso.Text = ""
        End If

        If Len(Session("id_empresa")) > 0 And Session("Aprovado") = "False" Then
            lblAviso.Text = "Essa já foi cadastrada e está em análise, ative a aprovação."
        Else
            lblAviso.Text = ""
        End If


    End Sub


End Class
