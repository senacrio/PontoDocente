Imports Microsoft.VisualBasic
Imports system.Data.Sqlclient

Public Class Dados

    'OBJETIVO: Obter a string de conexão que está no WEB.CONFIG
    'RECEBE: -
    'RETORNA: String de conexão (string)
    'AUTOR: André Campos
    'EM: Agostro/2007

    Shared Function StringConexao() As String
        Dim sRet As String

        Dim rootWebConfig As System.Configuration.Configuration
        rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/portal")
        Dim connString As System.Configuration.ConnectionStringSettings

        connString = rootWebConfig.ConnectionStrings.ConnectionStrings("senacRJConnectionString")
        sRet = connString.ConnectionString

        Return sRet

    End Function
	
    Shared Function scDatasulRH() As String

        Return "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.12;DB=HR209;UID=sysprogress;PWD=sysprogress;PORT=65520;"

    End Function
    Shared Function scDatasulRHEsp() As String

        Return "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.12;DB=HRESP;UID=sysprogress;PWD=sysprogress;PORT=65525;"

    End Function
    Shared Function scDatasulEMS2Cad() As String

        Return "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.60;DB=EMS2CAD;UID=sysprogress;PWD=sysprogress;PORT=65515;"

    End Function
    Shared Function scDatasulEMS2Mov() As String

        Return "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.60;DB=EMS2MOV;UID=sysprogress;PWD=sysprogress;PORT=65516;"

    End Function
    Shared Function scDatasulEMS5Cad() As String

        Return "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.60;DB=EMS5CAD;UID=sysprogress;PWD=sysprogress;PORT=65510;"

    End Function
    Shared Function scDatasulEMS5Mov() As String

        Return "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.60;DB=EMS5MOV;UID=sysprogress;PWD=sysprogress;PORT=65520;"

    End Function
    Shared Function scDatasulEMSEsp() As String

        Return "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.60;DB=EMSESP;UID=sysprogress;PWD=sysprogress;PORT=65523;"

    End Function

End Class
