Imports CRUD
Imports Dados


Partial Class AdmVisitaEmpresa
    Inherits System.Web.UI.Page

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        Select Case e.Item.Value
            Case "0"

                Session("EmpresaID") = cbonome_fantasia.SelectedValue
                MultiView1.ActiveViewIndex = 0

                Exit Select

            Case "1"

                
                Session("EmpresaID") = cbonome_fantasia.SelectedValue

                MultiView1.ActiveViewIndex = 1

                CRUD.Limpa(ViewVisita)

                GridView1.DataBind()


                Exit Select
            Case "2"


                Session("EmpresaID") = cbonome_fantasia.SelectedValue

                MultiView1.ActiveViewIndex = 2

                GridView2.DataBind()


                Exit Select


        End Select

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            CRUD.Popula(ViewCandidato, sqlEmpresa)
        End If

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        lblmensagemBotao.Text = ""

        'gridRepresentantes.DataBind()
        lblEmpresaAviso.Text = ""
        'A empresa possui conta, mas a senha está errada
        Dim oEmpresa As New Empresas

        Session("_modoEmp") = "Alterar"

        Session("EmpresaID") = oEmpresa.ID(Session("EmpresaCNPJ"))

        'Verifico se o usuario cadastrou o nome da empresa para que possa
        'ser visualizado na tela.

        oEmpresa.PegaRegistro(Session("EmpresaCNPJ"))

        'If oEmpresa.Registro.Count = 0 Then
        'Response.Write("Sessão expirou...<br>")
        'Response.Write("<a href='empresa.aspx'>Clique aqui para logar novamente.</a>")
        'Response.End()
        'End If

        If Session("Empresa") Is DBNull.Value Then
            lblEmpresalogado.Text = ""
        Else
            lblEmpresalogado.Text = Session("Empresa")
        End If


    End Sub

    

    Protected Sub gridRepresentantes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridRepresentantes.SelectedIndexChanged

        Session("_modoRep") = "Alterar"

        Session("id_representante") = gridRepresentantes.SelectedValue()
        MultiView1.ActiveViewIndex = 2

        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboestado.SelectedIndexChanged

        cboid_municipio.DataBind()


    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        Session("EmpresaID") = cbonome_fantasia.SelectedValue

        If MultiView1.ActiveViewIndex = 0 Then
            If Session("_modoEmp") = "Alterar" Then

                'ALTERAR - Mudificado por Rafael - Dia 03/09/2008 Verificar com o André.
                'CRUD.Popula(View1, sqlEmpresa)

            ElseIf Session("_modoEmp") = "Incluir" Then

                'INCLUIR
                CRUD.Limpa(ViewCandidato)
            End If


        End If

    End Sub

    Protected Sub ibtSalvar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvar0.Click


        Session("empresaid") = cbonome_fantasia.SelectedValue


        CRUD.Popula(ViewCandidato, sqlEmpresa)

        CRUD.Limpa(ViewVisita)

        GridView1.DataBind()

    End Sub


    Protected Sub btnpesquisar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnpesquisar.Click
        Dim parEmpresa, parCNPJ As New Parameter

        SqlbuscaEmpresa.SelectParameters.Clear()

        parEmpresa.Name = "nome_fantasia"
        If txtBuscaEmpresa.Text.Length = 0 Then
            parEmpresa.DefaultValue = "%"
        Else
            parEmpresa.DefaultValue = txtBuscaEmpresa.Text
        End If
        SqlbuscaEmpresa.SelectParameters.Add(parEmpresa)

        parCNPJ.Name = "cnpj"
        If txtBuscaCNPJ.Text.Length = 0 Then
            parCNPJ.DefaultValue = "%"
        Else
            parCNPJ.DefaultValue = txtBuscaCNPJ.Text
        End If
        SqlbuscaEmpresa.SelectParameters.Add(parCNPJ)

        txtBuscaEmpresa.Text = ""
        txtBuscaCNPJ.Text = ""
    End Sub


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Session("EmpresaID") = cbonome_fantasia.SelectedValue

        CRUD.Popula(ViewVisita, SqlVisitaForm)
    End Sub

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        Session("EmpresaID") = cbonome_fantasia.SelectedValue

        Dim data As Date = datdatavisita.Text

        If verificaHoraExiste(cboid_captador1.SelectedValue, Format(data, "yyyy-MM-dd").ToString, txthoravisita.Text) Then
            lblmensagemBotao.Text = "Já existe uma entrevista marcada para essa data e horário."
        Else
            SqlVisitaForm.Insert()
        End If
        GridView1.DataBind()
        CRUD.Limpa(ViewVisita)
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        Session("EmpresaID") = cbonome_fantasia.SelectedValue
        SqlVisitaForm.Update()
        GridView1.DataBind()
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        CRUD.Limpa(ViewVisita)
    End Sub

    Function verificaHoraExiste(ByVal captador As String, ByVal data As String, ByVal hora As String) As Boolean
        Dim b As Boolean = False
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "select * from tblempresavisita where id_captador1=@captador and datavisita=@datavisita and dbo.fnHora2Decimal(horavisita)<=(dbo.fnHora2Decimal(@horavisita)+1800) and dbo.fnHora2Decimal(horavisita)>=(dbo.fnHora2Decimal(@horavisita)-1800)"

        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)

        Dim PCaptador As SqlParameter = New SqlParameter()
        PCaptador.ParameterName = "captador"
        PCaptador.Value = captador

        Dim PData As SqlParameter = New SqlParameter()
        PData.ParameterName = "datavisita"
        PData.Value = data

        Dim PHOra As SqlParameter = New SqlParameter()
        PHOra.ParameterName = "horavisita"
        PHOra.Value = hora

        cmd.Parameters.Add(PCaptador)
        cmd.Parameters.Add(PData)
        cmd.Parameters.Add(PHOra)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            b = True
        Else
            b = False
        End If

        conn.Dispose()
        cmd.Dispose()


        Return b


    End Function

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        Session("EmpresaID") = cbonome_fantasia.SelectedValue
        MultiView1.ActiveViewIndex = 1
        CRUD.Popula(ViewVisita, SqlVisitaForm)
    End Sub
End Class
