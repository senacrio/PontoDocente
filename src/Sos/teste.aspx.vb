
Partial Class Sos_teste
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Comunicacao.EnviaEmail("sos@rj.senac.br", "gabriel.ferreira@rj.senac.br", "Assunto", "Email de teste")
        Comunicacao.EnviaEmail("sos@rj.senac.br", "tiago.marques@rj.senac.br", "Assunto", "Email de teste")




    End Sub
End Class
