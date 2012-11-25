Option Explicit On
Option Strict On

Imports System.IO

Partial Class _Default
    Inherits System.Web.UI.Page

  
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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
