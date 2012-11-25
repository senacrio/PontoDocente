
'Imports System.Data.SqlClient
Partial Public Class _Default_Menu
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

    Private Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Session("AnoAnterior") = DDL_Ano.Text - 1        
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Session("Ano") = DDL_Ano.SelectedValue
        Session("Mes") = DDL_Mes.SelectedValue
        Session("Regional") = DDL_Mes.SelectedValue
        Session("Label0") = Label0.SelectedValue
        Session("Label1") = Label1.SelectedValue
        Session("Label2") = Label2.SelectedValue
        Session("Label3") = Label3.SelectedValue
        Session("Label4") = Label4.SelectedValue
        DDLRegional.DataBind()
        Response.Redirect("balancete.aspx")
    End Sub

End Class