Imports Microsoft.VisualBasic
Imports System

Public Class Seguranca


    Shared Sub AutorizarPagina()
        Dim sUsuario As String = Usuario.UsuarioLogado()

        If sUsuario Is Nothing Then


        End If

    End Sub


End Class
