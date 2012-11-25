
Partial Class TesteRH
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cStringConexao As String = "Driver={Progress OpenEdge 10.1A driver};HOST=145.35.0.12;DB=RH209;UID=sysprogress;PWD=sysprogress;PORT=65520;"
        Dim oConexao As New Odbc.OdbcConnection(cStringConexao)
        Dim cSql As String

        cSql = "SELECT a.cdn_funcionario as MATRICULA, c.des_unid_lotac+'  ' as SETOR, b.nom_pessoa_fisic+'  ' as COLABORADOR,  a.cod_unid_lotac AS CENTRO_CUSTO FROM pub.funcionario a"
        cSql += " inner join pub.rh_pessoa_fisic b on a.num_pessoa_fisic=b.num_pessoa_fisic"
        cSql += " inner join pub.unid_lotac c on a.cod_unid_lotac=c.cod_unid_lotac"
        cSql += " where IFNULL(TO_CHAR(a.dat_desligto_func),99999)=99999 and a.cod_unid_lotac<>'300026'"
        cSql += " order by c.des_unid_lotac"

        'cSql = "select cod_unid_lotac, des_unid_lotac from pub.unid_lotac"

        'TESTES
        'cSql = "Select * from pub.unid_lotac"
        'cSql = "Select cod_unid_lotac from pub.funcionario"

        Dim oDr As Odbc.OdbcDataReader
        Dim oCmd As New Odbc.OdbcCommand(cSql, oConexao)

        oConexao.Open()

        oDr = oCmd.ExecuteReader()

        GridView1.DataSource = oDr
        GridView1.DataBind()

        GridView1.Font.Size = 8
        GridView1.HeaderRow.HorizontalAlign = HorizontalAlign.Left

        oDr.Close()
        oConexao.Close()
    End Sub
End Class


