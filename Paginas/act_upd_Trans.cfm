<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

	<cfoutput>
	<cfset ws_fecha = now()>
	<cfset ws_date = now()>	
	<cfif #Trim(FORM.fn_yyyymmdd)# GT 0>	
	     <cfset ws_fecha = #Trim(FORM.fn_yyyymmdd)#> 
		 <cfset ws_date = #DateFormat(DateAdd('d', 0, ws_fecha),'yyyy-mm-dd')#> 	 
	<cfelse>		 
	     <cfset ws_date = #DateFormat(DateAdd('d', 0, ws_fecha),'yyyy-mm-dd')#> 
    </cfif>			 
	</cfoutput>	
	
	
<cfquery name="editemp" datasource="wolffdb_dsn">
UPDATE FN_Transacciones
	SET    fn_yyyymmdd         =   '#ws_date#' 	
         , fn_fk_cat_key  = '#TRIM(Form.fn_fk_cat_key)#' 
         , fn_fk_tp_key    = '#TRIM(Form.fn_fk_tp_key)#'
         , fn_tienda         = '#TRIM(Form.fn_tienda)#' 
         , fn_monto        = '#TRIM(Form.fn_monto)#'
	     , fn_status      = '#TRIM(Form.fn_status)#' 
WHERE 
        fn_key = #Form.fn_key#       
</cfquery>
 
 <cflocation url="Listar_Trans_por_pagar.cfm">

</body>
</html> 