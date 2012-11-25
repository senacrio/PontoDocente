Imports Microsoft.VisualBasic
Imports System.Web.HttpContext

Public Class ValidaCPF

    Public Shared Function CandidatoValidaCPF(ByVal CPF As String) As Boolean
        Dim i, a, n1, n2 As Integer

        CPF = CPF.Replace(".", "").Replace(",", "").Replace("/", "").Replace("-", "")
        CPF = CPF.Trim

        If CPF = "" OrElse _
          CPF.Trim.Length <> 11 OrElse _
          CPF = "11111111111" OrElse _
          CPF = "22222222222" OrElse _
          CPF = "33333333333" OrElse _
          CPF = "44444444444" OrElse _
          CPF = "55555555555" OrElse _
          CPF = "66666666666" OrElse _
          CPF = "77777777777" OrElse _
          CPF = "88888888888" OrElse _
          CPF = "99999999999" Then
            Return False
        End If

        For a = 0 To 1
            n1 = 0
            For i = 1 To 9 + a
                n1 = n1 + Val(Mid(CPF, i, 1)) * (11 + a - i)
            Next
            n2 = 11 - (n1 - (Int(n1 / 11) * 11))
            If n2 = 10 Or n2 = 11 Then n2 = 0
            If n2 <> Val(Mid(CPF, 10 + a, 1)) Then
                Return False
            End If
        Next
        Return True
    End Function
  

End Class
