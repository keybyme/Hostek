<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome</title>
<Style>

   body {margin: 0px;}
   
</style>
</head>

<body>

        	<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cfinclude template="loginForm.cfm">
               <cfabort>
          </cfif> 
 
<cfquery name="get_bc" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Business_card
WHERE bc_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfform name="edit" method="post" action="act_upd_bus_card.cfm">
	<cfoutput>
        <input type="hidden" name="bc_id_key" value="#get_bc.bc_id_key#">	
       
    </cfoutput>
    
<table width="100%" align="center">
<tr>
 <td colspan="5" align="center" align="center">
<cfinclude template="../menu/heading.cfm">
<br>
</td>
</tr>

    <tr>
    	<td align="center" colspan="2">
              <cfoutput>
            <a href="uploadlogo.cfm?claveU=#get_bc.bc_id_key#">Update Business card logo</a>
            </cfoutput>
        </td>
   &nbsp;&nbsp;&nbsp;
    	<td align="center" colspan="2">
              <cfoutput>
            <a href="uploadfoto.cfm?claveU=#get_bc.bc_id_key#">Update Business card picture</a>
            </cfoutput>
        </td>
    </tr><br>
<cfoutput>
    <tr>
        <td>Password: </td>
        <td><cfinput name="bc_password" value="#get_bc.bc_password#" type="password"></td>
    </tr>
    <tr>
        <td>Name: </td>
        <td><cfinput name="bc_name" value="#get_bc.bc_name#" size="30"></td>
   
        <td>Last name: </td>
        <td><cfinput name="bc_last_name" value="#get_bc.bc_last_name#" size="30"></td>
    </tr> 
    <tr>
        <td>Address: </td>
        <td><cfinput name="bc_address" value="#get_bc.bc_address#" size="30"></td>
     
        <td>City: </td>
        <td><cfinput name="bc_city" value="#get_bc.bc_city#" size="30"></td>
    </tr> 
    <tr>   
        <td>State: </td>
        <td><cfinput name="bc_state" value="#get_bc.bc_state#" size="30"></td>
     
        <td>Zipcode: </td>
        <td><cfinput name="bc_zipcode" value="#get_bc.bc_zipcode#" size="30"></td>
    </tr>  
    <tr>
        <td>Business Name: </td>
        <td><cfinput name="bc_business_name" value="#get_bc.bc_business_name#" size="30"></td>
    
        <td>Website: </td>
        <td><cfinput name="bc_website" value="#get_bc.bc_website#" size="30"></td>
    </tr> 
    <tr>
        <td>Telephone: </td>
        <td><cfinput name="bc_telephone" value="#get_bc.bc_telephone#" size="30"></td>
        <td>Cellular: </td>
        <td><cfinput name="bc_celular" value="#get_bc.bc_celular#" size="30"></td>
    </tr>   
    <tr>
        <td>Fax: </td>
        <td><cfinput name="bc_fax" value="#get_bc.bc_fax#" size="30"></td>
    </tr>     
    <tr>  
        <td>Email: </td>
        <td><cfinput name="bc_email" value="#get_bc.bc_email#" size="30"></td>
        <td>Title: </td>
        <td><cfinput name="bc_title" value="#get_bc.bc_title#" size="30"></td>
    </tr>   
    <tr>
        <td>Photo: </td>
        <td><cfinput name="bc_photo" value="#get_bc.bc_photo#"></td>
   
        <td>Logo: </td>
        <td><cfinput name="bc_logo" value="#get_bc.bc_logo#"></td>
    </tr> 
   
    <tr>
        <td>Field1: </td>
        <td colspan="3"><cfinput name="bc_field1" value="#get_bc.bc_field1#" size="100"></td>
    </tr>   
    <tr>
        <td>Field2: </td>
        <td colspan="3"><cfinput name="bc_field2" value="#get_bc.bc_field2#" size="100"></td>
    </tr>   
    <tr>
        <td>Type: </td>
        <td><cfinput name="bc_type" value="#get_bc.bc_type#"></td>
    </tr>  
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update">
        </cfoutput>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td>
</cfform>
<cfform name="LGedit" method="post" action="logout.cfm">
 
        <input type="submit" name="editemp3" value="Log out">
</cfform>  
</td>
    </tr>                                        

</table>

</body>
</html>