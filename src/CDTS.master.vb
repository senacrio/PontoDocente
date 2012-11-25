Imports System.Data
Imports System.Data.SqlClient

Partial Class CDTS
    Inherits System.Web.UI.MasterPage
    Public lRemenu As Boolean = False


    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        'CARREGA OS ITENS PAI DO MENU
        If (Not IsPostBack) Or (lRemenu) Then

            'SE FOR UMA REMONTAGEM DE MENU, É PRECISO LIMPAR O ANTERIOR
            If lRemenu Then
                tvMenu.ExpandDepth = 5
                tvMenu.Nodes.Clear()
                tvMenu.ExpandAll()
                lRemenu = False
            End If

            Dim oNode As New TreeNode
            oNode.Text = "Opções"
            oNode.Value = 0

            'CARREGA OS FILHOS DE PRIMEIRO NÍVEL, SE HOUVER
            AdicionaMenuFilhos(oNode, 0)
            tvMenu.Nodes.Add(oNode)

        End If


    End Sub

    Protected Sub AdicionaMenuFilhos(ByRef oNode As TreeNode, ByVal nIdMenu As Integer)


        Dim oCnx As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String

        '***** Aqui deve ser adicionado o mecanismo de controle de acesso com base na senha
        If nIdMenu = 0 Then
            sSql = "SELECT * FROM ptlMenu WHERE id_menu_pai_fk is NULL ORDER BY ordem"
        Else
            sSql = "SELECT * FROM ptlMenu WHERE id_menu_pai_fk =" & nIdMenu & " ORDER BY ordem"
        End If

        Dim oCmd As New SqlCommand(sSql, oCnx)
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        'CARREGA TODOS OS ITENS FILHOS PARA UM ITEM FILHO 2 OU SUPERIOR
        While oReader.Read()

            Dim oNodeFilho As New TreeNode
            oNodeFilho.Text = oReader("menu").ToString
            oNodeFilho.Value = oReader("id_menu").ToString
            oNodeFilho.ToolTip = oReader("menu_tooltip").ToString

            'A PÁGINA RELACIONADA É BUSCADA E ATRIBUÍDA AO NÓ EM QUESTÃO
            Dim oCnxPagina As SqlConnection = New SqlConnection(Dados.StringConexao())
            Dim sSqlPagina As String
            Dim sIdPagina As String = oReader("id_pagina_fk").ToString

            'TRATA OS CASOS EM QUE A OPÇÃO DE MENU NÃO APONTA PARA QUALQUER PÁGINA
            If sIdPagina <> "" Then
                sSqlPagina = "SELECT * FROM ptlPaginas WHERE id_pagina=" & sIdPagina
            Else
                sSqlPagina = "SELECT * FROM ptlPaginas WHERE id_pagina=0"
            End If

            Dim oCmdPagina As New SqlCommand(sSqlPagina, oCnxPagina)
            oCmdPagina.Connection.Open()
            Dim oReaderPagina As SqlDataReader = oCmdPagina.ExecuteReader()

            If oReaderPagina.HasRows Then
                oReaderPagina.Read()
                oNodeFilho.NavigateUrl = oReaderPagina("pagina").ToString
            Else
                oNodeFilho.NavigateUrl = ""
            End If

            oReaderPagina.Dispose()
            oCmdPagina.Dispose()
            oCnxPagina.Dispose()



            'CARREGA OS FILHOS DO ITEM FILHO, SE HOUVER - PROPORCIONA A RECURSIVIDADE
            AdicionaMenuFilhos(oNodeFilho, oReader("id_menu"))

            oNode.ChildNodes.Add(oNodeFilho)

        End While

        oReader.Close()
        oCmd.Dispose()
        oCnx.Dispose()


    End Sub

End Class

