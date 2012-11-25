Imports Dados
Imports CRUD2
Imports System.Web.UI.WebControls

Partial Class clickoportunidades_AdmVagas
    Inherits System.Web.UI.Page


    Protected Sub botaoAdmVagas_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAdmVagas.Click

        Dim parempresa, parCnpj, parmodalidade, paridentificador, parAtivada As New Parameter
        Dim parvaga, parescolaridade, parmunicipio, pardata, pardata2 As New Parameter

        Sqlvagas.SelectParameters.Clear()

        parvaga.Name = "id_vaga"
        If txtvaga.Text.Length = 0 Then
            parvaga.DefaultValue = "%"
        Else
            parvaga.DefaultValue = txtvaga.Text
        End If
        Sqlvagas.SelectParameters.Add(parvaga)

        parempresa.Name = "nome_fantasia"
        If txtempresa.Text.Length = 0 Then
            parempresa.DefaultValue = "%"
        Else
            parempresa.DefaultValue = txtempresa.Text
        End If
        Sqlvagas.SelectParameters.Add(parempresa)

        parCnpj.Name = "cnpj"
        If txtcnpj.Text.Length = 0 Then
            parCnpj.DefaultValue = "%"
        Else
            parCnpj.DefaultValue = txtcnpj.Text
        End If
        Sqlvagas.SelectParameters.Add(parCnpj)

        parmodalidade.Name = "modalidade"
        If cbomodalidade.Text.Length = 0 Then
            parmodalidade.DefaultValue = "%"
        Else
            parmodalidade.DefaultValue = cbomodalidade.Text
        End If
        Sqlvagas.SelectParameters.Add(parmodalidade)

        parmunicipio.Name = "nome"
        If cbomunicipio.Text.Length = 0 Then
            parmunicipio.DefaultValue = "%"
        Else
            parmunicipio.DefaultValue = cbomunicipio.Text
        End If
        Sqlvagas.SelectParameters.Add(parmunicipio)

        pardata.Name = "dtinicio"

        pardata.DefaultValue = txtdatinicio.Text

        Sqlvagas.SelectParameters.Add(pardata)

        pardata2.Name = "dtfim"

        pardata2.DefaultValue = txtdatfim.Text

        Sqlvagas.SelectParameters.Add(pardata2)

        parAtivada.Name = "ativada"
        If rdAtivada.SelectedValue = 2 Then
            parAtivada.DefaultValue = 2

        End If
        If rdAtivada.SelectedValue = 1 Then
            parAtivada.DefaultValue = 1

        End If
        If rdAtivada.SelectedValue = 0 Then
            parAtivada.DefaultValue = 0
        End If

        Sqlvagas.SelectParameters.Add(parAtivada)

        MultiView1.ActiveViewIndex = 1


    End Sub


    Protected Sub btnativar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)


        Sqlativar.Update()

        Dim oVaga As New Vagas

        oVaga.vagaLog(Session("id_vaga"))

        Session("ativada") = oVaga.vagaLog(Session("id_vaga"))

        SqlLogAlteracao.Insert()

        MultiView1.ActiveViewIndex = 1
        GridVaga.DataBind()


    End Sub

    Protected Sub btnInativar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)



        SqlInativar.Update()


        Dim oVaga As New Vagas

        oVaga.vagaLog(Session("id_vaga"))


        Session("ativada") = oVaga.vagaLog(Session("id_vaga"))

        SqlLogAlteracao.Insert()

        MultiView1.ActiveViewIndex = 1

        GridVaga.DataBind()




    End Sub

    Protected Sub btnAnalisa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        SqlAnalise.Update()


        Dim oVaga As New Vagas

        oVaga.vagaLog(Session("id_vaga"))


        Session("ativada") = oVaga.vagaLog(Session("id_vaga"))


        SqlLogAlteracao.Insert()

        MultiView1.ActiveViewIndex = 1
        GridVaga.DataBind()

    End Sub

    Protected Sub GridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVaga.SelectedIndexChanged

        Session("id_vaga") = GridVaga.SelectedValue
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dteNow As Date = Now()


        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        lblaviso.Text = ""

        Dim oVaga As New Vagas

        Session("id_vaga") = oVaga.Vaga(Session("id_vaga"))

        oVaga.PossuiVaga(Session("id_vaga"))

        Session("id_vagacandidato") = oVaga.PossuiVaga(Session("id_vaga"))


    End Sub

    Protected Sub btnvoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnvoltar.Click
        MultiView1.ActiveViewIndex = 0
    End Sub


End Class

