<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KeyByMe</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap4.min.css" rel="stylesheet">
 
</head>
<body>
<cfinclude template="menu.cfm"></cfinclude>
<div class="container"> 	
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    	<cflocation url="https://www.keybyme.com">
</cfif> 
 	
<table id="tabla" class="table table-striped table-bordered" style="width:100%">
        <thead> 
            <tr>
                <th><h1>Finanzas</h1></th> 
            </tr>
        </thead>
        <tbody>
			 <tr><td><a href="Listar_Transacciones.cfm">Transacciones</a></td></tr>
			 <tr><td><a href="Listar_Trans_por_pagar.cfm">Transacciones Por Pagar</a></td></tr>
			 <tr><td><a href="Listar_Tipos_Pagos.cfm">Tipos de Pagos</a></td></tr>
			 <tr><td><a href="Listar_Categorias.cfm">Categorias</a></td></tr>
			 <tr><td><a href="Reportes.cfm">Reportes</a></td></tr>
			 <tr><td><a href="income.cfm">Income</a></td></tr>
			 <tr><td><a href="calculate_int.cfm">Calcular Interes</a></td></tr>
			 <tr><td><a href="https://www.experian.com/blogs/ask-experian/credit-education/score-basics/what-affects-your-credit-scores/">What Affects Your Credit Scores?</a></td></tr>
        </tbody>
</table>
 </div>	
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function() {
    $('#tabla').DataTable();
    } );
</script>
</body>
</html>