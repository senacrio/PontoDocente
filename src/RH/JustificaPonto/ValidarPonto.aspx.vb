Imports Funcionario
Partial Class Ponto_ValidarPonto
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
    Dim btnSalvar As Button = New Button()
    Dim interino As Boolean = False

    'Verifica se é interino
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

    'Retorna descrição do cargo
    Private Function PegaDesCargo(ByVal sMatricula As String) As String
        Dim s As String = ""

        Dim sSql As String = "SELECT des_cargo FROM dbo.SGT_RHFuncionarioAtivo INNER JOIN View_RHCargo ON dbo.SGT_RHFuncionarioAtivo.cdn_cargo_basic = View_RHCargo.cdn_cargo_basic AND dbo.SGT_RHFuncionarioAtivo.cdn_niv_cargo = View_RHCargo.cdn_niv_cargo WHERE     (dbo.SGT_RHFuncionarioAtivo.cdn_funcionario = @Matricula)"
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()
        Dim PMatricula As SqlParameter = New SqlParameter()

        PMatricula.ParameterName = "matricula"
        PMatricula.Value = sMatricula
        oCmd.Parameters.Add(PMatricula)

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            s = oRd("des_cargo")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return s

    End Function
    'Retorna lotação
    Private Function PegaUnidadeLotacao(ByVal sMatricula As String) As Integer
        Dim i As Integer

        Dim sSql As String = "SELECT cod_unid_lotac  FROM dbo.SGT_RHFuncionarioAtivo where cdn_funcionario = '" + sMatricula + "'"
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
        Dim func As Funcionario = New Funcionario()
        
		If Not Page.IsPostBack Then
            Try
                Utilitario.RegistraLog()
            Catch
            End Try

        End If	
          
        'Session("c_Matricula") = "8123"
        ' "10125"
        '10536
        Dim cargo As String = Left(func.Posicao(Session("c_Matricula")), 3)
        If VerificaInterino(Session("c_Matricula")) Then
            interino = True
            'sdsPontos.SelectParameters("matricula").DefaultValue = 1
            Session("mat") = Session("c_Matricula")
            'grdPonto.DataBind()

        ElseIf cargo = "GER" Or cargo = "COO" Or cargo = "SUP" Then
            Session("sCargo") = Left(PegaDesCargo(Session("c_Matricula")), 3)
            Session("sLotacao") = PegaUnidadeLotacao(Session("c_Matricula"))
            Session("mat") = Session("c_Matricula")

            interino = False
        Else
            Response.Redirect("Erro.aspx")

        End If
    End Sub

   

    Protected Sub btnAplicar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdPonto.RowCommand

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdPonto.SelectedIndexChanged

        


        Dim data As DateTime = grdPonto.DataKeys(grdPonto.SelectedIndex).Values("data")
        Dim entrada As String = grdPonto.DataKeys(grdPonto.SelectedIndex).Values("entrada")
        Dim saida As String = grdPonto.DataKeys(grdPonto.SelectedIndex).Values("saida")
        Dim matricula As Integer = grdPonto.DataKeys(grdPonto.SelectedIndex).Values("Matric")

        Try
            sdsPontos.UpdateParameters("Hora").DefaultValue = entrada
            sdsPontos.UpdateParameters("Data").DefaultValue = Format(data, "yyyy-MM-dd")
            sdsPontos.UpdateParameters("Matric").DefaultValue = matricula
            sdsPontos.Update()

            sdsPontos.UpdateParameters("Hora").DefaultValue = saida
            sdsPontos.UpdateParameters("Data").DefaultValue = Format(data, "yyyy-MM-dd")
            sdsPontos.UpdateParameters("Matric").DefaultValue = matricula
            sdsPontos.Update()
            Try
                sdsLog.InsertParameters("Validador").DefaultValue = Session("c_Matricula")
                sdsLog.InsertParameters("Colaborador").DefaultValue = matricula
                sdsLog.InsertParameters("Entrada").DefaultValue = entrada
                sdsLog.InsertParameters("Saida").DefaultValue = saida
                sdsLog.InsertParameters("DataMarcacao").DefaultValue = Format(data, "yyyy-MM-dd")
                sdsLog.Insert()
            Catch
            End Try

        Catch ex As Exception
            Response.Write(ex.Message.ToString)
        End Try

            grdPonto.SelectedIndex = -1



    End Sub

    Protected Sub grdPonto_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles grdPonto.SelectedIndexChanging

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
     
    End Sub

    Protected Sub sdsPontos_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sdsPontos.Selected
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        grdPonto.DataBind()

    End Sub
End Class
