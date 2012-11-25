Imports Microsoft.VisualBasic

Public Class UtilitariosSOS


    Shared Function totalSos() As String
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select count(*) as num from sosChamado", conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        Dim s As String = reader("num").ToString()
        conn.Close()
        cmd.Dispose()

        Return s
    End Function

End Class
