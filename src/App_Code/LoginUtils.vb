Imports System
Imports System.Collections.Generic
Imports System.Text
Imports System.Net

Public Class LoginUtils
    Const vLOGINWINDOWS As String = "_vti_bin/PSI/LoginWindows.asmx"
    Const vLOGINFORMS As String = "_vti_bin/PSI/LoginForms.asmx"

    Private Shared loginWindows As New WebSvcLoginWindows.LoginWindows()
    Private Shared loginForms As New WebSvcLoginForms.LoginForms()
    Private m_cookies As New CookieContainer()

    Private m_baseUrl As String


    Public Sub New()
    End Sub

    Public ReadOnly Property BaseUrl() As String
        Get
            Return m_baseUrl
        End Get
    End Property

    Public ReadOnly Property Cookies() As CookieContainer
        Get
            Return loginForms.CookieContainer
        End Get
    End Property

    ''' <summary> 
    ''' Log on Project Server 
    ''' </summary> 
    ''' <param name="useWinLogon"></param> 
    ''' <param name="bUrl"></param> 
    ''' <param name="userName"></param> 
    ''' <param name="password"></param> 
    ''' <returns>true for successful logon</returns> 
    Public Function LogonPS(ByVal useWinLogon As Boolean, ByVal bUrl As String, ByVal userName As String, ByVal password As String) As Boolean
        Dim logonSucceeded As Boolean = False
        '        m_baseUrl = bUrl
        m_baseUrl = "http://epm/pwa/"

        If useWinLogon Then
            loginWindows.Url = m_baseUrl + vLOGINWINDOWS
            loginWindows.Credentials = CredentialCache.DefaultCredentials

            If loginWindows.Login() Then
                logonSucceeded = True
            End If
        Else
            ' Use LoginForms 
            loginForms.Url = m_baseUrl + vLOGINFORMS
            loginForms.CookieContainer = m_cookies

            If loginForms.Login(userName, password) Then
                logonSucceeded = True
            End If
        End If
        Return logonSucceeded
    End Function

    ''' <summary> 
    ''' Log off Project Server 
    ''' </summary> 
    ''' <param name="useWinLogon"></param> 
    ''' <returns>true for successful logoff</returns> 
    Public Function LogoffPS(ByVal useWinLogon As Boolean) As Boolean
        Dim loggedOff As Boolean = True
        If useWinLogon Then
            loginWindows.Logoff()
        Else
            loginForms.Logoff()
        End If
        Return loggedOff
    End Function


    Public Function GetServerName(ByVal url As String) As String
        Dim name As String
        Dim slash As Integer
        slash = url.IndexOf("/", 8)
        name = url.Substring(7, slash - 7)
        Return name
    End Function
End Class

