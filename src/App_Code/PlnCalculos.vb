Imports Microsoft.VisualBasic
Imports System.Math

Public Class PlnCalculos

    Private _fatorcalculo, _fluxocaixaAjustado, _fluxocaixa, _tir As Decimal
    Private _anos, _meses As Integer

    ReadOnly Property tir() As Decimal
        Get
            Return _tir
        End Get
    End Property

    ReadOnly Property fatorcalculo() As Decimal
        Get
            Return _fatorcalculo
        End Get
    End Property
    ReadOnly Property fluxocaixaajustado() As Decimal
        Get
            Return _fluxocaixaAjustado

        End Get
    End Property

    ReadOnly Property fluxocaixa() As Decimal
        Get
            Return _fluxocaixa
        End Get
    End Property
    ReadOnly Property anos() As Decimal
        Get
            Return _anos
        End Get
    End Property
    ReadOnly Property meses() As Decimal
        Get
            Return _meses
        End Get
    End Property

#Region " SEM PERPETUIDADE "
    Shared Function retornaTotal(ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As Integer
        Dim i As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT nMesesEntrada as total FROM dbo.plnProjeto where id_Projeto=" + id_Projeto.ToString, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            Try
                i = Integer.Parse(reader(0))
            Catch
                i = 0
            End Try
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i

    End Function
    Shared Function retornaTotalSaida(ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As Integer
        Dim i As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT nmesesSaida FROM dbo.plnProjeto where id_Projeto=" + id_Projeto.ToString, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            Try
                i = Integer.Parse(reader(0))
            Catch
                i = 0
            End Try
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i

    End Function
    Shared Function retornaMesesProjeto(ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As Integer
        Dim i As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT nMesesEntrada FROM dbo.plnProjeito where id_Projeto=" + id_Projeto.ToString, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            Try
                i = Integer.Parse(reader(0))
            Catch
                i = 0
            End Try
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i
    End Function

    Shared Function retornaTotalEntrada(ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As Integer
        Dim i As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT nmesesEntrada FROM dbo.plnProjeto where id_Projeto=" + id_Projeto.ToString, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            Try
                i = Integer.Parse(reader(0))
            Catch
                i = 0
            End Try
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i
    End Function




    Shared Function retornaValor(ByVal id_array As Integer, ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As Double
        Dim i As Double = 0


        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT valor FROM fnValorDespesaPLN(" + id_Projeto.ToString + "," + id_empresa.ToString + ") WHERE mes=" + id_array.ToString, conn)


        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()




        If reader.HasRows Then
            reader.Read()
            i = Double.Parse(reader(0))
        Else
            i = 0
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i

    End Function

    Shared Function retornaDescricao(ByVal id_array As Integer, ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As String
        Dim i As String = ""

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT isnull(descricao,'') as descricao FROM plnReceitasDespesasTemp where id_Projeto=" + id_Projeto.ToString + " and id_empresa=" + id_empresa.ToString + " and mes=" + id_array.ToString, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            i = reader(0).ToString()
        Else
            i = ""
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i
    End Function
    Shared Function retornaValorEntSaida(ByVal id_array As Integer, ByVal id_Projeto As Integer, ByVal id_empresa As Integer, ByVal flag As Integer) As Double
        Dim i As Double = 0

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select valordespesareceita from dbo.plnReceitasDespesasTemp where id_Projeto=" + id_Projeto.ToString + " and id_empresa=" + id_empresa.ToString + " and mes=" + id_array.ToString + " and flagdespesareceita=" + flag.ToString, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            i = Double.Parse(reader(0))
        Else
            i = 0
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i
    End Function

    Shared Function Finaliza(ByVal id_Projeto As Integer, ByVal id_empresa As Integer) As Boolean
        Dim Saida, Entrada As Double
        Dim b As Boolean
        Dim totalSaida As Integer = retornaTotalSaida(id_Projeto, id_empresa)
        Dim totalEntrada As Integer = retornaTotalEntrada(id_Projeto, id_empresa)


        Saida = retornaValorEntSaida(totalSaida, id_Projeto, id_empresa, 1)
        Entrada = retornaValorEntSaida(totalEntrada, id_Projeto, id_empresa, 0)

        If Saida = 0 Or Entrada = 0 Then
            b = False
        Else
            b = True

        End If

        Return b

    End Function


    Public Sub TestIRR(ByVal TaxaRef As Decimal, ByVal vlInvestimento As Decimal, ByVal id_Projeto As Integer, ByVal id_empresa As Integer)
        Dim Guess, RetRate, Values(retornaTotalEntrada(id_Projeto, id_empresa)), valorPayBack(retornaTotal(id_Projeto, id_empresa)) As Double

        Dim y As Integer = 0

        Dim payback As Integer = retornaValor(0, id_Projeto, id_empresa)


        Dim Fmt, Msg As String
        Guess = 0.1
        Fmt = "#0.00"
        'Values(0) = 0 - vlInvestimento
        ' valorPayBack(0) = 0 - vlInvestimento

        'array da vpl e tir
        For x As Integer = 0 To retornaTotalEntrada(id_Projeto, id_empresa)
            Values(x) = Double.Parse(retornaValor(x, id_Projeto, id_empresa))
        Next

        'gera payback
        For x As Integer = 1 To retornaTotal(id_Projeto, id_empresa)

            payback += (Double.Parse(retornaValor(x, id_Projeto, id_empresa))) * Round(((100 - TaxaRef * 100) / 100), 2)
            y += 1

            If Decimal.Parse(payback) >= 0 Then
                Exit For
            End If
        Next

        'cálculo tir
        Try
            _tir = IRR(Values, Guess) * 100
        Catch
            _tir = 0
        End Try

        Dim valor As Decimal
        Dim taxa As Decimal

        taxa = TaxaRef

        Dim i As Integer
        _fluxocaixa = 0

        'cálculo da vpl 
        For i = 0 To retornaTotalSaida(id_Projeto, id_empresa)
            valor = valor + Values(i)
            _fatorcalculo = (1 + taxa) ^ i
            _fluxocaixaAjustado = Values(i) / _fatorcalculo
            _fluxocaixa = _fluxocaixa + (Values(i) / _fatorcalculo)
        Next

        'calculo payback
        _meses = y - (Truncate((y / 12)) * 12)
        _anos = (Truncate((y) / 12))

    End Sub


    'IPmt      namespace - Microsoft.VisualBasic.Financial 


    'IPmt(rate, per, nper, pv[, fv[, due]])

    'rate (requerido,Double) - a taxa de juros por período.
    'per (requerido,Double) - o período no qual o pagamento será computado.
    'nper (requerido;Double) - número total de pagamentos no período.
    'pv (requerido;Double) - o valor atual de uma série de pagamentos futuros.
    'fv (opcional;Double) - o valor futuro ou balanço de caixa de um pagamento final. Se omitido o valor padrão é zero.

    'due (opcional,DueDat enumeration) - valor que indica quando os pagamentos são devidos. O valor padrão é DueDate.EndOfPeriod.

    'DueDate.EndOfPeriod ou 0 : indica que o pagamento são devidos no final do período de pagamento 
    'DueDate.BegOfPeriod ou 1 : indica que o pagamento são devidos no início do período 
    'Valor de Retorno : retorna um Double representando o valor do pagamento dos juros sobre o capital investido/emprestado para um período de uma anuidade. Uma anuidade é uma série de pagamentos fixos feitos sobre um período de tempo.

    'Suponha que você tenha emprestado R$ 30.000,00 a uma taxa de juros anual de 11,5% para ser pago em 3 anos com pagamentos feitos no final de cada mês. Vamos calcular o valor do pagamento mensal e total que você dever receber sobre o capital no período.

    'Para resolver o problema basta aplicar a função : IPmt(rate, per, nper, pv[, fv[, due]])

    'Vamos então identificar o valor de cada argumento:

    'rate - a taxa de juros mensal é obtida dividindo-se a taxa de juros anual por 12 => 0.115/12
    'per - o período deverá estar compreendido entre 1 e 36 ( 3 anos)
    'nper - o número de pagamentos => 36 
    'pv - o valor atual => 30.000,00
    'fv - será omitido => 0
    'due - o pagamento será feito no ínicio de cada mês => 1

    'Teremos então : lPmt(0.009583333, 1-36, 36, -30.000, 0, 1)
    'O primeiro pagamento é de r$ 278,10 e o último pagamento é menor que R$ 10,00. O total pago é R$ 5.276,02 sobre o capital. 


    Sub CalculaJuros()
        'IPmt(rate, per, nper, pv[, fv[, due]])
        'lPmt(0.009583333, 1-36, 36, -30.000, 0, 1)
        Dim pv, fv, nper As Double
        Dim rate, Pagamento, Total As Decimal
        pv = 30000
        fv = 0
        rate = 0.115 / 12
        nper = 3 * 12
        Dim per As Integer

        For per = 1 To nper
            Pagamento = IPmt(rate, per, nper, -pv, fv, 1)
            '   Console.WriteLine(" mês " & per & " : " & Pagamento)
            Total = Total + Pagamento
        Next

        'Console.WriteLine("Total dos juros no período : " & Total)
        'TextBox3.Text = "Total dos juros no período : " & Total
        Console.ReadLine()
    End Sub

    '    PPmt      namespace - Microsoft.VisualBasic.Financial 

    'PPmt(rate, per, nper, pv[, fv[, due]])

    'rate (requerido,Double) - a taxa de juros por período.
    'per (requerido,Double) - o período no qual o pagamento será computado.
    'nper (requerido;Double) - número total de pagamentos no período.
    'pv (requerido;Double) - o valor atual de uma série de pagamentos futuros.
    'fv (opcional;Double) - o valor futuro ou balanço de caixa de um pagamento final. Se omitido o valor padrão é zero.
    'due (opcional,DueDat enumeration) - valor que indica quando os pagamentos são devidos. O valor padrão é DueDate.EndOfPeriod.

    'DueDate.EndOfPeriod ou 0 : indica que o pagamento são devidos no final do período de pagamento 
    'DueDate.BegOfPeriod ou 1 : indica que o pagamento são devidos no início do período 
    'Valor de Retorno : retorna um Double representando o pagamento do principal investido/aplicado para um dado período de um anuidade.

    'Para calcularmos o pagamento do principal para o exemplo anterior usamos a função : PPmt(0.009583333, 1-36, 36, -30.000, 0, 1)

    Sub CalculaTotalPagto()
        'PPmt(rate, per, nper, pv[, fv[, due]])
        'lPmt(0.009583333, 1-36, 36, -30.000, 0, 1)
        Dim pv, fv, nper As Double
        Dim rate, Pagamento, Total As Decimal
        pv = 30000
        fv = 0
        rate = 0.115 / 12
        nper = 3 * 12
        Dim per As Integer
        For per = 1 To nper
            Pagamento = PPmt(rate, per, nper, -pv, fv, 1)
            '  Console.WriteLine(" mês " & per & " : " & Pagamento)
            Total = Total + Pagamento
        Next
        'Console.WriteLine("Total do pagamento do principal : " & Total)
        'TextBox4.Text = "Total do pagamento do principal : " & Total
        Console.ReadLine()
    End Sub

    '    Pmt      namespace - Microsoft.VisualBasic.Financial 

    'Pmt(rate, nper, pv[, fv[, due]])

    'rate (requerido,Double) - a taxa de juros por período.
    'nper (requerido;Double) - número total de pagamentos no período.
    'pv (requerido;Double) - o valor atual de uma série de pagamentos futuros.
    'fv (opcional;Double) - o valor futuro ou balanço de caixa de um pagamento final. Se omitido o valor padrão é zero.
    'due (opcional,DueDat enumeration) - valor que indica quando os pagamentos são devidos. O valor padrão é DueDate.EndOfPeriod.

    'DueDate.EndOfPeriod ou 0 : indica que o pagamento são devidos no final do período de pagamento 
    'DueDate.BegOfPeriod ou 1 : indica que o pagamento são devidos no início do período 
    'Valor de Retorno : retorna um Double representando o pagamento(principal e juros) para uma anuidade baseada em um período com pagamentos e taxa de juros fixos.

    Sub CalculaTotalRecebido()
        'Pmt(rate, nper, pv[, fv[, due]])
        'Pmt(0.009583333, 36 , 30000 , 0 , 1)
        Dim pv, fv, nper As Double
        Dim rate, Pagamento, Total As Decimal
        pv = 30000
        fv = 0
        rate = 0.115 / 12
        nper = 3 * 12
        Dim per As Integer
        For per = 1 To nper
            Pagamento = Pmt(rate, nper, -pv, fv, 1)
            Console.WriteLine(" mês " & per & " : " & Pagamento)
            Total = Total + Pagamento
        Next
        Console.WriteLine("Total recebido no período : " & Total)
        ' TextBox5.Text = "Total recebido no período : " & Total
        Console.ReadLine()
    End Sub


    Sub CalculaRetorno()

        'FV(rate, nper, pmt [, pv [, due]])

        'rate (requerido,Double) - a taxa de juros por período.
        'nper (requerido;Double) - número total de pagamentos no período.
        'pmt (requerido;Double) - o pagamento feito em cada período.
        'pv (opcional;Variant) - o valor atual de um capital ou anuidade.
        'due (opcional,DueDat enumeration) - valor que indica quando os pagamentos são devidos. O valor padrão é DueDate.EndOfPeriod.

        'DueDate.EndOfPeriod ou 0 : indica que o pagamento são devidos no final do período de pagamento 
        'DueDate.BegOfPeriod ou 1 : indica que o pagamento são devidos no início do período 
        'Valor de Retorno : retorna um Double representando o valor futuro de uma anuidade baseado em um número regular de pagamentos de um valor fixo e uma taxa de juros sobre o período da anuidade.

        'Vamos supor que você deseja calcular o valor futuro de um investimento com uma taxa de juros de 6,25% , 48 pagamentos mensais de R$ 180,00 , e um valor presente de R$ 12.000,00. 

        'Vamos definir os argumentos para a função : FV(rate, nper, pmt [, pv [, due]])

        'rate - a taxa de juros => 0,0625
        'nper - número de pagamentos => 48
        'pmt - pagamento feito em cada período => 180,00
        'pv - valor atual do capital => 12.000,00
        'due - no início do período => 1 (DueDate.BegOfPeriod)


        'FV(rate, nper, pmt [, pv [, due]])
        'Vamos supor que você deseja calcular o valor futuro de um investimento 
        'com uma taxa de juros de 6,25% ANUAL, 48 pagamentos mensais de R$ 180,00 , 
        'e um valor presente de R$ 12.000,00. 
        Dim pv, valor As Double
        Dim rate, pmt As Double
        Dim nper As Integer
        pmt = 180
        rate = 6.25 / 100
        nper = 48
        pv = 12000

        'Console.WriteLine("Investimento      :  " + pv.ToString)
        'Console.WriteLine("Taxa de juros     :  " + (rate / 12).ToString)
        'Console.WriteLine("No de pagamentos  :  " + nper.ToString)
        'Console.WriteLine("Valor pgto mensal :  " + pmt.ToString)
        'Console.WriteLine("")

        valor = FV(rate / 12, nper, -pmt, -pv, DueDate.BegOfPeriod)

        'MsgBox("Após " & nper & " meses seus retorno será de : R$ " & valor)
        'TextBox2.Text = "Após " & nper & " meses seus retorno será de : R$ " & valor
        Console.ReadLine()
    End Sub

    'NPer     namespace - Microsoft.VisualBasic.Financial 

    'NPer(rate, pmt , pv [, fv [, due]])

    'rate (requerido,Double) - a taxa de juros por período.
    'pmt (requerido;Double) - o pagamento feito em cada período.
    'pv (opcional;Variant) - o valor atual de uma série de pagamentos futuros.
    'fv (opcional;Double) - o valor futuro de uma série de pagamentos. Se omitido o valor padrão é zero.
    'due (opcional,DueDat enumeration) - valor que indica quando os pagamentos são devidos. O valor padrão é DueDate.EndOfPeriod.

    'DueDate.EndOfPeriod ou 0 : indica que o pagamento são devidos no final do período de pagamento 
    'DueDate.BegOfPeriod ou 1 : indica que o pagamento são devidos no início do período 
    'Valor de Retorno : retorna um Double representando o número de pagamentos periódicos para uma anuidade.

    'Vamos supor que você tome um empréstimo de R$ 25.000,00 a juros de 11,5% ao ano, e você deseja pagar R$ 450,00 por mês. Vamos calcular qual o número de pagamentos você precisará fazer para quitar o empréstimo. 

    'Usando a função NPer(rate, pmt , pv [, fv [, due]]) teremos :

    'rate - a taxa de juros do período => 0,115/12
    'pmt - pagamento feito em cada período => 450,00
    'pv - valor atual do capital => 25.000,00
    'fv - o valor futuro de uma série de pagamentos. Se omitido o valor padrão é zero.
    'due - no início do período => 1 (DueDate.BegOfPeriod)

    'O valor retornado para o exemplo será de 80 meses ou 6 anos e meio. Se o pagamento for aumentado de R$ 450,00 para R$ 500,00 a duração será reduzida para 68 meses.

    Sub DuracaoEmprestimo()
        'NPer(rate, pmt , pv [, fv [, due]])
        'Vamos supor que você tome um empréstimo de R$ 25.000,00 a juros de 11,5% ao ano, 
        'e você deseja pagar R$ 450,00 por mês. Vamos calcular qual o número de pagamentos
        ' você precisará fazer para quitar o empréstimo. 
        '
        Dim pv, fv As Integer
        Dim rate, pmt As Double
        Dim Total As Integer
        fv = 0
        pv = 25000
        rate = 0.115 / 12
        pmt = 450
        Total = NPer(rate, -pmt, pv, fv, DueDate.EndOfPeriod)
        If Int(Total) <> Total Then
            Total = Int(Total) + 1
        End If
        'Console.WriteLine(" A duração do empréstimo será de : " & Total & " meses")
        ' TextBox6.Text = " A duração do empréstimo será de : " & Total & " meses"
        Console.ReadLine()
    End Sub




    'Rate     namespace - Microsoft.VisualBasic.Financial 

    'Rate(nper, pmt , pv [, fv [, due[, guess]]])

    'nper (requerido,Double) - representa o número total de pagamentos no período da anuidade.
    'pmt (requerido;Double) - o pagamento feito em cada período.
    'pv (opcional;Variant) - o valor atual de uma série de pagamentos futuros.
    'fv (opcional;Double) - o valor futuro de uma série de pagamentos. Se omitido o valor padrão é zero.
    'due (opcional,DueDat enumeration) - valor que indica quando os pagamentos são devidos. O valor padrão é DueDate.EndOfPeriod.

    'DueDate.EndOfPeriod ou 0 : indica que o pagamento são devidos no final do período de pagamento 
    'DueDate.BegOfPeriod ou 1 : indica que o pagamento são devidos no início do período 
    'guess (opcional Variant) -especifica um valor estimado que será retornado pela taxa (rate). Se omitido o valor padrão é 0.1 (10 %)

    'Valor de Retorno : retorna um Double representando a taxa de juros para o período da anuidade.

    Sub CalculaTxJuros()

        'Rate(nper, pmt , pv [, fv [, due[, guess]]])

        Dim Fmt, FVal, Guess, valorFinanciado, valorPagamento, numeroPagamentos, tpPgto, taxa
        Const ENDPERIOD As Int16 = 0
        Const BEGINPERIOD As Int16 = 1  ' Quando o pagamento será feito

        Fmt = "##0.00" ' Define o formato da porcentagem. 
        FVal = 0       ' ususalmente zero para um financiamento
        Guess = 0.1    ' 10%. 
        valorFinanciado = InputBox("Quanto deseja financiar ?")
        valorPagamento = InputBox("Qual o valor do pagamento mensal ?")
        numeroPagamentos = InputBox("Quer pagar em quantos meses ?")
        tpPgto = MsgBox("Você vai realizar pagamentos no final do mês ? ", vbYesNo)
        If tpPgto = vbNo Then
            tpPgto = BEGINPERIOD
        Else
            tpPgto = ENDPERIOD
        End If
        taxa = (Rate(numeroPagamentos, -valorPagamento, valorFinanciado, FVal, tpPgto, Guess) * 12) * 100
        'MsgBox("A taxa de juros é : " & Format(CInt(taxa), Fmt) & " % ")
        'TextBox7.Text = "A taxa de juros é : " & Format(CInt(taxa), Fmt) & " % "
        Console.ReadLine()
    End Sub
#End Region


#Region " COM PERPETUIDADE "

    Shared Function Perpetuidade(ByVal id_projeto As Integer, ByVal id_empresa As Integer) As Boolean

        Dim b As Boolean = False
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT isnull(Max(CAST(perpetuidade AS int)),0) FROM dbo.plnReceitasDespesasTemp WHERE id_projeto=" + id_projeto.ToString + " and id_empresa=" + id_empresa.ToString, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            If Integer.Parse(reader(0)) = 1 Then
                b = True
            Else
                b = False

            End If
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return b
    End Function


    Shared Function retornaMesesP(ByVal id_projeto As Integer, ByVal id_empresa As Integer) As Integer
        Dim i As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT MIN(mes) AS mes FROM dbo.plnReceitasDespesasTemp WHERE perpetuidade=1 AND mes<>0 and id_projeto=" + id_projeto.ToString + " and id_empresa=" + id_empresa.ToString, conn)


        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            Try
                i = Integer.Parse(reader(0))
            Catch
                i = 0
            End Try
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i
    End Function

    Shared Function retornaRecDespP(ByVal id_projeto As Integer, ByVal id_empresa As Integer, ByVal flag As Integer) As Decimal
        Dim i As Decimal = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SenacConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT  MIN(valorDespesaReceita) AS valor FROM dbo.plnReceitasDespesasTemp WHERE flagDespesaReceita=" + flag.ToString + " and perpetuidade=1 and id_projeto=" + id_projeto.ToString + " and id_empresa=" + id_empresa.ToString, conn)


        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            Try
                i = Decimal.Parse(reader(0))
            Catch
                i = 0
            End Try
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i
    End Function

    Public Sub TestIRRP(ByVal TaxaRef As Decimal, ByVal vlInvestimento As Decimal, ByVal id_projeto As Integer, ByVal id_empresa As Integer)
        Dim Guess, RetRate, Values(retornaMesesP(id_projeto, id_empresa)), valorPayBack(retornaMesesP(id_projeto, id_empresa)) As Double

        Dim y As Integer = 0

        Dim payback As Integer = retornaValor(0, id_projeto, id_empresa)

        Dim Fmt, Msg As String
        Guess = 0.1
        Fmt = "#0.00"
        'Values(0) = 0 - vlInvestimento
        ' valorPayBack(0) = 0 - vlInvestimento

        'array da vpl e tir
        For x As Integer = 0 To retornaMesesP(id_projeto, id_empresa)
            Values(x) = Double.Parse(retornaValor(x, id_projeto, id_empresa))
        Next

        'gera payback
        For x As Integer = 1 To retornaTotal(id_projeto, id_empresa)
            payback += (Double.Parse(retornaValor(x, id_projeto, id_empresa))) * Round(((100 - TaxaRef * 100) / 100), 2)
            y += 1
            If Decimal.Parse(payback) >= 0 Then
                Exit For
            End If
        Next

        'cálculo tir
        Try
            _tir = IRR(Values, Guess) * 100

        Catch
            _tir = 0
        End Try

        Dim valor As Decimal
        Dim taxa As Decimal
        taxa = TaxaRef

        Dim i As Integer
        _fluxocaixa = 0

        'cálculo da vpl 
        For i = 0 To retornaMesesP(id_projeto, id_empresa)
            valor = valor + Values(i)
            _fatorcalculo = (1 + taxa) ^ i
            _fluxocaixaAjustado = Values(i) / _fatorcalculo
            _fluxocaixa = _fluxocaixa + (Values(i) / _fatorcalculo)
        Next

        _fluxocaixa += (retornaRecDespP(id_projeto, id_empresa, 1) - retornaRecDespP(id_projeto, id_empresa, 0)) / TaxaRef

        'calculo payback
        _meses = y - (Truncate((y / 12)) * 12)
        _anos = (Truncate((y) / 12))
    End Sub


#End Region

End Class
