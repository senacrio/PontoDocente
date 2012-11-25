
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


        Panel3.Visible = True

        


    End Sub


    Protected Sub btnConsulta_ger_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConsulta_ger.Click
        ReportViewer3.Visible = True


        Dim dtini As String = Right(txtDtInicial1.Text, 4) + "/" + Left(txtDtInicial1.Text, 2)
        Dim dtfim As String = Right(txtDtFinal1.Text, 4) + "/" + Left(txtDtFinal1.Text, 2)
        Dim linha As String = Left(txtLinha.Text, 2) + " " + Mid(txtLinha.Text, 3, 4) + " " + Right(txtLinha.Text, 4)
        'Dim pLinha_c As String
        'Dim teste As String


        'teste = DropDownList1.SelectedValue
        ReportViewer3.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote

        ReportViewer3.ServerReport.ReportServerUrl = New Uri("http://banco01/reportserver")
        ReportViewer3.ServerReport.ReportPath = "/Report_SisPonto/TelefoniaCelular_func_adm"

        Dim params(2) As Microsoft.Reporting.WebForms.ReportParameter

        'Dim p As Microsoft.Reporting.WebForms.ReportParameter
        'p = New Microsoft.Reporting.WebForms.ReportParameter("Lotac", teste)

        Dim pDtInicial As Microsoft.Reporting.WebForms.ReportParameter
        pDtInicial = New Microsoft.Reporting.WebForms.ReportParameter("dt_inicial", dtini)
        'pDtInicial = New Microsoft.Reporting.WebForms.ReportParameter("dt_inicial", dtInicial)

        Dim pDtFinal As Microsoft.Reporting.WebForms.ReportParameter
        pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", dtfim)
        'pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", dtFinal)
        If Not Len(RTrim(LTrim((linha)))) <> 0 Then
            linha = ""
        End If


        Dim pLinha As Microsoft.Reporting.WebForms.ReportParameter
        pLinha = New Microsoft.Reporting.WebForms.ReportParameter("linha", linha)
        'pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", dtFinal)


        'params(0) = p
        params(0) = pDtInicial
        params(1) = pDtFinal
        params(2) = pLinha


        ReportViewer3.ServerReport.SetParameters(params)
        ReportViewer3.ServerReport.Refresh()
    End Sub
End Class
