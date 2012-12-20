Imports System.IO
Imports Senac.ControleRHDocente
Imports System.Linq
Imports System.Collections.Generic

Partial Class FrequenciaDocente_AgendaExecutada
    Inherits System.Web.UI.Page
    ' Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"

    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"
    Dim listaAgendaExecutada As List(Of AgendaExecutada)
    Dim parametroAtivo As Parametro
    Dim guidArquivo As String

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        guidArquivo = Guid.NewGuid().ToString()
        Me.listaAgendaExecutada = New List(Of AgendaExecutada)

        If (FileUpload1.PostedFile.ContentLength.Equals(0)) Then
            lblMsg.Text = "Selecione um arquivo"
            lblMsg.ForeColor = Drawing.Color.Red
        Else

            Try
                Dim str As New StreamReader(FileUpload1.PostedFile.InputStream)
                Dim db As New FrequenciaDocenteDataContext(conn)

                Dim linha As String

                Do
                    linha = str.ReadLine()

                    Dim ae As New AgendaExecutada()
                    ae.Id = Guid.NewGuid().ToString()
                    ae.DataHoraRegistro = DateTime.Now

                    If (Not String.IsNullOrEmpty(linha)) Then
                        LoadAgendaExecutada(ae, linha)
                        ValidaAgendaExecutada(linha.Split(";")(1))
                        Me.listaAgendaExecutada.Add(ae)

                    End If



                Loop Until linha Is Nothing

                If (Not Me.listaAgendaExecutada Is Nothing) And (Me.listaAgendaExecutada.Count > 0) Then
                    db.AgendaExecutadas.InsertAllOnSubmit(Me.listaAgendaExecutada)
                    db.SubmitChanges()
                End If


                Download()

                lblMsg.Text = "Arquivo salvo com sucesso"
                lblMsg.ForeColor = Drawing.Color.Green

                grdArquivos.Rows(0).BackColor = Drawing.Color.Yellow

            Catch ex As Exception
                lblMsg.Text = ex.Message
                lblMsg.ForeColor = Drawing.Color.Red


            End Try



        End If
    End Sub

    Private Sub LoadAgendaExecutada(ae As AgendaExecutada, linha As String)
        'ae.Unidade = linha.Substring(0, 3)
        'ae.Data = linha.Substring(3, 8)
        'ae.HoraInicial = linha.Substring(11, 5)
        'ae.HoraFinal = linha.Substring(19, 5)
        'ae.Disciplina = linha.Substring(27, 8)
        'ae.Turma = linha.Substring(35, 7)
        'ae.SalarioHora = linha.Substring(42, 11)
        'ae.Matricula = linha.Substring(53, 10)
        'ae.Status = linha.Substring(63, 9)
        'ae.Categoria = linha.Substring(72, 1)

        ae.Unidade = linha.Split(";")(10)
        ae.Data = Convert.ToDateTime(linha.Split(";")(1)).ToString("ddMMyyyy")
        ae.HoraInicial = linha.Split(";")(2).Substring(0, 5)
        ae.HoraFinal = linha.Split(";")(2).Substring(8, 5)
        ae.Disciplina = linha.Split(";")(4)
        ae.Turma = linha.Split(";")(5)
        ae.SalarioHora = linha.Split(";")(6)
        ae.Matricula = linha.Split(";")(7)
        ae.Status = linha.Split(";")(8)
        ae.Categoria = linha.Split(";")(0)
        ae.IdParametro = Me.parametroAtivo.Id
        ae.ArquivoDownload = "ArquivoAgendaExecutada/" & parametroAtivo.Ano.ToString() + "_" + parametroAtivo.Mes.ToString() + "_" + parametroAtivo.Versao.ToString() + "-" + guidArquivo + ".TXT"
    End Sub

    Private Sub Download()
        Dim linhas As New StringBuilder()

        For Each ae As AgendaExecutada In Me.listaAgendaExecutada
            linhas.AppendLine(GetLinha(ae))
        Next

        Dim sw As New StreamWriter(MapPath(Me.listaAgendaExecutada(0).ArquivoDownload))
        sw.WriteLine(linhas.ToString())
        sw.Close()
        sw.Dispose()

        LoadGrid()
    End Sub

    Private Function GetLinha(ae As AgendaExecutada) As Object
        Dim s As String

        Dim situacao As String = ""


        If (ae.Status.ToUpper().Contains("EXECUTADA")) Then
            situacao = "EXECUTADA" + ae.Categoria

        ElseIf ae.Status.ToUpper().Contains("AFASTADO") Then
            situacao = "AFASTADO " + ae.Categoria

        End If

        s = ae.Unidade & ae.Data & ae.HoraInicial & ":00" & ae.HoraFinal & ":00" & _
            ae.Disciplina.PadRight(10, " ") & ae.Turma.PadRight(10, " ") & _
            ae.SalarioHora.ToString().PadRight(8, " ") & ae.Matricula.PadLeft(8, "0") & situacao

        Return s
    End Function

    Private Sub ValidaAgendaExecutada(dataAe As String)


        If (parametroAtivo Is Nothing) Then
            Throw New Exception("Está faltando cadastro do período")
        End If

        Dim dataInicial = Convert.ToDateTime("20" + parametroAtivo.PCO_DE)
        Dim dataFinal = Convert.ToDateTime("20" + parametroAtivo.PCO_ATE)

        Dim data = Convert.ToDateTime(dataAe)


        If Not ((data >= dataInicial) And (data <= dataFinal)) Then
            Throw New Exception("A data do arquivo está fora do período")

        End If

    End Sub

    Private Function GetParametroAtivo() As Parametro
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim par = (From p In db.Parametros _
                  Where p.Ano = DateTime.Now.Year And _
                  p.Mes = DateTime.Now.Month And _
                  p.Ativo _
                  Select p).FirstOrDefault()

        Return par
    End Function



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.parametroAtivo = GetParametroAtivo()

        If (Me.parametroAtivo Is Nothing) Then
            lblMsg.Text = "No momento não existe nenhum cronograma ativo"
            lblMsg.ForeColor = Drawing.Color.Red
            btnSalvar.Enabled = False
            FileUpload1.Enabled = False
            Return
        Else
            btnSalvar.Enabled = True
            FileUpload1.Enabled = True

        End If

        lblCronograma.Text = Me.parametroAtivo.ToString()
        LoadGrid()
    End Sub

    Private Sub LoadGrid()

        Dim db As New FrequenciaDocenteDataContext(conn)

        Dim agendaExecutadas = From ae In db.AgendaExecutadas _
                     Group ae By Key = ae.ArquivoDownload Into Group _
                     Select Arquivo = Key, Linhas = Group.Count().ToString(), _
                      Parametro = (From p In Group Select p.Parametro).FirstOrDefault(), _
                      DataHora = Group.Min(Function(p2) p2.DataHoraRegistro) _
                      Order By DataHora Descending

        grdArquivos.DataSource = agendaExecutadas
        grdArquivos.DataBind()
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)

        Dim arquivo = CType(sender, ImageButton)

        Dim strPhysicalFilePath As String = arquivo.AlternateText

        Dim objFile As System.IO.FileInfo = New IO.FileInfo(Server.MapPath(strPhysicalFilePath))


        If objFile.Exists Then

            Response.Clear()
            
            Response.AddHeader("Content-Disposition", "attachment; filename=" & strPhysicalFilePath.Replace("ArquivoAgendaExecutada_", ""))
            Response.AddHeader("Content-Length", objFile.Length.ToString())
            Response.ContentType = "application/octet-stream"
            Response.WriteFile(objFile.FullName)


            Response.Flush()
        End If
    End Sub
End Class
