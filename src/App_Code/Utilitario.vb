Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Web.UI.ControlCollection


Public Class Utilitario
    
    Shared Sub ExportaExcel(ByVal dgv As GridView, ByVal arquivo As String)
        Dim Page As System.Web.UI.Page = DirectCast(HttpContext.Current.CurrentHandler, System.Web.UI.Page)



        If dgv.Rows.Count.ToString + 1 < 65536 Then

            dgv.AllowPaging = "False"
            dgv.DataBind()
            Dim tw As New StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()

            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel"
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + arquivo + ".xls")
            HttpContext.Current.Response.Charset = ""
            Page.EnableViewState = False
            Page.Controls.Add(frm)
            frm.Controls.Add(dgv)

            frm.RenderControl(hw)
            HttpContext.Current.Response.Write(tw.ToString())
            HttpContext.Current.Response.End()
            dgv.AllowPaging = "True"
            dgv.DataBind()
        Else

            '.Text = " planilha possui muitas linhas, não é possível exportar para o EXcel"

        End If
    End Sub
	
	 Shared Function RetornaEmail(ByVal Matricula As String) As String

        Dim conex As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select login  from admPortalUsuario where matricula=@Matricula and ativo = 1", conex)
        Dim email As String = ""

        Dim oUsuarioAD As New UsuarioAD()


        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "Matricula"
        PMatricula.Value = Matricula

        cmd.Parameters.Add(PMatricula)
        conex.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            oUsuarioAD.PegaInfo(reader("Login").ToString)
            email = oUsuarioAD.c_Email


        End If

        cmd.Dispose()
        conex.Dispose()
        reader.Close()

        Return email


    End Function

    Shared Sub RegistraLog()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)

        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO admPortalLog (DataHora,Matricula,Pagina) VALUES (getdate(),@matricula,@pagina)", conn)

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "matricula"
        PMatricula.Value = Integer.Parse(HttpContext.Current.Session("c_Matricula"))

        Dim PPagina As SqlParameter = New SqlParameter()
        PPagina.ParameterName = "pagina"
        PPagina.Value = HttpContext.Current.CurrentHandler.ToString()


        cmd.Parameters.Add(PMatricula)
        cmd.Parameters.Add(PPagina)

        conn.Open()

        cmd.ExecuteNonQuery()

        conn.Dispose()
        cmd.Dispose()


    End Sub
	
	
    Shared Function GridEmail(ByVal grid As GridView) As String

        Dim formHtml As HtmlForm = New HtmlForm()

        formHtml.Controls.Add(grid)

        Dim sw As StringWriter = New StringWriter()

        Dim textoHtml As HtmlTextWriter = New HtmlTextWriter(sw)

        formHtml.Controls(0).RenderControl(textoHtml)

        Dim Conteudo As String = sw.ToString

        Return Conteudo

    End Function
	

End Class
