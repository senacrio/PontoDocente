
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
  

   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       


    End Sub
End Class
