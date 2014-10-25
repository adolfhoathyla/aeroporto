INSERT INTO enderecos(bairro, cidade, estado, logradouro, numero)
		VALUES('Jereissati 1', 'Maracanaú', 'Ceará', 'Rua 31', 314);

INSERT INTO funcionarios(id_endereco, nome, cpf, telefone, salario, companhia, tecnico)
		VALUES(1, 'Goku', '098.435.546-56', '(85) 3467 8990', 3500, 'TAM', true);

INSERT INTO modelos(numero_modelo, capacidade, peso, autonomia)
		VALUES('DC-10', 300, 2000, '30 km');

INSERT INTO avioes(numero_registro, numero_modelo)
		VALUES(211987, 'DC-10');

INSERT INTO testes(numero_teste, nome, pontuacao_maxima)
		VALUES(25, 'Teste de autonomia do motor', 100);

INSERT INTO especialidades(matricula_tecnico, numero_modelo, experiencia)
		VALUES(1, 'DC-10', 'ótima');

INSERT INTO evento_teste(numero_aviao, numero_teste, matricula_tecnico, data_teste, qtd_horas, pontuacao)
		VALUES(211987, 25, 1, '27/08/2014', 1, 95);


INSERT INTO testes(numero_teste, nome, pontuacao_maxima)
		VALUES(48, 'Teste de combustivel', 100);

INSERT INTO evento_teste(numero_aviao, numero_teste, matricula_tecnico, data_teste, qtd_horas, pontuacao)
		VALUES(211987, 48, 1, '03/12/2014', 1, 98);
