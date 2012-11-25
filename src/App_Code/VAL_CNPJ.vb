Imports Microsoft.VisualBasic
Imports System.Web.HttpContext

Public Class ValidaCNPJ

    Shared Function CandidatoValidaCNPJ(ByVal CGC As String) As Boolean
        Dim RecebeCNPJ As String
        Dim Numero(14) As Integer
        Dim Soma, Resultado1, Resultado2 As Integer
        CGC = CGC.Replace(".", "").Replace(",", "").Replace("/", "").Replace("-", "")
        RecebeCNPJ = CGC.Trim

        If RecebeCNPJ.Length <> 14 Or _
        RecebeCNPJ = "00000000000000" Or _
        RecebeCNPJ = "11111111111111" Or _
        RecebeCNPJ = "22222222222222" Or _
        RecebeCNPJ = "33333333333333" Or _
        RecebeCNPJ = "44444444444444" Or _
        RecebeCNPJ = "55555555555555" Or _
        RecebeCNPJ = "66666666666666" Or _
        RecebeCNPJ = "77777777777777" Or _
        RecebeCNPJ = "88888888888888" Or _
        RecebeCNPJ = "99999999999999" Then
            Return False
        Else
            Numero(1) = CInt(Mid(RecebeCNPJ, 1, 1))
            Numero(2) = CInt(Mid(RecebeCNPJ, 2, 1))
            Numero(3) = CInt(Mid(RecebeCNPJ, 3, 1))
            Numero(4) = CInt(Mid(RecebeCNPJ, 4, 1))
            Numero(5) = CInt(Mid(RecebeCNPJ, 5, 1))
            Numero(6) = CInt(Mid(RecebeCNPJ, 6, 1))
            Numero(7) = CInt(Mid(RecebeCNPJ, 7, 1))
            Numero(8) = CInt(Mid(RecebeCNPJ, 8, 1))
            Numero(9) = CInt(Mid(RecebeCNPJ, 9, 1))
            Numero(10) = CInt(Mid(RecebeCNPJ, 10, 1))
            Numero(11) = CInt(Mid(RecebeCNPJ, 11, 1))
            Numero(12) = CInt(Mid(RecebeCNPJ, 12, 1))
            Numero(13) = CInt(Mid(RecebeCNPJ, 13, 1))
            Numero(14) = CInt(Mid(RecebeCNPJ, 14, 1))
            Soma = Numero(1) * 5 + Numero(2) * 4 + Numero(3) * 3 + Numero(4) * 2 + Numero(5) * 9 + Numero(6) * 8 + Numero(7) * 7 + Numero(8) * 6 + Numero(9) * 5 + Numero(10) * 4 + Numero(11) * 3 + Numero(12) * 2
            Soma = Soma - (11 * (Int(Soma / 11)))


            If Soma = 0 Or Soma = 1 Then
                Resultado1 = 0
            Else
                Resultado1 = 11 - Soma
            End If

            If Resultado1 = Numero(13) Then
                Soma = Numero(1) * 6 + Numero(2) * 5 + Numero(3) * 4 + Numero(4) * 3 + Numero(5) * 2 + Numero(6) * 9 + Numero(7) * 8 + Numero(8) * 7 + Numero(9) * 6 + Numero(10) * 5 + Numero(11) * 4 + Numero(12) * 3 + Numero(13) * 2
                Soma = Soma - (11 * (Int(Soma / 11)))

                If Soma = 0 Or Soma = 1 Then
                    Resultado2 = 0
                Else
                    Resultado2 = 11 - Soma
                End If

                If Resultado2 = Numero(14) Then
                    Return True
                Else
                    Return False
                End If
            Else
                Return False
            End If
        End If
    End Function


End Class
