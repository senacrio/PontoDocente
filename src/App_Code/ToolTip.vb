Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class ToolTip

    Shared Function retornaDescricaoGrupoServico() As SqlDataReader
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select * from sosGrupoServico", conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

        Return reader

    End Function

    Shared Function retornaDescricaoServico(ByVal IDGrupoServico As Integer) As SqlDataReader
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select * from sosServico where IDGruposervico=@IDGruposervico", conn)

        Dim PIDGrupoServico As SqlParameter = New SqlParameter()
        PIDGrupoServico.ParameterName = "IDGrupoServico"
        PIDGrupoServico.Value = IDGrupoServico

        cmd.Parameters.Add(PIDGrupoServico)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

        Return reader

    End Function

End Class
