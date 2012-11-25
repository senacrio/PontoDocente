Imports Microsoft.VisualBasic

Public Class Cripto
    Shared Function crplost(ByVal sText As String) As String
        Dim n, nCar As Integer
        Dim sRet As String

        sRet = ""
        For n = Len(sText) To 1 Step -1
            nCar = Asc(Mid(sText, n, 1)) + 25

            'Se for par
            If (nCar / 2) = Int(nCar / 2) Then
                sRet += Chr(nCar) + Chr((Int(nCar / 25) * 30))
            Else
                sRet += Chr(nCar)
            End If

        Next

        Return sRet

    End Function
End Class
