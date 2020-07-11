#Include "Protheus.Ch"
#Include "RwMake.Ch"
#Include "Totvs.Ch"
#Include "RPTDEF.CH"
#Include "FWPrintSetup.ch"
#Include "COLORS.CH"

/* #########################################################################################
// -----------------------------------------+----------------------------------------------+
// Modulo :FINANCEIRO                                                                      |
// Fonte  :BOLETOPDF()                                                                     |
// -----------+-------------------+--------------------------------------------------------+
// Data       | Autor             | Descricao                                              |
// -----------+-------------------+--------------------------------------------------------+
// 10/07/2020 | Michael M. Castro | Layout de Boleto Modelo Grafico em PDF                 |
// -----------+-------------------+--------------------------------------------------------+
// #########################################################################################*/
User Function BOLETOPDF()

//-------------------------------------------------------------------------+
// Inicializacao do objeto grafico                                         |
//-------------------------------------------------------------------------+
Local n_Lin       := 0
Local n_Col       := 0
Local n_hLin      := 0
Local n_LinSav    := 0
Local n_SavLin2   := 0
Local n_VLin      := 0
Local n_VCol      := 0

Local PixelX	  := nil
Local PixelY	  := nil

Local oFont10N
Local oFont07N
Local oFont07
Local oFont08
Local oFont08N
Local oFont09N
Local oFont09
Local oFont10
Local oFont11
Local oFont12
Local oFont11N
Local oFont18N
Local OFONT12N

Local  VBOX    :=  080
Local  HMARGEM :=  080
Local  VMARGEM :=  030

Local cBanco   := "237"
Local cLinDig  := "123456789123456789123458912345678912315469789132154987888"
Local cAgencia := "3025"
Local cConven  := "22222222"
Local cConta   := "111111-2"
Local cNumBco  := "0123456789"
Local cNumTit  := "002 123456789 001"
Local nValBol  := 50200.55
Local nDescre  := 1.5
Local cNomeCli := "ADVPL"
Local cEndCli  := "RUA TESTE DOS SANTOS, 1050"
Local cCep     := "12345-236"
Local cMunic   := "S�O PAULO"
Local cUF      := "SP"
Local cNomEmp  := "DESENVOLVENDO LAYOUT BOLETO PDF"
Local cMsgBol  := "Mensagem para Boleto"
Local cEspecDoc:= "DM"
Local cAceite  := "S"
Local dDtaEmis := Date()
Local dDtaVenc := Date()+15
Local cUsoBco  := "BCO"
Local cCodCart := "101"
Local cInstru1 := "Instru��o 1"
Local cInstru2 := "Instru��o 2"
Local cInstru3 := "Instru��o 3"
Local cInstru4 := "Instru��o 4"
Local cCodBar := "12348912315469789135678923456789124589123456"
Local cArquivoPDF := "santander.rel"
Local cLogoBco := "C:\boleto\santander.png"

