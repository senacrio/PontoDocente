Imports System
Imports System.Net
Imports System.Data
Imports System.Web.Services.Protocols


Public Class AdminUtils
    Public Sub New()
    End Sub

    Public Function ProjectServerVersion(ByVal admin As WebSvcAdmin.Admin) As String
        Dim major As String, minor As String, build As String, revision As String
        Dim version As String = ""

        Try
            Dim dsInfo As DataSet = admin.ReadServerVersion()

            Dim row As DataRow = dsInfo.Tables("ServerVersion").Rows(0)
            major = row("WADMIN_VERSION_MAJOR").ToString()
            minor = row("WADMIN_VERSION_MINOR").ToString()
            build = row("WADMIN_VERSION_BUILD").ToString()
            revision = row("WADMIN_VERSION_REVISION").ToString()

            build = build.Insert(build.Length - 4, ".")

            version = (((major & ".") + minor & ".") + build & ", rev. ") + revision
        Catch ex As SoapException
            version = ("Error - SOAP Exception" & vbLf & vbLf) + ex.Message.ToString()
        Catch ex As WebException
            version = ("Error - Web Exception" & vbLf & vbLf) + ex.Message.ToString()
        End Try

        Return version
    End Function
End Class
