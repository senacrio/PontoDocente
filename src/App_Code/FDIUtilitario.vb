Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class FDIUtilitario

    Shared Sub IncluiPerpetuidade(ByVal id_iniciativa As Integer, ByVal id_empresa As Integer, ByVal mes As Integer, ByVal descricao As String, ByVal valor As Decimal)




        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO fdiReceitasDespesas(id_Iniciativa, Mes, flagDespesaReceita, valorDespesaReceita, Descricao, Id_Empresa) VALUES (@id_iniciativa,  @mes, 0, @valordespesa, @descricao, @id_Empresa)", conn)

        Dim PId_Iniciativa, PId_Empresa, PMes, PValor, PDescricao As New SqlParameter()

        PId_Iniciativa.ParameterName = "id_iniciativa"
        PId_Iniciativa.Value = id_iniciativa

        PId_Empresa.ParameterName = "id_empresa"
        PId_Empresa.Value = id_empresa

        PMes.ParameterName = "Mes"
        PMes.Value = mes

        PValor.ParameterName = "valordespesa"
        PValor.Value = valor

        PDescricao.ParameterName = "descricao"
        PDescricao.Value = descricao + ". Perpetuidade Aplicada."

        cmd.Parameters.Add(PId_Empresa)
        cmd.Parameters.Add(PId_Iniciativa)
        cmd.Parameters.Add(PDescricao)
        cmd.Parameters.Add(PMes)
        cmd.Parameters.Add(PValor)



        conn.Open()

        cmd.ExecuteNonQuery()


        conn.Dispose()
        cmd.Dispose()




    End Sub


    'Shared Function FinalizouEntSaida(ByVal Id_Empresa As Integer, ByVal Id_Iniciativa As Integer, ByVal nMes As Integer, ByVal tipo As Boolean) As Boolean

    '    Dim b As Boolean = False

    '    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)

    '    Dim cmd As SqlCommand = New SqlCommand("select mes from dbo.fdiReceitasDespesas where id_Iniciativa=@id_iniciativa and id_empresa=@id_empresa  and flagDespesaReceita=@flag", conn)

    '    Dim PId_Empresa, PId_Iniciativa, PTipo As New SqlParameter()

    '    PId_Empresa.ParameterName = "id_empresa"
    '    PId_Empresa.Value = Id_Empresa

    '    PId_Iniciativa.ParameterName = "id_iniciativa"
    '    PId_Iniciativa.Value = Id_Iniciativa

    '    PTipo.ParameterName = "flag"
    '    PTipo.Value = tipo
    '    PTipo.DbType = DbType.Boolean

    '    cmd.Parameters.Add(PId_Empresa)
    '    cmd.Parameters.Add(PId_Iniciativa)
    '    cmd.Parameters.Add(PTipo)

    '    conn.Open()

    '    Dim reader As SqlDataReader = cmd.ExecuteReader()

    '    Dim x As Integer = 0


    '    If reader.HasRows Then
    '        While reader.Read()
    '            x += 1
    '        End While
    '    End If

    '    If x = nMes Then
    '        b = True
    '    Else
    '        b = False

    '    End If



    '    conn.Dispose()
    '    cmd.Dispose()

    '    Return b

    'End Function


End Class
