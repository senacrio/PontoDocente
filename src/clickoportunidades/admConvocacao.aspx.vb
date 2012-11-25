Imports Encryption64
Partial Class admVagasEdit
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD

#Region " Funções "
    Function verificaHoraExiste(ByVal captador As String, ByVal data As String, ByVal hora As String) As Boolean
        Dim b As Boolean = False
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "select * from tblentrevista where captador=@captador and dataClick=@data and dbo.fnHora2Decimal(horaclick)<=(dbo.fnHora2Decimal(@hora)+1800)	and dbo.fnHora2Decimal(horaclick)>=(dbo.fnHora2Decimal(@hora)-1800)"

        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)

        Dim PCaptador As SqlParameter = New SqlParameter()
        PCaptador.ParameterName = "captador"
        PCaptador.Value = captador

        Dim PData As SqlParameter = New SqlParameter()
        PData.ParameterName = "data"
        PData.Value = data

        Dim PHOra As SqlParameter = New SqlParameter()
        PHOra.ParameterName = "hora"
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

    Public Shared Sub Desabilitar(ByVal oContainer As View, ByVal ativar As Boolean)

        Dim oDataView As New System.Data.DataView

        For n = 0 To oContainer.Controls.Count - 1

            Dim oTxt As TextBox
            Dim oChk As CheckBox
            Dim oCbo As DropDownList
            Dim oGrid As GridView
            Dim oBtnImg As ImageButton


            Dim sCmp As String = Mid(oContainer.Controls(n).ID, 1, 3)

            If sCmp = "txt" Or sCmp = "moe" Or sCmp = "dat" Then
                oTxt = oContainer.Controls(n)
                oTxt.Enabled = ativar
            End If

            If sCmp = "chk" Then

                oChk = oContainer.Controls(n)
                oChk.Enabled = ativar

            End If

            If sCmp = "grid" Then
                oGrid = oContainer.Controls(n)
                oGrid.Enabled = ativar
                oGrid.DataBind()

            End If

            If sCmp = "cbo" Then
                oCbo = oContainer.Controls(n)
                oCbo.Enabled = ativar
            End If

            If sCmp = "btn" Then
                oBtnImg = oContainer.Controls(n)
                oBtnImg.Enabled = ativar
            End If


        Next

    End Sub

    'Public Shared Sub Atualizar(ByVal oContainer As HtmlForm)

    '    Dim oDataView As New System.Data.DataView

    '    For n = 0 To oContainer.Controls.Count - 1

    '        Dim oCbo As DropDownList


    '        Dim sCmp As String = Mid(oContainer.Controls(n).ID, 1, 3)

    '        If sCmp = "DDL" Then
    '            oCbo = oContainer.Controls(n)
    '            oCbo.DataBind()
    '        End If



    '    Next

    'End Sub

  
    Public Function PegaCPF(ByVal sID As String) As String

        Dim sRet As String

        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT identificador from tblCandidato where id_candidato='" + sID + "'"
        Dim oCmd As New SqlCommand(sSql, oCon)
        oCmd.Connection.Open()

        Dim oReader As SqlDataReader = oCmd.ExecuteReader()

        If oReader.HasRows Then
            oReader.Read()
            sRet = oReader("identificador")
        Else
            sRet = ""
        End If

        oReader.Close()
        oCmd.Dispose()
        oCon.Dispose()

        Return sRet

    End Function

    Public Sub PegaPerfilVaga(ByVal idvaga As Integer)
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "select id_cargo_fk,bairro,sexo from tblvaga where id_vaga=@id_vaga"

        Dim cmd As SqlCommand = New SqlCommand(sSql, oCon)

        Dim PIdvaga As SqlParameter = New SqlParameter()
        PIdvaga.ParameterName = "id_vaga"
        PIdvaga.Value = idvaga

        cmd.Parameters.Add(PIdvaga)
        oCon.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()

            Session("id_cargo_fk") = reader("id_cargo_fk")
            Session("bairro") = reader("bairro")
            Session("sexo") = reader("sexo")
        Else
            Session("id_cargo_fk") = 0
            Session("bairro") = ""
            Session("sexo") = ""

        End If

        oCon.Dispose()
        cmd.Dispose()
        reader.Close()


    End Sub

    Public Sub getDados(ByVal id As Integer)
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT     c.id_candidato, c.nome, c.identificador_tipo, c.identificador, c.rg, c.id_nacionalidade, c.nascimento, c.sexo, c.id_estadocivil, c.endereco, c.numero,c.complemento, c.bairro, c.id_municipio, c.estado_fk, c.cep, c.telefone, c.celular, c.telefone_recado, c.email, c.dependentes, c.observacao, c.id_contato,c.ultima_atualizacao, c.id_descobriu_fk, c.descobriu_outros, c.observacoes, c.senha, c.id_deficiente_fk, c.emailnao, c.nomePai, c.nomeMae, c.cidade,c.lembrete, c.id_evento, c.id_unidade, c.id_tipo_fk, ce.id_candidatoentr, ce.id_cadidato_fk, ce.id_entrevista_fk, ce.Captador, ce.DataCaptacao,isnull(ce.FormaEnc,0) as FormaEnc FROM         tblCandidato AS c LEFT OUTER JOIN tblCandidatoEntrevista AS ce ON c.id_candidato = ce.id_cadidato_fk where c.id_candidato=@id"

        Dim oCmd As SqlCommand = New SqlCommand(sSql, oCon)

        Dim Pid As SqlParameter = New SqlParameter()
        Pid.ParameterName = "id"
        Pid.Value = id

        oCmd.Parameters.Add(Pid)

        oCon.Open()

        Dim reader As SqlDataReader = oCmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            txtnome.Text = reader("nome").ToString
            cboid_unidade_fk.SelectedValue = reader("id_unidade")
            txtDataNascimento.Text = reader("nascimento")
            cboid_sexo_fk.SelectedValue = reader("sexo")
            txtidentificador.Text = reader("identificador")
            cboid_municipio_fk.SelectedValue = reader("id_municipio")
            txtbairro.Text = reader("bairro")
            txttelefone.Text = reader("telefone")
            cboid_formaenc_fk.SelectedValue = reader("FormaEnc")

        Else
            txtnome.Text = ""
            txtDataNascimento.Text = ""
            txtidentificador.Text = ""
            txtbairro.Text = ""
            txttelefone.Text = ""
            cboid_formaenc_fk.SelectedValue = 0
        End If

        oCon.Dispose()
        oCmd.Dispose()
        reader.Close()
    End Sub
    Public Sub desativarButao(ByVal ativar As Boolean)
        btnIncluir.Visible = Not ativar
        btnSalvar.Visible = ativar

    End Sub

    Public Sub Limpar()
        txtnome.Text = ""
        txtDataNascimento.Text = ""
        txtidentificador.Text = ""
        txtbairro.Text = ""
        txttelefone.Text = ""
        cboid_formaenc_fk.SelectedValue = 0
    End Sub

    Public Function UltimoCandidatoExtra() As Integer
        Dim S As String = ""
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "select max(id_candidato) as id_candidato_extra from tblcandidato where id_tipo_fk=2"

        Dim oCmd As SqlCommand = New SqlCommand(sSql, oCon)




        oCon.Open()

        Dim reader As SqlDataReader = oCmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            S = reader(0).ToString
        Else
            S = ""
        End If

        Return S

    End Function

