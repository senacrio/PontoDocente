Imports System.IO
Imports Senac.ControleRHDocente
Imports System.Collections.Generic

Partial Class FrequenciaDocente_Relatorio_CategoriaImportacao
    Inherits System.Web.UI.Page
    ' Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"

    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"
    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Dim listaCategoria As New List(Of CategoriaDocente)

        If (FileUpload1.PostedFile.ContentLength.Equals(0)) Then
            lblMsg.Text = "Selecione um arquivo"
            lblMsg.ForeColor = Drawing.Color.Red
        Else

            Try
                Dim str As New StreamReader(FileUpload1.PostedFile.InputStream)
                Dim db As New FrequenciaDocenteDataContext(conn)

                Dim linha As String
                linha = str.ReadLine()
                Do
                    linha = str.ReadLine()

                    Dim categoria As New CategoriaDocente()

                    If (Not String.IsNullOrEmpty(linha)) Then
                        LoadCategoriaDocente(categoria, linha)
                        listaCategoria.Add(categoria)
                    End If



                Loop Until linha Is Nothing

                If (Not listaCategoria Is Nothing) And (listaCategoria.Count > 0) Then
                    DeleteAllCategorias(db)
                    db.CategoriaDocentes.InsertAllOnSubmit(listaCategoria)
                    db.SubmitChanges()
                End If



                lblMsg.Text = "Arquivo salvo com sucesso"
                lblMsg.ForeColor = Drawing.Color.Green



            Catch ex As Exception
                lblMsg.Text = ex.Message
                lblMsg.ForeColor = Drawing.Color.Red


            End Try
        End If

    End Sub

    Private Sub LoadCategoriaDocente(categoria As CategoriaDocente, linha As String)
        categoria.EAD = Convert.ToDecimal(linha.Split(";")(12))
        categoria.Fictec = Convert.ToDecimal(linha.Split(";")(9))
        categoria.Grad = Convert.ToDecimal(linha.Split(";")(10))
        categoria.POS = Convert.ToDecimal(linha.Split(";")(11))
        categoria.Matricula = linha.Split(";")(2).Trim()
        categoria.Nome = linha.Split(";")(3)
    End Sub

    Private Sub DeleteAllCategorias(db As FrequenciaDocenteDataContext)
        db.CategoriaDocentes.DeleteAllOnSubmit(db.CategoriaDocentes)
    End Sub

End Class
