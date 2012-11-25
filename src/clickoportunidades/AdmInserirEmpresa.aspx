<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="AdmInserirEmpresa.aspx.vb" Inherits="Empresa" title="Empresas" StyleSheetTheme="" Theme="Basico" %>
<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
   
   <style type="text/css">
       .modalBackground 
       {    
        background-color:Gray;    
        filter:alpha(opacity=70);    
        opacity:0.7;
        }
        
        .modalPopup    
        {
        	background-color:#FFFFDD;    
        	border-width:3px;    
        	border-style:solid;    
        	border-color:Gray;    
        	padding:3px;    
        	width:250px;}

       .style1
       {
           height: 15px;
       }
       .style2
       {
       }
       .style5
       {
       }
       .style6
       {
           height: 15px;
           width: 102px;
       }
       .style7
       {
           width: 102px;
       }

       .style8
       {
           width: 100%;
       }
       .style9
       {
           width: 114px;
       }

   </style>
  
        <form id="form1" runat="server">

   

   
  
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px" Font-Names="Verdana"></asp:Label>
                        <br />
                        <br />
                        <table class="style8">
                            <tr>
                                <td class="style9">
                                    <asp:Label ID="Label2" runat="server" Text="Usuário logado:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlUsuario" 
                                        DataTextField="Nome" DataValueField="IdUsuario" 
                                        style="margin-top: 11px; margin-bottom: 0px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">
                                    &nbsp;</td>
                                <td>
                                    <asp:SqlDataSource ID="SqlUsuario" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT [IdUsuario], [Nome] FROM [admPortalUsuario]
where nome = @nome">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nome" SessionField="c_nome" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>

   

   
  
        <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC99" Width="602px" 
                        BorderColor="#0066CC" BorderStyle="Dashed" BorderWidth="1px">
            <table style="font-family: Verdana; font-size: 11px; color: #0066CC; font-weight: bold; height: 133px; width: 598px;">
                <tr>
                    <td align="right" 
                style="text-align: left;" class="style6">
                        &nbsp;</td>
                    <td style="height: 15px; text-align: left; ">
                        Cadastro de empresa</td>
                </tr>
                <tr>
                    <td align="right" style="text-align: left;" class="style6">
                        &nbsp;</td>
                    <td style="height: 15px; text-align: left; ">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="text-align: left;" class="style6">
                        Nome Fantasia:</td>
                    <td style="height: 15px; text-align: left; ">
                        <asp:TextBox ID="txtnome_fantasia" runat="server" Width="300px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtnome_fantasia" ErrorMessage="Campo obrigatório" 
                            ValidationGroup="usuarioCad"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" 
                style="text-align: left;" class="style6">
                        Razão social:</td>
                    <td style="height: 15px; text-align: left; ">
                        <asp:TextBox ID="txtrazao_social" runat="server" Width="300px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtrazao_social" ErrorMessage="Campo obrigatório" 
                            ValidationGroup="usuarioCad"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" 
                style="text-align: left;" class="style6">
                        CNPJ:</td>
                    <td style="text-align: left; " class="style1">
                        <asp:TextBox ID="txtIdentificadoCad" runat="server" AutoPostBack="True" 
                            Width="120px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="valCnpj" runat="server" 
                            ControlToValidate="txtIdentificadoCad" ErrorMessage="Digite o CNPJ com ponto e barra." 
                            ValidationGroup="usuarioCad"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                            runat="server" ControlToValidate="txtIdentificadoCad" 
                            ErrorMessage="CNPJ não é válido." 
                            ValidationExpression="\d{2}.?\d{3}.?\d{3}/?\d{4}-?\d{2}" 
                            ValidationGroup="usuarioCad"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="text-align: left;" class="style7">
                        Senha:</td>
                    <td style="text-align: left; " class="style2">
                        <asp:TextBox ID="txtSenhaCad" runat="server" MaxLength="20" TextMode="Password" 
                        Width="120px" ToolTip="Informe sua senha"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="valSenhaCad" runat="server" 
                            ControlToValidate="txtSenhaCad" ErrorMessage="Digite sua senha." 
                            ValidationGroup="usuarioCad" Width="120px"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="text-align: left;" class="style7">
                        Confirmação:</td>
                    <td style="text-align: left; ">
                        <asp:TextBox ID="txtConfirma" runat="server" MaxLength="20" TextMode="Password" 
                        style="text-align: left" Width="120px" ToolTip="Confirme sua senha"></asp:TextBox>
                        &nbsp;<asp:CompareValidator ID="comparaSenha" runat="server" 
                            ControlToCompare="txtSenhaCad" ControlToValidate="txtConfirma" 
                            ErrorMessage="Senha não confere." ValidationGroup="usuarioCad"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style7">
                        &nbsp;</td>
                    <td style="text-align: left;" class="style5">
                        <asp:ImageButton ID="ibtCriaConta" runat="server" 
                        ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" ValidationGroup="usuarioCad" 
                        ToolTip="Criar conta" ImageAlign="Middle" />
                        &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                            ToolTip="Cancelar criação" ImageAlign="Middle" />
                        &nbsp;Clique no botão verde para adicionar a empresa.</td>
                </tr>
                <tr>
                    <td align="right" class="style7">
                        &nbsp;</td>
                    <td style="text-align: left;">
                        <asp:Label ID="lblAviso" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
                        <asp:SqlDataSource ID="SqlInsereEmpresa" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [id_empresa] FROM [tblEmpresa]" 
                            
                            
                        UpdateCommand="UPDATE tblEmpresa SET nome_fantasia = @nome_fantasia, razao_social = @razao_social WHERE (cnpj = @cnpj)" 
                        InsertCommand="INSERT INTO tblLogAlteraEmpresa(id_empresa, nome, dataAteracao, acao) VALUES (@id_empresa, @nome, GETDATE(), 'Adicionou empresa')">
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtnome_fantasia" Name="nome_fantasia" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtrazao_social" Name="razao_social" 
                                    PropertyName="Text" />
                                <asp:SessionParameter Name="cnpj" SessionField="empresaCNPJ" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="id_empresa" SessionField="empresaID" />
                                <asp:SessionParameter Name="nome" SessionField="c_nome" />
                            </InsertParameters>
                        </asp:SqlDataSource>
       

 

                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="id_alteraEmpresa" DataSourceID="SqlEmpresaUsuario">
                            <Columns>
                                <asp:BoundField DataField="id_alteraEmpresa" HeaderText="Código" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_alteraEmpresa" />
                                <asp:BoundField DataField="nome" HeaderText="Usuário/Captador" 
                                    SortExpression="nome" />
                                <asp:BoundField DataField="nome_fantasia" HeaderText="Nome da Empresa" 
                                    SortExpression="nome_fantasia" />
                                <asp:BoundField DataField="acao" HeaderText="Ação" SortExpression="acao" />
                                <asp:BoundField DataField="dataAteracao" HeaderText="Data" 
                                    SortExpression="dataAteracao" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlEmpresaUsuario" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT tblLogAlteraEmpresa.id_alteraEmpresa, tblLogAlteraEmpresa.nome, tblLogAlteraEmpresa.acao, tblLogAlteraEmpresa.dataAteracao, tblEmpresa.nome_fantasia FROM tblLogAlteraEmpresa INNER JOIN tblEmpresa ON tblLogAlteraEmpresa.id_empresa = tblEmpresa.id_empresa">
                        </asp:SqlDataSource>
       

 

</form>

       

 

