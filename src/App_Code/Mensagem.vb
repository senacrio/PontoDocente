Imports Microsoft.VisualBasic

Public Class Mensagem
    Private sDe, sPara, sAssunto, sMensagem As String

    Public Sub Mensagem()
        sDe = ""
        sPara = ""
        sAssunto = ""
        sMensagem = ""
    End Sub
    Public Sub Close()
        sDe = ""
        sPara = ""
        sAssunto = ""
        sMensagem = ""
    End Sub
    Public Property De() As String
        Get
            Return sDe
        End Get
        Set(ByVal value As String)
            sDe = value
        End Set
    End Property

    Public Property Para() As String
        Get
            Return sPara
        End Get
        Set(ByVal value As String)
            sPara = value
        End Set
    End Property
    Public Property Assunto() As String
        Get
            Return sAssunto
        End Get
        Set(ByVal value As String)
            sAssunto = value
        End Set
    End Property
    Public Property Texto() As String
        Get
            Return sMensagem
        End Get
        Set(ByVal value As String)
            sMensagem = value
        End Set
    End Property

    Public Function Envia() As String
        Dim sM As String = ""
        sM += "<p align='center' class='MsoNormal' style='TEXT-ALIGN: center'>"
        sM += "<span style='FONT-SIZE: 14pt; COLOR: #548dd4; LINE-HEIGHT: 115%; mso-themecolor: text2; mso-themetint: 153'>"
        sM += "<span style='font-family: Arial, Helvetica, sans-serif'>Mensagem automática "
        sM += "enviada pelo </span><span class='SpellE'><span class='GramE' "
        sM += "style='font-family: Arial, Helvetica, sans-serif'>"
        sM += "<b style='mso-bidi-font-weight: normal'><i style='mso-bidi-font-style: normal'>"
        sM += "ClickOportunidades</i></b></span></span><o:p></o:p></span></p>"
        sM += "<div style='BORDER-RIGHT: medium none; PADDING-RIGHT: 0cm; BORDER-TOP: windowtext 1pt solid; PADDING-LEFT: 0cm; PADDING-BOTTOM: 1pt; BORDER-LEFT: medium none; PADDING-TOP: 1pt; BORDER-BOTTOM: windowtext 1pt solid; mso-element: para-border-div; mso-border-top-alt: solid windowtext .75pt; mso-border-bottom-alt: solid windowtext .75pt'>"
        sM += "<span style=' FONT-SIZE: 11pt; font-family: Arial, Helvetica, sans-serif;'>"
        sM += sMensagem
        sM += "</span></p>"
        sM += "</div>"
        sM += "<span style='COLOR: gray; FONT-SIZE: 8pt; FONT-FAMILY: Arial, Helvetica, sans-serif; color=gray;'>Esta "
        sM += "mensagem, incluindo seus anexos, pode conter informações privilegiadas e/ou de "
        sM += "caráter confidencial, não podendo ser retransmitida sem autorização do "
        sM += "remetente. Se você não é o destinatário ou pessoa autorizada a recebê-la, "
        sM += "informamos que o seu uso, divulgação, cópia ou arquivamento são proibidos. "
        sM += "Portanto, se você recebeu esta mensagem por engano, por favor, informe-nos "
        sM += "respondendo imediatamente a este e-mail e em seguida apague-a.</span></p>"
        Return Comunicacao.EnviaEmail(sDe, sPara, sAssunto, sM)
    End Function

End Class
