
Partial Class SenacVagas_CadastroVagas
    Inherits System.Web.UI.Page
    
#Region " FUNÇÕES "

    Private Sub GetVaga(ByVal cd_vaga As Integer)
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacVagasCS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select * from svvagas where cd_vaga=@cd_vaga", conn)

        conn.Open()

        Dim PCd_Vaga As SqlParameter = New SqlParameter()
        PCd_Vaga.ParameterName = "cd_vaga"
        PCd_Vaga.Value = cd_vaga

        cmd.Parameters.Add(PCd_Vaga)

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()

            txtTitulo.Text = reader("Tx_Titulo") + ""
            txtDescricao.Text = reader("Tx_Descricao") + ""
            txtRequisitos.Text = reader("Tx_requisito") + ""
            txtnmax.Text = reader("Nr_Maximo_Inscrito") + 0
            ddlLocal.SelectedValue = reader("Cd_local_FK")
            txtBeneficios.Text = reader("Tx_Benificios") + ""
            txtEmail.Text = reader("Tx_Email").ToString.Replace("@rj.senac.br", "") + ""
            chkDeficiente.Checked = reader("Cd_Deficiente")
            txtDataInicio.Text = IIf(IsDBNull(reader("Dt_Inicio")), "", reader("Dt_Inicio"))
            txtDataFim.Text = IIf(IsDBNull(reader("Dt_Final")), "", reader("Dt_Final"))
            txtObs.Text = reader("Tx_Obs").ToString()
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

    End Sub

    Private Sub Limpar()
        txtTitulo.Text = ""
        txtDescricao.Text = ""
        txtRequisitos.Text = ""
        txtnmax.Text = ""
        txtBeneficios.Text = ""
        txtEmail.Text = ""
        chkDeficiente.Checked = False
        gridVagas.SelectedIndex = -1
        lblmsg.Text = ""
        txtDataFim.Text = ""
        txtDataInicio.Text = ""
        txtObs.Text = ""
    End Sub

    Private Sub Voltar()
        MultiView1.ActiveViewIndex = 0
        gridVagas.SelectedIndex = -1
    End Sub
#End Region

    Protected Sub btnIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnIncluir.Click

        MultiView1.ActiveViewIndex = 1
        Limpar()
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnVoltar.Click
        Voltar()
        Limpar()
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvar.Click
        Try
            If gridVagas.SelectedIndex = -1 Then
                sqlVagas.Insert()
                lblmsg.ForeColor = Drawing.Color.Green
                lblmsg.Text = "Vaga registrada com sucesso."
            Else
                sqlVagas.Update()
                lblmsg.ForeColor = Drawing.Color.Green
                lblmsg.Text = "Vaga atualizada com sucesso."
            End If

            Voltar()
            gridVagas.DataBind()
        Catch ex As Exception
            lblmsg.ForeColor = Drawing.Color.Red
            lblmsg.Text = "Erro: " + ex.Message.ToString
        End Try
    End Sub

    Protected Sub gridVagas_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridVagas.SelectedIndexChanged
        GetVaga(gridVagas.SelectedValue)
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        Voltar()
        Limpar()
    End Sub
End Class
