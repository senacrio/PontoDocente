using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Microsoft.Reporting.WebForms;

public partial class FrequenciaDocente_Relatorio_RelatorioMarcacaoDocente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["c_Matricula"] = "14134";
        Session["c_Nome"] = "Fulano de tal";
        var parametros = new ReportParameter[1];
        var parametroNome = new ReportParameter("nome",Session["c_Nome"].ToString());
        parametros[0] = parametroNome;
        ReportViewer1.LocalReport.SetParameters(parametros);
    }
}
