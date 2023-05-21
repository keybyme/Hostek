<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Codigos</title>
<Style>

   body {margin: 0px;}
   
     .style17 {
 color:#FFFFFF;
	 font-style:oblique;
	 font-size:25px;
	 font-weight:bold;
	 background-color:#FF0000;
 }
   
</style>
</head>

<body>
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	<cflocation url="loginForm.cfm">
    <cfabort>
</cfif>
<cfinclude template="../menu/heading.cfm">
<a href="../Admin/logout.cfm">Log out</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
<cfform name="aghno" method="post" action="dsp_codigo2.cfm">
<table align="center" border="0">
	<tr>
        <th>Codigo: </th>
    	<td>        
        <cfinput 
         type="text" 
         name="cd_codigo" 
         size="30" 
         value="" 
         maxlength="100" 
         required="yes" 
         message="Please enter Codigo">
        </td>    
     </tr>
     <tr>
     	<th>Flag Activo: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cd_flag_1_activo" 
         size="30" 
         value=" " 
         maxlength="100">
        </td>    
     </tr> 
     <tr>
     	<th>Fecha Activo: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cd_fecha_activo" 
         size="20" 
         value=" " 
         maxlength="40">
        </td>    
     </tr> 
     <tr>
     	<th>Fecha Until: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cd_fecha_until" 
         size="20" 
         value=" " 
         maxlength="40">
        </td>    
     </tr>


     <tr>
     	<td colspan="2" align="center">
        <cfinput type="submit" name="enviar" value="Agregar">&nbsp;&nbsp;&nbsp;
         <cfinput type="reset" name="reset" value="Borrar">
        </td>
     </tr>   	                                            
</table>     
</cfform>
</body>
</html> 