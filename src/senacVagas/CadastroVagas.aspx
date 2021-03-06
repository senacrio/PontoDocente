﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroVagas.aspx.vb" Inherits="SenacVagas_CadastroVagas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 27px;
        }
        .style3
        {
            width: 137px;
        }
        .style4
        {
            width: 355px;
        }
        .style5
        {
            width: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lbltitulo" runat="server" Font-Bold="True" Font-Size="Large" 
            Text="Cadastro de vagas"></asp:Label>
        <hr />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:ImageButton ID="btnIncluir" runat="server" ImageUrl="~/Icones/001_01.gif" 
                                ToolTip="Cadastrar nova vaga" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Incluir"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label> 
                <asp:GridView ID="gridVagas" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="Cd_vaga" DataSourceID="sqlVagas" EnableTheming="False" 
                    Font-Size="Small" ForeColor="#333333" GridLines="None" style="text-align: left" 
                    Width="900px">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/Icones/Standard/001_45.gif" ShowSelectButton="True">
                        <ItemStyle Width="10px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Cd_vaga" HeaderText="Código" InsertVisible="False" 
                            ReadOnly="True" SortExpression="Cd_vaga">
                        <ItemStyle Width="10px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nm_Nome" HeaderText="Local" SortExpression="Nm_Nome">
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tx_Titulo" HeaderText="Título" 
                            SortExpression="Tx_Titulo" />
                        <asp:BoundField DataField="Tx_Descricao" HeaderText="Descrição" 
                            SortExpression="Tx_Descricao" />
                        <asp:BoundField DataField="Tx_Requisito" HeaderText="Requisito" 
                            SortExpression="Tx_Requisito" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="imgDef" runat="server" ImageUrl="~/Icones/ico_deficiente.gif" 
                                    Visible='<%# Bind("Cd_Deficiente") %>' />
                            </ItemTemplate>
                            <ItemStyle Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" 
                                    ImageUrl="~/Icones/Standard/001_05.gif" 
                                    onclientclick="return confirm('Deseja desativar a vaga?');" 
                                    ToolTip="Cancelar a vaga" />
                            </ItemTemplate>
                            <ItemStyle Width="10px" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="sqlVagas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SenacVagasCS %>" 
                    DeleteCommand="UPDATE svVagas SET Nr_Status = 0 WHERE (Cd_vaga = @Cd_vaga)" 
                    
                    
                    InsertCommand="INSERT INTO svVagas(Tx_Titulo, Tx_Descricao, Tx_Requisito, Nr_Maximo_Inscrito, Cd_Local_FK, Tx_Benificios, Tx_Email, Nr_Status, Cd_Matricula, Cd_Deficiente, Dt_Inicio, Dt_Final, Tx_Obs) VALUES (@titulo, @descricao, @requisito, @inscrito_max, @cd_local, @beneficio, @email + '@rj.senac.br', 1, @matricula, @deficiente, convert(varchar,@dtInicio,102), convert(varchar,@dtFinal,102), @txObs)" SelectCommand="SELECT svVagas.Cd_vaga, svVagas.Tx_Titulo, svVagas.Tx_Descricao, svVagas.Tx_Requisito, svVagas.Cd_Deficiente, svMunicipio.Nm_Nome FROM svVagas INNER JOIN svMunicipio ON svVagas.Cd_Local_FK = svMunicipio.Cd_Local
where svVagas.nr_status=1" 
                    
                    
                    UpdateCommand="UPDATE svVagas SET Tx_Titulo = @titulo, Tx_Descricao = @descricao, Tx_Requisito = @requisito, Nr_Maximo_Inscrito = @nmax, Cd_Local_FK = @cd_local_fk, Tx_Benificios = @beneficio, Tx_Email = @email + '@rj.senac.br', Cd_Deficiente = @deficiente, Dt_Inicio =convert(varchar,@dtInicio,102) , Dt_Final = convert(varchar,@dtFim,102), Tx_Obs = @txobs WHERE (Cd_vaga = @cd_vaga)">
                    <DeleteParameters>
                        <asp:Parameter Name="Cd_vaga" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtTitulo" Name="titulo" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDescricao" Name="descricao" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRequisitos" Name="requisito" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtnmax" Name="nmax" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlLocal" Name="cd_local_fk" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtBeneficios" Name="beneficio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                        <asp:ControlParameter ControlID="chkDeficiente" Name="deficiente" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="gridVagas" Name="cd_vaga" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtDataInicio" Name="dtInicio" 
                        DbType="DateTime"
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDataFim" Name="dtFim" DbType="DateTime" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtObs" Name="txobs" PropertyName="Text" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtTitulo" Name="titulo" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDescricao" Name="descricao" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRequisitos" Name="requisito" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtnmax" Name="inscrito_max" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlLocal" Name="cd_local" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtBeneficios" Name="beneficio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                        <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
                        <asp:ControlParameter ControlID="chkDeficiente" Name="deficiente" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="txtDataInicio" DbType="DateTime" 
                            Name="dtInicio" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDataFim" Name="dtFinal" DbType="DateTime" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtObs" Name="txObs" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style5">
                            <asp:ImageButton ID="btnVoltar" runat="server" ImageUrl="~/Icones/voltar.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Voltar"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <br />
                <table class="style1">
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Título:"></asp:Label>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtTitulo" runat="server" Font-Size="Small" MaxLength="200" 
                                Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtTitulo" ErrorMessage="* Campo Obrigatório" 
                                ValidationGroup="vagas"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Descrição das atividades:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtDescricao" runat="server" Font-Size="Small" Height="100px" 
                                TextMode="MultiLine" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtDescricao" ErrorMessage="* Campo Obrigatório" 
                                ValidationGroup="vagas"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Requisitos:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtRequisitos" runat="server" Font-Size="Small" Height="100px" 
                                TextMode="MultiLine" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtRequisitos" ErrorMessage="* Campo Obrigatório" 
                                ValidationGroup="vagas"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="N° Max. Inscritos:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtnmax" runat="server" Font-Size="Small" Width="50px"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="txtnmax_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtnmax">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtnmax" ErrorMessage="* Campo Obrigatório" 
                                ValidationGroup="vagas"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Local de trabalho:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:DropDownList ID="ddlLocal" runat="server" DataSourceID="sqlLocal" 
                                DataTextField="Nm_Nome" DataValueField="Cd_Local" Font-Size="Small">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Benefícios:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtBeneficios" runat="server" Font-Size="Small" Height="100px" 
                                TextMode="MultiLine" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtBeneficios" ErrorMessage="* Campo Obrigatório" 
                                ValidationGroup="vagas"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Obs:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtObs" runat="server" Font-Size="Small" Height="100px" 
                                TextMode="MultiLine" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Email:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtEmail" runat="server" Font-Size="Small"></asp:TextBox>
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="@rj.senac.br"></asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="* Campo Obrigatório" 
                                ValidationGroup="vagas"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Deficiente:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:CheckBox ID="chkDeficiente" runat="server" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Data Início:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtDataInicio" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtDataInicio_CalendarExtender" 
                                runat="server" Enabled="True" TargetControlID="txtDataInicio">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="Data Fim:"></asp:Label>
                        </td>
                        <td class="style4" valign="top">
                            <asp:TextBox ID="txtDataFim" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtDataFim_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="txtDataFim">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            &nbsp;</td>
                        <td class="style4" valign="top">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" valign="top">
                            &nbsp;</td>
                        <td class="style4" valign="top">
                            <asp:ImageButton ID="btnSalvar" runat="server" ImageUrl="~/Icones/disquete.jpg" 
                                ValidationGroup="vagas" Width="25px" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="btnCancelar" runat="server" 
                                ImageUrl="~/Icones/voltar.jpg" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="sqlLocal" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SenacVagasCS %>" 
                    SelectCommand="SELECT Nm_Nome, Cd_Local FROM svMunicipio">
                </asp:SqlDataSource>
                <br />
                <br />
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
