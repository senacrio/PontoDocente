<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdmCandidatoCadastro.aspx.vb" Inherits="clickoportunidades_AdmCandidatoCadastro" %>
<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 71%;
        }
        .style2
        {
        }
        .style4
        {
            width: 337px;
            height: 23px;
        }
        .style5
        {
            width: 843px;
            height: 23px;
        }
        .style6
        {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="style1">
            <tr>
                <td class="style2" width="100">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px"></asp:Label>
                        </td>
            </tr>
            <tr>
                <td 
                    
                    style="font-family: verdana; font-size: 12px; color: #0066CC; font-weight: bold;" 
                    width="200">
                    Cadastro de candidatos</td>
            </tr>
            <tr>
                <td class="style6" width="100px">
                                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6" width="100px">
                                    <asp:Label ID="Label2" runat="server" Text="Usuário logado:" 
                        Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#0066CC" Width="150px"></asp:Label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlUsuario" 
                                        DataTextField="Nome" DataValueField="IdUsuario" 
                                        style="margin-top: 11px; margin-bottom: 0px">
                                    </asp:DropDownList>
                                &nbsp;<asp:SqlDataSource ID="SqlUsuario" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT [IdUsuario], [Nome] FROM [admPortalUsuario]
where nome = @nome">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nome" SessionField="c_nome" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
            </tr>
        </table>
         <asp:Panel ID="Panel3" DefaultButton="ImageButton2" runat="server" 
             BorderStyle="Dashed" groupingtext="Crie a conta e senha do candidato" 
        Height="268px" Width="518px" 
        ToolTip="Faça logon no sistema utilizando seu CPF ou seu Passaporte." 
             CssClass="legend" style="margin-left: 0px" BackColor="#FFCC99" 
            BorderColor="#0066CC" BorderWidth="2px"><br /> 
            <table               style="font-family: Verdana; font-size: 10px; font-weight: bold; color: #0066CC; text-align: left; height: 225px; background-color: #FFCC99; width: 510px;"><tr>
                    <td align="right" style="text-align: left;" colspan="2">Tipo de identificador:<asp:RadioButtonList 
                            ID="rblIdentificadorTipo" runat="server" CellPadding="0" CellSpacing="0" 
                            RepeatColumns="2" RepeatLayout="Flow" 
                            ToolTip="Passaporte apenas para estrangeiros">
                        <asp:ListItem Selected="True" Value="0">CPF</asp:ListItem>
                        <asp:ListItem Value="1">Passaporte</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr><tr><td align="right" style="text-align: left; " class="style4">
                    Identificador:</td>
                    <td class="style5">
                        <cc1:MaskedEditAspNet ID="txtIdentificador" runat="server" 
                            Mask="###.###.###-##" Width="138px" ValidationGroup="usuario" 
                            style="margin-left: 0px"></cc1:MaskedEditAspNet>
                    <asp:Image ID="imgAviso" runat="server" ImageUrl="~/icones/Standard/001_18.gif" 
                        Visible="False" Width="22px" />
                        &nbsp;</td>
                </tr><tr>
                    <td 
                        style="width: 337px; height: 14px;">Senha:</td>
                    <td style="width: 843px; height: 14px; text-align: left;">
                        <asp:TextBox ID="txtSenha" runat="server" MaxLength="20" TextMode="Password" 
                    ToolTip="Informe a sua senha." 
                    Width="140px" CssClass="txtSenha" style="text-align: left"></asp:TextBox> 
                        &nbsp;<asp:RequiredFieldValidator ID="valSenhaCad" runat="server" 
                            ControlToValidate="txtSenha" ErrorMessage="Informe sua senha. " 
                            ValidationGroup="usuario"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr><tr>
                    <td 
                        style="width: 337px; height: 23px; text-align: left;">Confirmação:</td>
                    <td style="height: 23px; width: 843px;">
                        <asp:TextBox ID="txtConfirma" runat="server" MaxLength="20" TextMode="Password" 
                    ToolTip="Confirme sua senha por favor." 
                    Width="140px"></asp:TextBox> 
                        &nbsp;<asp:CompareValidator ID="valConfirmacao" runat="server" 
                            ControlToCompare="txtSenha" ControlToValidate="txtConfirma" 
                            ErrorMessage="A confirmação não confere." ValidationGroup="usuario"></asp:CompareValidator>
                        <br />
                    </td>
                </tr>
                <tr><td 
                        style="width: 337px; height: 13px; text-align: left;">Lembrete:</td>
                    <td style="width: 843px; height: 13px;">
                        <asp:TextBox ID="txtLembrete" runat="server" Width="206px" 
                            ToolTip="Informe uma palavra que lembre a sua senha"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="height: 13px; text-align: left;" colspan="2" align="center">
                        <asp:RequiredFieldValidator ID="valLembrete" runat="server" 
                            ControlToValidate="txtLembrete" 
                            ErrorMessage="Informe uma palavra que lembre a sua senha." 
                            ValidationGroup="usuario"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="lblaviso" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 337px">
                    </td>
                    <td style="width: 843px">
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="28px" 
                            ImageUrl="~/clickoportunidades/icones/Standard/botao_criarconta.gif" ToolTip="Criar conta" 
                            ValidationGroup="usuarioCad" Width="80px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
             </table></asp:Panel> 
<asp:SqlDataSource ID="sqlIncluiEstudante" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
            InsertCommand="INSERT INTO tblCandidato(nome, identificador_tipo, identificador, sexo, endereco, bairro, cep, telefone, email, id_estadocivil, id_nacionalidade, id_municipio, senha, id_deficiente_fk, id_descobriu_fk, estado_fk, nascimento, Lembrete) VALUES (@nome, @identificador_tipo, @identificador, @sexo, @endereco, @bairro, @cep, @telefone, @email, @id_estadocivil, @id_nacionalidade, @id_municipio, @senha, @id_deficiente_fk, @id_descobriu_fk, @estado_fk, @nascimento, @Lembrete)" 
                       
             
             
        
        ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>">
            <InsertParameters>
                <asp:Parameter Name="nome" />
                <asp:Parameter Name="identificador_tipo" />
                <asp:Parameter Name="identificador" />
                <asp:Parameter Name="sexo" />
                <asp:Parameter Name="endereco" />
                <asp:Parameter Name="bairro" />
                <asp:Parameter Name="cep" />
                <asp:Parameter Name="telefone" />
                <asp:Parameter Name="email" />
                <asp:Parameter Name="id_estadocivil" />
                <asp:Parameter Name="id_nacionalidade" />
                <asp:Parameter Name="id_municipio" />
                <asp:Parameter Name="senha" />
                <asp:Parameter Name="id_deficiente_fk" />
                <asp:Parameter Name="id_descobriu_fk" />
                <asp:Parameter Name="estado_fk" />
                <asp:Parameter Name="nascimento" Type="DateTime" />
                <asp:ControlParameter ControlID="txtLembrete" Name="Lembrete" 
                    PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
