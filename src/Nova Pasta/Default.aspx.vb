Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Principal
Imports System.Xml
Imports System.DirectoryServices


Partial Class _Default
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not Me.IsPostBack Then
            Try
                lblUsuario.Text = "<b>Usuário:</b>&nbsp;" & Context.Session("c_Nome")
                Using oConexao As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString())
                    Using oCmd As SqlCommand = New SqlCommand

                        'LÊ DADOS DO USUÁRIO
                        oCmd.Connection = oConexao
                        oCmd.CommandText = "SELECT A.MenuTreeView, A.IdiomaPadrao, (SELECT TOP 1 A.DataHora " + _
                                            "FROM (SELECT TOP 2 B.DataHora FROM admPortalAcesso B WHERE B.LoginDigitado='" + User.Identity.Name + "' " + _
                                            "AND B.IDAcessoTipo=1 ORDER BY B.DataHora DESC ) A ORDER BY A.DataHora) AS UltimoAcesso " + _
                                            "FROM admPortalUsuario A " + _
                                            "WHERE A.Login='" + User.Identity.Name + "'"

                        oConexao.Open()
                        Dim oDr As SqlDataReader = oCmd.ExecuteReader
                        If oDr.Read Then
                            lblUsuario.Text += "&nbsp;&nbsp;&nbsp;<b>Último acesso:</b>&nbsp;" + String.Format("{0:dd/MM/yyyy HH:mm}", oDr("UltimoAcesso")).ToString()
                            If oDr("MenuTreeView") = True Then
                                menu.Visible = False
                                tvwMenu.Visible = True
                                Celula1.Width = 95
                            Else
                                menu.Visible = True
                                tvwMenu.Visible = False
                                Celula1.Width = 0
                            End If
                        End If

                        'DEFINE IDIOMA ESCOLHIDO OU PEGA ÚLTIMA PADRÃO DO USUÁRIO
                        If Session("c_Idioma") Is Nothing Then
                            Session("c_Idioma") = oDr("IdiomaPadrao").ToString()
                        Else
                            If Session("c_Idioma") <> oDr("IdiomaPadrao").ToString() Then
                                GravaIdioma()
                            End If
                        End If
                        menIdioma.Items(0).ImageUrl = "~/Imagens/Idioma" + Session("c_Idioma") + ".gif"
                        If Session("c_Idioma") = "POR" Then
                            menIdioma.Items(0).ChildItems(0).Selected = True
                        ElseIf Session("c_Idioma") = "ENG" Then
                            menIdioma.Items(0).ChildItems(1).Selected = True
                        ElseIf Session("c_Idioma") = "ESP" Then
                            menIdioma.Items(0).ChildItems(2).Selected = True
                        End If
                        oDr.Close()
                        oConexao.Close()
                    End Using
                End Using
            Finally
            End Try
            MontaGuias(-2007, 0)
        Else
            MontaGuias(-2007, 1)
        End If
    End Sub
    Protected Sub imbTrocaMenu_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbTrocaMenu.Click
        Try
            Using oConexao As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString())
                Using oCmd As SqlCommand = New SqlCommand
                    oCmd.Connection = oConexao
                    oConexao.Open()
                    If menu.Visible Then
                        menu.Visible = False
                        tvwMenu.Visible = True
                        Celula1.Width = 95
                        oCmd.CommandText = "UPDATE admPortalUsuario SET MenuTreeView=1 WHERE Login='" + User.Identity.Name + "'"
                    Else
                        menu.Visible = True
                        tvwMenu.Visible = False
                        Celula1.Width = 0
                        oCmd.CommandText = "UPDATE admPortalUsuario SET MenuTreeView=0 WHERE Login='" + User.Identity.Name + "'"
                    End If
                    oCmd.ExecuteNonQuery()
                    oCmd.Dispose()
                End Using
            End Using
        Finally
        End Try
        MontaGuias(-2007, 1)
    End Sub
    Protected Sub menIdioma_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles menIdioma.MenuItemClick
        Context.Session("c_Idioma") = menIdioma.SelectedValue
        menIdioma.Items(0).ImageUrl = menIdioma.SelectedItem.ImageUrl
        GravaIdioma()
        MontaGuias(-2007, 1)
    End Sub
    Protected Sub GravaIdioma()
        Try
            Using oConexao As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString())
                Using oCmd As SqlCommand = New SqlCommand
                    oCmd.Connection = oConexao
                    oConexao.Open()
                    oCmd.CommandText = "UPDATE admPortalUsuario SET IdiomaPadrao='" + Session("c_Idioma") + "' WHERE Login='" + User.Identity.Name + "'"
                    oCmd.ExecuteNonQuery()
                    oCmd.Dispose()
                End Using
            End Using
        Finally
        End Try
    End Sub
    Protected Sub NovoBotao_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Botao As LinkButton = sender
        MontaGuias(Botao.TabIndex, 1)
        MontaMenu(Botao.TabIndex)
    End Sub
    Public Sub MontaGuias(ByVal GuiaSelecionada As Integer, ByVal Inicio As Integer)

        Dim i As Integer
        Dim EhPrimeiraMontagem As Boolean = False

        Dim ImagemGuiaEsquerda As Image = New Image()
        Dim NovoBotao As LinkButton = New LinkButton()
        Dim ImagemGuiaDireita As Image = New Image()

        PlaceHolder1.Controls.Clear()

        Using oConexao As SqlConnection = New SqlConnection
            oConexao.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ToString
            Using oCmd As SqlCommand = New SqlCommand
                oCmd.Connection = oConexao
                oCmd.CommandText = "SELECT DISTINCT A.IdMenu, A.Titulo" + Session("c_Idioma") + ", A.Descricao" + Session("c_Idioma") + ", " + _
                                    "(CASE WHEN A.Link IS NULL THEN 'Fundo.htm' ELSE A.Link END) AS Link, " + _
                                    "A.OrdemExibicao FROM admPortalMenu A " + _
                                    "INNER JOIN admPortalMenuPerfil B ON A.IdMenu=B.IdMenu " + _
                                    "INNER JOIN admPortalPerfil C ON B.IDPerfil=C.IdPerfil " + _
                                    "INNER JOIN admPortalPerfilUsuario D ON C.IDPerfil=D.IdPerfil " + _
                                    "INNER JOIN admPortalUsuario E ON D.IdUsuario=E.IdUsuario " + _
                                    "WHERE(A.IdMenuPai Is NULL And A.Ativo = 1 And C.Ativo = 1) AND " + _
                                    "E.Login='" & User.Identity.Name & "' ORDER BY A.OrdemExibicao"
                oConexao.Open()
                Dim oDr As SqlDataReader = oCmd.ExecuteReader

                Do While oDr.Read()

                    i = oDr("IdMenu").ToString
                    If GuiaSelecionada = -2007 Then
                        GuiaSelecionada = i
                        MontaMenu(GuiaSelecionada)
                        EhPrimeiraMontagem = True
                    End If
                    ImagemGuiaEsquerda = New Image()
                    ImagemGuiaEsquerda.ID = "ImgEsq" & i
                    ImagemGuiaEsquerda.TabIndex = i
                    If GuiaSelecionada = i Then
                        If i = 1 Then
                            ImagemGuiaEsquerda.ImageUrl = "~/Imagens/AbaAtiva1Inicio.jpg"
                        Else
                            ImagemGuiaEsquerda.ImageUrl = "~/Imagens/AbaAtiva2Inicio.jpg"
                        End If
                    Else
                        If i = 1 Then
                            ImagemGuiaEsquerda.ImageUrl = "~/Imagens/AbaInativa1Inicio.jpg"
                        Else
                            ImagemGuiaEsquerda.ImageUrl = "~/Imagens/AbaInativa2Inicio.jpg"
                        End If
                    End If
                    ImagemGuiaEsquerda.BorderStyle = BorderStyle.None
                    ImagemGuiaEsquerda.ImageAlign = ImageAlign.AbsBottom
                    ImagemGuiaEsquerda.EnableViewState = True
                    ImagemGuiaEsquerda.Visible = True

                    ImagemGuiaDireita = New Image()
                    ImagemGuiaDireita.ID = "ImgDir" & i
                    ImagemGuiaDireita.TabIndex = i
                    If GuiaSelecionada = i Then
                        ImagemGuiaDireita.ImageUrl = "~/Imagens/AbaAtiva3Fim.jpg"
                    Else
                        ImagemGuiaDireita.ImageUrl = "~/Imagens/AbaInativa3Fim.jpg"
                    End If
                    ImagemGuiaDireita.BorderStyle = BorderStyle.None
                    ImagemGuiaDireita.ImageAlign = ImageAlign.AbsBottom
                    ImagemGuiaDireita.EnableViewState = True
                    ImagemGuiaDireita.Visible = True

                    NovoBotao = New LinkButton()
                    AddHandler NovoBotao.Click, AddressOf NovoBotao_Click
                    NovoBotao.ID = "Aba" & i
                    NovoBotao.Text = oDr("Titulo" + Session("c_Idioma")).ToString()
                    NovoBotao.Height = 19
                    NovoBotao.TabIndex = i
                    NovoBotao.EnableViewState = True
                    NovoBotao.Visible = True
                    NovoBotao.EnableTheming = False
                    NovoBotao.ToolTip = oDr("Descricao" + Session("c_Idioma")).ToString()
                    If GuiaSelecionada = i Then
                        NovoBotao.CssClass = "FormataAbaAtiva"
                        If Not EhPrimeiraMontagem Or Inicio = 0 Then
                            Celula2.Controls.Clear()
                            Celula2.Text = "<iframe id='AreaDeTrabalho' " + _
                                            "name = 'AreaDeTrabalho' " + _
                                            "frameborder = '0' " + _
                                            "height = '600px' " + _
                                            "src = '" + oDr("link").ToString() + "' " + _
                                            "Style = 'border-style: solid; border-width: 3px 1px 1px 1px; border-color: #306897; background-color: #FFFFFF;' " + _
                                            "width='100%'></iframe>"

                        End If
                    Else
                        NovoBotao.CssClass = "FormataAbaInativa"
                    End If

                    PlaceHolder1.Controls.Add(ImagemGuiaEsquerda)
                    PlaceHolder1.Controls.Add(NovoBotao)
                    PlaceHolder1.Controls.Add(ImagemGuiaDireita)

                Loop

                ImagemGuiaEsquerda.Dispose()
                ImagemGuiaDireita.Dispose()

                oDr.Close()
                oConexao.Close()
            End Using
        End Using

    End Sub
    Public Sub MontaMenu(ByVal IdMenu As Integer)
        Dim oMenuAdapter As SqlDataAdapter
        Dim oMenuDataset As DataSet
        Dim oRelacao As DataRelation

        Using oConexao As SqlConnection = New SqlConnection
            oConexao.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ToString
            Using oCmd As SqlCommand = New SqlCommand
                oMenuAdapter = New SqlDataAdapter( _
                     "With menu(IdMenu, Titulo, Descricao, IdMenuPai, OrdemExibicao, Link) " & _
                     "AS ( " & _
                     "	SELECT A.IdMenu, A.Titulo" + Session("c_Idioma") + ", A.Descricao" + Session("c_Idioma") + ", A.IdMenuPai, A.OrdemExibicao, A.Link " & _
                     "	FROM admPortalMenu A " & _
                     "	INNER JOIN admPortalMenuPerfil B ON A.IdMenu=B.IdMenu " & _
                     "	INNER JOIN admPortalPerfil C ON B.IDPerfil=C.IdPerfil " & _
                     "	INNER JOIN admPortalPerfilUsuario D ON C.IDPerfil=D.IdPerfil " & _
                     "	INNER JOIN admPortalUsuario E ON D.IdUsuario=E.IdUsuario " & _
                     "	WHERE A.IdMenu=" & IdMenu & " AND A.Ativo = 1 And C.Ativo = 1 AND E.Login='" & User.Identity.Name & "' " & _
                     "UNION ALL " & _
                     "	SELECT B.IdMenu, B.Titulo" + Session("c_Idioma") + ", B.Descricao" + Session("c_Idioma") + ", B.IdMenuPai, B.OrdemExibicao, B.Link " & _
                     "	FROM admPortalMenu B " & _
                     "	INNER JOIN Menu M ON B.IdMenuPai=M.IdMenu " & _
                     "	INNER JOIN admPortalMenuPerfil C ON B.IdMenu=C.IdMenu " & _
                     "	INNER JOIN admPortalPerfil D ON C.IDPerfil=D.IdPerfil " & _
                     "	INNER JOIN admPortalPerfilUsuario E ON D.IDPerfil=E.IdPerfil " & _
                     "	INNER JOIN admPortalUsuario F ON E.IdUsuario=F.IdUsuario " & _
                     "	WHERE B.Ativo = 1 And D.Ativo = 1 AND F.Login='" & User.Identity.Name & "' " & _
                     ") " & _
                     "SELECT DISTINCT IdMenu, Titulo, Descricao, (CASE WHEN IdMenuPai=" & IdMenu & " THEN NULL ELSE IdMenuPai END) AS IdMenuPai, OrdemExibicao, (CASE WHEN Link IS NULL THEN 'Fundo.htm' ELSE Link END) AS Link " & _
                     "FROM Menu WHERE IdMenu<>" & IdMenu & " ORDER BY OrdemExibicao", oConexao)

                oMenuDataset = New DataSet()
                oMenuAdapter.Fill(oMenuDataset, "Menu")

                oMenuDataset.DataSetName = "Menus"
                oMenuDataset.Tables(0).TableName = "Menu"
                oRelacao = New DataRelation("ParentChild", oMenuDataset.Tables("Menu").Columns("IdMenu"), oMenuDataset.Tables("Menu").Columns("IdMenuPai"), True)
                oRelacao.Nested = True
                oMenuDataset.Relations.Add(oRelacao)

                xmlDataSource1.Data = oMenuDataset.GetXml()

                tvwMenu.DataBind()
                menu.DataBind()

                oMenuDataset.Dispose()
                oMenuAdapter.Dispose()
                oConexao.Close()
                xmlDataSource1.Dispose()
            End Using
        End Using

    End Sub
    Protected Sub LoginStatus1_LoggingOut(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles LoginStatus1.LoggingOut
        Session.Abandon()
    End Sub
End Class