Local oBoleto

	// ----------------------------------------------------------------+
	// Define saida de impress�o                                       |
	// ----------------------------------------------------------------+			
	oBoleto := FWMSPrinter():New(cArquivoPDF, IMP_PDF, .F.,, .T., , , , , , .F., )	
	oBoleto:SetResolution(78) 
	oBoleto:SetPortrait()
	oBoleto:SetPaperSize(DMPAPER_A4)
	oBoleto:SetMargin(60,60,60,60)	

	PixelX  := oBoleto:nLogPixelX()
	PixelY  := oBoleto:nLogPixelY()

	//--------------------------------------------------------------------------+
	// processa o desenho                                                       |
	//--------------------------------------------------------------------------+
	oFont10N   := TFontEx():New(oBoleto,"Times New Roman",08,08,.T.,.T.,.F.)// 1
	oFont07N   := TFontEx():New(oBoleto,"Times New Roman",06,06,.T.,.T.,.F.)// 2
	oFont07    := TFontEx():New(oBoleto,"Times New Roman",06,06,.F.,.T.,.F.)// 3
	oFont08    := TFontEx():New(oBoleto,"Times New Roman",07,07,.F.,.T.,.F.)// 4
	oFont08N   := TFontEx():New(oBoleto,"Times New Roman",06,06,.T.,.T.,.F.)// 5
	oFont09N   := TFontEx():New(oBoleto,"Times New Roman",08,08,.T.,.T.,.F.)// 6
	oFont09    := TFontEx():New(oBoleto,"Times New Roman",08,08,.F.,.T.,.F.)// 7
	oFont10    := TFontEx():New(oBoleto,"Times New Roman",09,09,.F.,.T.,.F.)// 8
	oFont11    := TFontEx():New(oBoleto,"Times New Roman",10,10,.F.,.T.,.F.)// 9
	oFont12    := TFontEx():New(oBoleto,"Times New Roman",11,11,.F.,.T.,.F.)// 10
	oFont12N   := TFontEx():New(oBoleto,"Times New Roman",11,11,.T.,.T.,.F.)// 10
	oFont14N   := TFontEx():New(oBoleto,"Times New Roman",12,12,.T.,.T.,.F.)// 10
	oFont11N   := TFontEx():New(oBoleto,"Times New Roman",10,10,.T.,.T.,.F.)// 11
	oFont18N   := TFontEx():New(oBoleto,"Times New Roman",17,17,.T.,.T.,.F.)// 12
	oFONT12N   := TFontEx():New(oBoleto,"Times New Roman",11,11,.T.,.T.,.F.)// 12

	//---------------------------------------------------------------------------+
	// Inicializacao da pagina do objeto grafico                                 |
	///--------------------------------------------------------------------------+
	oBoleto:StartPage()

	//+----------------------------+
	//     Linha da Margem
	//+----------------------------+
	oBoleto:Box( 10, 10, 830, 600, "-4")

	nHPage := oBoleto:nHorzRes()
	nHPage *= (300/PixelX)
	nHPage -= HMARGEM
	nVPage := oBoleto:nVertRes()
	nVPage *= (300/PixelY)
	nVPage -= VBOX

	//---------------------------------------------------------------------------+
	// Desenha o Recibo do Sacado.                                               |
	//---------------------------------------------------------------------------+
	oBoleto:Box(HMARGEM,VMARGEM,038,578)
	oBoleto:Line(58,VMARGEM, 58, 578, 0, "-4")
	oBoleto:Box(HMARGEM,VMARGEM,038,433)
	oBoleto:Line(58,VMARGEM, 58, 578, 0, "-4")
	oBoleto:Box(HMARGEM,VMARGEM,038,289)
	oBoleto:Line(58,VMARGEM, 58, 578, 0, "-4")
	oBoleto:Box(HMARGEM,VMARGEM,038,144)
	oBoleto:Line(58,VMARGEM, 58, 578, 0, "-4")

	//+----------------+
	//Logo do Banco    |
	//+----------------+
	oBoleto:SayBitmap( 005, 030, cLogoBco, 90, 40)

	// Banco e Linha Digit�vel
	//oBoleto:Say(034,032, cNomeBco+" | "+cBanco+" | ", oFont18N:oFont)
	oBoleto:Say(030,130, " | "+cBanco+" | ", oFont18N:oFont)
	oBoleto:Say(034,240, Transform(cLinDig, "@R 99999.99999 99999.999999 99999.999999 9 99999999999999"), oFont14N:oFont) 			// --> LINHA DIGITAVEL CB  ( 23790.12301 60000.000038 78000.456703 3 49130000042790 )

	oBoleto:Say(034,505, "Recibo do Sacado", oFont12N:oFont)

	// T�tulos da primeira linha de boxes
	oBoleto:Say(044,032, "Vencimento", oFont07:oFont)

	// Mudanca no texto do boleto solicitado pelo SAFRA
	IF cBanco $ "033/353/422"
		oBoleto:Say(044,146, "Ag�ncia/C�digo do Beneficiario", oFont07:oFont)
	 ELSE
		oBoleto:Say(044,146, "Ag�ncia/C�digo do Cedente", oFont07:oFont)
	ENDIF

	oBoleto:Say(044,291, "N�mero do Documento", oFont07:oFont)
	oBoleto:Say(044,435, "Nosso N�mero/C�digo do Documento", oFont07:oFont)

	// T�tulos da segunda linha de boxes
	        //  Lin Col
	oBoleto:Say(064,032, "Valor do Documento", oFont07:oFont)
	oBoleto:Say(064,146, "(-) Descontos", oFont07:oFont)
	oBoleto:Say(064,291, "(+) Acr�scimos", oFont07:oFont)
	oBoleto:Say(064,435, "(=) Valor Cobrado", oFont07:oFont)

	// Dados da primeira linha de boxes
	oBoleto:Say(056,070, DTOC(dDtaVenc), oFont12:oFont)
	
	IF cBanco $ "033/353/422"
		oBoleto:Say(056,150, cAgencia +" / "+ cConven, oFont12:oFont)
	Else
		oBoleto:Say(056,150, cAgencia +" / "+ cConta, oFont12:oFont)
	EndIf

	oBoleto:Say(056,300, cNumTit , oFont12:oFont)
	oBoleto:Say(056,450, cNumBco, oFont12:oFont)

	// Dados da segunda linha de boxes
	oBoleto:Say(076,080, Transform(nValBol, PesqPict("SE1","E1_SALDO")), oFont12:oFont)
	If nDescre > 0
	    oBoleto:Say(076,200, Transform(nDescre, PesqPict("SE1","E1_DECRESC")), oFont12:oFont)
	EndIf

	//---------------------------------------------------------------------------+
	// Dados do Sacado (Recibo do Sacado).                                       |
	//---------------------------------------------------------------------------+
	oBoleto:Say(086,032, "Sacado", oFont07:oFont)

	//oBoleto:Say(086,435, "------------------- Autentica��o Mec�nica -------------------", oFont07:oFont)

	oBoleto:Say(088         , 080, cNomeCli, oFont12:oFont)
	oBoleto:Say(088 + 10    , 080, cEndCli, oFont12:oFont)
	oBoleto:Say(088 + (2*10), 080, "CEP: "+cCep+" "+cMunic+" - "+cUF, oFont12:oFont )

	//---------------------------------------------------------------------------+
	// Dados do Sacador Avalista/cedente. BLOCO 1                                       |
	//---------------------------------------------------------------------------+
	oBoleto:Say(128,032, "Sacador/Avalista", oFont07:oFont)

	// Inicia Linha
	n_Lin := 130

	oBoleto:Say(n_Lin, 080, cNomEmp, oFont12:oFont)
		
	n_Lin += 14	

	// Linha Pontilhada
	n_Lin += 16
	oBoleto:Say(n_Lin,VMARGEM, Replicate("-",177), oFont12:oFont)

	//---------------------------------------------------------------------------+
	// Desenha o Boleto (Ficha de Compensa��o).                                  |
	//---------------------------------------------------------------------------+

	// Banco e Linha Digit�vel
	n_Lin += 20
	
	//+----------------+
	//Logo do Banco    |
	//+----------------+
	oBoleto:SayBitmap(n_Lin-28, 030, cLogoBco, 90, 40)
	oBoleto:Say(n_Lin,130, " | "+cBanco+" | ", oFont18N:oFont)
	//oBoleto:Say(n_Lin,032, cNomeBco+" | "+cBanco+" | ", oFont18N:oFont)
	oBoleto:Say(n_Lin,315, Transform(cLinDig, "@R 99999.99999 99999.999999 99999.999999 9 99999999999999"), oFont14N:oFont)

	// Box Geral
	n_Lin += 5
	oBoleto:Box(n_Lin,VMARGEM,n_Lin+240,578)
	n_LinSav := n_Lin

	// Coluna Principal
	n_Col := 415
	oBoleto:Line(n_Lin,n_Col, n_Lin+180, n_Col, 0, "-4")

	// Colunas da 3a. Linha da Ficha
	n_VLin := n_Lin + 40
	n_VCol := 280
	oBoleto:Box(n_VLin,n_VCol,n_VLin+20,n_VCol+50)

	n_VCol := 230
	oBoleto:Box(n_VLin,n_VCol,n_VLin+20,n_VCol+50)

	n_VCol := 100
	oBoleto:Box(n_VLin,n_VCol,n_VLin+20,230)

	// Colunas da 4a Linha da Ficha
	n_VLin += 20
	n_VCol := 330
	oBoleto:Box(n_VLin,n_VCol,n_VLin+20,n_VCol+85)

	n_VCol := 230
	oBoleto:Box(n_VLin,n_VCol,n_VLin+20,330)

	n_VCol := 165
	oBoleto:Box(n_VLin,n_VCol,n_VLin+20,230)

	n_VCol := VMARGEM
	oBoleto:Box(n_VLin,n_VCol,n_VLin+20,100)

	// Define a altura da linha
	n_hLin := 20

	// Linhas
	oBoleto:Line(n_Lin+n_hLin, VMARGEM, n_Lin+n_hLin, 578, 0, "-4")
	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin, VMARGEM, n_Lin+n_hLin, 578, 0, "-4")
	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin, VMARGEM, n_Lin+n_hLin, 578, 0, "-4")
	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin, VMARGEM, n_Lin+n_hLin, 578, 0, "-4")

	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin, n_Col, n_Lin+n_hLin, 578, 0, "-4")
	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin, n_Col, n_Lin+n_hLin, 578, 0, "-4")
	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin, n_Col, n_Lin+n_hLin, 578, 0, "-4")
	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin, n_Col, n_Lin+n_hLin, 578, 0, "-4")

	n_Lin += n_hLin
	oBoleto:Line(n_Lin+n_hLin,  VMARGEM, n_Lin+n_hLin, 578, 0, "-4")

	// Titulo Box Sacado/Sacador Avalista
	oBoleto:Say(n_Lin+27,VMARGEM+2, "Sacado", oFont07:oFont)
	oBoleto:Say(n_Lin+70,VMARGEM+2, "Sacador/Avalista", oFont07:oFont)

	// Autenticacao
	n_Lin += 60 + n_hLin + 7
	oBoleto:Say(n_Lin,435, "Autentica��o Mec�nica/Ficha de Compensa��o", oFont07:oFont)

	//---------------------------------------------------------------------------+
	// T�tulo dos Quadros da Ficha de Compensacao                                |
	//---------------------------------------------------------------------------+

	// 1a. Linha
	n_Lin := n_LinSav + 6
	n_Col := 032
	oBoleto:Say(n_Lin, n_Col, "Local de Pagamento", oFont07:oFont)

	n_Col := 418
	oBoleto:Say(n_Lin, n_Col, "Vencimento", oFont07:oFont)

	// 2a. Linha
	n_Lin += n_hLin
	n_Col := 032

	oBoleto:Say(n_Lin, n_Col, "Beneficiario", oFont07:oFont)

	n_Col := 418

	oBoleto:Say(n_Lin, n_Col, "Ag�ncia/C�digo do Beneficiario", oFont07:oFont)

	// 3a. Linha
	n_Lin += n_hLin
	n_Col := 032
	oBoleto:Say(n_Lin, n_Col, "Data do Documento", oFont07:oFont)

	n_Col := 102
	oBoleto:Say(n_Lin, n_Col, "N�mero do Documento", oFont07:oFont)

	n_Col := 232
	oBoleto:Say(n_Lin, n_Col, "Esp�cie Doc.", oFont07:oFont)

	n_Col := 282
	oBoleto:Say(n_Lin, n_Col, "Aceite", oFont07:oFont)

	n_Col := 332
	oBoleto:Say(n_Lin, n_Col, "Data do Processamento", oFont07:oFont)

	n_Col := 417
	oBoleto:Say(n_Lin, n_Col, "Nosso N�mero", oFont07:oFont)

	// 4a. Linha
	n_Lin += n_hLin
	n_Col := 032
	oBoleto:Say(n_Lin, n_Col, "Uso do Banco", oFont07:oFont)

	n_Col := 102
	oBoleto:Say(n_Lin, n_Col, "Carteira", oFont07:oFont)

	n_Col := 167
	oBoleto:Say(n_Lin, n_Col, "Esp�cie", oFont07:oFont)

	n_Col := 232
	oBoleto:Say(n_Lin, n_Col, "Quantidade", oFont07:oFont)

	n_Col := 332
	oBoleto:Say(n_Lin, n_Col, "(X) Valor", oFont07:oFont)

	n_Col := 417
	oBoleto:Say(n_Lin, n_Col, "(=) Valor do Documento", oFont07:oFont)

	oBoleto:Say(n_Lin+21,VMARGEM+2, "Instru��es - Texto de Responsabilidade do Cedente", oFont07:oFont)

	n_SavLin2 := n_Lin

	// 5a. Linha (Coluna Direita)
	n_Lin += n_hLin
	n_Col := 417
	oBoleto:Say(n_Lin, n_Col, "(-) Descontos / Abatimentos", oFont07:oFont)

	// 6a. Linha (Coluna Direita)
	n_Lin += n_hLin
	n_Col := 417
	oBoleto:Say(n_Lin, n_Col, "(-) Outras Dedu��es", oFont07:oFont)

	// 7a. Linha (Coluna Direita)
	n_Lin += n_hLin
	n_Col := 417
	oBoleto:Say(n_Lin, n_Col, "(+) Mora Multa", oFont07:oFont)

	// 8a. Linha (Coluna Direita)
	n_Lin += n_hLin
	n_Col := 417
	oBoleto:Say(n_Lin, n_Col, "(+) Outros Acr�scimos", oFont07:oFont)

	// 9a. Linha (Coluna Direita)
	n_Lin += n_hLin
	n_Col := 417
	oBoleto:Say(n_Lin, n_Col, "(=) Valor Cobrado", oFont07:oFont)

	//---------------------------------------------------------------------------+
	// Texto/Detalhes da Ficha de Compensacao                                    |
	//---------------------------------------------------------------------------+

	// 1a. Linha
	n_Lin := n_LinSav + (n_hLin-2)
	n_Col := VMARGEM+10
	oBoleto:Say(n_Lin, n_Col, cMsgBol, oFont12:oFont)	
	oBoleto:Say(n_Lin,480, DTOC(dDtaVenc), oFont12:oFont)

	// 2a. Linha
	n_Lin += n_hLin-2
	oBoleto:Say(n_Lin, n_Col, cNomEmp, oFont12:oFont)
	oBoleto:Say(n_Lin,460, cAgencia +" / "+ cConta , oFont12:oFont)

	// 3a. Linha
	n_Lin += n_hLin
	oBoleto:Say(n_Lin, n_Col, DTOC(dDtaEmis), oFont12:oFont)

	n_Col := 120
	oBoleto:Say(n_Lin, n_Col, cNumTit, oFont12:oFont)

	n_Col := 240
	oBoleto:Say(n_Lin, n_Col, cEspecDoc, oFont12:oFont)

	n_Col := 300
	oBoleto:Say(n_Lin, n_Col, cAceite, oFont12:oFont)

	n_Col := 340
	oBoleto:Say(n_Lin, n_Col, DTOC(dDtaEmis), oFont12:oFont)

	n_Col := 480
	oBoleto:Say(n_Lin, n_Col, cNumBco, oFont12:oFont)

	// 4a. Linha
	n_Lin += n_hLin
	n_Col := VMARGEM+10
	oBoleto:Say(n_Lin, n_Col, cUsoBco, oFont12:oFont)

	n_Col := 120
	oBoleto:Say(n_Lin, n_Col, cCodCart, oFont12:oFont)

	n_Col := 180
	oBoleto:Say(n_Lin, n_Col, "R$", oFont12:oFont)

	n_Col := 480
	oBoleto:Say(n_Lin, n_Col, Transform(nValBol, PesqPict("SE1","E1_SALDO")), oFont12:oFont)

	// 5a. Linha (Coluna � direita)
	n_Lin += n_hLin
	n_Col := 480
	If nDescre > 0
	    oBoleto:Say(n_Lin, n_Col, Transform(nDescre, PesqPict("SE1","E1_DECRESC")), oFont12:oFont)
	EndIf

	// 6a. Linha (Coluna � direita)
	// --> Outros acr�scimos - nao sera impressa
	n_Lin += n_hLin

	//7a. Linha (Coluna � direita)
	n_Lin += n_hLin
	n_Col := 480

	//8a. Linha (Coluna � direita)
	n_Lin += n_hLin
	n_Col := 480

	//9a. Linha  (Coluna � direita)
	n_Lin += n_hLin
	n_Col := 480

	//---------------------------------------------------------------------------+
	// Texto/Box (Instru��es Banc�rias).                                         |
	//---------------------------------------------------------------------------+
	n_hLin := 10
	n_Lin  := n_SavLin2 + (4* n_hLin ) - 5
	n_Col  := VMARGEM+10
	oBoleto:Say(n_Lin, n_Col, AllTrim(cInstru1), oFont12:oFont)

	n_Lin += n_hLin
	oBoleto:Say(n_Lin, n_Col, AllTrim(cInstru2), oFont12:oFont)

	n_Lin += n_hLin
	oBoleto:Say(n_Lin, n_Col, AllTrim(cInstru3), oFont12:oFont)

	n_Lin += n_hLin
	oBoleto:Say(n_Lin, n_Col, AllTrim(cInstru4), oFont12:oFont)

	n_Lin += 10

	//n_Lin += n_hLin
	oBoleto:Say(n_Lin+10, n_Col, "PARA REGULARIZA��O DE PROTESTO POR FAVOR ACESSAR O SITE:", oFont12:oFont)
	//n_Lin += n_hLin
	oBoleto:Say(n_Lin+20, n_Col, "https://protestosp.com.br/, clicar na op��o SERVI�OS ELETRONICOS DE", oFont12:oFont)
	//n_Lin += n_hLin
	oBoleto:Say(n_Lin+30, n_Col, "PROTESTO, EFETUAR O CADASTRO E PAGAR O BOLETO.", oFont12:oFont)

	//---------------------------------------------------------------------------+
	// Dados do Sacado (Ficha de Compensacao). BLOCO 2 ANTES DO CODIGO DE BARRA  |
	//---------------------------------------------------------------------------+
	oBoleto:Say(n_Lin += 50         , 080, cNomeCli , oFont12:oFont)
	oBoleto:Say(n_Lin += 10         , 080, cEndCli , oFont12:oFont)
	oBoleto:Say(n_Lin += 10         , 080, "CEP: "+cCep+" "+cMunic+" - "+cUF, oFont12:oFont )
	
	//---------------------------------------------------------------------------+
	// Imprime os dados do Sacador Avalista/cedente.                             |
	//---------------------------------------------------------------------------+	
	n_Lin += 21
	
	oBoleto:Say(n_Lin, 080, cNomEmp, oFont12:oFont)
		
	n_Lin += 12

	//---------------------------------------------------------------------------+
	// C�digo de Barras                                                          |
	//---------------------------------------------------------------------------+	
	oBoleto:FwMsBar("INT25", 37, 2.5, cCodBar, oBoleto, .F., CLR_BLACK,.T.,0.02,0.8,.F.)

	//---------------------------------------------------------------------------+
	// Finalizar a P�gina.                                                       |
	//---------------------------------------------------------------------------+
	oBoleto:EndPage()

	//---------------------------------------------------------------------------+
	// Visualiza o Boleto em PDF                                                 |
	//---------------------------------------------------------------------------+
	oBoleto:Setup()

	If oBoleto:nModalResult == PD_OK
		oBoleto:Preview()
	EndIf

	//=================================================================================+
	//  Finalizar o Boleto PDF.                                                        |
	//                                                                                 |
	//=================================================================================+
	FreeObj(oBoleto)

	Ms_Flush()	

Return
