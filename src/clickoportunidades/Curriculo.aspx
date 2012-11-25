<%@ Page Language="VB" AutoEventWireup="false" CodeFile="curriculo.aspx.vb" Inherits="curriculo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
   <title>CLICK Oportunidades</title>
        <link href="App_Themes/Basico/StyleSheet.css" rel="stylesheet" type="text/css" />
          <link href="App_Themes/Basico/Styles.css" rel="stylesheet" type="text/css" />
         
    
</head>
<body class="umaColunaLiquida" alink="#ffffff">
        <form id="form2" runat="server">
                        <div id="conteudo">
                                
    <table align="center" style="width: 548px">
        <tr>
            <td>
    
                              <div id="principalConteudo">
    
        <asp:Panel ID="Panel1" runat="server" style="text-align: center" 
            HorizontalAlign="Center" Width="547px">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Middle" 
                ImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" 
                ToolTip="Voltar" PostBackUrl="javascript:history.go(-1)" />
            &nbsp;<asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="11px" 
                Text="Voltar"></asp:Label>
            <br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="estado" 
                DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" 
                Font-Names="Verdana" Font-Overline="False" Font-Size="Small" 
                Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                    Font-Strikeout="False" Font-Underline="False" />
                <ItemTemplate>
                    &nbsp;<span lang="pt-br"><asp:Label ID="lblnomeCandidato" runat="server" 
                        Font-Size="14pt" Text='<%# Eval("nome") %>' />
                    <br />
                    <asp:Label ID="lblNacionalidade" runat="server" Text="Nacionalidade:" 
                        Visible='<%# Eval("descricao") <> "Incompleto" %>'></asp:Label>
                    <asp:Label ID="nacionalidadelLabel" runat="server" 
                        Text='<%# Eval("descricao") %>' />
                    <span lang="pt-br">,
                    <asp:Label ID="estadocivilLabel" runat="server" 
                        Text='<%# Eval("estadocivil") %>' />
                    ,
                    <asp:Label ID="idadeLabel" runat="server" Text='<%# Eval("Idade") %>' />
                    anos<br />
                    </span>Rua:</span><asp:Label ID="enderecoLabel" runat="server" 
                        Text='<%# Eval("endereco") %>' />
                    <span lang="pt-br">, nº </span>
                    <asp:Label ID="numeroLabel" runat="server" Text='<%# Eval("numero") %>' />
                    <span lang="pt-br">&nbsp;- </span>
                    <asp:Label ID="BairroLabel" runat="server" Text='<%# Eval("bairro") %>' 
                        Visible='<%# Eval("bairro") <> "Incompleto" %>'></asp:Label>
                    <span lang="pt-br">,</span><br />
                    &nbsp;<span lang="pt-br">CEP:</span><asp:Label ID="cepLabel" runat="server" 
                        Text='<%# Eval("cep") %>' />
                    <span lang="pt-br">&nbsp;-
                    <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("municipio") %>' />
                    &nbsp;- </span>
                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                    <br />
                    <span lang="pt-br">Tel</span>:
                    <asp:Label ID="telefoneLabel" runat="server" Text='<%# Eval("telefone") %>' />
                    <asp:Label ID="lblCelular" runat="server" Text="/Cel:" 
                        Visible='<%# Eval("celular") <> "Incompleto" %>'></asp:Label>
                    &nbsp;<asp:Label ID="celularLabel" runat="server" Text='<%# Eval("celular") %>' 
                        Visible='<%# Eval("celular") <> "Incompleto" %>' />
                    <br />
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    <span lang="pt-br">&nbsp;</span><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>" 
                SelectCommand="SELECT DATEDIFF(year, tblCandidato.nascimento, GETDATE()) AS Idade, ISNULL(tblCandidato.endereco, 'Incompleto') AS endereco, ISNULL(tblCandidato.numero, 'Incompleto') AS numero, tblMunicipio.nome AS municipio, tblEstados.estado, ISNULL(tblCandidato.cep, 'Incompleto') AS cep, tblCandidato.telefone, ISNULL(tblCandidato.celular, 'Incompleto') AS celular, tblCandidato.email, tblCandidato.nome, tblCandidato.identificador, tblNacionalidade.descricao, tblEstadoCivil.estadocivil, ISNULL(tblCandidato.bairro, 'Incompleto') AS bairro FROM tblCandidato INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblEstados ON tblMunicipio.estado_fk = tblEstados.estado INNER JOIN tblNacionalidade ON tblCandidato.id_nacionalidade = tblNacionalidade.id_nacionalidade INNER JOIN tblEstadoCivil ON tblCandidato.id_estadocivil = tblEstadoCivil.id_estadocivil WHERE (tblCandidato.id_candidato = @id_candidato)">
                <SelectParameters>
                    <asp:SessionParameter Name="id_candidato" SessionField="id_candidato" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    
    </div>
                
            </td>
        </tr>
        <tr>
            <td>
    
        <asp:Panel ID="Panel12" runat="server" style="text-align: center" 
            HorizontalAlign="Center" Width="550px" GroupingText="Atuar como">
            <asp:DataList ID="DataList8" runat="server" DataSourceID="sqlObjetivo" 
                        Font-Bold="False" Font-Italic="False" Font-Names="Verdana" 
                        Font-Overline="False" Font-Size="Small" Font-Strikeout="False" 
                        Font-Underline="False" HorizontalAlign="Left" Width="518px" 
                CssClass="labelPreto">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("cargo") %>' 
                        ForeColor="Black"></asp:Label>
                </ItemTemplate>
            </asp:DataList>
            <br />
        </asp:Panel>
            </td>
        </tr>
    </table>
 
        <table align="center" style="width: 550px" __designer:mapid="4cb">
            <tr __designer:mapid="55a">
                <td class="style3" valign="top" __designer:mapid="55b">
                    <asp:Panel ID="Panel11" runat="server" GroupingText="Formação acadêmica" 
                        Visible="False" Width="550px">
                        <span lang="pt-br" 
                        style="font-family: verdana; font-size: 12px; ; font-weight: bold">
                        <asp:DataList ID="DataList2" runat="server" 
                        DataSourceID="sqlFormacao" Font-Bold="False" Font-Italic="False" 
                        Font-Names="Verdana" Font-Overline="False" Font-Size="Small" 
                        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" 
                        Width="550px" 
    style="margin-top: 0px; margin-right: 18px;" CssClass="labelPreto">
                            <ItemTemplate>
                                <span lang="pt-br">&nbsp;
                                <br />
                                </span>
                                <asp:Label ID="formacaoLabel" runat="server" Text='<%# Eval("formacao") %>' 
                                    ForeColor="Black" />
                                <span lang="pt-br" style="color: #000000">:</span><br />
                                <asp:Label ID="instituicaoLabel" runat="server" 
                                Text='<%# Eval("instituicao") %>' ForeColor="Black" />
                                <br />
                                <asp:Label ID="cursoLabel" runat="server" Text='<%# Eval("curso") %>' 
                                    ForeColor="Black" />
                                <br />
                                <span lang="pt-br" style="color: #000000">Período:</span><asp:Label 
                                ID="inicioLabel" runat="server" 
                                Text='<%# Eval("inicio") %>' ForeColor="Black" />
                                <span lang="pt-br" style="color: #000000">-</span><asp:Label ID="fimLabel" runat="server" 
                                Text='<%# Eval("fim") %>' ForeColor="Black" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        </span>
                        <br />
                    </asp:Panel>
                </td>
            </tr>
            <tr __designer:mapid="4ea">
                <td class="style3" valign="top" __designer:mapid="4eb">
                    <span lang="pt-br" 
                        style="font-family: verdana; font-size: 12px; ; font-weight: bold" 
                        __designer:mapid="4ec">
                    <asp:Panel ID="Panel3" runat="server" 
                        Width="550px" GroupingText="Cursos realizados no Senac Rio">
                        <asp:DataList ID="DataList3" runat="server" DataKeyField="nivel_codigo" 
                            DataSourceID="SqlDataSource2" Font-Bold="False" Font-Italic="False" 
                            Font-Names="Verdana" Font-Overline="False" Font-Size="Small" 
                            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" 
                            Width="557px" CssClass="labelPreto">
                            <ItemTemplate>
                                <span lang="pt-br">&nbsp;
                                <br />
                                </span>
                                <asp:Label ID="NIVELLabel" runat="server" Text='<%# Eval("NIVEL") %>' 
                                    ForeColor="Black" />
                                <br />
                                <asp:Label ID="cursoLabel0" runat="server" Text='<%# Eval("curso") %>' 
                                    ForeColor="Black" />
                                <br />
                                <span lang="pt-br" style="color: #000000">Período:</span><asp:Label 
                                    ID="conclusaoLabel" runat="server" 
                                    Text='<%# Eval("mes") %>' ForeColor="Black" />
                                <span lang="pt-br" style="color: #000000">/<asp:Label ID="conclusaoLabel0" runat="server" 
                                    Text='<%# Eval("ano") %>' ForeColor="Black" />
                                </span>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            
                            
                            SelectCommand="SELECT { fn MONTH(tblSGA_ClientesComOferta.conclusao) } AS mes, YEAR(tblSGA_ClientesComOferta.conclusao) AS ano, tblSGA_ClientesComOferta.NIVEL, tblSGA_ClientesComOferta.curso, tblSGA_ClientesComOferta.unidade, tblSGA_ClientesComOferta.IDENTIFICADOR, tblSGA_ClientesComOferta.nivel_codigo FROM tblSGA_Ofertas INNER JOIN tblSGA_ClientesComOferta INNER JOIN tblCandidato ON tblSGA_ClientesComOferta.IDENTIFICADOR = tblCandidato.identificador ON tblSGA_Ofertas.oferta = tblSGA_ClientesComOferta.id_oferta WHERE (tblCandidato.id_candidato = @id_candidato)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato" 
                                    SessionField="id_candidato" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    </span>
                </td>
            </tr>
            <tr __designer:mapid="4ff">
                <td class="style3" valign="top" __designer:mapid="500">
                    <span lang="pt-br" 
                        style="font-family: verdana; font-size: 12px; ; font-weight: bold" 
                        __designer:mapid="501">
                    <asp:Panel ID="Panel7" runat="server" Width="550px" 
                        GroupingText="Histórico Profissional">
                        <asp:DataList ID="DataList6" runat="server" DataSourceID="sqlHistoricoProf" 
                            Font-Bold="False" Font-Italic="False" Font-Names="Verdana" 
                            Font-Overline="False" Font-Size="Small" Font-Strikeout="False" 
                            Font-Underline="False" HorizontalAlign="Left" Width="537px" 
                            ForeColor="Black">
                            <ItemTemplate>
                                <span lang="pt-br">&nbsp;
                                <br />
                                </span>Empresa
                                <asp:Label ID="empresaLabel" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("empresa") %>' ForeColor="Black" />
                                <br />
                                <span lang="pt-br">Perío</span><span lang="pt-br">do:</span>&nbsp;<asp:Label 
                                    ID="inicioLabel0" runat="server" 
                                    Text='<%# Eval("inicio") %>' ForeColor="Black" />
                                <span lang="pt-br">&nbsp;até&nbsp;
                                <asp:Label ID="fimLabel0" runat="server" Text='<%# Eval("fim") %>' 
                                    ForeColor="Black" />
                                </span>
                                <br />
                                <span lang="pt-br">Função</span>:&nbsp;
                                <asp:Label ID="cargoLabel" runat="server" Text='<%# Eval("cargo") %>' 
                                    ForeColor="Black" />
                                <span lang="pt-br" style="color: #000000">
                                <br />
                                Atividades: </span>
                                <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' 
                                    ForeColor="Black" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <asp:SqlDataSource ID="sqlHistoricoProf" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            
                            SelectCommand="SELECT tblCandidatoHistorico.empresa, tblCandidatoHistorico.inicio, tblCandidatoHistorico.fim, tblCandidatoHistorico.trabalhando, tblCandidatoHistorico.remuneracao, tblCandidatoHistorico.descricao, tblCBO.cargo FROM tblCandidatoHistorico INNER JOIN tblCBO ON tblCandidatoHistorico.id_cargo_fk = tblCBO.id_cargo WHERE (tblCandidatoHistorico.id_candidato_fk = @id_candidato_fk)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    </span>
                </td>
            </tr>
            <tr __designer:mapid="518">
                <td class="style3" valign="top" __designer:mapid="519">
                    <span lang="pt-br" 
                        style="font-family: verdana; font-size: 12px; ; font-weight: bold" 
                        __designer:mapid="51a">
                    <asp:Panel ID="Panel8" runat="server" Width="550px" GroupingText="Idiomas">
                        <asp:DataList ID="DataList7" runat="server" DataSourceID="sqlIdiomas" 
                            Font-Bold="False" Font-Italic="False" Font-Names="Verdana" 
                            Font-Overline="False" Font-Size="Small" Font-Strikeout="False" 
                            Font-Underline="False" HorizontalAlign="Left" Width="540px" 
                            CssClass="labelPreto">
                            <ItemTemplate>
                                &nbsp;<span lang="pt-br">&nbsp;
                                <br />
                                </span>
                                <asp:Label ID="descricaoLabel0" runat="server" 
                                    Text='<%# Eval("descricao") %>' ForeColor="Black" />
                                <span lang="pt-br">&nbsp;</span><asp:Label 
                                    ID="nivelLabel0" runat="server" 
                                    Text='<%# Eval("nivel") %>' ForeColor="Black" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <asp:SqlDataSource ID="sqlIdiomas" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            
                            SelectCommand="SELECT tblConhecimento.descricao, tblCandidatoConhecimento.nivel, tblConhecimento.id_area_fk FROM tblConhecimento RIGHT OUTER JOIN tblCandidatoConhecimento ON tblConhecimento.id_conhecimento = tblCandidatoConhecimento.id_conhecimento_fk WHERE (tblCandidatoConhecimento.id_candidato_fk = @id_candidato_fk) AND (tblConhecimento.id_area_fk = 'AH')">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    </span>
                </td>
            </tr>
            <tr __designer:mapid="528">
                <td class="style3" valign="top" __designer:mapid="529">
                    <span lang="pt-br" 
                        style="font-family: verdana; font-size: 12px; ; font-weight: bold" 
                        __designer:mapid="52a">
                    <asp:Panel ID="Panel10" runat="server" Width="550px" GroupingText="Informática">
                        <asp:DataList ID="DataList9" runat="server" DataSourceID="sqlInformatica" 
                            Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" 
                            Font-Size="Small" Font-Strikeout="False" Font-Underline="False" 
                            HorizontalAlign="Left" ShowFooter="False" ShowHeader="False" Width="542px" 
                            CssClass="labelPreto">
                            <ItemTemplate>
                                <span lang="pt-br">&nbsp;
                                <br />
                                </span>
                                <asp:Label ID="descricaoLabel1" runat="server" 
                                    Text='<%# Eval("descricao") %>' ForeColor="Black" />
                                <span lang="pt-br">&nbsp;</span><asp:Label 
                                    ID="nivelLabel1" runat="server" 
                                    Text='<%# Eval("nivel") %>' ForeColor="Black" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <asp:SqlDataSource ID="sqlInformatica" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            
                            SelectCommand="SELECT tblConhecimento.descricao, tblCandidatoConhecimento.nivel, tblConhecimento.id_area_fk FROM tblConhecimento RIGHT OUTER JOIN tblCandidatoConhecimento ON tblConhecimento.id_conhecimento = tblCandidatoConhecimento.id_conhecimento_fk WHERE (tblCandidatoConhecimento.id_candidato_fk = @id_candidato_fk) AND (tblConhecimento.id_area_fk = 'AE')">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    </span>
                </td>
            </tr>
            <tr __designer:mapid="538">
                <td class="style3" valign="top" __designer:mapid="539">
                    <span lang="pt-br" 
                        style="font-family: verdana; font-size: 12px; ; font-weight: bold" 
                        __designer:mapid="53a">
                    <asp:Panel ID="Panel4" runat="server" Height="437px" 
                        Width="550px" GroupingText="Cursos complementares">
                        <asp:DataList ID="DataList4" runat="server" DataSourceID="sqlOutrosCursos" 
                            Font-Bold="False" Font-Italic="False" Font-Names="Verdana" 
                            Font-Overline="False" Font-Size="Small" Font-Strikeout="False" 
                            Font-Underline="False" HorizontalAlign="Left" Width="542px" 
                            ForeColor="Black">
                            <ItemTemplate>
                                <span lang="pt-br">&nbsp;
                                <br />
                                </span>
                                <asp:Label ID="cursoLabel1" runat="server" Text='<%# Eval("curso") %>' 
                                    ForeColor="Black" />
                                <br />
                                <asp:Label ID="instituicaoLabel0" runat="server" 
                                    Text='<%# Eval("instituicao") %>' ForeColor="Black" />
                                <br />
                                <span lang="pt-br">Duração</span>:<span lang="pt-br" style="color: #000000"> </span>
                                <asp:Label ID="cargaLabel" runat="server" Text='<%# Eval("carga") %>' 
                                    ForeColor="Black" />
                                <span lang="pt-br" style="color: #000000">h</span><br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <asp:SqlDataSource ID="sqlOutrosCursos" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            
                            SelectCommand="SELECT curso, instituicao, conclusao, carga FROM tblCandidatoCursosOutros WHERE (id_candidato_fk = @id_candidato_fk)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:Panel>
                    </span>
                </td>
            </tr>
            </table>
    
                        <asp:SqlDataSource ID="sqlobjetivo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            
            SelectCommand="SELECT tblCBO.cargo FROM tblCandidatoObjetivo INNER JOIN tblCBO ON tblCandidatoObjetivo.id_cargo_fk = tblCBO.id_cargo WHERE (id_candidato_fk = @id_candidato_fk)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlFormacao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            
            
        SelectCommand="SELECT ISNULL(tblCandidatoFormacao.instituicao, 'Incompleto') AS Instituicao, ISNULL(tblCandidatoFormacao.curso, '') AS curso, ISNULL(tblCandidatoFormacao.inicio, 'Incompleto') AS inicio, ISNULL(tblCandidatoFormacao.fim, 'Incompleto') AS fim, tblFormacaoNivel.formacao FROM tblCandidatoFormacao INNER JOIN tblCandidato ON tblCandidatoFormacao.id_candidato_fk = tblCandidato.id_candidato INNER JOIN tblFormacaoNivel ON tblCandidatoFormacao.id_formacaonivel_fk = tblFormacaoNivel.id_formacaonivel WHERE (tblCandidatoFormacao.id_candidato_fk = @id_candidato_fk)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                            </SelectParameters>
                        </asp:SqlDataSource>
     <!-- fim #principalConteudo --></div>
	                            <br />
	                            
	                        
                                  
  <!-- fim #rodape -->       
<!-- fim  #conteudo -->
 
        </form>
       
        
        </body>
</html>
