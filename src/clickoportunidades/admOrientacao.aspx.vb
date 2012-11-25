Imports Encryption64
Partial Class admVagasEdit
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD

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





    Protected Sub ibtCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        'MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'Session("c_Nome") = "Leandro Conceição"
        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not IsPostBack Then
            Session("empresavagasPopulado") = False
            Session("id_vaga") = ""
            Session("id_vaga_fk") = ""
        End If


        If Not IsPostBack Then

            lblentrevista.Text = ""
            lblfechamento0.Text = ""


        End If




    End Sub

    Protected Sub GridEntrevistaGeral_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaGeral.SelectedIndexChanged
        ' MultiView1.ActiveViewIndex = 2

        Session("id_vaga") = GridEntrevistaGeral.DataKeys(GridEntrevistaGeral.SelectedIndex).Values("id_vaga_fk")

        Session("id_entrevista") = GridEntrevistaGeral.SelectedValue


    End Sub


    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        GridEntrevistaGeral.DataBind()

    End Sub

    Protected Sub GridEntrevistaGeral_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevistaGeral.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then


            CType(e.Row.FindControl("sqlcaptadores"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text

            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text
            CType(e.Row.FindControl("sqlrepresentantes"), SqlDataSource).SelectParameters("id_empresa").DefaultValue = DataBinder.Eval(e.Row.DataItem, "id_empresa")

        End If

    End Sub

    Protected Sub ImageButton16_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton16.Click
        If gridorientados.SelectedIndex <> -1 Then
            lblMsg.Text = "Selecione um candidato na lista."
        Else

            If GridEntrevistaGeral.SelectedIndex <> -1 Then

                Session("id_entrevista") = GridEntrevistaGeral.DataKeys(GridEntrevistaGeral.SelectedIndex).Values("id_entrevista")


                Dim total As Integer = 0

                If GridEntrevistaGeral.SelectedIndex = -1 Then
                    lblMsg.Text = "Selecione uma entrevista."
                Else
                    For i As Integer = 0 To gridorientados.Rows.Count - 1

                        If gridorientados.Rows(i).RowType = DataControlRowType.DataRow Then
                            If CType(gridorientados.Rows(i).FindControl("rdid_statusOrient"), RadioButtonList).SelectedIndex <> -1 And CType(gridorientados.Rows(i).FindControl("rdid_aptoEncam"), RadioButtonList).SelectedIndex <> -1 And CType(gridorientados.Rows(i).FindControl("txtorientacaocandidato"), TextBox).Text <> "" Then
                                SqlorientadosSemVaga.InsertParameters("id_statusOrient").DefaultValue = CType(gridorientados.Rows(i).FindControl("rdid_statusOrient"), RadioButtonList).SelectedValue
                                SqlorientadosSemVaga.InsertParameters("id_aptoEncam").DefaultValue = CType(gridorientados.Rows(i).FindControl("rdid_aptoEncam"), RadioButtonList).SelectedValue
                                SqlorientadosSemVaga.InsertParameters("id_candidato_fk").DefaultValue = CType(gridorientados.Rows(i).FindControl("lblcandidato"), Label).Text
                                SqlorientadosSemVaga.InsertParameters("id_entrevista_fk").DefaultValue = CType(gridorientados.Rows(i).FindControl("lblentrevista"), Label).Text

                                SqlorientadosSemVaga.InsertParameters("orientacaocandidato").DefaultValue = CType(gridorientados.Rows(i).FindControl("txtorientacaocandidato"), TextBox).Text
                                Try
                                    SqlorientadosSemVaga.Insert()

                                    total = total + 1
                                Catch ex As Exception

                                    lblentrevista.Text = "Você já inseriu esses candidatos para a entrevista selecionada."
                                Finally
                                    lblfechamento0.Text = "Você orientou: " + total.ToString + " candidato(s)."

                                End Try

                            End If
                        End If
                    Next

                    gridorientados.DataBind()
                    GridorientadosOK.DataBind()

                End If

            Else
                lblentrevista.Text = "*Selecione uma entrevista."
            End If

        End If

    End Sub



    Protected Sub GridorientadosOK_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridorientadosOK.SelectedIndexChanged
        Session("id_candidato") = GridorientadosOK.DataKeys(GridorientadosOK.SelectedIndex).Values("id_cadidato_fk")
        SqlorientadosSemVaga0.Delete()
    End Sub

    Protected Sub GridorientadosOK_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridorientadosOK.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(0).Text
            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_candidato").DefaultValue = DataBinder.Eval(e.Row.DataItem, "id_cadidato_fk")
           
        End If
    End Sub

End Class
