<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EventosAdm.aspx.vb" Inherits="EventosAdm" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro de eventos</title>
    
</head>
<body>
    <form id="form1" runat="server" 
    style="font-family: verdana; font-size: 11px; color: #0066CC; font-weight: bold">
    Cadastro de Eventos<br />
    <table class="style3">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
    Adicione um novo evento:</td>
            <td>
    <asp:TextBox ID="txtEvento" runat="server" Width="300px" MaxLength="200"></asp:TextBox>
    <asp:ImageButton ID="botaoIncluiEvento" runat="server" Width="22px" 
        ImageAlign="Middle" ImageUrl="~/Icones/Standard/001_03.gif" />
    &nbsp;<asp:RequiredFieldValidator ID="ReqEvento" runat="server" 
        ControlToValidate="txtEvento" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                                        <asp:Label ID="lblid_evento_fk" 
        runat="server" Text="Selecione um evento cadastrado:"></asp:Label>
                                    </td>
            <td>
                <asp:DropDownList ID="cboid_evento_fk" 
        runat="server" DataSourceID="Sqleventos" 
                                            DataTextField="evento" 
        DataValueField="id_evento" AutoPostBack="True">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:SqlDataSource ID="Sqleventos" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            
        SelectCommand="SELECT id_evento, evento FROM tblEventos WHERE (ativo = 'True')">
                                        </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ImageButton ID="ImageButton10" 
        runat="server" ImageAlign="Middle" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                            ValidationGroup="insereEvento" />
                                        &nbsp;Clique no botão para completar os dados do evento.</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ImageButton ID="ImageButton11" runat="server" 
                ImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" 
                CausesValidation="False" ImageAlign="Middle" />
            &nbsp;Voltar</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label18" runat="server" 
                    Text="Clique na seta azul para selecionar e modificar o Status do evento."></asp:Label>
            </td>
        </tr>
        </table>
