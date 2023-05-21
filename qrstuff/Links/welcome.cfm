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
 
<cfquery name="get_links" datasource="wolffdb_dsn">			
SELECT *
FROM Links
WHERE lk_id = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfform name="edit" method="post" action="act_upd_links.cfm">
	<cfoutput>
        <input type="hidden" name="user_key" value="#get_links.lk_id#">	
       
    </cfoutput>
    
<table align="center" border="2" bgcolor="#99CCCC">
 <td colspan="2" align="center">
<cfinclude template="heading.cfm">
<br><br>
</td>
<cfoutput>

    <tr>
        <td>Flag Link 1: </td>
        <td><cfinput name="lk_link_flag_1" value="#get_links.lk_link_flag_1#" size="10"></td>
    </tr>
    <tr>
        <td>Link 1: </td>
        <td><cfinput name="lk_link_1" value="#get_links.lk_link_1#" size="150"></td>
    </tr> 
    <tr>
        <td>Desc Link 1: </td>
        <td><cfinput name="lk_link_desc_1" value="#get_links.lk_link_desc_1#" size="150"></td>
    </tr>   
    <tr><td colspan="2">
    ****************************************************************************************************************************************
    </td></tr> 
    <tr>
        <td>Flag Link 2: </td>
        <td><cfinput name="lk_link_flag_2" value="#get_links.lk_link_flag_2#" size="10"></td>
    </tr>
    <tr>
        <td>Link 2: </td>
        <td><cfinput name="lk_link_2" value="#get_links.lk_link_2#" size="150"></td>
    </tr> 
    <tr>
        <td>Desc Link 2: </td>
        <td><cfinput name="lk_link_desc_2" value="#get_links.lk_link_desc_2#" size="150"></td>
    </tr> 
    <tr><td colspan="2">
    ****************************************************************************************************************************************
    </td></tr>       
    <tr>
        <td>Flag Link 3: </td>
        <td><cfinput name="lk_link_flag_3" value="#get_links.lk_link_flag_3#" size="10"></td>
    </tr>
    <tr>
        <td>Link 3: </td>
        <td><cfinput name="lk_link_3" value="#get_links.lk_link_3#" size="150"></td>
    </tr> 
    <tr>
        <td>Desc Link 3: </td>
        <td><cfinput name="lk_link_desc_3" value="#get_links.lk_link_desc_3#" size="150"></td>
    </tr>    
    <tr><td colspan="2">
    ****************************************************************************************************************************************
    </td></tr>    
    <tr>
       	<td><input type="submit" name="editemp" value="Update">
                                           
</cfoutput>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<td>
</cfform>
<cfform name="LGedit" method="post" action="logout.cfm">
 
        <input type="submit" name="editemp2" value="Log out">
</cfform>  
</td>
</tr>
<table>      
</body>
</html>