Imports System.IO
Imports Senac.ControleRHDocente

Partial Class FrequenciaDocente_AgendaExecutada
    Inherits System.Web.UI.Page
    Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        If (FileUpload1.PostedFile Is Nothing) Then
            lblMsg.Text = "Selecione um arquivo"
            lblMsg.ForeColor = Drawing.Color.Red
        Else
            Dim str As New StreamReader(FileUpload1.PostedFile.InputStream)
            Dim db As New FrequenciaDocenteDataContext(conn)

            Dim linha As String

            Do
                linha = str.ReadLine()

                Dim ae As New AgendaExecutada()
                ae.Id = Guid.NewGuid().ToString()
                ae.Valor = linha
                db.AgendaExecutadas.InsertOnSubmit(ae)
                db.SubmitChanges()
            Loop Until linha Is Nothing

            lblMsg.Text = "Arquivo salvo com sucesso"
            lblMsg.ForeColor = Drawing.Color.Green



        End If
    End Sub
End Class
