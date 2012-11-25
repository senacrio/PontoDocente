Option Explicit On
Option Strict On

Imports System.IO

Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub btnDownload_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDownload.ServerClick
        Dim arquivo As FileInfo
        Dim nomeArquivo As String

        'Obtêm o nome compleo do arquivo selecionado
        'nomeArquivo = Server.MapPath("arquivos") & "\" & lstArquivos.SelectedItem.Text
        nomeArquivo = Server.MapPath("arquivos").ToString & "\" & Session("Arquivo").ToString
        'Obtêm os dados do arquivo pois o tamanho é requerido para efetuar o download
        arquivo = New FileInfo(nomeArquivo)
        'envia para o browser
        Response.Clear()
        Response.AddHeader("Content-Disposition", "attachment; filename=" & Session("Arquivo").ToString)
        Response.AddHeader("Content-Length", arquivo.Length.ToString())
        Response.ContentType = "application/octet-stream"
        Response.WriteFile(nomeArquivo)
        Response.End()
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Criacao de variavel
        Dim strServer As String
        'Server obtem o objeto, o qual é uma instacia de classes system.web.HttpServerUtility responsavel por fornecer metodos de ajuda para procerssar requisicoes web. .Maph retorno o caminho fisico corespondente ao caminho virtual do servidor web.
        strServer = Server.MapPath(".\")
        'acrescentando o caminho ate um diretorio especifico 
        strServer += "arquivos\"
        'file upload 
        '.hash -  obtem um boloean false ou true que indica se o controle contem um arquivo. Isso evita a tentativa de salvar um arquivo inexistente e causar um erro.
        'Save as - salva o conteudo do arquivo a ser enviado usando o controle fileupload para especificar o caminho no servidor web.
        'file name - obtem o nome do arquivo no cliente
        If FileUpload1.HasFile Then
            FileUpload1.SaveAs(strServer & FileUpload1.FileName)
            HyperLink1.Text = FileUpload1.FileName
            HyperLink1.NavigateUrl = "arquivos\" + FileUpload1.FileName
            Session("PathArquivo") = HyperLink1.NavigateUrl
            Session("Arquivo") = HyperLink1.NavigateUrl
            pnlVisualizar.Visible = True
            'lblVisualizar.Visible = True
            SqlDSDocumentos.Insert()
            lblAviso.Text = "Cadastro efetuado com sucesso. Clique no link para visualizar o arquivo: "
        End If
    End Sub

    Protected Sub Button1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Load
        Dim arquivos() As String
        Dim index As Integer

        If (Not Page.IsPostBack) Then
            'Obtem a lista de arquivos no diretório imagens
            arquivos = Directory.GetFiles(Server.MapPath("arquivos"))

            'removemos o caminho dos arquivos a serem exibidos
            For index = 0 To arquivos.Length - 1
                arquivos(index) = New FileInfo(arquivos(index)).Name
            Next index

            'vincula a lista dos arquivos ao controle no formulário
            lstArquivos.DataSource = arquivos
            lstArquivos.DataBind()

            'seleciona a primeira entrada da lista
            lstArquivos.SelectedIndex = 0

            'Teste para grid view
            'Obtem a lista de arquivos no diretório imagens
            arquivos = Directory.GetFiles(Server.MapPath("arquivos"))
            For index = 0 To arquivos.Length - 1
                arquivos(index) = New FileInfo(arquivos(index)).Name
            Next index
            lstArquivos.DataSource = arquivos
            lstArquivos.DataBind()

            GridView1.DataSource = arquivos
            GridView1.DataBind()

        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        pnlVisualizar.Visible = False
        HyperLink1.Text = ""

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        'Carrega o nome do arquivo para download
        Session("Arquivo") = GridView1.Rows(GridView1.SelectedIndex).Cells(2).Text
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim arquivo As FileInfo
        Dim nomeArquivo As String

        'Obtêm o nome compleo do arquivo selecionado
        'nomeArquivo = Server.MapPath("arquivos") & "\" & lstArquivos.SelectedItem.Text
        nomeArquivo = Server.MapPath("arquivos").ToString & "\" & Session("Arquivo").ToString
        'Obtêm os dados do arquivo pois o tamanho é requerido para efetuar o download
        arquivo = New FileInfo(nomeArquivo)
        'envia para o browser
        Response.Clear()
        Response.AddHeader("Content-Disposition", "attachment; filename=" & Session("Arquivo").ToString)
        Response.AddHeader("Content-Length", arquivo.Length.ToString())
        Response.ContentType = "application/octet-stream"
        Response.WriteFile(nomeArquivo)
        Response.End()
    End Sub
End Class
