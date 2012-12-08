using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Senac.ControleRHDocente
{
    public class Util
    {
        public static bool ValidaData(string data1, string data2)
        {
            var dataInicial = Convert.ToDateTime(data1);
            var dataFinal = Convert.ToDateTime(data2);

            if (dataFinal <= dataInicial || dataInicial >= dataFinal)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        public static bool ValidaDataRange(string data1, string data2, string data3)
        {
            var dataTestada = Convert.ToDateTime(data1);
            var dataInicial = Convert.ToDateTime(data2);
            var dataFinal = Convert.ToDateTime(data3);

            if (dataTestada >= dataInicial && dataTestada <= dataFinal)
            {
                return true;
            }
            else
            {
                return false;
            }

        }


        public static bool ValidaDataDiff(string data1, string data2, string data3)
        {
            var dataTestada = Convert.ToDateTime(data1);
            var dataInicial = Convert.ToDateTime(data2);
            var dataFinal = Convert.ToDateTime(data3);

            if (dataTestada >= dataInicial && dataTestada >= dataFinal)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }
}
