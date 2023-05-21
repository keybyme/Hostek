<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">

</head>
<body>

	<cfinclude template="menu.cfm"></cfinclude>
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
  
      <p>
		<div>
	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
		


 <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
</cfif>
 <cfif isDefined("form.CriteriaGrupos")>
    <cfset url.CriteriaGrupos = trim(form.CriteriaGrupos)>
</cfif>	 
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Contactos left join Carriers on
	    cl_carrier = ca_key
  Where #SESSION.Auth.user_key# = cl_fk_user_key	
  	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>
             AND  (cl_nombre LIKE '%#Trim(url.Criteria)#%' OR
                   cl_apellido LIKE '%#Trim(url.Criteria)#%' OR
                   cl_celular LIKE '%#Trim(url.Criteria)#%'OR
		           cl_email LIKE '%#Trim(url.Criteria)#%'OR
		           cl_address LIKE '%#Trim(url.Criteria)#%')
    </cfif> 

  order by cl_nombre
</CFQUERY>
	
	
				    	<h2> <cfoutput>Contacts</cfoutput> </h2>
	                
<table border="2" bordercolor="#blue">
   <tr>
     <th colspan="10">
        <cfoutput>
        <a href="add_contacto.cfm">Add contact</a>
        </cfoutput>     
     </th>
    </tr>
    <tr>
<cfform name="disp" method="post" action="ListarContactos.cfm">

    <tr>
        <td colspan="4">Search:  <input name="Criteria" size="30"></td>
		<td colspan="1" valign="bottom" align="center"><input type="submit" name="editpho" value="send"></td> 
		<td colspan="4">&nbsp;</td>
    </tr>          
 
</cfform>
</tr>
   <tr>
	    <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Edit</th>
        <th style="color:#006" bgcolor="#CCCCCC">Contact</th>
        <th style="color:#006" bgcolor="#CCCCCC">Phone</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Cellular</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Carrier</th>
	    <th style="color:#006" bgcolor="#CCCCCC">E-mail</th>
        <th style="color:#006" bgcolor="#CCCCCC">Address</th>
        <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>        
    </tr>      
<cfset phoneNumber = 0>
 <cfloop query="GetUser"> 
   <cfoutput> 
   <tr>
 
    <td align="center"><a href="upd_contactos.cfm?claveU=#GetUser.cl_id_key#&action=1"><img src="../image/ico-edit.gif" width="16" height="16" alt=""/></a></td>	
	  <cfset ws_phone = "">
	  <cfset ws_phone = #TRIM(GetUser.cl_phone)#>
	  <cfif #ws_phone# NEQ ""> 	  
	     <cfset areacode = left(ws_phone, 3)>
	     <cfset firstthree = mid(ws_phone, 4, 3)>
	     <cfset lastfour = right(ws_phone, 4)>
	     <cfset ws_phone = "(#areacode#) " & "#firstthree#" & "-" & "#lastfour#">
	  </cfif>	  
  <cfset ws_nombre = '#TRIM(GetUser.cl_nombre)#' & ' ' & '#TRIM(GetUser.cl_apellido)#'>		
 <td>#ws_nombre#</td>	 
  <td>#TRIM(ws_phone)#</td>	
	  <cfset ws_phone = "">
	  <cfset ws_phone = #TRIM(GetUser.cl_celular)#>
	  <cfif #ws_phone# NEQ ""> 	  
	     <cfset areacode = left(ws_phone, 3)>
	     <cfset firstthree = mid(ws_phone, 4, 3)>
	     <cfset lastfour = right(ws_phone, 4)>
	     <cfset ws_phone = "(#areacode#) " & "#firstthree#" & "-" & "#lastfour#">
	  </cfif>
    <td>#TRIM(ws_phone)#</td>         
  <cfset ws_to_text = '#TRIM(GetUser.cl_celular)#' & '@' & '#TRIM(GetUser.ca_text_at)#'>	  
  <td><a href="mailto:#ws_to_text#">#TRIM(GetUser.ca_company)#</a></td>	
  <td><a href="mailto:#TRIM(GetUser.cl_email)#">#TRIM(GetUser.cl_email)#</a></td>
      
      <cfset dire = Replace(TRIM(GetUser.cl_address), " ", "+", "ALL")/>  
      <cfset finaldire ="https://maps.google.com/?q=" & "#dire#">      
      
 <td><a href="#finaldire#">#TRIM(GetUser.cl_address)#</a></td>  
  <td align="center"><a href="del_contact.cfm?claveU=#GetUser.cl_id_key#&action=2"><img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>               
 
 </tr>
 </cfoutput>
 </cfloop>
 
</table>
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
   <!---<cfinclude template="propagandaKB.cfm"></cfinclude>--->
  </div>
</div>
	 

</body>
</html>
