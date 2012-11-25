Imports Microsoft.VisualBasic
Imports system.Data.Sqlclient
Imports System.Web.HttpContext

Public Class Usuario

    Shared Function UsuarioLogado() As String
        Return Current.Session("usuario")
    End Function

    Shared Sub VisitaLOG(ByVal cIP As String, ByVal cPath As String)


        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "INSERT INTO LOG (origem, path) VALUES('" & cIP & "' ,'" & cPath & "' )"

        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        cmd.ExecuteNonQuery()

        cmd.Dispose()
        conn.Dispose()

    End Sub

    'OBJETIVO: Obter o código da subunidade à qual um colaborador está ligado
    'RECEBE: Código de usuário (integer)
    'RETORNA: Código da Subunidade (integer)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function SubunidadeCodigo(ByVal nCodigoUsuario As Integer) As String
        Dim sRet As String
        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT id_subunidade_fk from SubunidadeColaboradores where id_colaborador_fk=" + Str(nCodigoUsuario)
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            sRet = reader("id_subunidade_fk")
        Else
            sRet = ""
        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return sRet

    End Function



    'OBJETIVO: Verificar se um usuário é gerente de plataforma
    'RECEBE: Código de usuário (integer)
    'RETORNA: Usuário é gerente (TRUE), ou usuário não é gerente(FALSE)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function SubunidadeGerente(ByVal nCodigo As Integer) As Boolean
        Dim bRet As Boolean

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT * from SubunidadeColaboradores where id_relacao_fk=3 and id_colaborador_fk=" + Str(nCodigo)
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            bRet = True
        Else
            bRet = False
        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return bRet

    End Function

    'OBJETIVO: Verificar se um usuário é gerente de plataforma
    'RECEBE: Código de usuário (integer)
    'RETORNA: Usuário é gerente (TRUE), ou usuário não é gerente(FALSE)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function SubunidadeRT(ByVal nCodigo As Integer) As Boolean
        Dim bRet As Boolean

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT * from SubunidadeColaboradores where id_relacao_fk=2 and id_colaborador_fk=" + Str(nCodigo)
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            bRet = True
        Else
            bRet = False
        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return bRet

    End Function



    'OBJETIVO: Verificar se um usuário está cadastrado ou não
    'RECEBE: Nome de usuário (string)
    'RETORNA: Usuário está cadastrado (TRUE), ou usuário não está cadastrado (FALSE)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function UsuarioCadastrado(ByVal sUsuario As String) As Boolean

        Dim bRet As Boolean

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSqlColaborador As String = "SELECT * from colaboradores where usuario='" + sUsuario + "'"
        Dim cmdColaborador As New SqlCommand(cSqlColaborador, conn)
        cmdColaborador.Connection.Open()

        Dim readerColaborador As SqlDataReader = cmdColaborador.ExecuteReader()

        If readerColaborador.HasRows Then
            bRet = True
        Else
            bRet = False
        End If

        readerColaborador.Close()
        cmdColaborador.Dispose()
        conn.Dispose()

        Return bRet

    End Function

    'OBJETIVO: Obter o código de um usuário
    'RECEBE: Nome de usuário (string)
    'DEVOLVE: Código do usuário (string)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function UsuarioCodigo(ByVal sUsuario As String) As String

        Dim sRet As String

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSqlColaborador As String = "SELECT * from colaboradores where usuario='" + sUsuario + "'"
        Dim cmdColaborador As New SqlCommand(cSqlColaborador, conn)
        cmdColaborador.Connection.Open()

        Dim readerColaborador As SqlDataReader = cmdColaborador.ExecuteReader()

        If readerColaborador.HasRows Then
            readerColaborador.Read()
            sRet = readerColaborador("id_colaborador").ToString
        Else
            sRet = ""
        End If

        readerColaborador.Close()
        cmdColaborador.Dispose()
        conn.Dispose()

        Return sRet

    End Function

    'OBJETIVO: Obter o código do grupo de pesquisa
    'RECEBE: Nome de usuário do Coordenador do Grupo de Pesquisa (string)
    'DEVOLVE: Código do grupo de pesquisa (string)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function GrupoPesquisaCodigo(ByVal sUsuario As String) As String

        Dim sRet As String

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSqlColaborador As String = "SELECT b.id_grupopesquisa FROM colaboradores a inner join GrupoPesquisaColaboradores b ON a.id_colaborador=b.id_colaborador WHERE a.usuario='" + sUsuario + "'"
        Dim cmdColaborador As New SqlCommand(cSqlColaborador, conn)
        cmdColaborador.Connection.Open()

        Dim readerColaborador As SqlDataReader = cmdColaborador.ExecuteReader()

        If readerColaborador.HasRows Then
            readerColaborador.Read()
            sRet = readerColaborador("id_grupopesquisa").ToString
        Else
            sRet = ""
        End If

        readerColaborador.Close()
        cmdColaborador.Dispose()
        conn.Dispose()

        Return sRet

    End Function

    'OBJETIVO: Obter código do coordenador do grupo de pesquisa
    'RECEBE: Código do grupo de pesquisa (integer)
    'DEVOLVE: Código do Coordenador do Grupo (integer)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function GrupoPesquisaCoordenadorCodigo(ByVal nGrupoPesquisa As Integer) As Integer

        Dim nRet As Integer

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSqlColaborador As String = "SELECT id_colaborador from GrupoPesquisaColaboradores WHERE id_relacao_fk=4 and id_grupopesquisa=" + Str(nGrupoPesquisa)
        Dim cmdColaborador As New SqlCommand(cSqlColaborador, conn)
        cmdColaborador.Connection.Open()

        Dim readerColaborador As SqlDataReader = cmdColaborador.ExecuteReader()

        If readerColaborador.HasRows Then
            readerColaborador.Read()
            nRet = readerColaborador("id_colaborador")
        End If

        readerColaborador.Close()
        cmdColaborador.Dispose()
        conn.Dispose()

        Return nRet

    End Function



    'OBJETIVO: Obter código do último colaborador incluído
    'RECEBE: -
    'DEVOLVE: Código código do último colaborador incluído(integer)
    'AUTOR: André Campos
    'EM: Agosto/2007
    Shared Function ColaboradorUltimo() As Integer

        Dim nRet As Integer

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSqlColaborador As String = "SELECT top 1 id_colaborador from colaboradores order by id_colaborador desc"
        Dim cmdColaborador As New SqlCommand(cSqlColaborador, conn)
        cmdColaborador.Connection.Open()

        Dim readerColaborador As SqlDataReader = cmdColaborador.ExecuteReader()

        If readerColaborador.HasRows Then
            readerColaborador.Read()
            nRet = readerColaborador("id_colaborador")
        End If

        readerColaborador.Close()
        cmdColaborador.Dispose()
        conn.Dispose()

        Return nRet

    End Function

End Class
