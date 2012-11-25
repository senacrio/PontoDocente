Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class Vagas

    Public Registro As New Collection

    'OBJETIVO: Encerrar a instancia da classe, limpando a memória
    'RECEBE: -
    'RETORNA: -
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Sub Close()
    End Sub


    'OBJETIVO: Pegar um registro de dados no banco CLICK OPORTUNIDADES.
    'RECEBE: Identificador da vaga
    'RETORNA: -
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Sub PegaRegistro(ByVal idVaga As Integer)

        Registro.Clear()

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT * from tblVaga where id_vaga=" & idVaga
        Dim oCmd As New SqlCommand(sSql, oCon)
        Dim bRet As Boolean = True
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        If oReader.HasRows Then

            'Lê o registro e carrega todos os campos em um collection de retorno
            oReader.Read()
            Dim n As Integer
            For n = 0 To oReader.FieldCount - 1
                Registro.Add(oReader(n), oReader.GetName(n))
            Next

        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

    End Sub



    'OBJETIVO: Incluir CNPJ
    'RECEBE: CNPJ, Senha
    'RETORNA: -
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function Inclui(ByVal nIDEmpresa As Integer) As Integer

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "INSERT INTO tblVaga(id_empresa_fk,domingo, segunda, terca, quarta, quinta, sexta, sabado, vale_transporte, vale_refeicao, vale_alimentacao, plano_saude, refeicao_local, id_cargo_fk,modalidade,id_localtrabalho_fk,id_faixaetaria_fk,sexo,estado_civil,id_escolaridade_fk) values(" + nIDEmpresa.ToString + ",0,0,0,0,0,0,0,0,0,0,0,0,'00000','E',0,0,'F','S',0); SELECT CAST(scope_identity() AS int);"
        Dim oCmd As New SqlCommand(sSql, oCon)
        Dim nRet As Integer

        oCmd.Connection.Open()
        nRet = oCmd.ExecuteScalar()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet

    End Function

    Public Function Vaga(ByVal idVaga As Integer) As Integer

       ' Registro.Clear()

        'Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        'Dim sSql As String = "SELECT * from tblVaga where id_vaga=" & idVaga
        'Dim oCmd As New SqlCommand(sSql, oCon)
        'Dim nRet As Integer

        'oCmd.Connection.Open()
        'nRet = oCmd.ExecuteScalar()
        'oCmd.Dispose()
        'oCon.Dispose()

        'Return nRet
		
		 Registro.Clear()

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT * from tblVaga where id_vaga=@id_vaga"
        Dim oCmd As New SqlCommand(sSql, oCon)
        Dim nRet As Integer

        Dim PIdvaga As SqlParameter = New SqlParameter()
        PIdvaga.ParameterName = "id_vaga"
        PIdvaga.Value = idVaga

        oCmd.Parameters.Add(PIdvaga)
        oCmd.Connection.Open()
        nRet = oCmd.ExecuteScalar()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet
		

    End Function

    Public Function PossuiVaga(ByVal sVaga As String) As Integer

        Dim nRet As Integer = 0

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT id_vagacandidato from tblacompanhamentovagacandidato where id_vaga_fk='" + sVaga + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)

        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()
        If oRd.HasRows Then
            oRd.Read()
            nRet = oRd("id_vagacandidato")
        End If


        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet

    End Function


    Public Function PossuiVagaporCandidato(ByVal sVagaCandidato As String) As Integer

        Dim nRet As Integer = 0

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT * from tblacompanhamentovagacandidato where id_vaga_fk='" + sVagaCandidato + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)

        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()
        If oRd.HasRows Then
            oRd.Read()
            nRet = oRd("id_vaga_fk")
        End If


        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet
    End Function
	
	Public Function vagaLog(ByVal sVaga As String) As Integer

        Dim sRet As Integer

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT ativada from tblvaga WHERE  id_vaga='" + sVaga + "'"
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()

            If IsDBNull(reader("ativada")) Then
                sRet = 0
            Else
                If reader("ativada") = True Then
                    sRet = 2
                Else
                    sRet = 1
                End If
            End If

        End If



        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return sRet
End Function
End Class
