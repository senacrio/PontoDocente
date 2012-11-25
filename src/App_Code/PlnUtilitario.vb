Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class PlnUtilitario
    Shared Sub IncluiPerpetuidade(ByVal id_Projeto As Integer, ByVal id_empresa As Integer, ByVal mes As Integer, ByVal flag As Integer, ByVal descricao As String, ByVal valor As Decimal)

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacSConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO plnReceitasDespesasTemp(id_Projeto, Mes, flagDespesaReceita, valorDespesaReceita, Descricao, Id_Empresa) VALUES (@id_projeto,  @mes, @flag, @valordespesa, @descricao, @id_Empresa)", conn)

        Dim PId_Projeto, PId_Empresa, PMes, PValor, PDescricao, PFlag As New SqlParameter()

        PId_Projeto.ParameterName = "id_Projeto"
        PId_Projeto.Value = id_Projeto

        PId_Empresa.ParameterName = "id_empresa"
        PId_Empresa.Value = id_empresa

        PFlag.ParameterName = "flag"
        PFlag.Value = flag

        PMes.ParameterName = "Mes"
        PMes.Value = mes

        PValor.ParameterName = "valordespesa"
        PValor.Value = valor

        PDescricao.ParameterName = "descricao"
        'PDescricao.Value = descricao + ". Perpetuidade Aplicada."

        cmd.Parameters.Add(PId_Empresa)
        cmd.Parameters.Add(PId_Projeto)
        cmd.Parameters.Add(PDescricao)
        cmd.Parameters.Add(PMes)
        cmd.Parameters.Add(PValor)
        cmd.Parameters.Add(PFlag)

        conn.Open()
        cmd.ExecuteNonQuery()
        conn.Dispose()
        cmd.Dispose()
    End Sub

    Shared Function Calculado(ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As Boolean
        Dim b As Boolean = False
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)
        Dim cSql As String = "SELECT case when tir is null then 'False' else 'True' end as calculado FROM dbo.plnAnaliseProjeto where id_Projeto=" + id_projeto.ToString + " and id_empresa=" + id_empresa.ToString
        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            b = Boolean.Parse(reader(0).ToString)
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return b
    End Function
End Class
