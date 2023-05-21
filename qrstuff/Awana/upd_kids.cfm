<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AWANA</title>
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
	<cfinclude template="loginForm.cfm">
    <cfabort>
</cfif>    
<cfinclude template="welcome.cfm">
 
<cfif '#TRIM(SESSION.Auth.roll_upd_kid)#' NEQ 1>
	 
    <br><br><span class="style17">El uso de esta secci&oacute;n esta restringida.</span>
	<cfabort> 
</cfif>

<cfquery name="Get_kid" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Kids
WHERE kd_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>


<cfquery name="GetClub" datasource="wolffdb_dsn">
SELECT *
FROM QR_Club 
Order by club_id_key 
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

<cfquery name="GetSX" datasource="wolffdb_dsn">
SELECT *
FROM Sexo 
Order by sx_key
</cfquery>

<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_kids.cfm">
	<cfoutput>
        <input type="hidden" name="kd_id_key" value="#Get_kid.kd_id_key#">	
       
    </cfoutput>
<table align="center">


<cfoutput>    
    <tr>
        <td>Nombre: </td>
        <td><cfinput name="kd_name" value="#Get_kid.kd_name#"></td>
    </tr>
    <tr>
        <td>Apellido: </td>
        <td><cfinput name="kd_last_name" value="#Get_kid.kd_last_name#"></td>
    </tr>
    <tr>
        <td>Direccion: </td>
        <td><cfinput name="kd_address" value="#Get_kid.kd_address#"></td>
    </tr>        
    <tr>
        <td>Ciudad: </td>
        <td><cfinput name="kd_city" value="#Get_kid.kd_city#"></td>
    </tr>
       <tr>
        <td>Estado: </td>
        <td><cfinput name="kd_state" value="#Get_kid.kd_state#"></td>
    </tr>
        <tr>
        <td>Zipcode: </td>
        <td><cfinput name="kd_zipcode" value="#Get_kid.kd_zipcode#"></td>
    </tr>        
    <tr>
        <td>Apoderado: </td>
        <td><cfinput name="kd_apoderado" value="#Get_kid.kd_apoderado#"></td>
    </tr>
    <tr>
        <td>Matricula: </td>
        <td><cfinput name="kd_matricula" value="#Get_kid.kd_matricula#"></td>
    </tr>    
    <tr>
        <td>Telefono: </td>
        <td><cfinput name="kd_telephone" value="#Get_kid.kd_telephone#"></td>
    </tr>
   
       <tr>
        <td>DOB: (MM/DD/YYYY) </td>
        <td>
         <cfinput 
         type="text"
         validate="date" 
         mask= "99/99/9999"
         name="kd_dob" 
         size="40" 
         value="#DATEFORMAT((Get_kid.kd_dob),"mm/dd/yyyy")#" 
         maxlength="60">
                       
        </td>    
        </td>
    </tr>
    <tr>
     	<td>Club: </td>
        </cfoutput>
        <td>	    
           <select name="kd_club_id_key" size="1">
              <cfoutput query="GetClub">
                <cfif '#GetClub.club_id_key#' EQ '#Get_kid.kd_club_id_key#'>
                  <option value="#Get_kid.kd_club_id_key#" selected="selected">#GetClub.club_description#</OPTION>
                <cfelse>
                  <option value="#club_id_key#">#GetClub.club_description#</OPTION> 
                </cfif>  
              </cfoutput>
           </select>
         </td>  
     </tr>
      <tr>
        <td>Sexo:</td>
        <td>	    
           <select name="kd_sexo" size="1">
              <cfoutput query="GetSX">
                <cfif '#GetSX.sx_key#' EQ '#Get_kid.kd_sexo#'>
                  <option value="#Get_kid.kd_sexo#" selected="selected">#GetSX.sx_desc#</OPTION>
                <cfelse>
                  <option value="#sx_key#">#GetSX.sx_desc#</OPTION> 
                </cfif>  
              </cfoutput>
           </select>
         </td>      
    </tr>
        <tr>
     	<td>Teacher: </td>
        <td>	    
           <select name="kd_te_id_key" size="1">
              <cfoutput query="GetProfe">
                <cfif '#GetProfe.te_id_key#' EQ '#Get_kid.kd_te_id_key#'>
                  <option value="#Get_kid.kd_te_id_key#" selected="selected">#GetProfe.nombre_apellido#</OPTION>
                <cfelse>
                  <option value="#te_id_key#">#GetProfe.nombre_apellido#</OPTION> 
                </cfif>  
              </cfoutput>
           </select>
         </td>  
     </tr>         
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Actualizar"></td>
    </tr>   				
</table>
 
</cfform>
</body>
</html> 