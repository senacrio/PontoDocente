using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Senac.ControleRHDocente
{
    public partial class Parametro
    {
        public DateTime DataInicioMes
        {
            get
            {
                return Convert.ToDateTime(this.Ano.ToString() + "-" + this.Mes.ToString() + "-01");
            }
        }
        
        public bool AtivoSinal
        {
            get {

                bool b = false;

                if (this.Ano == DateTime.Now.Year && this.Mes == DateTime.Now.Month)
                {
                    b = true;
                }
                else if (this.Ano > DateTime.Now.Year && this.Mes > DateTime.Now.Month)
                {
                    b = false;
                }

                return b;
            }
            
        }
    }
}
