Imports Microsoft.VisualBasic

Public Class coresGrid
    Shared Function GetColor(ByVal captador As String) As System.Drawing.Color


        Select Case ltrim(rtrim(captador))
            Case "Aline Silva"
                Return Drawing.Color.LightCoral
            Case "Florence Perfeito"
                Return Drawing.Color.LightBlue
            Case "Lincoln Oliveira"
                Return Drawing.Color.LightYellow
            Case "Leandro Conceição"
                Return Drawing.Color.LightCyan
            Case "thais Pessanha"
                Return Drawing.Color.LightGoldenrodYellow
            Case "Ingrid Oliveira"
                Return Drawing.Color.LightGray
            Case "Edi Monteiro"
                Return Drawing.Color.LightGreen
            Case "Silvania Trintim"
                Return Drawing.Color.LightPink
            Case "Karina Silva"
                Return Drawing.Color.LightSalmon
            Case "Ludmila Ribeiro"
                Return Drawing.Color.LightSeaGreen
            Case "Gisele Canto"
                Return Drawing.Color.LightSkyBlue
            Case "Tiago Bastos"
                Return Drawing.Color.LightSlateGray
            Case "Wagner Silva"
                Return Drawing.Color.LightSteelBlue
             
            Case Else

        End Select


    End Function
End Class
