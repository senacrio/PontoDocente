Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class Empresas

    Public Registro As New Collection

    'OBJETIVO: Encerrar a instancia da classe, limpando a memória
    'RECEBE: -
    'RETORNA: -
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Sub Close()
    End Sub


    'OBJETIVO: Pegar um registro de dados no banco CLICK OPORTUNIDADES.
    'RECEBE: Identificador do estudante
    'RETORNA: True - Leu o registro, ou False - Não leu o registro
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Sub PegaRegistro(ByVal sCNPJ As String)

        Registro.Clear()

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT * from tblEmpresa where cnpj='" + sCNPJ + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        Dim bRet As Boolean = True
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        If oReader.HasRows Then

            'Lê o registro e carrega todos os campos em um collection de retorno
            oReader.Read()
            Dim n As Integer
            For n = 0 To oReader.FieldCount - 1
                If oReader.GetName(n) = "aprovado" Or oReader.GetName(n) = "cancelamento" Then
                    If IsDBNull(oReader(n)) Then
                        Registro.Add(False, oReader.GetName(n))
                    Else
                        Registro.Add(oReader(n), oReader.GetName(n))
                    End If
                Else
                    Registro.Add(oReader(n), oReader.GetName(n))
                End If


            Next

        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()
       
    End Sub

    'OBJETIVO: Verificar se empresa está cadastrada e se a senha está correta
    'RECEBE: CNPJ
    'RETORNA: True: Ok - False: Negado
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function Logon(ByVal sCNPJ As String, ByVal sSenha As String) As Boolean

        Dim bRet As Boolean = False

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT cnpj, senha from tblEmpresa where cnpj='" + sCNPJ + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            If oRd("senha") = Cripto.crplost(sSenha) Then
                bRet = True
            End If
        End If

        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return bRet

    End Function


    'OBJETIVO: Pega o ID da empresa
    'RECEBE: CNPJ
    'RETORNA: True: Ok - False: Negado
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function ID(ByVal sCNPJ As String) As Integer

        Dim nRet As Integer = 0

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT id_empresa from tblEmpresa where cnpj='" + sCNPJ + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            nRet = oRd("id_empresa")
        End If

        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet

    End Function

    'OBJETIVO: Verificar se empresa está cadastrada
    'RECEBE: CNPJ
    'RETORNA: True: Ok - False: Negado
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function Existe(ByVal sCNPJ As String) As Boolean

        Dim bRet As Boolean = False

        If sCNPJ Is Nothing Or IsDBNull(sCNPJ) Then
            sCNPJ = "-------------------------------"
        End If

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT cnpj from tblEmpresa where cnpj='" + sCNPJ + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            bRet = True
        End If

        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return bRet

    End Function


    'OBJETIVO: Incluir CNPJ
    'RECEBE: CNPJ, Senha
    'RETORNA: -
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Sub IncluiCNPJ(ByVal sCNPJ As String, ByVal sSenha As String)

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "INSERT INTO tblEmpresa(cnpj, senha, id_municipio, id_porte_fk, id_segmento_fk, id_atividade_fk, id_descobriu_fk, id_sindicato_fk, estado, cancelamento) values('" + sCNPJ + "','" + Cripto.crplost(sSenha) + "',1,1,1,1,1,1,'RJ', 'False')"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()
        oCmd.ExecuteNonQuery()
        oCmd.Dispose()
        oCon.Dispose()

    End Sub
	
	Public Function PossuiRepresentante(ByVal sRepresentante As String) As Integer

        Dim nRet As Integer = 0

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT id_representante from tblEmpresaRepresentantes where id_empresa_fk='" + sRepresentante + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)

        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()
        If oRd.HasRows Then
            oRd.Read()
            nRet = oRd("id_representante")
        End If


        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet

    End Function

    Public Function PossuiRepresentanteEmail(ByVal sRepresentanteEmail As String) As String

        Dim sRet As String

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT emailrep from tblEmpresaRepresentantes where id_empresa_fk='" + sRepresentanteEmail + "'"
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            sRet = reader("emailrep")
        Else
            sRet = ""
        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return sRet


    End Function

    Public Function Cancelamento(ByVal sCNPJ As String) As Boolean

        Dim sRet As Boolean

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT cancelamento from tblempresa WHERE  cnpj='" + sCNPJ + "'"
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            sRet = reader("cancelamento")
        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return sRet

    End Function

    Public Function AdmCancelamento(ByVal sCancelamento As String) As Boolean

        Dim sRet As Boolean

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT cancelamento from tblempresa WHERE  cancelamento='True'"
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            sRet = reader("cancelamento")
        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return sRet

    End Function

    Public Function AprovaEmpresa(ByVal sAprovaEmpresa As String) As Integer

        Dim sRet As Integer

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT aprovado from tblempresa WHERE  id_empresa='" + sAprovaEmpresa + "'"
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()

            If IsDBNull(reader("aprovado")) Then
                sRet = 0
            Else
                If reader("aprovado") = True Then
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
