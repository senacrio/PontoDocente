Imports Senac.ControleRHDocente
Imports System.Linq
Imports System.IO
Imports Ionic.Zip

Partial Class FrequenciaDocente_ExportacaoArquivos
    Inherits System.Web.UI.Page
    'Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        Try

            Dim db = New FrequenciaDocenteDataContext(conn)

            Dim atividades = db.vwAtividadeAcademicaExports.ToList()
            Dim rateio = db.vwRateioExports.ToList().Where(Function(r) Not String.IsNullOrEmpty(r.Expr1))
            Dim coordenacao = db.vwCoordenacaoExports.ToList()
            Dim fetranspor = db.vwFetransporExports.ToList()
            Dim datasul = db.vwVtDs.ToList()

            Dim srtAtv = New StringBuilder()
            Dim srtRateio = New StringBuilder()
            Dim srtCoord = New StringBuilder()
            Dim srtFet = New StringBuilder()
            Dim srtDS = New StringBuilder()

            For Each atv As vwAtividadeAcademicaExport In atividades
                srtAtv.AppendLine(atv.arquivo)
            Next

            For Each rt As vwRateioExport In rateio
                srtRateio.AppendLine(rt.Expr1)
            Next

            For Each coord As vwCoordenacaoExport In coordenacao
                srtCoord.AppendLine(coord.Expr1)
            Next

            For Each fet As vwFetransporExport In fetranspor
                srtFet.AppendLine(fet.arq)
            Next


            For Each ds As vwVtD In datasul
                srtDS.AppendLine(ds.arquivo)
            Next

            Dim pathAtv = MapPath("~/FrequenciaDocente/ArquivoExportacao") + "\Atividade-" + DateTime.Now.ToString("dd-MM-yy-hh-mm") + ".txt"
            Dim pathCoord = MapPath("~/FrequenciaDocente/ArquivoExportacao") + "\Coordenacao-" + DateTime.Now.ToString("dd-MM-yy-hh-mm") + ".csv"
            Dim pathRateio = MapPath("~/FrequenciaDocente/ArquivoExportacao") + "\Rateio-" + DateTime.Now.ToString("dd-MM-yy-hh-mm") + ".txt"
            Dim pathFetranspor = MapPath("~/FrequenciaDocente/ArquivoExportacao") + "\Fetranspor-" + DateTime.Now.ToString("dd-MM-yy-hh-mm") + ".txt"
            Dim pathZip = MapPath("ArquivoExportacao") + "\Arquivos-" + DateTime.Now.ToString("dd-MM-yy-hh-mm") + ".zip"
            Dim pathDatasul = MapPath("~/FrequenciaDocente/ArquivoExportacao") + "\Vt-Datasul-" + DateTime.Now.ToString("dd-MM-yy-hh-mm") + ".txt"

            Dim sw As New StreamWriter(pathAtv)
            sw.WriteLine(srtAtv.ToString())
            sw.Close()
            sw.Dispose()


            Dim swCoord As New StreamWriter(pathCoord)
            swCoord.WriteLine(srtCoord.ToString())
            swCoord.Close()
            swCoord.Dispose()

            Dim swRateio As New StreamWriter(pathRateio)
            swRateio.WriteLine(srtRateio.ToString())
            swRateio.Close()
            swRateio.Dispose()

            Dim swFetransporte As New StreamWriter(pathFetranspor)
            swFetransporte.WriteLine(srtFet.ToString())
            swFetransporte.Close()
            swFetransporte.Dispose()

            Dim swDs As New StreamWriter(pathDatasul)
            swDs.WriteLine(srtDS.ToString())
            swDs.Close()
            swDs.Dispose()


            Using zip As ZipFile = New ZipFile()
                zip.AddFile(pathAtv, "")
                zip.AddFile(pathCoord, "")
                zip.AddFile(pathRateio, "")
                zip.AddFile(pathFetranspor, "")
                zip.AddFile(pathDatasul, "")
                zip.Save(pathZip)
            End Using


            Dim objFile As System.IO.FileInfo = New IO.FileInfo(pathZip)


            If objFile.Exists Then

                Response.Clear()

                Response.AddHeader("Content-Disposition", "attachment; filename=" & pathZip)
                Response.AddHeader("Content-Length", objFile.Length.ToString())
                Response.ContentType = "application/octet-stream"
                Response.WriteFile(objFile.FullName)


                Response.Flush()
            End If

            lblMsg.ForeColor = Drawing.Color.Green
            lblMsg.Text = "Exportação gerada com sucesso."

        Catch ex As Exception
            lblMsg.ForeColor = Drawing.Color.Red
            lblMsg.Text = "Ocorreu um erro na exportação: " + ex.Message


        End Try

    End Sub
End Class
