Imports Microsoft.VisualBasic

Public Class SOSRamal

    Private _Matricula As Integer
    Private _Ramal As String

    Public Property Matricula() As Integer
        Get
            Return _Matricula
        End Get
        Set(ByVal value As Integer)
            _Matricula = value
        End Set
    End Property

    Public Property Ramal() As String
        Get
            Return _Ramal
        End Get
        Set(ByVal value As String)
            _Ramal = value
        End Set
    End Property
    Public Sub PegaRamal()



        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select ramal from sosRamal where matricula=@matricula", conn)

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "matricula"
        PMatricula.Value = _Matricula
        PMatricula.DbType = DbType.Int32

        cmd.Parameters.Add(PMatricula)
        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            _Ramal = reader("ramal").ToString
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()




    End Sub

    Public Sub CadastrarRamal()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO [sistemaSOS].[dbo].[sosRamal] ([Ramal] ,[Matricula])  VALUES (@ramal,@matricula)", conn)

        Dim PRamal As SqlParameter = New SqlParameter()
        PRamal.ParameterName = "ramal"
        PRamal.Value = _Ramal
        PRamal.DbType = DbType.String

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "matricula"
        PMatricula.Value = _Matricula
        PMatricula.DbType = DbType.Int32

        cmd.Parameters.Add(PMatricula)
        cmd.Parameters.Add(PRamal)
        conn.Open()

        cmd.ExecuteNonQuery()

        conn.Dispose()
        cmd.Dispose()

    End Sub

    Public Sub AtualizaRamal()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE [sistemaSOS].[dbo].[sosRamal] SET [Ramal] =@Ramal  WHERE [Matricula] =@Matricula", conn)

        Dim PRamal As SqlParameter = New SqlParameter()
        PRamal.ParameterName = "ramal"
        PRamal.Value = _Ramal
        PRamal.DbType = DbType.String

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "matricula"
        PMatricula.Value = _Matricula
        PMatricula.DbType = DbType.Int32

        cmd.Parameters.Add(PMatricula)
        cmd.Parameters.Add(PRamal)
        conn.Open()

        cmd.ExecuteNonQuery()

        conn.Dispose()
        cmd.Dispose()

    End Sub



End Class
