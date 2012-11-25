
Partial Class Ponto_Relatorios_Relatorio
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
    Public Function PegaUnidadeLotacao(ByVal sMatricula As String) As Integer
        Dim i As Integer

        Dim sSql As String = "SELECT cod_unid_lotac  FROM SGT_RHFuncionarioAtivo where cdn_funcionario = '" + sMatricula + "' And dat_desligto_func is null"
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            i = oRd("cod_unid_lotac")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return i

    End Function
    Public Function PegaInterino(ByVal sMatricula As String) As Integer
        Dim i As Integer

        Dim sSql As String = "SELECT lotacao  FROM ptnInterino where Matricula = " + sMatricula + ""
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            i = oRd("lotacao")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return i

    End Function
  


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim func As Funcionario = New Funcionario()
        'Session("c_Matricula") = "9610"

        Dim cargo As String = Left(func.Posicao(Session("c_Matricula")), 3)



        Session("c_lotac") = PegaUnidadeLotacao(Session("c_Matricula"))
        txtLinha0.Text = Session("c_Matricula")
        txtLinha0.Enabled = False
        Panel2.Visible = True




    End Sub

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        ReportViewer2.Visible = True


        Dim dtInicial As String = Right(txtDtInicial0.Text, 4) + "/" + Left(txtDtInicial0.Text, 2)
        Dim dtFinal As String = Right(txtDtFinal0.Text, 4) + "/" + Left(txtDtFinal0.Text, 2)
        'Dim dt As String = dtFinal + "/" + dtInicial
        Dim linha As String = txtLinha0.Text
        'Dim teste As String



        'teste = DropDownList1.SelectedValue
        ReportViewer2.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote

        ReportViewer2.ServerReport.ReportServerUrl = New Uri("http://banco01/reportserver")
        ReportViewer2.ServerReport.ReportPath = "/Report_SisPonto/TelefoniaCelular_Func"

        Dim params(2) As Microsoft.Reporting.WebForms.ReportParameter

        'Dim p As Microsoft.Reporting.WebForms.ReportParameter
        'p = New Microsoft.Reporting.WebForms.ReportParameter("Lotac", teste)

        Dim pDtInicial As Microsoft.Reporting.WebForms.ReportParameter
        pDtInicial = New Microsoft.Reporting.WebForms.ReportParameter("dt_inicial", dtInicial)
        'pDtInicial = New Microsoft.Reporting.WebForms.ReportParameter("dt_inicial", dtInicial)

        Dim pDtFinal As Microsoft.Reporting.WebForms.ReportParameter
        pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", dtFinal)
        'pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", dtFinal)

        Dim pLinha As Microsoft.Reporting.WebForms.ReportParameter
        pLinha = New Microsoft.Reporting.WebForms.ReportParameter("linha", linha)
        'pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", dtFinal)

        'params(0) = p
        params(0) = pDtInicial
        params(1) = pDtFinal
        params(2) = pLinha


        ReportViewer2.ServerReport.SetParameters(params)
        ReportViewer2.ServerReport.Refresh()


    End Sub

   
End Class
