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

    'OBJETIVO: Obter o c�digo da subunidade � qual um colaborador est� ligado
    'RECEBE: C�digo de usu�rio (integer)
    'RETORNA: C�digo da Subunidade (integer)
    'AUTOR: Andr� Campos
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



    'OBJETIVO: Verificar se um usu�rio � gerente de plataforma
    'RECEBE: C�digo de usu�rio (integer)
    'RETORNA: Usu�rio � gerente (TRUE), ou usu�rio n�o � gerente(FALSE)
    'AUTOR: Andr� Campos
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

    'OBJETIVO: Verificar se um usu�rio � gerente de plataforma
    'RECEBE: C�digo de usu�rio (integer)
    'RETORNA: Usu�rio � gerente (TRUE), ou usu�rio n�o � gerente(FALSE)
    'AUTOR: Andr� Campos
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



    'OBJETIVO: Verificar se um usu�rio est� cadastrado ou n�o
    'RECEBE: Nome de usu�rio (string)
    'RETORNA: Usu�rio est� cadastrado (TRUE), ou usu�rio n�o est� cadastrado (FALSE)
    'AUTOR: Andr� Campos
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

    'OBJETIVO: Obter o c�digo de um usu�rio
    'RECEBE: Nome de usu�rio (string)
    'DEVOLVE: C�digo do usu�rio (string)
    'AUTOR: Andr� Campos
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

    'OBJETIVO: Obter o c�digo do grupo de pesquisa
    'RECEBE: Nome de usu�rio do Coordenador do Grupo de Pesquisa (string)
    'DEVOLVE: C�digo do grupo de pesquisa (string)
    'AUTOR: Andr� Campos
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

    'OBJETIVO: Obter c�digo do coordenador do grupo de pesquisa
    'RECEBE: C�digo do grupo de pesquisa (integer)
    'DEVOLVE: C�digo do Coordenador do Grupo (integer)
    'AUTOR: Andr� Campos
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



    'OBJETIVO: Obter c�digo do �ltimo colaborador inclu�do
    'RECEBE: -
    'DEVOLVE: C�digo c�digo do �ltimo colaborador inclu�do(integer)
    'AUTOR: Andr� Campos
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
