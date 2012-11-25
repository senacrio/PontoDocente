Imports Microsoft.Office.Interop.Outlook

Partial Class Sos_teste2
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Write(Comunicacao.EnviaEmail("admin.comunica@rj.senac.br", "tiago.marques@rj.senac.br", "teste", "msg"))




        ''Criando uma instancia do outlook 
        'Dim outlook As Application = New ApplicationClass()

        ''Agora vamos nos autenticar 
        'Dim ns As [NameSpace] = outlook.GetNamespace("Mapi")
        'Dim _missing As Object = Type.Missing
        'ns.Logon(_missing, _missing, False, True)


        ''Apenas como exemplo vamos selecionar a Inbox para ler seus e-mails 
        'Dim inbox As MAPIFolder = ns.GetDefaultFolder(OlDefaultFolders.olFolderInbox)

        ''Exemplo de recurso da DLL, abaixo vemos com identificar quantos emails não lidos ainda 
        'Dim unread As Integer = inbox.UnReadItemCount

        ''Agora podemos fazer um loop e ler todos os emails da pasta selecionada 
        'For Each mail As MailItem In inbox.Items
        '    Dim body As String = mail.Body
        '    Dim subject As String = mail.Subject
        'Next
        'Response.Write(Request.ServerVariables("LOGON_USER"))

    End Sub
End Class
