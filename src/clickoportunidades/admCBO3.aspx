<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admCBO3.aspx.vb" Inherits="clickoportunidades_admCBO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style2
        {
            margin-top: 0px;
        }
        .style3
        {
            width: 87%;
        }
        .style4
        {
        }
        .style5
        {
            width: 386px;
        }
        .style8
        {
            width: 388px;
        }
        .style9
        {
            background-color: #CCCCCC;
        }
        .style10
        {
            background-color: #CCCCCC;
        }
        .style11
        {
            width: 103px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span lang="pt-br"><asp:Menu ID="Menu1" runat="server" 
            BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Bold="True" 
            Font-Names="Verdana" Font-Size="12px" ForeColor="#284E98" 
            Orientation="Horizontal" StaticSubMenuIndent="12px">
            <StaticSelectedStyle BackColor="#507CD1" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <Items>
                <asp:MenuItem Text="Área de Cargo" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="Área de relacionamento Cargo x Senac" Value="1">
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <br />
        </span>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server" EnableTheming="False">
                
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lbladicionarcargo" runat="server" 
                                    Text="Para adicionar um novo Cargo, preencha as opções abaixo:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td>
                                <br />
                                <br />
                                <asp:Label ID="Label4" runat="server" 
                                    Text="Entre um valor maior que o último código do cargo:"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Código do cargo:"></asp:Label>
                                <span lang="pt-br">&nbsp;</span><asp:TextBox ID="txtid_cargo" runat="server" 
                                    Width="60px"></asp:TextBox>
                                <span lang="pt-br">&nbsp;</span><asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="txtid_cargo" 
                                    ErrorMessage="Valores devem ser maior do que 9990 e até 5 dígitos." 
                                    MaximumValue="12000" MinimumValue="9990" Type="Integer" ValidationGroup="cargo"></asp:RangeValidator>
                                <span lang="pt-br">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                    runat="server" ControlToValidate="txtid_cargo" ErrorMessage="Campo obrigatório" 
                                    ValidationGroup="cargo"></asp:RequiredFieldValidator>
                                </span>
                                <br />
                                <br />
                                <asp:Label ID="lblnovocargo0" runat="server" Text="Novo Cargo:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcargo2" runat="server" AutoPostBack="True" Height="22px" 
                                    Width="283px"></asp:TextBox>
                                <span lang="pt-br">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                    runat="server" ControlToValidate="txtcargo2" ErrorMessage="Campo obrigatório" 
                                    ValidationGroup="cargo"></asp:RequiredFieldValidator>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <br />
                            <br />
                        </tr>
                        <tr>
                            <td class="style5">
                                <asp:ImageButton ID="btninserir" runat="server" CssClass="style2" 
                                    ImageUrl="~/clickoportunidades/icones/Standard/001_03.gif" 
                                    ToolTip="Adicionar novo CBO" ValidationGroup="cargo" />
                                <span lang="pt-br">&nbsp;</span><asp:ImageButton ID="btnCancela" runat="server" 
                                    ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                    ToolTip="Cancelar " />
                            </td>
                            <td>
                                <asp:SqlDataSource ID="SqlNovoCargo" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    DeleteCommand="DELETE FROM [tblCBO] WHERE [id_cargo] = @original_id_cargo AND (([cargo] = @original_cargo) OR ([cargo] IS NULL AND @original_cargo IS NULL)) AND (([tipo] = @original_tipo) OR ([tipo] IS NULL AND @original_tipo IS NULL))" 
                                    InsertCommand="INSERT INTO [tblCBO] ([id_cargo], [cargo], [tipo]) VALUES (@id_cargo, @cargo, @tipo)" 
                                    OldValuesParameterFormatString="original_{0}" 
                                    SelectCommand="SELECT id_cargo, cargo, tipo, status FROM tblCBO WHERE (tipo = 'Ocupação') ORDER BY cargo" 
                                    
                                    
                                    
                                    
                                    UpdateCommand="UPDATE [tblCBO] SET [cargo] = @cargo, [tipo] = @tipo WHERE [id_cargo] = @original_id_cargo AND (([cargo] = @original_cargo) OR ([cargo] IS NULL AND @original_cargo IS NULL)) AND (([tipo] = @original_tipo) OR ([tipo] IS NULL AND @original_tipo IS NULL))">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_id_cargo" Type="String" />
                                        <asp:Parameter Name="original_cargo" Type="String" />
                                        <asp:Parameter Name="original_tipo" Type="String" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="cargo" Type="String" />
                                        <asp:Parameter Name="tipo" Type="String" />
                                        <asp:Parameter Name="original_id_cargo" Type="String" />
                                        <asp:Parameter Name="original_cargo" Type="String" />
                                        <asp:Parameter Name="original_tipo" Type="String" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="id_cargo" Type="String" />
                                        <asp:Parameter Name="cargo" Type="String" />
                                        <asp:Parameter Name="tipo" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlCargoInserir" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        InsertCommand="INSERT INTO tblCBO(cargo, tipo, id_cargo, status) VALUES (@cargo, 'Ocupação', @id_cargo, 2)" 
                        SelectCommand="SELECT id_cargo, cargo, tipo FROM tblCBO">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtcargo2" Name="cargo" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtid_cargo" Name="id_cargo" 
                                PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
               
                        <asp:SqlDataSource ID="Sqlativar" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT id_cargo, cargo FROM tblCBO" 
                            UpdateCommand="UPDATE tblCBO SET status = 2 WHERE (id_cargo = @id_cargo)">
                            <UpdateParameters>
                                <asp:SessionParameter Name="id_cargo" SessionField="id_cargo" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDesativar" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT id_cargo, cargo, tipo, status FROM tblCBO" 
                            UpdateCommand="UPDATE tblCBO SET status = 1 WHERE (id_cargo = @id_cargo)">
                            <UpdateParameters>
                                <asp:SessionParameter Name="id_cargo" SessionField="id_cargo" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
               
                        <br />
                        <table class="style3">
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Buscar o Cargo:"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txtcargo" runat="server" style="margin-left: 0px" 
                                        Width="200px"></asp:TextBox>
                                    <asp:ImageButton ID="btnpesquisar" runat="server" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table class="style3">
                            <tr>
                                <td class="style5">
                                    CBO Antigo</td>
                                <td class="style5">
                                    CBO Novo</td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style5">
                                    <asp:Label ID="lbladicionarcargo1" runat="server" Font-Names="Verdana" 
                                        Font-Size="11px" 
                                        Text="Para modificar um CBO, clique na seta azul para selecionar." 
                                        ForeColor="#0066CC" Width="400px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <asp:GridView ID="GridAntigoCargo" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_cargo" 
                                        DataSourceID="Sqlbuscacargo0" Width="500px">
                                        <Columns>
                                            <asp:BoundField DataField="id_cargo" HeaderText="Código" ReadOnly="True" 
                                                SortExpression="id_cargo">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo">
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Status" SortExpression="status">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <span lang="pt-br">
                                                    <asp:ImageButton ID="btnOK" runat="server" CausesValidation="False" 
                                                        CommandName="Select" ImageUrl="~/icones/Standard/001_18.gif" 
                                                        onclick="btnOK_Click" Text="Select" ToolTip="Cargo ativado" 
                                                        Visible='<%# Eval("status") = 2 %>' />
                                                    <asp:ImageButton ID="btnNO" runat="server" CausesValidation="False" 
                                                        ImageUrl="~/Icones/Standard/001_19.gif" onclick="btnNO_Click" 
                                                        ToolTip="Cargo desativado" Visible='<%# Eval("status") = 1 %>' Width="24px" />
                                                    </span>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="Sqlbuscacargo0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" SelectCommand="SELECT id_cargo, cargo, tipo, status FROM tblCBO WHERE (tipo = 'Ocupação')
AND (cargo LIKE '' + @cargo + '%') ORDER BY id_cargo desc" 
                                        UpdateCommand="UPDATE tblCBO SET cargo = @cargo WHERE (id_cargo = @id_cargo)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtcargo" DefaultValue="%" Name="cargo" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="cargo" />
                                            <asp:ControlParameter ControlID="GridNovoCargo" Name="id_cargo" 
                                                PropertyName="SelectedValue" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td class="style5">
                                    <asp:GridView ID="GridNovoCargo" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_cargo" 
                                        DataSourceID="Sqlbuscacargo" Width="500px">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" HeaderText="Selecionar" 
                                                SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                                ShowSelectButton="True">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:CommandField ButtonType="Image" 
                                                CancelImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                                EditImageUrl="~/clickoportunidades/icones/Standard/001_45.gif" 
                                                HeaderText="Editar" ShowEditButton="True" 
                                                UpdateImageUrl="~/clickoportunidades/icones/Standard/001_39.gif">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_cargo" HeaderText="Código " ReadOnly="True" 
                                                SortExpression="id_cargo">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo">
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Ativar/Desativar" SortExpression="status">
                                                <ItemTemplate>
                                                    <span lang="pt-br">
                                                    <asp:ImageButton ID="btnOK" runat="server" CausesValidation="False" 
                                                        CommandName="Select" ImageUrl="~/icones/Standard/001_18.gif" 
                                                        onclick="btnOK_Click" Text="Select" ToolTip="Cargo ativado" 
                                                        Visible='<%# Eval("status") = 2 %>' />
                                                    <asp:ImageButton ID="btnNO" runat="server" CausesValidation="False" 
                                                        ImageUrl="~/Icones/Standard/001_19.gif" onclick="btnNO_Click" 
                                                        ToolTip="Cargo desativado" Visible='<%# Eval("status") = 1 %>' Width="24px" />
                                                    </span>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                        ImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                                        onclick="ImageButton1_Click" Text="Delete" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="Sqlbuscacargo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT id_cargo, cargo, tipo, status FROM tblCBO WHERE (CAST(id_cargo AS decimal) &gt; 10000) AND (tipo = 'Ocupação') AND (cargo LIKE + @cargo + '%') ORDER BY cargo" 
                                        
                                        UpdateCommand="UPDATE tblCBO SET cargo = @cargo WHERE (id_cargo = @id_cargo)" 
                                        DeleteCommand="DELETE FROM tblCBO WHERE (id_cargo = @id_cargo)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtcargo" DefaultValue="%" Name="cargo" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GridNovoCargo" Name="id_cargo" 
                                                PropertyName="SelectedValue" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="cargo" />
                                            <asp:ControlParameter ControlID="GridNovoCargo" Name="id_cargo" 
                                                PropertyName="SelectedValue" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                            </tr>
                        </table>
               
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server" EnableTheming="False" 
                EnableViewState="False">
                
                    <asp:Label ID="lbladicionarcargo0" runat="server" 
                            Text="Relacione a área x Cargo x Programação Senac"></asp:Label>
                        <br />
                        <table cellpadding="0" cellspacing="0" class="style3">
                            <tr>
                                <td class="style11">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style11">
                                    <asp:Label ID="lblfamilia" runat="server" Text="Área:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="cboarea" runat="server" DataSourceID="SqlArea" 
                                        DataTextField="area" DataValueField="codigo" AutoPostBack="True">
                                        <asp:ListItem>Família</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlArea" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT codigo, area FROM tblSGA_AreasConhecimento">
                                    </asp:SqlDataSource>
                                    <span lang="pt-br">
                                    <asp:SqlDataSource ID="SqlCursoSenac" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT OFERTA, NOME, TIPO FROM viewSGA_Oferta_Faculdade_Union WHERE (AREA_OPERACIONAL_RJ = @area) ORDER BY NOME">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboarea" Name="area" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style11">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style11" valign="top">
                                    Buscar cargo:</td>
                                <td valign="top">
                                    <asp:TextBox ID="txtBuscaCargo" runat="server" Width="200px"></asp:TextBox>
                                    &nbsp;
                                    <asp:ImageButton ID="ImageButton2" runat="server" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style11">
                                    &nbsp;</td>
                                <td>
                                    <span lang="pt-br">
                                    <asp:SqlDataSource ID="SqlCargos" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        SelectCommand="SELECT id_cargo, isnull(cargo,'CARGO NULO') as cargo FROM tblCBO c WHERE (c.tipo = 'Ocupação') AND (c.cargo LIKE + @cargo + '%') AND (CAST(c.id_cargo AS decimal) &gt; 10000) OR (c.cargo IS NULL) ORDER BY c.cargo">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtBuscaCargo" DefaultValue="%" Name="cargo" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblSelecionada" runat="server"></asp:Label>
                                            <br />
                                            <table class="style3">
                                                <tr>
                                                    <td class="style10" colspan="3">
                                                        <asp:Label ID="Label7" runat="server" Text="Selecione a oferta desejada"></asp:Label>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Label ID="Label8" runat="server" 
                                                            Text="Marque aqui os cargos relacionados a oferta selecionada"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style8">
                                                        <asp:Panel ID="Panel2" runat="server" GroupingText="Ofertas" Height="380px" 
                                                            ScrollBars="Vertical" Width="380px">
                                                            <asp:RadioButtonList ID="rdOferta" runat="server" AutoPostBack="True" 
                                                                DataSourceID="SqlCursoSenac" DataTextField="NOME" DataValueField="OFERTA" 
                                                                Font-Size="11px" style="font-size: small">
                                                            </asp:RadioButtonList>
                                                        </asp:Panel>
                                                    </td>
                                                    <td class="style9">
                                                        &nbsp;</td>
                                                    <td>
                                                        <asp:Panel ID="Panel1" runat="server" GroupingText="Cargos" Height="380px" 
                                                            ScrollBars="Vertical" Width="450px">
                                                            <asp:CheckBoxList ID="chkCargo" runat="server" DataSourceID="SqlCargos" 
                                                                DataTextField="cargo" DataValueField="id_cargo" Font-Size="Small" 
                                                                style="font-size: small">
                                                            </asp:CheckBoxList>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style10" colspan="3">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="style11">
                                    <asp:ImageButton ID="btninserir0" runat="server" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/001_03.gif" 
                                        ToolTip="Adicionar novo CBO" ValidationGroup="familia" 
                                        onclientclick="return confirm('Deseja realmente incluir esses registros?') " />
                                    <span lang="pt-br">&nbsp;</span><asp:ImageButton ID="btnCancela0" runat="server" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                        ToolTip="Cancelar " />
                                </td>
                                <td>
                                    <asp:SqlDataSource ID="SqlrelacionaInserir" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        
                                        
                                        InsertCommand="INSERT INTO tblCboOferta(id_cargo_fk, oferta_fk, status) VALUES (@id_cargo_fk, @oferta_fk, 2)">
                                        <InsertParameters>
                                           <asp:Parameter Name="id_cargo_fk" Type="String" />
                                            <asp:ControlParameter ControlID="rdoferta" Name="oferta_fk" 
                                                PropertyName="SelectedValue" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        <br />
                    <asp:Label ID="lbladicionarcargo2" runat="server" 
                        Text="Para modificar um Relacionamento, clique na seta azul para selecionar."></asp:Label>
                    <br />
                        <br />
                        <asp:GridView ID="GridRelacionados" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_CBOOferta,nome" 
                            DataSourceID="SqlAreaSenacCargo" GridLines="Vertical" CellPadding="3" 
                        CellSpacing="1">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                                    HeaderText="Selecionar" 
                                    SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                    SelectText="Selecionar" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:BoundField DataField="id_CBOOferta" HeaderText="Código" 
                                    SortExpression="id_CBOOferta" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="area" HeaderText="Área" SortExpression="area" />
                                <asp:TemplateField HeaderText="Cargo" SortExpression="cargo">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("cargo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cargo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="nome" HeaderText="Oferta Senac" 
                                    SortExpression="nome" />
                                <asp:TemplateField HeaderText="Status" SortExpression="status">
                                    <ItemTemplate>
                                        <span lang="pt-br">
                                        <asp:ImageButton ID="btnOK2" runat="server" CausesValidation="False" 
                                            CommandName="Select" ImageUrl="~/icones/Standard/001_18.gif" 
                                            onclick="btnOK2_Click" Text="Select" ToolTip="Relacionamento ativado" 
                                            Visible='<%# Eval("status") = 2 %>' />
                                        <asp:ImageButton ID="btndesativar" runat="server" CausesValidation="False" 
                                            ImageUrl="~/Icones/Standard/001_19.gif" onclick="btndesativar_Click" 
                                            ToolTip="Relacionamento desativado" Visible='<%# Eval("status") = 1 %>' 
                                            Width="24px" />
                                        </span>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" ButtonType="Image" 
                                    DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                    DeleteText="Excluir" HeaderText="Excluir" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                            </Columns>
                            <SelectedRowStyle BackColor="#E1E1E1" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlAreaSenacCargo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            DeleteCommand="DELETE FROM tblCboOferta WHERE (id_CBOOferta = @id_CBOOferta)" 
                            InsertCommand="INSERT INTO [tblCboOferta] ([id_cargo_fk], [oferta_fk], [status]) VALUES (@id_cargo_fk, @oferta_fk, @status)" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectCommand="SELECT DISTINCT tblCboOferta.status, tblCboOferta.id_CBOOferta, tblCBO.cargo, tblSGA_AreasConhecimento.area, tblSGA_Ofertas.nome FROM tblSGA_AreasConhecimento INNER JOIN tblSGA_Ofertas ON tblSGA_AreasConhecimento.codigo = tblSGA_Ofertas.area_operacional_rj INNER JOIN tblCboOferta ON tblSGA_Ofertas.oferta = tblCboOferta.oferta_fk INNER JOIN tblCBO ON tblCboOferta.id_cargo_fk = tblCBO.id_cargo" 
                            
                        
                        
                        
                        
                        
                                
                                UpdateCommand="UPDATE [tblCboOferta] SET [id_cargo_fk] = @id_cargo_fk, [oferta_fk] = @oferta_fk, [status] = @status WHERE [id_CBOOferta] = @original_id_CBOOferta AND (([id_cargo_fk] = @original_id_cargo_fk) OR ([id_cargo_fk] IS NULL AND @original_id_cargo_fk IS NULL)) AND (([oferta_fk] = @original_oferta_fk) OR ([oferta_fk] IS NULL AND @original_oferta_fk IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL))">
                            <DeleteParameters>
                                <asp:ControlParameter Name="id_CBOOferta" 
                                    ControlID="GridRelacionados" PropertyName="Selectedvalue" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id_cargo_fk" Type="String" />
                                <asp:Parameter Name="oferta_fk" Type="String" />
                                <asp:Parameter Name="status" Type="Int32" />
                                <asp:Parameter Name="original_id_CBOOferta" Type="Int32" />
                                <asp:Parameter Name="original_id_cargo_fk" Type="String" />
                                <asp:Parameter Name="original_oferta_fk" Type="String" />
                                <asp:Parameter Name="original_status" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id_cargo_fk" Type="String" />
                                <asp:Parameter Name="oferta_fk" Type="String" />
                                <asp:Parameter Name="status" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                   
                    <asp:SqlDataSource ID="SqlAtivarRelacionamento" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        SelectCommand="SELECT [id_CBOOferta], [id_cargo_fk], [oferta_fk], [status] FROM [tblCboOferta]" 
                        UpdateCommand="UPDATE tblCboOferta SET status = 2 WHERE (id_CBOOferta = @id_cbooferta)">
                        <UpdateParameters>
                            <asp:SessionParameter Name="id_cbooferta" SessionField="id_codRel" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqldesativarRelacionamento" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        SelectCommand="SELECT [id_CBOOferta], [id_cargo_fk], [oferta_fk], [status] FROM [tblCboOferta]" 
                        UpdateCommand="UPDATE tblCboOferta SET status = 1 WHERE (id_CBOOferta = @id_cbooferta)">
                        <UpdateParameters>
                            <asp:SessionParameter Name="id_cbooferta" SessionField="id_codRel" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                   
            </asp:View>
            <br />
        </asp:MultiView>
        <br />
    
    </div>
    </form>
</body>
</html>
