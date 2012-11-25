
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
  Private Function VerificaInterino(ByVal sMatricula As String) As Boolean
        Dim b As Boolean = False

        Dim sSql As String = "SELECT * FROM ptnInterino WHERE Matricula=@Matricula"
        Dim oCmd As SqlCommand = New SqlCommand(sSql, conn)
        conn.Open()

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "Matricula"
        PMatricula.Value = sMatricula

        oCmd.Parameters.Add(PMatricula)

        Dim reader As SqlDataReader = oCmd.ExecuteReader()

        If reader.HasRows Then
            b = True
            reader.Read()
            Session("sLotacao") = reader("Lotacao")
        Else
            b = False
        End If

        conn.Close()
        oCmd.Dispose()
        reader.Close()

        Return b


    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConsulta.Click
        ReportViewer1.Visible = True


        Dim dtInicial As DateTime = txtDtInicial.Text
        Dim dtFinal As DateTime = txtDtFinal.Text


        Dim teste As String
        teste = DropDownList1.SelectedValue
        ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote

        ReportViewer1.ServerReport.ReportServerUrl = New Uri("http://banco01/reportserver")
        ReportViewer1.ServerReport.ReportPath = "/Report_SisPonto/MarcacaoGerente3"

        Dim params(2) As Microsoft.Reporting.WebForms.ReportParameter

        Dim p As Microsoft.Reporting.WebForms.ReportParameter
        p = New Microsoft.Reporting.WebForms.ReportParameter("lotac", teste)

        Dim pDtInicial As Microsoft.Reporting.WebForms.ReportParameter
        pDtInicial = New Microsoft.Reporting.WebForms.ReportParameter("dt_inicial", Format(dtInicial, "yyyy-MM-dd"))
        'pDtInicial = New Microsoft.Reporting.WebForms.ReportParameter("dt_inicial", dtInicial)

        Dim pDtFinal As Microsoft.Reporting.WebForms.ReportParameter
        pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", Format(dtFinal, "yyyy-MM-dd"))
        'pDtFinal = New Microsoft.Reporting.WebForms.ReportParameter("dt_final", dtFinal)





        params(0) = p
        params(1) = pDtInicial
        params(2) = pDtFinal


        ReportViewer1.ServerReport.SetParameters(params)

        ReportViewer1.ServerReport.Refresh()





    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim func As Funcionario = New Funcionario()
        'Session("c_Matricula") = "8123"

        Dim cargo As String = Left(func.Posicao(Session("c_Matricula")), 3)

        If VerificaInterino(Session("c_Matricula")) Then
            
            Session("c_lotac") = PegaUnidadeLotacao(Session("c_Matricula"))

        ElseIf cargo = "GER" Or cargo = "COO" Or cargo = "SUP" Then
            Session("c_lotac") = PegaUnidadeLotacao(Session("c_Matricula"))
        Else
            Response.Redirect("Erro.aspx")

        End If



    End Sub
End Class
