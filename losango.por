programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Texto --> t
	inclua biblioteca Mouse --> m
	//Campos
	inteiro noBug = 0
	inteiro yCamposPos = 50
	//Larbura da Tela
	const inteiro LarguraT = 600
	//Atura da Tela
	const inteiro AlturaT = 500
	//Caminho/Endereço da imagem da He4rt
	const cadeia CaminhoImg = "./he4rtlogo.png"
	inteiro enderecoImagem = g.redimensionar_imagem(g.carregar_imagem(CaminhoImg), 100, 100, falso)
	//cor para aplicar em retangulos, e textos.
	inteiro corRoxo = g.criar_cor(145, 99, 204)
	//quantidade de botoes
	const inteiro numBotoes = 10
	//vetor que gardará os botoes
	inteiro botoes[2][numBotoes]
	//numero que será mostrado do lado dos botoes
	inteiro textoBotao[numBotoes]
	
	funcao inicio()
	{
		DesenharTela()

		enquanto(verdadeiro)
		{
			noBug = 0
		     CorFundoPadrao()
	     	DesenharCreditos()
	     	DesenharRetanguloCentro()

			DesenharBotoes(1, 0, 1)
			DesenharBotoes(2, 2, 3)
			
			//
	     	DesenharLosango(0)
	     	DesenharLosango(120)
	     	
	     	AlterandoValorBotao()
	     	
			g.renderizar()
		}
	}

	funcao vazio AlterandoValorBotao()
	{
		inteiro pos = MouseEstaEmCimaBotao()
		
		se (pos != -1)
		{
			se (pos % 2 == 0)
			{
				se(botoes[0][pos] < 300 e textoBotao[0] < 350) textoBotao[0]++
				senao se(botoes[0][pos] > 300 e textoBotao[1] < 120) textoBotao[1]++
			}
			senao
			{
				se(botoes[0][pos] < 300 e textoBotao[0] > 0) textoBotao[0]--
				senao se(botoes[0][pos] > 300 e textoBotao[1] > 0) textoBotao[1]--
			}
		}
	}

	funcao inteiro MouseEstaEmCimaBotao()
	{
		se (m.botao_pressionado(0))
		{
			para(inteiro i = 0; i < numBotoes; i++)
			{
				se ((m.posicao_x() >= botoes[0][i]  e m.posicao_x() <= botoes[0][i] + 48) e 
					(m.posicao_y() >= botoes[1][i] e m.posicao_y() <= botoes[1][i] + 10))
				{
					retorne i
				}
			}
		}
		retorne -1
	}

	funcao vazio DesenharBotoes(inteiro num, inteiro valor1, inteiro valor2)
	{
		inteiro x = num * 180
		
		g.definir_cor(corRoxo)
		g.desenhar_retangulo(x, 40 + yCamposPos, 60, 30, verdadeiro, falso)
		g.definir_tamanho_texto(14.0)
		
		g.desenhar_texto(x + 10, 50 + yCamposPos, textoBotao[noBug] + "")
		noBug++
		
		g.definir_cor(corRoxo)
		g.desenhar_retangulo(x + 48, 44 + yCamposPos, 10, 10, verdadeiro, verdadeiro)
		g.desenhar_retangulo(x + 48, 57 + yCamposPos, 10, 10, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(13.0)
		g.desenhar_texto(x + 49, 41 + yCamposPos, "+")
		g.desenhar_texto(x + 52, 53 + yCamposPos, "-")
		
		AdicionarBotaoLista(x + 48, 44 + yCamposPos, valor1)
		AdicionarBotaoLista(x + 48, 57 + yCamposPos, valor2)
	}

	funcao vazio AdicionarBotaoLista(inteiro x, inteiro y, inteiro pos)
	{
		botoes[0][pos] = x
		botoes[1][pos] = y
	}

	funcao vazio DesenharRetanguloCentro()
	{
		g.definir_cor(corRoxo)
		g.desenhar_retangulo(30, 130, 540, 250, falso, falso)
	}

	funcao vazio DesenharCreditos()
	{
		g.definir_fonte_texto("")
		g.desenhar_imagem(30, 400, enderecoImagem)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(15.0)
		g.desenhar_texto(370, 440, "Desenvolvido por")
		g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
		g.desenhar_texto(485, 440, "Logikoz")
		g.definir_tamanho_texto(10.0)
		g.definir_estilo_texto(falso, falso, falso)
		g.desenhar_texto(410, 460, "Portugol The Best")
	}
	
	funcao vazio DesenharTela()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LarguraT, AlturaT)
		g.definir_titulo_janela("Desafio Losangos")
	}

	funcao vazio CorFundoPadrao()
	{
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
	}

	funcao vazio DesenharLosango(inteiro xBase)
	{
		inteiro count = 1, linha = 0, espPos = 4, espNeg = 0
		g.definir_cor(corRoxo)
		g.definir_tamanho_texto(15.0)
		g.definir_fonte_texto("Consolas")
		enquanto(verdadeiro)
		{
			se (linha == 150) pare
			
			se (linha < 60)
			{
				g.desenhar_texto(30 + textoBotao[0] + xBase, (127 + linha + textoBotao[1]), (DesenharCaracter(espPos, " ") + DesenharCaracter(count, "X")))
				espPos--
				count += 2
			}
			senao se (linha >= 60)
			{
				g.desenhar_texto(30 + textoBotao[0] + xBase, (127 + linha + textoBotao[1]), (DesenharCaracter(espNeg, " ") + DesenharCaracter(count, "X")))
				espNeg++
				count -= 2
			}
			linha += 15
		}
	}

	funcao cadeia DesenharCaracter(inteiro num, cadeia car)
	{
		cadeia char = ""
		
		para(inteiro i = 0; i < num; i++)
		{
			char += car
		}
		
		retorne char
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1001; 
 * @DOBRAMENTO-CODIGO = [119, 140, 172];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = vetor, matriz;
 */