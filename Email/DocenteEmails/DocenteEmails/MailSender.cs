using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace DocenteEmails
{
    class MailSender
    {

        public void EnviarEmail()
        {
        

            EnvioDeEmail();
        }

        private void EnvioDeEmail()
        {
            MailMessage mensagemEmail = new MailMessage("tiagonascimento.m@gmail.com", "tiago-nm@hotmail.com", "Validação de ponto", "Mensagem do email");

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);

            NetworkCredential cred = new NetworkCredential("tiagonascimento.m@gmail.com", "");
            client.Credentials = cred;

            // inclui as credenciais
            //client.UseDefaultCredentials = true;
            client.EnableSsl = true;
            // envia a mensagem
            client.Send(mensagemEmail);
        }
    }
}
