Imports Microsoft.VisualBasic

Public Class FDIUsuario
    Shared Function retornaid(ByVal sLogin As String, ByVal id_empresa As Integer) As Integer

        Dim i As Integer = 0

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)

        Dim cmd As SqlCommand = New SqlCommand("select id_Solicitante from fdisolicitante where login=@login and id_empresa=@id_empresa", conn)

        Dim PLogin, PId_Empresa As New SqlParameter()

        PLogin.ParameterName = "login"
        PLogin.Value = sLogin

        PId_Empresa.ParameterName = "id_empresa"
        PId_Empresa.Value = id_empresa

        cmd.Parameters.Add(PLogin)
        cmd.Parameters.Add(PId_Empresa)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            i = Integer.Parse(reader(0))
        End If



        cmd.Dispose()
        conn.Dispose()
        reader.Close()

        Return i


    End Function

    Shared Function UsuarioExiste(ByVal sLogin As String, ByVal id_Empresa As Integer) As Boolean
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)

        Dim cmd As SqlCommand = New SqlCommand("select * from fdisolicitante where login=@login and id_empresa=@id_empresa", conn)

        Dim PLogin, PId_Empresa As New SqlParameter()

        PLogin.ParameterName = "login"
        PLogin.Value = sLogin

        PId_Empresa.ParameterName = "id_empresa"
        PId_Empresa.Value = id_Empresa

        cmd.Parameters.Add(PLogin)
        cmd.Parameters.Add(PId_Empresa)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        Dim b As Boolean = reader.HasRows



        cmd.Dispose()
        conn.Dispose()
        reader.Close()

        Return b

    End Function

    'Public Sub cadastrarUsuario(ByVal sMatricula As Integer, ByVal nome As String, ByVal email As String, ByVal Id_Empresa As Integer, ByVal Id_area As Integer, ByVal sLogin As String)
    '    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)

    '    Dim cmd As SqlCommand = New SqlCommand("INSERT INTO fdiSolicitante(Matric_Solicitante, Nome_Solicitante, email, Id_Empresa, Id_Area, Login) VALUES (@Matric_Solicitante, @Nome_Solicitante, @email, @Id_Empresa,@Id_Area,@Login)", conn)

    '    Dim PMatric_Solicitante, PNome_Solicitante, Pemail, PId_Empresa, PId_Area, PLogin As New SqlParameter()
    '    PMatric_Solicitante.ParameterName = "Matric_Solicitante"
    '    PMatric_Solicitante.Value = sMatricula

    '    PNome_Solicitante.ParameterName = "Nome_Solicitante"
    '    PNome_Solicitante.Value = nome

    '    Pemail.ParameterName = "email"
    '    Pemail.Value = email

    '    PId_Empresa.ParameterName = "Id_Empresa"
    '    PId_Empresa.Value = Id_Empresa

    '    PId_Area.ParameterName = "Id_Area"
    '    PId_Area.Value = Id_area

    '    PLogin.ParameterName = "Login"
    '    PLogin.Value = sLogin

    '    cmd.Parameters.Add(PNome_Solicitante)
    '    cmd.Parameters.Add(PNome_Solicitante)
    '    cmd.Parameters.Add(PMatric_Solicitante)
    '    cmd.Parameters.Add(Pemail)
    '    cmd.Parameters.Add(PId_Empresa)
    '    cmd.Parameters.Add(PId_Area)
    '    cmd.Parameters.Add(PLogin)

    '    conn.Open()
    '    cmd.ExecuteNonQuery()
    '    conn.Dispose()
    '    cmd.Dispose()


    'End Sub

End Class
