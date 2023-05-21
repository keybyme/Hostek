<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Luz y Vida</title>
</head>

<body>

<cfquery name="editemp" datasource="luzyvidaDB_dsn">


UPDATE lVersiculos
SET        V_Contenido     = '#TRIM(Form.V_Contenido)#'  
	     , V_LBLA = '#TRIM(Form.V_LBLA)#'
        
WHERE 
        V_IdVersiculo = #Form.V_IdVersiculo#       
</cfquery>
 <cfoutput>
 <cflocation url="RV.cfm?IDcapituloU=#TRIM(Form.V_IdCapitulo)#">
	 </cfoutput>
</body>
</html> 