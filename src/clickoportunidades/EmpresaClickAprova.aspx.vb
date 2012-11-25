Imports Dados
Imports System.Data.SqlClient
Partial Class EmpresaClickAprova
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        MultiView1.Visible = True
        MultiView1.ActiveViewIndex = 0
        lblAviso.Text = ""

        If gridAprovacao.SelectedIndex >= 0 Then
            lblAviso.Text = "Por favor, selecione a empresa. Para ordernar pelos itens desejados, clique no cabeçalho das colunas."
        Else
            lblAviso.Text = ""
        End If


    End Sub

    Protected Sub btnAprova_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAprova.Click
        Dim parCNPJ, parRazaoSocial, parNomeFantasia, parAprovada, parcancelamento As New Parameter

        'Limpa todos os parâmetros correntes
        sqlAprovacaoGrid.SelectParameters.Clear()

        parCNPJ.Name = "cnpj"
        If txtCNPJ.Text.Length = 0 Then
            parCNPJ.DefaultValue = "%"
        Else
            parCNPJ.DefaultValue = txtCNPJ.Text
        End If
        sqlAprovacaoGrid.SelectParameters.Add(parCNPJ)

        parRazaoSocial.Name = "razao_social"
        If txtRazao.Text.Length = 0 Then
            parRazaoSocial.DefaultValue = "%"
        Else
            parRazaoSocial.DefaultValue = txtRazao.Text
        End If
        sqlAprovacaoGrid.SelectParameters.Add(parRazaoSocial)

        parNomeFantasia.Name = "nome_fantasia"
        If txtNomeFantasia.Text.Length = 0 Then
            parNomeFantasia.DefaultValue = "%"
        Else
            parNomeFantasia.DefaultValue = txtNomeFantasia.Text
        End If
        sqlAprovacaoGrid.SelectParameters.Add(parNomeFantasia)

        parAprovada.Name = "aprovado"
        parAprovada.DefaultValue = rdAprovada.SelectedValue
        sqlAprovacaoGrid.SelectParameters.Add(parAprovada)

        txtCNPJ.Text = ""
        txtNomeFantasia.Text = ""
        txtRazao.Text = ""


    End Sub

    
    Protected Sub btnativar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        If gridAprovacao.SelectedIndex >= 0 Then


            SqlAprovaEmp.Update()

            Dim oEmpresas As New Empresas

            oEmpresas.AprovaEmpresa(Session("id_empresa"))

            Session("aprovado") = oEmpresas.AprovaEmpresa(Session("id_empresa"))

            Dim oRow As TableCellCollection
            oRow = gridAprovacao.Rows(gridAprovacao.SelectedIndex).Cells


            Dim oMsg As New Mensagem
            Dim sEmpresa As String
            Dim semail As String
            Dim Remail As String

            Try

                oEmpresas.PegaRegistro(oRow.Item(4).Text)

                sEmpresa = oEmpresas.Registro("razao_social") + ", CNPJ " + oEmpresas.Registro("cnpj")

                Remail = oEmpresas.PossuiRepresentanteEmail(Session("id_empresa"))

                semail = oEmpresas.Registro("email")

                oMsg.De = "atendimentoclick@rj.senac.br"
                oMsg.Para = semail + "," + Remail
                oMsg.Assunto = "Mensagem automática enviada pelo Click Oportunidades."
                oMsg.Texto += "Agora sua empresa " + sEmpresa + " já pode cadastrar as vagas disponíveis, bem como os perfils desejados. Para isso, utilize o endereço eletrônico www.rj.senac.br/clickoportunidades. Enviaremos, o mais breve possível, os candidatos adequados às necessidades e características de sua empresa. Mais informações sobre os serviços do Click Oportunidades podem ser obtidas, atráves dos telefones (21) 2582-5529/5565 ou pelo endereço eletrônico atendimentoclick@rj.senac.br <br>"
                oMsg.Envia()
                oMsg.Close()
                lblAviso.Text = "Mensagem de aprovação foi enviada para a empresa " + sEmpresa
            Catch ex As Exception

                lblAviso.Text = "Não foi possível enviar a mensagem. Entre em contato com suporte"
            End Try

            SqlLogEmpresa.Insert()
            gridAprovacao.DataBind()
        Else
            lblAviso.Text = "Selecione uma empresa na lista."
        End If

    End Sub

    Protected Sub btnInativar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        If gridAprovacao.SelectedIndex >= 0 Then


            SqlInativaEmp.Update()

            Dim oEmpresas As New Empresas

            oEmpresas.AprovaEmpresa(Session("id_empresa"))

            Session("aprovado") = oEmpresas.AprovaEmpresa(Session("id_empresa"))

            Dim oRow As TableCellCollection
            oRow = gridAprovacao.Rows(gridAprovacao.SelectedIndex).Cells


            Dim oMsg As New Mensagem
            Dim sEmpresa As String
            Dim semail As String

            Try

                oEmpresas.PegaRegistro(oRow.Item(4).Text)

                sEmpresa = oEmpresas.Registro("razao_social") + ", CNPJ " + oEmpresas.Registro("cnpj")

                semail = oEmpresas.Registro("email")

                oMsg.De = "atendimentoclick@rj.senac.br"
                oMsg.Para = semail
                oMsg.Assunto = "Mensagem automática enviada pelo Click Oportunidades."
                oMsg.Texto += "A sua empresa " + sEmpresa + " não foi aprovada pelo Click para maiores informações, utilize o endereço eletrônico www.rj.senac.br/clickoportunidades. Mais informações sobre os serviços do Click Oportunidades podem ser obtidas, atráves dos telefones (21) 2582-5529/5565 ou pelo endereço eletrônico atendimentoclick@rj.senac.br <br>"
                oMsg.Envia()
                oMsg.Close()
                lblAviso.Text = "Mensagem de aprovação foi enviada para a empresa " + sEmpresa
            Catch ex As Exception

                lblAviso.Text = "Não foi possível enviar a mensagem. Entre em contato com suporte"
            End Try

            SqlLogEmpresa.Insert()
            gridAprovacao.DataBind()
        Else
            lblAviso.Text = "Selecione uma empresa na lista."
        End If


    End Sub

    Protected Sub btnAnalisa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        If gridAprovacao.SelectedIndex >= 0 Then



            SqlAnaliseEmp.Update()

            Dim oEmpresas As New Empresas

            oEmpresas.AprovaEmpresa(Session("id_empresa"))

            Session("aprovado") = oEmpresas.AprovaEmpresa(Session("id_empresa"))

            Dim oRow As TableCellCollection
            oRow = gridAprovacao.Rows(gridAprovacao.SelectedIndex).Cells


            Dim oMsg As New Mensagem
            Dim sEmpresa As String
            Dim semail As String

            Try

                oEmpresas.PegaRegistro(oRow.Item(4).Text)

                sEmpresa = oEmpresas.Registro("razao_social") + ", CNPJ " + oEmpresas.Registro("cnpj")

				semail = oEmpresas.Registro("email")

                oMsg.De = "atendimentoclick@rj.senac.br"
                oMsg.Para = semail
                oMsg.Assunto = "Mensagem automática enviada pelo Click Oportunidades."
                oMsg.Texto += "Agora sua empresa " + sEmpresa + " está em análise e após aprovação, poderá cadastrar as vagas disponíveis, bem como os perfils desejados. Para isso, utilize o endereço eletrônico www.rj.senac.br/clickoportunidades. Enviaremos, o mais breve possível, os candidatos adequados às necessidades e características de sua empresa. Mais informações sobre os serviços do Click Oportunidades podem ser obtidas, atráves dos telefones (21) 2582-5529/5565 ou pelo endereço eletrônico atendimentoclick@rj.senac.br <br>"
                oMsg.Envia()
                oMsg.Close()
                lblAviso.Text = "Mensagem de aprovação foi enviada para a empresa " + sEmpresa
            Catch ex As Exception

                lblAviso.Text = "Não foi possível enviar a mensagem. Entre em contato com suporte"
            End Try

            SqlLogEmpresa.Insert()
            gridAprovacao.DataBind()
        Else
            lblAviso.Text = "Selecione uma empresa na lista."
        End If

    End Sub

    Protected Sub gridAprovacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridAprovacao.SelectedIndexChanged
        Session("id_empresa") = gridAprovacao.SelectedValue
    End Sub


    
    Protected Sub gridAprovacao_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gridAprovacao.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlRepresentantes"), SqlDataSource).SelectParameters("id_empresa_fk").DefaultValue = DataBinder.Eval(e.Row.DataItem, "id_empresa")
        End If
    End Sub
End Class
