'Imports System.Data.SqlClient
Partial Public Class _Default
    Inherits System.Web.UI.Page

  
    Private Function le_dtIni(ByVal Ano As Integer, ByVal Mes As Integer) As Date
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("DW_Datasul_conexao").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT [DW_Datasul].[dbo].[fcLeDataIniFechto] (@Ano,@mes)", conn)
        Dim vAno As SqlParameter = New SqlParameter
        Dim vMes As SqlParameter = New SqlParameter
        Dim vData As Date
        vAno.ParameterName = "Ano"
        vMes.ParameterName = "Mes"
        vAno.Value = Ano
        vMes.Value = Mes
        cmd.Parameters.Add(vAno)
        cmd.Parameters.Add(vMes)
        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.HasRows Then
            reader.Read()
            vData = reader(0)
        End If
        conn.Close()
        Return vData
    End Function
    Private Function le_dtFim(ByVal Ano As Integer, ByVal Mes As Integer) As Date
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("DW_Datasul_conexao").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT [DW_Datasul].[dbo].[fcLeDataFimFechto] (@Ano,@mes)", conn)
        Dim vAno As SqlParameter = New SqlParameter
        Dim vMes As SqlParameter = New SqlParameter
        Dim vData As Date
        vAno.ParameterName = "Ano"
        vMes.ParameterName = "Mes"
        vAno.Value = Ano
        vMes.Value = Mes
        cmd.Parameters.Add(vAno)
        cmd.Parameters.Add(vMes)
        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.HasRows Then
            reader.Read()
            vData = reader(0)
        End If
        conn.Close()
        Return vData
    End Function

    Public Shared Sub Atualizar(ByVal oContainer As Panel)

        Dim oDataView As New System.Data.DataView

        For n = 0 To oContainer.Controls.Count - 1

            Dim oCbo As DropDownList


            Dim sCmp As String = Mid(oContainer.Controls(n).ID, 1, 3)

            If sCmp = "DDL" Then
                oCbo = oContainer.Controls(n)
                oCbo.DataBind()
            End If

        Next

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Literal1.Text = ""
    End Sub

    Private Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Session("AnoAnterior") = DDL_Ano.Text - 1
        DDL_Ano.SelectedValue = Session("Ano")
        DDL_Mes.SelectedValue = Session("Mes")
        DDL_Mes.SelectedValue = Session("Regional")
        Label0.Items.Add(New ListItem(Session("Label0"), Session("Label0")))
        Label1.Items.Add(New ListItem(Session("Label1"), Session("Label1")))
        Label2.Items.Add(New ListItem(Session("Label2"), Session("Label2")))
        Label3.Items.Add(New ListItem(Session("Label3"), Session("Label3")))
        Label4.Items.Add(New ListItem(Session("Label4"), Session("Label4")))
        Atualizar(Panel1)

    End Sub
    Protected Sub BtnGrava_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BtnGrava.Click
        SDSDados.Insert()
        GeraXml()
    End Sub
    Private Sub GeraXml()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlDataAdapter = New SqlDataAdapter("select top 1 * from balanceteweb order by idbalanceteweb desc", conn)
        conn.Open()
        Dim ds As DataSet = New DataSet("Balancete")
        Dim nomeArq As String
        Dim nomeWeb As String

        ds.Namespace = "Conselho Fiscal"
        cmd.Fill(ds, "Classe")

        ds.Tables(0).Columns.RemoveAt(0)
        nomeArq = "/Inetpub/Portal/BalanceteWeb/arquivos/balancete" + Session("Ano") + Session("Mes") + ".xml"
        nomeWeb = "/BalanceteWeb/arquivos/balancete" + Session("Ano") + Session("Mes") + ".xml"
        ds.WriteXml(nomeArq)
        Literal1.Text = "<script type=text/javascript> window.open('" + nomeWeb + "') </script>"
        conn.Close()
        cmd.Dispose()
    End Sub

End Class