#End Region

    Protected Sub RegsPag_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dteNow As Date = Now()

        'datdataretorno.Text = dteNow

        Session("_modo") = "Incluir"



        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If



        Dim oVaga As New Vagas

        oVaga.Vaga(Session("id_vaga"))

        Session("id_vaga") = oVaga.Vaga(Session("id_vaga"))

        oVaga.PossuiVaga(Session("id_vaga"))

        Session("id_vagacandidato") = oVaga.PossuiVaga(Session("id_vaga"))


    End Sub

    

    Protected Sub ibtCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        'MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblfechamento.Text = ""

        lblcomentario.Visible = False
        cbocomentario.Visible = False

        lblMsg.Text = ""

        'Session("c_Nome") = "Leandro Conceição"
        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not IsPostBack Then
            Session("empresavagasPopulado") = False
            Session("id_vaga") = ""
            Session("id_vaga_fk") = ""
        End If



        'lblAvisoCadastro.Visible = False
        'ImageButton1.Visible = False

        'lbltituloEmpresas.Visible = False




    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        'Session("id_vaga") = cboid_vaga.SelectedValue

        Gridcandidato0.DataBind()

        If Session("_modo") = "IncluirConv" Then
            CRUD.Limpa(ViewCandidatos)

        ElseIf Session("_modo") = "AlterarConv" Then
            CRUD.Popula(ViewCandidatos, sqlConvocacaoForm)

        End If
    End Sub
   

    Protected Sub View1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles View1.PreRender

       

    End Sub



    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)


        Dim Idcursos As String
        Dim btn As ImageButton = sender

        Session("id_candidato") = btn.CommandArgument.ToString

        Idcursos = Session("id_candidato")

        Dim strURL As String = "Curriculo.aspx?id_candidato=" & encryptQueryString(Idcursos)

        Response.Redirect(strURL)

    End Sub

    Protected Sub btnAgendar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub



   
    Protected Sub IraPag(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub ViewCandidatos_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ViewCandidatos.Load
        If GridEntrevistaGeral.SelectedIndex = -1 Then
            lblErro.Text = "Selecione uma entrevista."
            Desabilitar(ViewCandidatos, False)
        Else
            lblErro.Text = ""
            Desabilitar(ViewCandidatos, True)
        End If
    End Sub

   
    Protected Sub GridEntrevistaGeral_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaGeral.SelectedIndexChanged
        ' MultiView1.ActiveViewIndex = 2

        Session("id_vaga") = GridEntrevistaGeral.DataKeys(GridEntrevistaGeral.SelectedIndex).Values("id_vaga_fk")

        Session("id_entrevista") = GridEntrevistaGeral.SelectedValue


        lblErro.Text = ""
        Desabilitar(ViewCandidatos, True)


        CRUD.Popula(View2, sqlVagaForm)


        Gridcandidato0.DataBind()


    End Sub


    Protected Sub sqlConvocacaoForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqlConvocacaoForm.Inserted
        CRUD.Limpa(ViewCandidatos)

    End Sub

    Protected Sub Gridcandidato0_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Gridcandidato0.SelectedIndexChanged
        Session("_modo") = ""
        
        Session("id_candidato") = Gridcandidato0.SelectedValue
    End Sub

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        GridEntrevistaGeral.DataBind()

    End Sub

    Protected Sub ImageButton7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton7.Click

        Session("id_vaga") = GridEntrevistaGeral.DataKeys(GridEntrevistaGeral.SelectedIndex).Values("id_vaga_fk")

        Dim total As Integer = 0

        If GridEntrevistaGeral.SelectedIndex = -1 Then
            lblMsg.Text = "Selecione uma entrevista."
        Else
            For i As Integer = 0 To Gridcandidato0.Rows.Count - 1

                If Gridcandidato0.Rows(i).RowType = DataControlRowType.DataRow Then
                    If CType(Gridcandidato0.Rows(i).FindControl("RadioButtonList2"), RadioButtonList).SelectedIndex <> -1 Then

                        sqlConvocacaoForm.InsertParameters("formaenc").DefaultValue = CType(Gridcandidato0.Rows(i).FindControl("RadioButtonList2"), RadioButtonList).SelectedValue
                        sqlConvocacaoForm.InsertParameters("id_cadidato_fk").DefaultValue = Gridcandidato0.Rows(i).Cells(1).Text
                        Try
                            sqlConvocacaoForm.Insert()

                            total = total + 1
                        Catch ex As Exception
                            lblMsg.Text = ex.Message.ToString
                        Finally
                            lblMsg.Text = "Você encaminhou: " + total.ToString + " candidatos."
                            lblErro.Text = "Você encaminhou: " + total.ToString + " candidatos."
                        End Try

                    End If
                End If


            Next



            Gridcandidato0.DataBind()
            GridEncaminhados.DataBind()

        End If

        
    End Sub

    Protected Sub Gridcandidato0_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Gridcandidato0.RowCreated

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim btn As ImageButton = e.Row.FindControl("btnViewCandidato0")
            ScriptManager1.RegisterPostBackControl(btn)
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        For i As Integer = 0 To Gridcandidato0.Rows.Count - 1

            If Gridcandidato0.Rows(i).RowType = DataControlRowType.DataRow Then
                CType(Gridcandidato0.Rows(i).FindControl("RadioButtonList2"), RadioButtonList).SelectedIndex = -1


            End If
        Next
        lblErro.Text = ""
        lblMsg.Text = ""
    End Sub

    Protected Sub ImageButton8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton8.Click

        Session("id_vaga") = GridEntrevistaGeral.DataKeys(GridEntrevistaGeral.SelectedIndex).Values("id_vaga_fk")


        Dim total As Integer = 0

        If GridEntrevistaGeral.SelectedIndex = -1 Then
            lblMsg.Text = "Selecione uma entrevista."
        Else
            For i As Integer = 0 To Gridcandidato0.Rows.Count - 1

                If Gridcandidato0.Rows(i).RowType = DataControlRowType.DataRow Then
                    If CType(Gridcandidato0.Rows(i).FindControl("RadioButtonList2"), RadioButtonList).SelectedIndex <> -1 Then

                        sqlConvocacaoForm.InsertParameters("formaenc").DefaultValue = CType(Gridcandidato0.Rows(i).FindControl("RadioButtonList2"), RadioButtonList).SelectedValue
                        sqlConvocacaoForm.InsertParameters("id_cadidato_fk").DefaultValue = Gridcandidato0.Rows(i).Cells(1).Text
                        Try
                            sqlConvocacaoForm.Insert()

                            total = total + 1
                        Catch ex As Exception
                            lblErro.Text = ex.Message.ToString
                        Finally
                            lblErro.Text = "Você encaminhou: " + total.ToString + " candidato(s)."
                            lblMsg.Text = "Você encaminhou: " + total.ToString + " candidatos(s)."
                        End Try

                    End If
                End If


            Next

            Gridcandidato0.DataBind()
            GridEncaminhados.DataBind()
        End If

    End Sub

    Protected Sub GridEncaminhados_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridEncaminhados.RowDeleted
        Gridcandidato0.DataBind()

    End Sub

    Protected Sub ImageButton10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnIncluir.Click
        Try
            ' sqlEncaminharExtra.InsertParameters("id_candidato_extra").DefaultValue = UltimoCandidatoExtra()

            

            sqlNovosCandidatosForm.Insert()
            'sqlEncaminharExtra.Insert()
            sqlConvocacaoForm.InsertParameters("formaenc").DefaultValue = cboid_formaenc_fk.SelectedValue
            sqlConvocacaoForm.InsertParameters("id_cadidato_fk").DefaultValue = Integer.Parse(UltimoCandidatoExtra())

            sqlConvocacaoForm.Insert()

            Limpar()
            GridNovosCandidatos.DataBind()
            GridEncaminhadosExtra.DataBind()
            lblmsgcandidatoextra.Text = "Candidato cadastrado."
        Catch ex As Exception

            lblmsgcandidatoextra.Text = "Erro: " + ex.Message.ToString
        End Try

    End Sub

    Protected Sub GridNovosCandidatos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridNovosCandidatos.SelectedIndexChanged
        desativarButao(True)
        getDados(GridNovosCandidatos.SelectedValue)
        lblmsgcandidatoextra.Text = ""
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvar.Click
        Try
            sqlNovosCandidatosForm.Update()
            GridNovosCandidatos.DataBind()
            GridNovosCandidatos.SelectedIndex = -1

            Limpar()
            desativarButao(False)
            lblmsgcandidatoextra.Text = "Candidato Alterado."
        Catch ex As Exception
            lblmsgcandidatoextra.Text = "Erro: " + ex.Message.ToString

        End Try

    End Sub

       Protected Sub ImageButton13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton13.Click
        Limpar()
        desativarButao(False)
        lblmsgcandidatoextra.Text = ""
    End Sub

    Protected Sub ImageButton15_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub GridEncaminhadosExtra_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridEncaminhadosExtra.RowDeleted

        GridNovosCandidatos.DataBind()

    End Sub

    Protected Sub ImageButton16_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        sqlConvocacaoForm.InsertParameters("formaenc").DefaultValue = cboid_formaenc_fk.SelectedValue
        sqlConvocacaoForm.InsertParameters("id_cadidato_fk").DefaultValue = Integer.Parse(UltimoCandidatoExtra())

        sqlConvocacaoForm.Insert()

        GridEncaminhadosExtra.DataBind()

    End Sub


    Protected Sub ImageButton16_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton16.Click
        Sqlfechamento.Update()
        lblfechamento.Text = "Fechamento da vaga realizado com sucesso."
        GridEntrevistaGeral.DataBind()
    End Sub

    Protected Sub cbofechamento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbofechamento.SelectedIndexChanged
        If cbofechamento.SelectedValue = 15 Then
            lblcomentario.Visible = True
            cbocomentario.Visible = True
        Else
            lblcomentario.Visible = False
            cbocomentario.Visible = False
            cbocomentario.SelectedIndex = 0
        End If

    End Sub



    Protected Sub GridEntrevistaGeral_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevistaGeral.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then


            CType(e.Row.FindControl("sqlcaptadores"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text


        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text

        End If
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        Gridcandidato0.DataBind()
    End Sub

 
    Protected Sub GridEncaminhadosExtra_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEncaminhadosExtra.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text

        End If
    End Sub

   
End Class
