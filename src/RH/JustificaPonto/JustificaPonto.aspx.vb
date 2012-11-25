
Partial Class Ponto_JustificaPonto
    Inherits System.Web.UI.Page

    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
    Dim btnSalvar As Button = New Button()



    Private Function BatidaExiste(ByVal data As Date, ByVal matricula As String) As Boolean

        Dim b As Boolean = False

        Dim cmd As SqlCommand = New SqlCommand("select * from ponto where matric=@matric and data=@data", conn)

        Dim pMatricula As SqlParameter = New SqlParameter
        pMatricula.ParameterName = "matric"
        pMatricula.Value = matricula

        Dim pData As SqlParameter = New SqlParameter()
        pData.ParameterName = "data"
        pData.Value = data

        cmd.Parameters.Add(pMatricula)
        cmd.Parameters.Add(pData)
        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader

        reader.Read()


        If reader.HasRows Then
            b = True
        Else
            b = False

        End If
        conn.Close()
        cmd.Dispose()
        reader.Close()

        Return b

    End Function

    Private Function Verifica11Horas(ByVal sMatricula As Integer, ByVal data As DateTime, ByVal hora As String) As Boolean
        Dim b As Boolean = False
        Dim conn2 As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)

        Dim cmd As SqlCommand = New SqlCommand("EXEC [prVerifica11horas]  @Matricula  ,@Data  ,@Hora", conn2)
        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.DbType = DbType.Int32

        PMatricula.ParameterName = "@Matricula"
        PMatricula.Value = sMatricula

        Dim PData As SqlParameter = New SqlParameter()
        PData.DbType = DbType.DateTime
        PData.ParameterName = "@Data"
        PData.Value = data

        Dim PHora As SqlParameter = New SqlParameter()
        PHora.DbType = DbType.String
        PHora.ParameterName = "@Hora"
        PHora.Value = hora

        cmd.Parameters.Add(PMatricula)
        cmd.Parameters.Add(PData)
        cmd.Parameters.Add(PHora)

        conn2.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            b = Boolean.Parse(reader(0))
        End If

        conn2.Dispose()
        cmd.Dispose()
        reader.Close()

        Return b
    End Function

    'Retorna descrição do cargo
    Private Function PegaDesCargo(ByVal sMatricula As String) As String
        Dim s As String = ""

        Dim sSql As String = "SELECT des_cargo FROM SGT_RHFuncionario INNER JOIN View_RHCargo ON SGT_RHFuncionario.cdn_cargo_basic = View_RHCargo.cdn_cargo_basic AND SGT_RHFuncionario.cdn_niv_cargo = View_RHCargo.cdn_niv_cargo WHERE     (SGT_RHFuncionario.cdn_funcionario = @Matricula)"
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()
        Dim PMatricula As SqlParameter = New SqlParameter()

        PMatricula.ParameterName = "matricula"
        PMatricula.Value = sMatricula
        oCmd.Parameters.Add(PMatricula)

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            s = oRd("des_cargo")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return s

    End Function
    'Retorna lotação
    Private Function PegaUnidadeLotacao(ByVal sMatricula As String) As Integer
        Dim i As Integer

        Dim sSql As String = "SELECT cod_unid_lotac  FROM RHFuncionario where cdn_funcionario = '" + sMatricula + "' And dat_desligto_func is null"
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            i = oRd("cod_unid_lotac")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return i

    End Function
    'Verifica se hora existe
    Private Function HoraExiste(ByVal Data As String, ByVal hora As String, ByVal Matricula As Integer) As Boolean
        Dim b As Boolean = False

        Dim cmd As SqlCommand = New SqlCommand("select * from ponto where data=@data and left(hora,5)=@hora and matric=@matricula", conn)

        Dim PData As SqlParameter = New SqlParameter()
        PData.ParameterName = "data"
        PData.SqlDbType = SqlDbType.DateTime
        PData.Value = Data

        Dim PHora As SqlParameter = New SqlParameter()
        PHora.ParameterName = "hora"
        PHora.Value = hora

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "matricula"
        PMatricula.Value = Matricula

        cmd.Parameters.Add(PData)
        cmd.Parameters.Add(PHora)
        cmd.Parameters.Add(PMatricula)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()
        reader.Read()

        If reader.HasRows Then
            b = True
        Else
            b = False
        End If


        conn.Close()
        cmd.Dispose()
        reader.Close()

        Return b

    End Function

    

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            btnSalvarI = sender
            lblErro.Text = "Registro alterado."
        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
    End Sub

    Protected Sub grdPonto_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdPonto.SelectedIndexChanged
        Session("sDataAntiga") = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("lblData"), Label).Text
        Session("sHoraEntrada") = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtEntrada"), TextBox).Text
        Session("sHoraSaida") = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtSaida"), TextBox).Text
        Session("sMatricula") = grdPonto.DataKeys(grdPonto.SelectedIndex).Values("matric")
        Session("sIDAjuste") = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("cboAcao"), DropDownList).SelectedValue


        For i As Integer = 0 To grdPonto.Rows.Count - 1
            Dim txtE As TextBox = grdPonto.Rows(i).FindControl("txtEntrada")
            txtE.Enabled = False
            Dim txtJ As TextBox = grdPonto.Rows(i).FindControl("txtJustificativa")
            txtJ.Enabled = False
            Dim txtS As TextBox = grdPonto.Rows(i).FindControl("txtSaida")
            txtS.Enabled = False


            Dim cboA As DropDownList = grdPonto.Rows(i).FindControl("cboAcao")
            cboA.Enabled = False

            Dim valA As RequiredFieldValidator = grdPonto.Rows(i).FindControl("valAcao")
            valA.Enabled = False

            Dim valJ As RequiredFieldValidator = grdPonto.Rows(i).FindControl("valJustificativa")
            valJ.Enabled = False


            Dim valb As CompareValidator = grdPonto.Rows(i).FindControl("Comparevalidator1")
            valb.Enabled = False

            Dim btn As Button = grdPonto.Rows(i).FindControl("btnSalvar")
            btn.Enabled = False

        Next

        Dim cboAcao As DropDownList = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("cboAcao")
        cboAcao.Enabled = True


        Dim btnSalvar As Button = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("btnSalvar")
        btnSalvar.Enabled = True

        Dim txtJustificativa As TextBox = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtJustificativa")
        txtJustificativa.Enabled = True

        Dim txtEntrada As TextBox = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtEntrada")
        txtEntrada.Enabled = True

        Dim valAcao As RequiredFieldValidator = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("valAcao")
        valAcao.Enabled = True

        Dim valJustificativa As RequiredFieldValidator = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("valJustificativa")
        valJustificativa.Enabled = True


        Dim valComp As CompareValidator = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("CompareValidator1")
        valComp.Enabled = True

        Dim txtSaida As TextBox = grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtSaida")
        txtSaida.Enabled = True


    End Sub

    Protected Sub grdPonto_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdPonto.RowCommand

       

        If btnSalvarI.CommandName = "salvar" Then


            Dim data As DateTime = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("lblData"), Label).Text
            Dim entrada As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtEntrada"), TextBox).Text
            Dim saida As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtSaida"), TextBox).Text
            Dim matricula As Integer = grdPonto.DataKeys(grdPonto.SelectedIndex).Values("matric")
            Dim ajuste As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("cboAcao"), DropDownList).SelectedValue
            Dim justificativa As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtJustificativa"), TextBox).Text



            'Verifica se hora de entrada existe
            If HoraExiste(data, entrada, matricula) Then

                If Verifica11Horas(matricula, data, saida) And Verifica11Horas(matricula, data, entrada) Then
                    sdsPonto.InsertParameters("Hora").DefaultValue = saida
                    sdsPonto.InsertParameters("Data").DefaultValue = Format(data, "dd/MM/yyyy")
                    sdsPonto.InsertParameters("Matric").DefaultValue = matricula
                    sdsPonto.InsertParameters("Id_Ajuste").DefaultValue = ajuste
                    sdsPonto.InsertParameters("Justificativa").DefaultValue = justificativa
                    sdsPonto.Insert()

                    sdsPonto.UpdateParameters("hora").DefaultValue = entrada
                    sdsPonto.UpdateParameters("data").DefaultValue = Format(data, "yyyy-MM-dd")
                    sdsPonto.UpdateParameters("matric").DefaultValue = matricula
                    sdsPonto.UpdateParameters("Id_Ajuste").DefaultValue = ajuste
                    sdsPonto.UpdateParameters("justificativa").DefaultValue = justificativa
                    sdsPonto.Update()

                    Try
                        Session("acao") = "Justificou Ponto"
                        sdsLog.InsertParameters("DataJustificada").DefaultValue = data
                        sdsLog.Insert()

                    Catch ex As Exception

                    End Try
                Else
                    lblErro.Text = "Registro não permitido. Deverá ser observado o limite obrigatório de intervalo de  11 horas entre o final de uma jornada e início de outra."
                End If



                

                'Verifica se hora de saida existe
            ElseIf HoraExiste(data, saida, matricula) Then

                If Verifica11Horas(matricula, data, entrada) And Verifica11Horas(matricula, data, entrada) Then
                    sdsPonto.InsertParameters("Hora").DefaultValue = entrada
                    sdsPonto.InsertParameters("Data").DefaultValue = data
                    sdsPonto.InsertParameters("Matric").DefaultValue = matricula
                    sdsPonto.InsertParameters("Id_Ajuste").DefaultValue = ajuste
                    sdsPonto.InsertParameters("Justificativa").DefaultValue = justificativa
                    sdsPonto.Insert()

                    sdsPonto.UpdateParameters("Hora").DefaultValue = saida
                    sdsPonto.UpdateParameters("Data").DefaultValue = Format(data, "yyyy-MM-dd")
                    sdsPonto.UpdateParameters("Matric").DefaultValue = matricula
                    sdsPonto.UpdateParameters("Id_Ajuste").DefaultValue = ajuste
                    sdsPonto.InsertParameters("Justificativa").DefaultValue = justificativa
                    sdsPonto.Update()

                    Try
                        Session("acao") = "Editou Justificativa"
                        sdsLog.InsertParameters("DataJustificada").DefaultValue = data
                        sdsLog.Insert()

                    Catch ex As Exception

                    End Try
                Else
                    lblErro.Text = "Registro não permitido. Deverá ser observado o limite obrigatório de intervalo de  11 horas entre o final de uma jornada e início de outra."
                End If

                End If
        End If

        If btnSalvarI.CommandName = "editar" Then

            Dim data As DateTime = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("lblData"), Label).Text
            Dim entrada As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtEntrada"), TextBox).Text
            Dim saida As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtSaida"), TextBox).Text
            Dim matricula As Integer = grdPonto.DataKeys(grdPonto.SelectedIndex).Values("matric")
            Dim ajuste As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("cboAcao"), DropDownList).SelectedValue
            Dim justificativa As String = CType(grdPonto.Rows(grdPonto.SelectedIndex).FindControl("txtJustificativa"), TextBox).Text

            If Verifica11Horas(matricula, data, entrada) And Verifica11Horas(matricula, data, saida) Then
                sdsEditarHorario.UpdateParameters("horaantiga").DefaultValue = Session("sHoraEntrada")
                sdsEditarHorario.UpdateParameters("data").DefaultValue = Session("sDataAntiga")
                sdsEditarHorario.UpdateParameters("hora").DefaultValue = entrada
                sdsEditarHorario.UpdateParameters("data").DefaultValue = Format(data, "yyyy-MM-dd")
                sdsEditarHorario.UpdateParameters("matric").DefaultValue = matricula
                sdsEditarHorario.UpdateParameters("Id_Ajuste").DefaultValue = ajuste
                sdsEditarHorario.UpdateParameters("Justificativa").DefaultValue = justificativa
                sdsEditarHorario.Update()



                sdsEditarHorario.UpdateParameters("horaantiga").DefaultValue = Session("sHoraSaida")
                sdsEditarHorario.UpdateParameters("data").DefaultValue = Session("sDataAntiga")
                sdsEditarHorario.UpdateParameters("hora").DefaultValue = saida
                sdsEditarHorario.UpdateParameters("data").DefaultValue = Format(data, "yyyy-MM-dd")
                sdsEditarHorario.UpdateParameters("matric").DefaultValue = matricula
                sdsEditarHorario.UpdateParameters("Id_Ajuste").DefaultValue = ajuste
                sdsEditarHorario.UpdateParameters("Justificativa").DefaultValue = justificativa
                sdsEditarHorario.Update()

                Try
                    Session("acao") = "Editou Justificativa"
                    sdsLog.InsertParameters("DataJustificada").DefaultValue = Session("sDataAntiga")
                    sdsLog.Insert()

                Catch ex As Exception
                End Try
            Else
                lblErro.Text = "Registro não permitido. Deverá ser observado o limite obrigatório de intervalo de  11 horas entre o final de uma jornada e início de outra."
            End If

        End If

        grdPonto.DataBind()

    End Sub

    Protected Sub grdPonto_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdPonto.RowDataBound
        'If e.Row.RowType = DataControlRowType.DataRow Then

        '    If CType(e.Row.FindControl("cboAcao"), DropDownList).SelectedValue = "" Then
        '        e.Row.Enabled = True
        '    Else
        '        e.Row.Enabled = False
        '    End If
        'End If


    End Sub

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIncluir.Click
        grdPonto.SelectedIndex = -1

        For i As Integer = 0 To grdPonto.Rows.Count - 1
            Dim txtE As TextBox = grdPonto.Rows(i).FindControl("txtEntrada")
            txtE.Enabled = False

            Dim txtJ As TextBox = grdPonto.Rows(i).FindControl("txtJustificativa")
            txtJ.Enabled = False

            Dim txtS As TextBox = grdPonto.Rows(i).FindControl("txtSaida")
            txtS.Enabled = False

            Dim cboA As DropDownList = grdPonto.Rows(i).FindControl("cboAcao")
            cboA.Enabled = False

            Dim btn As Button = grdPonto.Rows(i).FindControl("btnSalvar")
            btn.Enabled = False

            Dim valA As RequiredFieldValidator = grdPonto.Rows(i).FindControl("valAcao")
            valA.Enabled = False

            Dim valJ As RequiredFieldValidator = grdPonto.Rows(i).FindControl("valJustificativa")
            valJ.Enabled = False

            Dim valb As CompareValidator = grdPonto.Rows(i).FindControl("Comparevalidator1")
            valb.Enabled = False

        Next

        pnlPonto.Visible = True
    End Sub

    Protected Sub btnCancelarI_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelarI.Click
        pnlPonto.Visible = False
    End Sub

    Protected Sub btnSalvarI_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvarI.Click
        If txtDataI.Text > "01/02/2010" Then


            If Convert.ToDateTime(txtDataI.Text) < Convert.ToDateTime(Now.ToString("dd/MM/yyyy")) Then

                If Not BatidaExiste(txtDataI.Text, Session("c_Matricula")) Then
                    If Verifica11Horas(Session("c_Matricula"), txtDataI.Text, txtEntradaI.Text) And Verifica11Horas(Session("c_Matricula"), txtDataI.Text, txtSaidaI.Text) Then
                        Try
                            sdsIncluirPonto.InsertParameters("hora").DefaultValue = txtEntradaI.Text
                            sdsIncluirPonto.Insert()
                            sdsIncluirPonto.InsertParameters("hora").DefaultValue = txtSaidaI.Text
                            sdsIncluirPonto.Insert()
                            lblErro.Text = "Ponto incluído."

                            'REGISTRA LOG 
                            Try
                                Session("acao") = "Incluiu Ponto"
                                sdsLog.InsertParameters("DataJustificada").DefaultValue = txtDataI.Text
                                sdsLog.Insert()

                            Catch ex As Exception

                            End Try
                        Catch ex As Exception
                            lblErro.Text = ex.Message.ToString()

                        Finally
                            grdPonto.DataBind()

                            txtDataI.Text = ""
                            txtEntradaI.Text = ""
                            txtSaidaI.Text = ""
                            pnlPonto.Visible = False
                        End Try
                    Else

                        lblErro.Text = "Registro não permitido. Deverá ser observado o limite obrigatório de intervalo de  11 horas entre o final de uma jornada e início de outra."
                    End If
                Else
                    lblErro.Text = "Já existe uma marcação para esse dia."

                End If


            Else
                lblErro.Text = "A data não pode ser igual ou superior a hoje."
            End If
        Else
            lblErro.Text = "Justificativa não pode ser feita nessa data."
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not Page.IsPostBack Then
        '    cboMes.SelectedValue = Now.Month
        'End If
        lblErro.Text = ""
	   If Not Page.IsPostBack Then
            Try
                Utilitario.RegistraLog()
            Catch
            End Try

        End If
        'Session("c_Matricula") = "9782"
        'Session("c_Matricula") = "8123"
        'Session("c_Matricula") = "10830"

        'Session("sDiaData") = Format(DateTime.Now.AddDays(-1), "yyyy-MM-dd")
        'Session("sCargo") = Left(PegaDesCargo(Session("c_Matricula")), 3)
        'Session("sLotacao") = PegaUnidadeLotacao(Session("c_Matricula")) '"300010" 
    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        'btnIncluir.Visible = True
        grdPonto.DataBind()

    End Sub

    Protected Sub cboAcaoI_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAcaoI.SelectedIndexChanged
        If cboAcaoI.SelectedValue = 5 Then
            txtDataI.Text = "17/02/2010"
            txtDataI.ReadOnly = True
            txtDataI_CalendarExtender.Enabled = False

            txtJustificativaI.Text = "Quarta Feira de Carnaval."
            txtJustificativaI.ReadOnly = True
        Else
            txtEntradaI.Text = ""
            txtSaidaI.Text = ""
            txtDataI.Text = ""
            txtDataI.ReadOnly = False
            txtJustificativaI.Text = ""
            txtDataI_CalendarExtender.Enabled = True
            txtJustificativaI.ReadOnly = False
        End If
    End Sub
End Class
