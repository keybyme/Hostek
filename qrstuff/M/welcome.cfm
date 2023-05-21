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
	            <cfinclude template="../M/loginForm.cfm">
               <cfabort>
          </cfif> 
 
<cfquery name="get_M" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Misc
WHERE m_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfform name="edit" method="post" action="../M/act_upd_bus_card.cfm">
	<cfoutput>
        <input type="hidden" name="m_id_key" value="#get_M.m_id_key#">	
       
    </cfoutput>
    
<table width="100%">

    <tr>
    	<td align="center" colspan="2">
              <cfoutput>
            <a href="../M/uploadfoto.cfm?claveU=#get_M.m_id_key#">Update image</a>
            </cfoutput>
        </td>
    </tr>
<cfoutput>
    <tr>
        <td>Password: </td>
        <td><cfinput name="m_password" value="#get_M.m_password#" type="password"></td>
    </tr>
    <tr>
        <td>Title: </td>
        <td><cfinput name="m_titulo" value="#get_M.m_titulo#"></td>
    </tr>
    <tr>
        <td>Sub title: </td>
        <td><cfinput name="m_subtitulo" value="#get_M.m_subtitulo#"></td>
    </tr>    
    <tr>
        <td>Paragraph 1: </td>
        <td><cfinput name="m_parrafo1" value="#get_M.m_parrafo1#"></td>
    </tr>  
    <tr>
        <td>Paragraph 2: </td>
        <td><cfinput name="m_parrafo2" value="#get_M.m_parrafo2#"></td>
    </tr>
    <tr>
        <td>Paragraph 3: </td>
        <td><cfinput name="m_parrafo3" value="#get_M.m_parrafo3#"></td>
    </tr>
    <tr>
        <td>Paragraph 4: </td>
        <td><cfinput name="m_parrafo4" value="#get_M.m_parrafo4#"></td>
    </tr> 
    <tr>
        <td>Link: </td>
        <td><cfinput name="m_link" value="#get_M.m_link#"></td>
    </tr>
    <tr>
        <td>Web/Link: </td>
        <td><cfinput name="m_parrafo5" value="#get_M.m_parrafo5#"></td>
    </tr>                    
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
    </tr>                                        
</cfoutput>
</table>
</cfform>
</body>
</html>