&nbsp;
         
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
        EnableViewState="False">
        <asp:View ID="View1" runat="server">
            <asp:Label ID="Label17" runat="server"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_evento" 
                DataSourceID="SqlDataSource1" SkinID="basico">
                <Columns>
                    <asp:CommandField ButtonType="Image" CausesValidation="False" 
                        EditImageUrl="~/Icones/Standard/001_45.gif" EditText="Alterar" 
                        SelectImageUrl="~/Icones/Standard/001_60.gif" SelectText="Selecionar" 
                        ShowSelectButton="True" UpdateImageUrl="~/Icones/Standard/001_39.gif" 
                        UpdateText="Atualizar" />
                    <asp:BoundField DataField="evento" HeaderText="Eventos" 
                        SortExpression="evento" />
                    <asp:TemplateField HeaderText="Status" SortExpression="ativo">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                ImageUrl="~/Icones/Standard/001_18.gif" onclick="ImageButton1_Click" 
                                ToolTip="Ativar/Desativar" Visible='<%# Eval("ativo") %>' />
                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                ImageUrl="~/Icones/Standard/001_19.gif" onclick="ImageButton2_Click" 
                                ToolTip="Ativar/Desativar" Visible='<%# not Eval("ativo") %>' Width="24px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" 
                        CancelImageUrl="~/Icones/Standard/001_02.gif" CancelText="Cancelar" 
                        CausesValidation="False" EditImageUrl="~/Icones/Standard/001_45.gif" 
                        EditText="Alterar" HeaderText="Alterar" ShowEditButton="True" 
                        UpdateImageUrl="~/Icones/Standard/001_39.gif" UpdateText="Atualizar">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlEventoUpdate" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                SelectCommand="SELECT [ativo] FROM [tblEventos] WHERE ([id_evento] = @id_evento)" 
                UpdateCommand="UPDATE tblEventos SET ativo = 'True' WHERE (id_evento = @id_evento)">
                <SelectParameters>
                    <asp:Parameter Name="id_evento" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="id_evento" 
                        PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlEventoUpdate0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                SelectCommand="SELECT [ativo] FROM [tblEventos] WHERE ([id_evento] = @id_evento)" 
                UpdateCommand="UPDATE tblEventos SET ativo = 'False' WHERE (id_evento = @id_evento)">
                <SelectParameters>
                    <asp:Parameter Name="id_evento" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="id_evento" 
                        PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <table class="style3">
            <tr>
                <td>
                    <asp:View ID="View2" runat="server">
                        <table style="width: 576px">
                            <tr>
                                <td>
                                    <table class="style1" 
                                        style="font-family: verdana; font-size: 11px; color: #0066CC; font-weight: bold">
                                        <tr>
                                            <td class="style6">
                                                <asp:Label ID="Label7" runat="server" Text="Data Inicial do Evento:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="datdataevento" runat="server" Width="90px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="evento_CalendarExtender" runat="server" 
                                                    BehaviorID="evento_CalendarExtender" TargetControlID="datdataevento">
                                                </ajaxToolkit:CalendarExtender>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                                    EnableScriptGlobalization="True">
                                                </asp:ScriptManager>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <asp:Label ID="Label20" runat="server" Text="Data Final do Evento:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="datdataevento2" runat="server" Width="90px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="evento2_CalendarExtender" 
                                                    runat="server" TargetControlID="datdataevento2">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <asp:Label ID="Label8" runat="server" Text="Horário do evento:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txthoraevento" runat="server" Width="90px"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="txthoraevento" ErrorMessage="Hórario inválido." 
                                                    ToolTip="Entre horário no formato 00:00" 
                                                    ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6" valign="top">
                                                <asp:Label ID="lblacoesdesev" runat="server" Text="Ações desenvolvidas:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtacoesdesenv" runat="server" Rows="3" TextMode="MultiLine" 
                                                    Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6" valign="top">
                                                <asp:Label ID="Label2" runat="server" Text="Necessidades observadas:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtnecessobservada" runat="server" Rows="3" 
                                                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6" valign="top">
                                                <asp:Label ID="Label5" runat="server" Text="Resultados alcançados:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtResultados" runat="server" Rows="3" TextMode="MultiLine" 
                                                    Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6" valign="top">
                                                <asp:Label ID="Label6" runat="server" Text="Oportunidades observadas:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtoportunidades" runat="server" Rows="3" TextMode="MultiLine" 
                                                    Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6" valign="top">
                                                <asp:Label ID="Label9" runat="server" Text="Compromissos assumidos:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtcompromissos" runat="server" Rows="3" TextMode="MultiLine" 
                                                    Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6" valign="top">
                                                <asp:Label ID="Label19" runat="server" Text="Observação"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtobservacao" runat="server" Rows="3" TextMode="MultiLine" 
                                                    Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style2" colspan="2">
                                                <asp:Label ID="Label15" runat="server" Font-Names="Verdana" Font-Size="12px" 
                                                    ForeColor="#FF6600"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style2" colspan="2">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4" colspan="2">
                                                <asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                                    ValidationGroup="insereEvento" />
                                                &nbsp;<asp:Label ID="Label13" runat="server" Text="Completar dados do evento"></asp:Label>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4" colspan="2">
                                                <asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                                    ValidationGroup="insereEvento" />
                                                &nbsp;<asp:Label ID="Label14" runat="server" Text="Cancelar operação"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4" colspan="2">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4" colspan="2">
                                                <asp:Label ID="Label11" runat="server" Text="Adicionar participantes:"></asp:Label>
                                                <asp:ImageButton ID="ImageButton6" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                                                    ValidationGroup="insereEvento" />
                                                <br />
                                                <br />
                                                <asp:GridView ID="GridParticipantes" runat="server" AutoGenerateColumns="False" 
                                                    DataKeyNames="id_participante" DataSourceID="SqlInsereparticipante">
                                                    <Columns>
                                                        <asp:BoundField DataField="Nome" HeaderText="Participante" 
                                                            SortExpression="Nome" />
                                                        <asp:CommandField ButtonType="Image" 
                                                            DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                                            DeleteText="Excluir" HeaderText="Excluir" ShowDeleteButton="True">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="SqlEventoCompleta" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT id_evento, evento, acoesdesenv, necessObservada, resultados, oportunidades, compromissos, horaEvento, dataEvento, dataEvento2, observacao FROM tblEventos WHERE (id_evento = @id_evento)" 
                                        
                                        UpdateCommand="UPDATE tblEventos SET acoesdesenv = @acoesdesenv, necessObservada = @necessObservada, resultados = @resultados, oportunidades = @oportunidades, compromissos = @compromissos, dataEvento = @dataEvento, horaEvento = @horaEvento, dataEvento2 = @dataEvento2, observacao = @observacao WHERE (id_evento = @id_evento)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_evento" SessionField="id_evento" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="txtacoesdesenv" Name="acoesdesenv" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtnecessobservada" Name="necessObservada" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtResultados" Name="resultados" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtoportunidades" Name="oportunidades" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtcompromissos" Name="compromissos" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="datdataevento" DbType="DateTime" 
                                                Name="dataEvento" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txthoraevento" Name="horaEvento" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="cboid_evento_fk" Name="id_evento" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="datdataevento2" Name="dataEvento2" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtobservacao" Name="observacao" 
                                                PropertyName="Text" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            InsertCommand="INSERT INTO tblEventos(evento, ativo) VALUES (@evento, 'true')" 
                            SelectCommand="SELECT id_evento, evento, ativo  FROM tblEventos " 
                            UpdateCommand="UPDATE tblEventos SET evento=@evento where id_evento=@id_evento">
                            <UpdateParameters>
                                <asp:SessionParameter Name="id_evento" SessionField="id_evento" />
                                <asp:Parameter Name="evento" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtEvento" Name="evento" PropertyName="Text" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:View ID="View3" runat="server" EnableViewState="False">
            <asp:Label ID="Label16" runat="server" 
                Text="Adicionar participantes ao evento:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Participantes:"></asp:Label>
            <asp:DropDownList ID="cboid_participante" runat="server" 
                DataSourceID="Sqlparticipante" DataTextField="Nome" DataValueField="IdUsuario">
            </asp:DropDownList>
            <asp:ImageButton ID="ImageButton8" runat="server" 
                ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                ValidationGroup="insereEvento" />
            &nbsp;<asp:ImageButton ID="ImageButton9" runat="server" 
                ImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" 
                CausesValidation="False" />
            <asp:SqlDataSource ID="Sqlparticipante" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                SelectCommand="SELECT admPortalUsuario.Nome, admPortalPerfil_1.Descricao, admPortalUsuario.IdUsuario FROM admPortalPerfil AS admPortalPerfil_1 INNER JOIN admPortalPerfilUsuario ON admPortalPerfil_1.IdPerfil = admPortalPerfilUsuario.IdPerfil INNER JOIN admPortalUsuario ON admPortalPerfilUsuario.IdUsuario = admPortalUsuario.IdUsuario WHERE (admPortalPerfil_1.Descricao = 'Click Adm') ORDER BY admPortalUsuario.Nome">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlInsereparticipante" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                DeleteCommand="DELETE FROM tblEventoParticipante WHERE (id_participante = @id_participante)" 
                InsertCommand="INSERT INTO tblEventoParticipante(id_usuario_fk, id_evento_fk) VALUES (@id_usuario_fk, @id_evento_fk)" 
                SelectCommand="SELECT View_IntranetUsuario.Nome, tblEventoParticipante.id_usuario_fk, tblEventoParticipante.id_participante, tblEventoParticipante.id_evento_fk, tblEventoParticipante.id_evento_fk AS Expr1 FROM tblEventoParticipante INNER JOIN View_IntranetUsuario ON tblEventoParticipante.id_usuario_fk = View_IntranetUsuario.IdUsuario WHERE (tblEventoParticipante.id_evento_fk = @id_evento_fk)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cboid_evento_fk" Name="id_evento_fk" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridParticipantes0" Name="id_participante" 
                        PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="cboid_participante" Name="id_usuario_fk" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cboid_evento_fk" Name="id_evento_fk" 
                        PropertyName="SelectedValue" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridParticipantes0" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="id_participante" 
                DataSourceID="SqlInsereparticipante">
                <Columns>
                    <asp:BoundField DataField="Nome" HeaderText="Participante" 
                        SortExpression="Nome" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" 
                        DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                        DeleteText="Excluir" HeaderText="Excluir" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
    <br />
    </form>
    </body>
</html>
