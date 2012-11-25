Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class Estudantes

    Public RegistroSGA As New Collection
    Public RegistroCLICK As New Collection


    'OBJETIVO: Encerrar a instancia da classe, limpando a memória
    'RECEBE: -
    'RETORNA: -
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Sub Close()
        RegistroSGA.Clear()
        RegistroCLICK.Clear()
    End Sub

    Public Function PegaID(ByVal sIdentificador As String) As Integer

        Dim nRet As Integer

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT id_candidato from tblCandidato where identificador='" + sIdentificador + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        If oReader.HasRows Then
            oReader.Read()
            nRet = oReader("id_candidato")
        Else
            nRet = -1
        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet

    End Function
    'OBJETIVO: Incluir todos os cursos de um determinado estudante
    'RECEBE: Identificador do estudante
    'RETORNA: -
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Sub IncluiCursos(ByVal sIdentificador As String)

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        'Dim sSql As String = "SELECT * from viewSGA_Cliente_Ofertas where identificador='" + sIdentificador + "'"
        Dim sSql As String = "select * from fcClick_ClienteOfertas('" + sIdentificador + "')"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        While oReader.Read()

            Dim oPar1, oPar2, oPar3, oPar4, oPar5 As New SqlParameter


            Dim sSql2 As String = "Insert into tblCandidatoCursosSenac(id_candidato_fk, id_oferta_fk, id_unidade_fk, conclusao, id_nivel) values (@id_candidato_fk, @id_oferta, @id_unidade, @conclusao, @nivel_codigo)"
            Dim oCon2 As SqlConnection = New SqlConnection(Dados.StringConexao())

            Dim oCmd2 As New SqlCommand(sSql2, oCon2)

            oPar1.ParameterName = "id_candidato_fk"
            oPar1.Value = PegaID(sIdentificador)
            oCmd2.Parameters.Add(oPar1)

            oPar2.ParameterName = "id_oferta"
            oPar2.Value = Trim(oReader("id_oferta"))
            oCmd2.Parameters.Add(oPar2)

            oPar3.ParameterName = "id_unidade"
            oPar3.Value = oReader("id_unidade")
            oCmd2.Parameters.Add(oPar3)

            oPar4.ParameterName = "conclusao"
            oPar4.Value = oReader("conclusao")
            oPar4.DbType = DbType.Date
            oCmd2.Parameters.Add(oPar4)

            oPar5.ParameterName = "nivel_codigo"
            oPar5.Value = oReader("nivel_codigo")
            oCmd2.Parameters.Add(oPar5)

            oCmd2.Connection.Open()
            oCmd2.ExecuteNonQuery()

            oCmd2.Dispose()
            oCon2.Dispose()

        End While

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

    End Sub


    'OBJETIVO: Verificar se um estudante está habilitado ou não
    'RECEBE: Identificador do estudante
    'RETORNA: True: Habilitado - False: Não habilitado
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function Habilitado(ByVal sIdentificador As String) As Boolean

        Dim bRet As Boolean
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        'Dim sSql As String = "SELECT identificador from viewSGA_clientes where identificador='" + sIdentificador + "'"
        Dim sSql As String = "select * from fcClick_Cliente('" + sIdentificador + "')"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim reader As SqlDataReader = oCmd.ExecuteReader()

        If reader.HasRows Then
            bRet = True
        Else
            bRet = False
        End If

        reader.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return bRet

    End Function

    'OBJETIVO: Verificar se o estudante já está cadastrado.
    'RECEBE: Identificador do estudante
    'RETORNA: True: Cadastrado - False: Não cadastrado
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function Cadastrado(ByVal sIdentificador As String) As Boolean

        Dim bRet As Boolean
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT identificador from tblCandidato where identificador='" + sIdentificador + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        If oReader.HasRows Then
            bRet = True
        Else
            bRet = False
        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return bRet

    End Function

    'OBJETIVO: Pegar um registro de dados no SGA.Só trás alunos habilitados.
    'RECEBE: Identificador do estudante
    'RETORNA: True - Leu o registro, ou False - Não leu o registro
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function PegaRegistroSGA(ByVal sIdentificador As String) As Boolean

        RegistroSGA.Clear()

        'Dim oCon As SqlConnection = New SqlConnection(Dados.scSGA())
        'Dim sSql As String = "SELECT * from viewclick_clientes where identificador='" + sIdentificador + "'"
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "select * from fcClick_Cliente('" + sIdentificador + "')"
        Dim oCmd As New SqlCommand(sSql, oCon)
        Dim bRet As Boolean = True
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        If oReader.HasRows Then

            'Lê o registro e carrega todos os campos em um collection de retorno
            oReader.Read()
            Dim n As Integer
            For n = 0 To oReader.FieldCount - 1
                If IsDBNull(oReader(n)) Then
                    RegistroSGA.Add("", oReader.GetName(n))
                Else
                    RegistroSGA.Add(oReader(n), oReader.GetName(n))
                End If
            Next

        Else
            'Se não encontrou retorna nothing
            bRet = False
        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return bRet

    End Function

    'OBJETIVO: Pegar um registro de dados no banco CLICK OPORTUNIDADES.
    'RECEBE: Identificador do estudante
    'RETORNA: True - Leu o registro, ou False - Não leu o registro
    'AUTOR: André Campos
    'EM: Junho/2008
    Public Function PegaRegistroCLICK(ByVal sIdentificador As String) As Boolean

        RegistroCLICK.Clear()

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT * from tblCandidato where identificador='" + sIdentificador + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        Dim bRet As Boolean = True
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        If oReader.HasRows Then

            'Lê o registro e carrega todos os campos em um collection de retorno
            oReader.Read()
            Dim n As Integer
            For n = 0 To oReader.FieldCount - 1
                RegistroCLICK.Add(oReader(n), oReader.GetName(n))
            Next

        Else
            'Se não encontrou retorna nothing
            bRet = False
        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return bRet

    End Function

    Public Function SalvaLog(ByVal sIdentificador As String) As Integer

        Dim nRet As Integer = 0

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT * from tblCandidato where identificador='" + sIdentificador + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            nRet = oRd("id_candidato")
        End If

        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return nRet

    End Function

End Class
