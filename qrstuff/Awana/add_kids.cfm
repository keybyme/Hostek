<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Awana</title>
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
	<cflocation url="loginForm.cfm?action=5">
    <cfabort>
</cfif>
<cfinclude template="welcome.cfm">
 
<cfif '#TRIM(SESSION.Auth.roll_upd_kid)#' NEQ 1>
	 
   <br><br><span class="style17">El uso de esta secci&oacute;n esta restringida.</span>
    <cfabort>
</cfif>

<cfset GetClub.RecordCount=0>  
<cfquery name="GetClub" datasource="wolffdb_dsn">
SELECT *
FROM QR_Club order by club_id_key
</cfquery>

<cfset GetProfe.RecordCount=0>
<cfquery name="GetProfe" datasource="wolffdb_dsn">
Select QR_Teachers.te_id_key,
       QR_Teachers.te_en_id_key,
       RTRIM (QR_Teachers.te_name) + ' ' +
       RTRIM (QR_Teachers.te_last_name) as nombre_apellido
FROM QR_Teachers 
Where te_en_id_key = '#TRIM(SESSION.Auth.user_en_id_key)#' 
order by nombre_apellido
</cfquery>
  
<cfform name="aghno" method="post" action="dsp_kids2.cfm">
<table align="center" border="0">
	<tr>
        <th>Nombre: </th>
    	<td>        
        <cfinput 
         type="text" 
         name="FirstName" 
         size="30" 
         value="" 
         maxlength="100" 
         required="yes" 
         message="Please enter First Name">
        </td>    
     </tr>
     <tr>
     	<th>Apellido: </th>
        <td>   
        <cfinput 
         type="text" 
         name="LastName" 
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr> 
     <tr>
     	<th>Direccion: </th>
        <td>   
        <cfinput 
         type="text" 
         name="direccion" 
         size="20" 
         value="" 
         maxlength="40">
        </td>    
     </tr> 
     <tr>
     	<th>Ciudad: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ciudad" 
         size="20" 
         value="" 
         maxlength="40">
        </td>    
     </tr>
     <tr>
     	<th>Estado: </th>
        <td>   
        <cfinput 
         type="text" 
         name="estado" 
         size="20" 
         value="" 
         maxlength="40">
        </td>    
     </tr> 
     <tr>
     	<th>zipcode: </th>
        <td>   
        <cfinput 
         type="text" 
         name="zipcode" 
         size="40" 
         value="" 
         maxlength="60">
        </td>    
     </tr> 
     <tr>
     <th>Apoderado:</th>
     <td>
     <cfinput
      type="text"
      name="apoderado"
      size="40"
      value=""
      maxlength="60">
     </td>
     </tr>   
     <tr>
     <th>Matricula:</th>
     <td>
     <cfinput
      type="text"
      name="matricula"
      size="40"
      value=""
      required="yes"
      message="Please, Enter matricula"
      maxlength="60">
     </td>
     </tr> 
     <tr>
     	<th>telefono: </th>
        <td>   
        <cfinput 
         type="text" mask="999-999-9999"
         name="telefono" 
         size="40" 
         value="" 
         maxlength="60">
        </td>    
     </tr>  
     <tr>
     	<th>Fecha Nacimiento: (MM/DD/YYYY)</th>
        <td>   
        <cfinput 
         type="text" 
         validate="date"
         mask= "99/99/9999"
         name="dob" 
         size="40" 
         value="" 
         maxlength="60">
        </td>    
     </tr>     
          <tr>
     	<th>Sexo: </th>
         <td>
           <select name="accionSX" size="1">
              <option value="1" selected="selected">Femenino</option>
              <option value="2">Masculino</option>
           </select>
         </td>
     </tr>
     <tr>
     <th>Club: </th>
        <td>	    
           <select name="clubSEL" size="1">
             <option value="" selected="selected">Seleccione Club</option>
               <cfoutput query="GetClub">
                  <option value="#club_id_key#">
                        #GetClub.club_description#
                 </OPTION>
               </cfoutput> 
            
            </select>
        </td>  
     </tr>
      <tr>
     <th>Teacher: </th>
        <td>	    
           <select name="teacherSEL" size="1">
             <option value="" selected="selected">Seleccione Teacher</option>
               <cfoutput query="GetProfe">
                  <option value="#te_id_key#">
                        #GetProfe.nombre_apellido#
                 </OPTION>
               </cfoutput> 
            
            </select>
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