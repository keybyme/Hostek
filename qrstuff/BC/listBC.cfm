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


<cfquery name = "GetBusCard" dataSource = "wolffdb_dsn">
    SELECT QR_Business_card.bc_id_key,
           RTRIM (QR_Business_card.bc_name) + ' ' +
           RTRIM (QR_Business_card.bc_last_name) as nombre_apellido,
           RTRIM (QR_Business_card.bc_address) + ' ' +
           RTRIM (QR_Business_card.bc_city) + ' ' +
           RTRIM (QR_Business_card.bc_state) + ' ' +
           RTRIM (QR_Business_card.bc_zipcode) as direccion,
           QR_Business_card.bc_business_name,
           QR_Business_card.bc_telephone,
           QR_Business_card.bc_celular,
           QR_Business_card.bc_email,
           QR_Business_card.bc_website,
           QR_Business_card.bc_photo,
           QR_Business_card.bc_logo,
           QR_Business_card.bc_title,
           QR_Business_card.bc_fax,
           QR_Business_card.bc_field1,
           QR_Business_card.bc_field2,
           QR_Business_card.bc_type
    FROM QR_Business_card   
         WHERE bc_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_integer">
</cfquery>
<cfoutput>
<cfset logo1 = "logos/"> 
<cfset numero = "#URL.claveU#">
<cfset logo2 = ".gif"> 
<cfset ws_logo = logo1 & #numero#  & logo2>

<cfset foto1 = "fotos/"> 
<cfset foto2 = ".gif"> 
<cfset ws_foto = foto1 & #numero#  & foto2>
</cfoutput>

 <title>www.QRcodeTech.com</title>

<table align="center" width="100%">
 
 <cfoutput query="GetBusCard" group="bc_id_key">
   <cfoutput>
  		 <cfif GetBusCard.bc_logo EQ "1">
   			<tr>
  				<td><img src="#ws_logo#"></td>
	       </tr> 
   		</cfif>
   		<cfif GetBusCard.bc_business_name NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetBusCard.bc_business_name)#</strong></td>
  			</tr>
   		</cfif>
      	<cfif GetBusCard.bc_website NEQ "NULL">
     		<tr>
    			<td><strong><a href="#TRIM(GetBusCard.bc_website)#" target="_blank">#TRIM(GetBusCard.bc_website)#</a></strong></td>
  			</tr>
   		</cfif>
   		<cfif GetBusCard.direccion NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetBusCard.direccion)#</strong></td>
  			</tr>
   		</cfif>   
     	<tr>  
    		<td><br></td>
 		</tr>
       	<cfif GetBusCard.bc_photo EQ "1">
   			<tr>
  				<td> <img src="#ws_foto#"></td>
			</tr> 
   		</cfif>
  			<tr>
    			<td><strong>#TRIM(GetBusCard.nombre_apellido)#</strong></td>
  			</tr>
     	<cfif GetBusCard.bc_title NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetBusCard.bc_title)#</strong></td>
  			</tr>
   		</cfif> 
   		<cfif GetBusCard.bc_telephone NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetBusCard.bc_telephone)#</strong></td>
  			</tr>
   		</cfif>
   		<cfif GetBusCard.bc_celular NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetBusCard.bc_celular)#</strong></td>
  			</tr>
   		</cfif>
   		<cfif GetBusCard.bc_email NEQ "NULL">
     		<tr>
    			<td><strong><a href="mailto: #GetBusCard.bc_email#">#TRIM(GetBusCard.bc_email)#</a></strong></td>
  			</tr>
  		</cfif>
  		<cfif GetBusCard.bc_fax NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetBusCard.bc_fax)#</strong></td>
  			</tr>
  		</cfif>
  		<cfif GetBusCard.bc_field1 NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetBusCard.bc_field1)#</strong></td>
  			</tr>
  		</cfif>

  		<cfif GetBusCard.bc_field2 NEQ "NULL">
     		<tr>
    			<td><strong><a href="#TRIM(GetBusCard.bc_field2)#" target="_blank"><img src="image/addcontact.gif" width="310" height="174" /></a></strong></td>
  			</tr>
  		</cfif>
        
    <!---   <a href="http://www.qrcodetech.com/qrstuff/BC/script/download.php?id=_Jorge_Wolff">Agregar a contactos</a>--->
   </cfoutput>
  
  </cfoutput>  
<!---   <tr><td style="font-size:medium">
   <br><br><br><br><br><br>
   <a href="http://www.qrcodetech.com/qrstuff/BC/logout.cfm" target="_blank">Update this Business Card here!</a></td></tr> --->
</table>  
 



