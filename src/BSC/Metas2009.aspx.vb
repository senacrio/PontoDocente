
Partial Class Ponto_Relatorios_Relatorio
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
    Public Function PegaUnidadeNegocio(ByVal sMatricula As String) As Integer
        Dim i As Integer

        Dim sSql As String = "SELECT Cod_unid_negoc FROM [STG_RHFuncionarioUnidNeg] where cdn_funcionario = '" + sMatricula + "'"
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            i = oRd("Cod_unid_negoc")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return i

    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            'Session("c_Matricula") = "8123"
            Session("c_UnidNeg") = PegaUnidadeNegocio(Session("c_Matricula"))

            Dim _UnidadeNegoc As String = Session("c_UnidNeg")

            
            ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote
            ReportViewer1.ServerReport.ReportServerUrl = New Uri("http://banco01/reportserver")
            ReportViewer1.ServerReport.ReportPath = "/Metas/Meta_reducao2009v2"

            Dim params(0) As Microsoft.Reporting.WebForms.ReportParameter

            Dim pUnidNeg As Microsoft.Reporting.WebForms.ReportParameter
            pUnidNeg = New Microsoft.Reporting.WebForms.ReportParameter("unidade", _UnidadeNegoc)

            params(0) = pUnidNeg
            ReportViewer1.ServerReport.SetParameters(params)
            ReportViewer1.ServerReport.Refresh()
        End If



        Dim func As Funcionario = New Funcionario()

    End Sub

End Class
