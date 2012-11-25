Imports Microsoft.VisualBasic

Public Class Funcionario
    Private _UnidadeLotacao As String
    Private _FuncCSC As New Collection

    Public ReadOnly Property UnidadeNegocio() As String
        Get
            Return _UnidadeLotacao
        End Get
    End Property

    Public Sub Close()
        _UnidadeLotacao = Nothing
    End Sub

    '   Public Sub PegaUnidadeLotacao(ByVal sMatricula As String)
    '
    'Dim oCon As Odbc.OdbcConnection = New Odbc.OdbcConnection(Dados.scDatasulRH())
    'Dim sSql As String = "select func.cod_unid_lotac from pub.funcionario as func where func.cdn_funcionario = '" + sMatricula + "' And func.dat_desligto_func is null"
    '
    'Dim oCmd As New Odbc.OdbcCommand(sSql, oCon)
    '    oCmd.Connection.Open()
    '
    'Dim oReader As Odbc.OdbcDataReader = oCmd.ExecuteReader()
    '
    '    If oReader.HasRows Then
    '        oReader.Read()
    '        _UnidadeLotacao = oReader("cod_unid_lotac").ToString
    '    Else
    '        _UnidadeLotacao = ""
    '    End If
    '
    '    oReader.Close()
    '    oCmd.Dispose()
    '    oCon.Dispose()
    '
    'End Sub

 Public Function Posicao(ByVal sMatricula As String) As String
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
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



    'OBJETIVO: Pega o Centro de Custo (Unidade de Lotação)
    'RECEBE: CNPJ
    'RETORNA: True: Ok - False: Negado
    'AUTOR: André Campos
    'EM: Junho/2008

    Public Sub PegaUnidadeLotacao(ByVal sMatricula As String)

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT cod_unid_lotac  FROM senac.dbo.SGT_RHFuncionario where cdn_funcionario = '" + sMatricula + "' And dat_desligto_func is null"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            _UnidadeLotacao = oRd("cod_unid_lotac")
        End If

        oRd.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return

    End Sub


    Public Sub PegaFuncionarioCSC()

        Dim oCon As Odbc.OdbcConnection = New Odbc.OdbcConnection(Dados.scDatasulRH())
        Dim sSql As String = "select func.cdn_funcionario from dbo.SGT_RHFuncionarioAtivo as func where func.cdn_estab = 70 And func.dat_desligto_func is null"

        Dim oCmd As New Odbc.OdbcCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oReader As Odbc.OdbcDataReader = oCmd.ExecuteReader()
        Dim bRet As Boolean

        If oReader.HasRows Then

            'Lê o registro e carrega todos os campos em um collection de retorno
            oReader.Read()
            Dim n As Integer
            For n = 0 To oReader.FieldCount - 1
                If IsDBNull(oReader(n)) Then
                    _FuncCSC.Add("", oReader.GetName(n))
                Else
                    _FuncCSC.Add(oReader(n), oReader.GetName(n))
                End If
            Next

        Else
            'Se não encontrou retorna nothing
            bRet = False
        End If

        '        If oReader.HasRows Then
        '        oReader.Read()
        '        _FuncCSC = _FuncCSC + "," + oReader("cdn_funcionario").ToString
        '        Else
        '        _FuncCSC = _FuncCSC
        '        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

    End Sub

End Class
