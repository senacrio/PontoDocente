﻿Imports Microsoft.VisualBasic
Imports System.Web.HttpContext

Public Class CRUD

    Public Shared Sub Popula(ByVal oContainer As View, ByVal sqlDS As SqlDataSource)

        Dim oDataView As New System.Data.DataView
        Dim oArgs As New DataSourceSelectArguments

        sqlDS.DataBind()
        oDataView = sqlDS.Select(oArgs)

        'Só entra se houverem dados a serem lidos
        If Not oDataView Is Nothing Then

            For n = 0 To oContainer.Controls.Count - 1

                'Pega os primeiros 3 caracters do nome do controle
                Dim sID = Mid(oContainer.Controls(n).ID, 1, 3)
                Dim sCampo = Mid(oContainer.Controls(n).ID, 4)
                Dim s As String = ""

                If sID = "txt" Then
                    Dim oTxt As TextBox
                    oTxt = oContainer.Controls(n)
                    oTxt.Text = oDataView.Item(0).Row(Mid(oTxt.ID, 4)).ToString
                End If

                If sID = "cur" Then
                    Dim oTxt As TextBox
                    oTxt = oContainer.Controls(n)
                    If FormatCurrency(oDataView.Item(0).Row(Mid(oTxt.ID, 4)).ToString, 2, TriState.True, TriState.False).Replace("R$ ", "") = ",00" Then

                        oTxt.Text = "0,00"
                    Else
                        oTxt.Text = FormatCurrency(oDataView.Item(0).Row(Mid(oTxt.ID, 4)).ToString, 2, TriState.True, TriState.False).Replace("R$ ", "")
                    End If



                End If

                If sID = "per" Then
                    Dim oTxt As TextBox
                    oTxt = oContainer.Controls(n)
                    oTxt.Text = FormatPercent(oDataView.Item(0).Row(Mid(oTxt.ID, 4)).ToString, 2)
                End If

                If sID = "dat" Then
                    Dim oTxt As TextBox
                    oTxt = oContainer.Controls(n)
                    s = oDataView.Item(0).Row(Mid(oTxt.ID, 4)).ToString
                    If s.Length > 0 Then
                        oTxt.Text = Mid(s, 1, InStr(s, " ") - 1)
                    End If
                End If

                If sID = "cbo" Then

                    Dim oCBO As DropDownList
                    oCBO = oContainer.Controls(n)

                    s = oDataView.Item(0).Row(sCampo).ToString
                    If s.Length > 0 Then
                        oCBO.SelectedValue = s
                    End If
                    oCBO.DataBind()

                End If

                If sID = "hor" Then
                    Dim oTxt As TextBox
                    oTxt = oContainer.Controls(n)
                    s = oDataView.Item(0).Row(Mid(oTxt.ID, 4)).ToString
                    oTxt.Text = Mid(s, InStr(s, " ") + 1, 5)
                End If

                If sID = "moe" Then
                    Dim oTxt As TextBox
                    oTxt = oContainer.Controls(n)
                    s = oDataView.Item(0).Row(Mid(oTxt.ID, 4)).ToString
                    oTxt.Text = Mid(s, 1, InStr(s, ",") + 3)
                End If


                If sID = "chk" Then
                    Dim oChk As CheckBox
                    oChk = oContainer.Controls(n)
                    oChk.Checked = oDataView.Item(0).Row(Mid(oChk.ID, 4))
                End If

            Next

        End If

        Current.Session("_CRUDRodando") = False

    End Sub

    Public Shared Sub Limpa(ByVal oContainer As View)

        Dim oDataView As New System.Data.DataView

        For n = 0 To oContainer.Controls.Count - 1

            Dim oTxt As TextBox
            Dim oChk As CheckBox
            Dim sCmp As String = Mid(oContainer.Controls(n).ID, 1, 3)

            If Mid(oContainer.Controls(n).ID, 1, 3) = "txt" Then
                oTxt = oContainer.Controls(n)
                oTxt.Text = ""
            End If

            If Mid(oContainer.Controls(n).ID, 1, 3) = "cur" Then
                oTxt = oContainer.Controls(n)
                oTxt.Text = ""
            End If


            If sCmp = "chk" Then

                oChk = oContainer.Controls(n)
                oChk.Checked = False

            End If

        Next

    End Sub


End Class
