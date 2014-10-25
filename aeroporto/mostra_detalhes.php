<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aeroporto Siqueira</title>
</head>

<?php

	$local = 'mysql:host=localhost;port=3306;dbname=db_aeroporto';
	$usuario = 'root';
	$senha = 'aaroot';
	$opcoes = array(
			PDO::ATTR_PERSISTENT => true,
			PDO::ATTR_CASE => PDO::CASE_LOWER
	);
	
	try {
		$pdo = new PDO($local, $usuario, $senha, $opcoes);
	} catch (PDOException $e) {
		echo 'Erro: '.$e->getMessage();
	}
	
	$numero_registro = $_POST['registro'];
	
	echo 'Registro do avião: ' . $numero_registro;
	

	try{
	
		$stmte = $pdo->prepare("SELECT m.numero_modelo, m.capacidade, m.peso, a.numero_registro, t.nome AS nome_teste, t.pontuacao_maxima,
										et.data_teste, et.qtd_horas, et.pontuacao, f.nome AS tecnico
										FROM avioes a INNER JOIN modelos m ON a.numero_modelo = m.numero_modelo
										INNER JOIN evento_teste et ON a.numero_registro = et.numero_aviao
										INNER JOIN testes t ON t.numero_teste = et.numero_teste
										INNER JOIN funcionarios f ON f.matricula = et.matricula_tecnico
										WHERE a.numero_registro = ?;");
		$stmte->bindParam(1, $numero_registro);
		$executa = $stmte->execute();
		if($executa){
			$i = 0;
			while($reg = $stmte->fetch(PDO::FETCH_OBJ)){ /* Para recuperar um ARRAY utilize PDO::FETCH_ASSOC */
				$modelo = $reg->numero_modelo;
				$capacidade = $reg->capacidade;
				$peso = $reg->peso;
				$nome_teste = $reg->nome_teste;
				$pontuacao_maxima = $reg->pontuacao_maxima;
				$data_teste = $reg->data_teste;
				$qtd_horas = $reg->qtd_horas;
				$pontuacao = $reg->pontuacao;
				$tecnico = $reg->tecnico;
	
				$i++;
					
			}
	
		}else{
			echo 'Erro';
		}
	} catch(PDOException $e){
		echo $e->getMessage();
	}

?>

<body>
	<fieldset>
	<legend>Avião <?= $numero_registro ?></legend>
		<fieldset>
		<legend>Modelo</legend>
			<b>Modelo: </b><?= $modelo ?> <br/>
			<b>Capacidade: </b><?= $capacidade?><br />
			<b>Peso(kg): </b><?= $peso?> 
		</fieldset>
		<fieldset>
		<legend>Teste</legend>
			<b>Nome: </b><?= $nome_teste ?> <br />
			<b>Pontuação máxima: </b><?= $pontuacao_maxima?> <br />
			<b>Data do teste: </b><?= $data_teste?> <br />
			<b>Quantidade de horas: </b><?= $qtd_horas?> <br />
			<b>Pontuação: </b><?= $pontuacao?>
		</fieldset>
		<fieldset>
		<legend>Técnico responsável</legend>
			<b>Nome: </b><?= $tecnico ?>
		</fieldset>
	</fieldset>
</body>
</html>