Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections.Generic
Imports System.ComponentModel

Public Class Colaborador

    Private _Nome As String
    Private _Matricula As Integer
    Private _Cod_Estab As String
    Private _Nom_Estab As String
    Private _Cod_Lotac As String
    Private _Nom_Lotac As String
    Private _CentroCusto As String



    Public Property Nome() As String
        Get
            Return _Nome
        End Get
        Set(ByVal value As String)
            _Nome = value
        End Set
    End Property

    Public Property Matricula() As Integer
        Get
            Return _Matricula
        End Get
        Set(ByVal value As Integer)
            _Matricula = value
        End Set
    End Property

    Public ReadOnly Property Cod_Estab() As String
        Get
            Return _Cod_Estab
        End Get

    End Property
    Public ReadOnly Property CentroCusto() As String
        Get
            Return _CentroCusto
        End Get

    End Property


    Public ReadOnly Property Nom_Estab() As String
        Get
            Return _Nom_Estab
        End Get

    End Property
    Public ReadOnly Property Cod_Lotac() As String
        Get
            Return _Cod_Lotac
        End Get

    End Property

    Public ReadOnly Property Nom_Lotac() As String
        Get
            Return _Nom_Lotac
        End Get

    End Property

    Public Sub Buscar()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT     SGT_RHFuncionarioAtivo.cdn_funcionario,SGT_RHFuncionarioAtivo.cod_rh_ccusto ,SGT_RHFuncionarioAtivo.nom_pessoa_fisic, STG_RHUnidadeLotacao.cod_unid_lotac, STG_RHUnidadeLotacao.des_unid_lotac, View_Estabelecimento.cod_estab, View_Estabelecimento.nom_pessoa AS nom_estab fROM         SGT_RHFuncionarioAtivo INNER JOIN STG_RHUnidadeLotacao ON SGT_RHFuncionarioAtivo.cod_unid_lotac = STG_RHUnidadeLotacao.cod_unid_lotac INNER JOIN View_Estabelecimento ON SGT_RHFuncionarioAtivo.cdn_estab = View_Estabelecimento.cod_estab WHERE cdn_funcionario=(CASE WHEN @cdn_funcionario='' THEN cdn_funcionario ELSE @cdn_funcionario END) AND nom_pessoa_fisic LIKE (CASE WHEN @nom_pessoa_fisic='' THEN '%' ELSE @nom_pessoa_fisic + '%' end)    ORDER BY nom_pessoa_fisic ", conn)

        Dim PCdn_Funcionario As SqlParameter = New SqlParameter()
        PCdn_Funcionario.ParameterName = "cdn_funcionario"
        PCdn_Funcionario.Value = _Matricula
        PCdn_Funcionario.DbType = DbType.Int32

        Dim PNom_pessoa_fisic As SqlParameter = New SqlParameter()
        PNom_pessoa_fisic.ParameterName = "nom_pessoa_fisic"
        PNom_pessoa_fisic.Value = _Nome
        PNom_pessoa_fisic.DbType = DbType.String

        cmd.Parameters.Add(PCdn_Funcionario)
        cmd.Parameters.Add(PNom_pessoa_fisic)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            _Matricula = Integer.Parse(reader("cdn_funcionario"))
            _Nome = reader("nom_pessoa_fisic").ToString + ""
            _Cod_Estab = reader("cod_estab").ToString + ""
            _Nom_Estab = reader("nom_estab").ToString + ""
            _Cod_Lotac = reader("cod_unid_lotac").ToString + ""
            _Nom_Lotac = reader("des_unid_lotac").ToString + ""
            _CentroCusto = reader("cod_rh_ccusto").ToString + ""
        Else
            _Matricula = 0
            _Nome = ""
            _Cod_Estab = ""
            _Nom_Estab = ""
            _Cod_Lotac = ""
            _Nom_Lotac = ""
            _CentroCusto = ""
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()
    End Sub

    Public Function Lista() As List(Of Colaborador)
        Dim lst As List(Of Colaborador) = New List(Of Colaborador)
        Dim i As Integer = 0

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT cdn_funcionario,nom_pessoa_fisic FROM dbo.SGT_RHFuncionarioAtivo order by nom_Pessoa_fisic", conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then

            While reader.Read()
                lst.Add(New Colaborador)
                lst(i).Matricula = Integer.Parse(reader("cdn_funcionario"))
                lst(i).Nome = reader("nom_pessoa_fisic").ToString

                i = i + 1
            End While

        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return lst

    End Function
End Class
