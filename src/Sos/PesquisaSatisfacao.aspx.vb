
Partial Class Sos_PesquisaSatisfacao
    Inherits System.Web.UI.Page

    Private Function retornaDescricao(ByVal IDChamado As Integer) As String
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim s As String = ""

        Dim cmd As SqlCommand = New SqlCommand("select descricao from sosChamado where idchamado=@idchamado", conn)

        Dim PIDChamado As SqlParameter = New SqlParameter
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        cmd.Parameters.Add(PIDChamado)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        If reader.HasRows Then
            s = reader("descricao").ToString
        End If

        conn.Close()
        cmd.Dispose()
        reader.Close()


        Return s


    End Function


    Private Function IncluirAcompanhamento(ByVal Historico As String, ByVal IDChamado As Integer, ByVal IDStatus As Integer) As Boolean
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)

        Dim PHistorico As SqlParameter = New SqlParameter()
        PHistorico.ParameterName = "Historico"
        PHistorico.Value = Historico


        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        Dim PIDStatus As SqlParameter = New SqlParameter()
        PIDStatus.ParameterName = "IDStatus"
        PIDStatus.Value = IDStatus

        Dim cmd As SqlCommand = New SqlCommand("insert into sosAcompanhamento(Historico,IDRegistrador,IDTecnico,DataHoraRegistro,IDChamado,IDStatus) values (@Historico,1,1,getdate(),@IDChamado,@IDStatus)", conn)


        cmd.Parameters.Add(PHistorico)
        cmd.Parameters.Add(PIDChamado)
        cmd.Parameters.Add(PIDStatus)

        conn.Open()
        Try
            cmd.ExecuteNonQuery()
            conn.Close()
            Return True
        Catch ex As Exception

            Response.Write(ex.Message.ToString())
            conn.Close()
            Return False
        End Try


        cmd.Dispose()
    End Function


    Private Sub MudarStatus(ByVal IDChamado As Integer)
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)

        Dim cmd As SqlCommand = New SqlCommand("update sosChamado set IDStatus=4,DataHoraFechamentoUsuario=getdate() where idchamado=@IDChamado", conn)

        Dim PIDchamado As SqlParameter = New SqlParameter()
        PIDchamado.ParameterName = "IDChamado"
        PIDchamado.Value = IDChamado

        cmd.Parameters.Add(PIDchamado)


        conn.Open()

        cmd.ExecuteNonQuery()

        cmd.Dispose()
        conn.Dispose()



    End Sub


    Private Function IncluirPesquisa(ByVal Resolvido As String, ByVal Satisfacao As String, ByVal Justificativa As String, ByVal IDChamado As Integer) As Boolean
        Dim b As Boolean = False
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)

        Dim cmd As SqlCommand = New SqlCommand("insert into sosPesquisa(Resolvido,IDSatisfacao,Justificativa,IDChamado) values(@Resolvido,@Satisfacao,@Just,@IDChamado)", conn)

        Dim PResolvido As SqlParameter = New SqlParameter()
        PResolvido.ParameterName = "Resolvido"

        PResolvido.Value = Resolvido

        Dim PSatisfacao As SqlParameter = New SqlParameter()
        PSatisfacao.ParameterName = "Satisfacao"

        PSatisfacao.Value = Satisfacao

        Dim PJustificativa As SqlParameter = New SqlParameter()
        PJustificativa.ParameterName = "Just"
        PJustificativa.Value = Justificativa

        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        cmd.Parameters.Add(PResolvido)
        cmd.Parameters.Add(PSatisfacao)
        cmd.Parameters.Add(PJustificativa)
        cmd.Parameters.Add(PIDChamado)



        conn.Open()

        Try
            cmd.ExecuteNonQuery()
            MudarStatus(IDChamado)
            IncluirAcompanhamento("Chamado finalizado pelo usuario. Resolvido: " + Resolvido + " Satisfação: " + Satisfacao + " Justificativa: " + Justificativa, IDChamado, 4)
            b = True

        Catch ex As Exception
            b = False


        End Try

        cmd.Dispose()
        conn.Dispose()
        Return b



    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCodigo.Text = Request.QueryString("id")
        lblDescricao.Text = retornaDescricao(Request.QueryString("id"))

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        

        If (rdSatisfacao.SelectedValue = "2" Or rdSatisfacao.SelectedValue = "1" Or rdAtendido.SelectedValue = "nao") And txtJustificativa.Text = "" Then
            lblerro.Text = "Justificativa obrigatória."


        Else
            If rdAtendido.SelectedValue = "nao" Then
                If IncluirPesquisa(rdAtendido.SelectedValue, "", txtJustificativa.Text, lblCodigo.Text) Then
                    pnlPesquisa.Visible = False
                    Response.Write("Pesquisa respondida com sucesso.")
                End If
            End If
            If IncluirPesquisa(rdAtendido.SelectedValue, rdSatisfacao.SelectedValue, txtJustificativa.Text, lblCodigo.Text) Then
                pnlPesquisa.Visible = False
                Response.Write("Pesquisa respondida com sucesso.")
            End If

        End If

    End Sub

    Protected Sub rdAtendido_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdAtendido.SelectedIndexChanged
       
    End Sub
End Class
