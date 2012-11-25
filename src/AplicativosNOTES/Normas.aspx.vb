
Partial Class AplicativosNOTES_NormasProcedimentos_Normas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write("<iframe id='AreaDeTrabalho' " + _
                                            "name = 'AreaDeTrabalho' " + _
                                            "frameborder = '0' " + _
                                            "height = '600px' " + _
                                            "src = 'http://intranet/aplicativos/Instrab.nsf' " + _
                                            "" + _
                                            "width='100%'></iframe>")
    End Sub
End Class
