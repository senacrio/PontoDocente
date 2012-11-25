Imports System.DirectoryServices




Public Class UsuarioAD

    Public cErro As String = ""
    Public c_IDUsuario As String
    Public c_Nome As String
    Public c_Email As String
    Public c_Ramal As String
    Public c_Matricula As String

    Public Sub PegaInfo(ByVal cUsuario As String)
        Dim oEntry As DirectoryEntry = New DirectoryEntry("LDAP://145.35.0.2", "senacrio\usrsos", "100senha@sos")


        Try
            Dim oObj As Object = oEntry.NativeObject
            Dim oSearch As DirectorySearcher = New DirectorySearcher(oEntry)

            oSearch.Filter = "(SAMAccountName=" & cUsuario & ")"
            oSearch.PropertiesToLoad.Add("cn")
            oSearch.PropertiesToLoad.Add("displayName")
            oSearch.PropertiesToLoad.Add("mail")
            'oSearch.PropertiesToLoad.Add("telephoneNumber")

            Dim oResult As SearchResult = oSearch.FindOne()
            If (oResult Is Nothing) Then

                Exit Try
            End If

            'PEGA ATRIBUTOS DO AD
            c_Nome = CType(oResult.Properties("displayName")(0), String)

            Try
                c_Email = CType(oResult.Properties("mail")(0), String)
            Catch
                c_Email = ""
            End Try




        Catch ex As Exception
            cErro = "<br/>" & ex.Message.ToString()

        End Try



    End Sub




End Class




