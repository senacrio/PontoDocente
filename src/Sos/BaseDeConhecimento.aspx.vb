Imports System.Data.SqlClient
Partial Class Sos_BaseDeConhecimento
    Inherits System.Web.UI.Page

    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
    Dim reader As SqlDataReader

    Private Sub Alterar()
        MultiView1.ActiveViewIndex = 2
        reader.Read()
        If reader.HasRows Then

            cboIDGrupoServico.SelectedValue = reader("idGrupoServico")

            cboIDGrupoServico.DataBind()

            cboIDServico.DataBind()


            If cboIDServico.Items.Count <> 0 Then
                cboIDServico.SelectedValue = reader("idServico")
            End If

            txtProblema.Text = reader("problema")
            txtSolucao.Text = reader("solucao")

        End If
    End Sub

    Private Sub EditarBase(ByVal IDBaseConhecimento As Integer)

        Dim cmd As SqlCommand = New SqlCommand("select * from sosBaseDeConhecimento where IDBaseDeConhecimento=@IDBaseDeConhecimento", conn)
        cmd.Parameters.Add(New SqlParameter("@IDBaseDeConhecimento", IDBaseConhecimento))
        conn.Open()

        reader = cmd.ExecuteReader()



        Alterar()

        cmd.Dispose()
        conn.Dispose()
        reader.Close()




    End Sub


    Private Sub AtualizaQtdUso(ByVal IDBaseDeConhecimento As Integer)


        Dim cmd As SqlCommand = New SqlCommand("update sosBaseDeconhecimento set qtduso=qtduso+1 where IDBaseDeConhecimento = @idbasedeconhecimento", conn)
        cmd.Parameters.Add(New SqlParameter("idbasedeconhecimento", IDBaseDeConhecimento))
        conn.Open()
        cmd.ExecuteNonQuery()
        conn.Close()
        conn.Dispose()
        cmd.Dispose()


    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        

    End Sub




    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        Dim btn As ImageButton = sender
        AtualizaQtdUso(btn.CommandArgument)
        grdBase.DataBind()

    End Sub

    Protected Sub grdBase_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdBase.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        DetailsView1.DataBind()


    End Sub

   

    Protected Sub btnSalvar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvar0.Click


        If btnSalvar0.CommandName = "Incluir" Then
            Try
                sdsBaseDeConhecimentoInc.Insert()
                lblErro.Text = "Resgistro incluído."

            Catch ex As Exception
                lblErro.Text = ex.Message.ToString()
            Finally
                grdBase.DataBind()
                MultiView1.ActiveViewIndex = 0

            End Try
        ElseIf btnSalvar0.CommandName = "Editar" Then
            Try
                sdsBaseDeConhecimentoInc.Update()
                lblErro.Text = "Resgistro alterado."

            Catch ex As Exception
                lblErro.Text = ex.Message.ToString()
            Finally
                grdBase.DataBind()
                MultiView1.ActiveViewIndex = 0

            End Try

        End If

    End Sub

    Protected Sub ddlGrupoServicoInc_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIDGrupoServico.SelectedIndexChanged

        'sdsServicoInc.SelectParameters("IDGrupoServico").DefaultValue = cboIDGrupoServico.SelectedValue

        'cboIDServico.DataBind()

    End Sub

    Protected Sub grdBase_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdBase.RowCommand
        lblErro.Text = ""
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender
        EditarBase(btn.CommandArgument)
        MultiView1.ActiveViewIndex = 2



        Session("idbasedeconhecimento") = btn.CommandArgument



        btn.Dispose()
        
        'CRUD.Popula(View2, sdsBaseDeConhecimentoInc)

        btnSalvar0.CommandName = "Editar"


    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        btnSalvar0.CommandName = "Incluir"
        Try
            cboIDGrupoServico.SelectedIndex = 0
            cboIDGrupoServico.DataBind()
            cboIDServico.DataBind()
        Catch
        End Try

        txtProblema.Text = ""
        txtSolucao.Text = ""
        MultiView1.ActiveViewIndex = 2

    End Sub



    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        'If btnSalvar0.CommandName = "Editar" Then

        '    sdsBaseDeConhecimentoInc.Update()



        'End If


    End Sub

    Protected Sub ImageButton9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton9.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub ImageButton10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton10.Click
        


        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub cboIDGrupoServico_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIDGrupoServico.TextChanged
        'cboIDServico.DataBind()
    End Sub
End Class
