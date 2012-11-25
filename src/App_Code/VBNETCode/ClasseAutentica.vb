Namespace AutenticacaoActiveDirectoty

    Public Class AutenticaUsuario

        Public cErro As String = ""
        Public c_IDUsuario As String
        Public c_Nome As String
        Public c_Email As String
        Public c_Ramal As String
        Public c_Matricula As String

        Public Function ValidaUsuario(ByVal cServidorAD As String, ByVal cDominio As String, ByVal cUsuario As String, ByVal cSenha As String) As Boolean
            Dim oEntry As DirectoryEntry = New DirectoryEntry(cServidorAD, cDominio & "\" & cUsuario, cSenha)
            Dim lRetorno As Boolean = True

            Try
                Dim oObj As Object = oEntry.NativeObject
                Dim oSearch As DirectorySearcher = New DirectorySearcher(oEntry)

                oSearch.Filter = "(SAMAccountName=" & cUsuario & ")"
                oSearch.PropertiesToLoad.Add("cn")
                oSearch.PropertiesToLoad.Add("displayName")
                'oSearch.PropertiesToLoad.Add("mail")
                'oSearch.PropertiesToLoad.Add("telephoneNumber")

                Dim oResult As SearchResult = oSearch.FindOne()
                If (oResult Is Nothing) Then
                    lRetorno = False
                    Exit Try
                End If

                'PEGA ATRIBUTOS DO AD
                c_Nome = CType(oResult.Properties("displayName")(0), String)
                'c_Email = CType(result.Properties("mail")(0), String)
                'c_Ramal = CType(result.Properties("telephoneNumber")(0), String)

                Using oConexao As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString())
                    Using oCmd As SqlCommand = New SqlCommand
                        Dim oDr As SqlDataReader
                        oCmd.Connection = oConexao
                        oConexao.Open()
                        oCmd.CommandText = "SELECT DISTINCT A.IdUsuario, A.Matricula FROM admPortalUsuario A " & _
                                            "INNER JOIN admPortalPerfilUsuario B ON A.IdUsuario=B.IdUsuario " & _
                                            "INNER JOIN admPortalPerfil C ON B.IdPerfil=C.IdPerfil " & _
                                            "INNER JOIN admPortalMenuPerfil D ON C.IdPerfil=D.IdPerfil " & _
                                            "INNER JOIN admPortalMenu E ON D.IdMenu=E.IdMenu " & _
                                            "WHERE A.Login='" & cUsuario & "' AND C.Ativo=1 AND E.Ativo=1"
                        oDr = oCmd.ExecuteReader
                        If oDr.Read Then
                            c_IDUsuario = oDr("IDUsuario").ToString
                            c_Matricula = oDr("Matricula").ToString
                        Else
                            Me.cErro = "<br>Acesso negado. Sua conta não está habilitada corretamente."
                            lRetorno = False
                        End If
                        oDr.Close()
                        oCmd.Dispose()
                        oConexao.Close()
                    End Using
                End Using


            Catch ex As Exception
                cErro = "<br/>" & ex.Message.ToString()
                lRetorno = False
            End Try

            Return lRetorno

        End Function

    End Class

End Namespace

