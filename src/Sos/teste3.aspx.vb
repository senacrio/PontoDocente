
Partial Class Sos_teste3
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Comunicacao2.EnviaEmail("SistemaSOS@rj.senac.br", "tiago.marques@rj.senac.br", "assunto", "msg")
    End Sub
End Class
