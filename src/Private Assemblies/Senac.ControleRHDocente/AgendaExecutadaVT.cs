using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Senac.ControleRHDocente
{
    public partial class AgendaExecutadaVT
    {
        public string MaxValueVT
        {
            get
            {
                return this.Parametro.VL_CT_VT;
            }
        }
    }
}
