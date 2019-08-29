<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 


<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>



<meta charset="UTF-8">
<title>AgeTech - Exames</title>
</head>
<body>




	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<s:if test="resultado=='success'">
				<div class="alert alert-success " role="alert">Sucesso!</div>
			</s:if>

			<s:if test="resultado=='error'">
				<div class="alert alert-error" role="alert">Desculpe, ocorreu
					um erro!</div>
			</s:if>


		</div>
		<div class="col-lg-4"></div>
	</div>

	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<s:form action="insertExame.action" method="post"
				cssClass="form-horizontal" theme="simple" id="novoExame">
				<h3>Novo Exame</h3>
				<label for="paciente">Paciente</label>
				<s:textfield name="paciente" class="form-control required" key="paciente" placeholder="Nome do Paciente"
					size="120" />
				<label for="medico">Médico</label>
				<s:textfield name="medico" class="form-control required" key="medico"  placeholder="Médico Responsável"
					size="120" />

				<label for="tipoExame">Tipo de Exame</label>
				<s:textfield name="tipoExame" class="form-control required" key="tipoExame"  placeholder="Tipo do Exame"
					size="120" />

				<label for="observacao">Observação</label>
				<s:textarea name="observacao" class="form-control" key="observacao"
					size="120" />
				<s:submit method="insertExame" key="Novo Exame" align="center"
					class="btn-primary" />
			</s:form>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h3>Exames cadastrados:</h3>
			<hr>
			<table class="table">
				<s:if test="todosExames.size()>0">
					<thead>
						<tr>
							<th>#</th>
							<th>Paciente</th>
							<th>Médico</th>
							<th>Tipo Exame</th>
							<th>Ações</th>
						</tr>
					</thead>

					<tbody>
						<s:iterator value="todosExames">
							<tr>
							
								<td><s:property value="id" /></td>
								<td><s:property value="paciente" /></td>
								<td><s:property value="medico" /></td>
								<td><s:property value="tipoExame" /></td>
								<td colspan="2"><a
									href="updatedetails.action?submitType=update&id=<s:property value="id"/>">
										<button class="button" type="button" class="btn btn-primary">Alterar</button>
								</a> <a
									href="deleterecord.action?id=<s:property value="id"/>">
										<button class="button" type="button" class="btn btn-danger">Excluir</button>
								</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</s:if>
				<s:else>

					<tr>
						<td colspan="5">Sem exames cadastrados.</td>
					</tr>

				</s:else>
			</table>

		</div>
		<div class="col-lg-2"></div>
	</div>


	<style>
		.erro 
		{
			border:1px solid #ff0000;
			background-color: #ffeceb
			
		}
		
body {
  background:url(assets/img/health_care-background.jpg);
  background-size:cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
}
	</style>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#novoExame").validate({
				errorClass: "erro",
				errorPlacement: function(error,element) {
				    return true;
				  }
			});
		});
	</script>


</body>
</html>