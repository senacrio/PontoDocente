using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DocenteEmails
{
    class Program
    {
        private static DateTime GetDataCorte()
        {
            var db = new DataClasses1DataContext();

            var parametro = (from p in db.Parametros
                             where p.Ano.Value == DateTime.Now.Year &&
                             p.Mes.Value == DateTime.Now.Month &&
                             p.Ativo.Value
                             select p).FirstOrDefault();

            return Convert.ToDateTime(parametro.PAA_ATE);

        }
        static void Main(string[] args)
        {
            //var data = DateTime.Now.Date.ToString("yyyy-MM-dd") + " " + System.Configuration.ConfigurationManager.AppSettings["HoraExecucao"].ToString(); //GetDataCorte();
            //var dataHora = Convert.ToDateTime(data);

            var mailSender = new MailSender();
            mailSender.EnviarEmail();
        }
    }
}
