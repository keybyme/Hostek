<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>QRcodeTech.com</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
	<!--[if IE]><style type="text/css" media="screen"> #navigation ul li a em { top:32px; } </style><![endif]-->
	
	<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="js/jquery-func.js" type="text/javascript"></script>
<Style>

   body {margin: 0px;}
   
</style>
</head>

<body>

        	<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cfinclude template="loginForm.cfm">
               <cfabort>
          </cfif> 
 <cfinclude template="Header.cfm">
<cfquery name="get_links" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Links
WHERE lk_username = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfform name="edit" method="post" action="act_upd_links.cfm">
	<cfoutput>
        <input type="hidden" name="user_key" value="#get_links.lk_id_key#">	
       
    </cfoutput>
    
<table align="center" border="2" bgcolor="#99CCCC">
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
        <td>Flag Link 4: </td>
        <td><cfinput name="lk_link_flag_4" value="#get_links.lk_link_flag_4#" size="10"></td>
    </tr>
    <tr>
        <td>Link 4: </td>
        <td><cfinput name="lk_link_4" value="#get_links.lk_link_4#" size="150"></td>
    </tr> 
    <tr>
        <td>Desc Link 4: </td>
        <td><cfinput name="lk_link_desc_4" value="#get_links.lk_link_desc_4#" size="150"></td>
    </tr>    
    <tr><td colspan="2">
    ****************************************************************************************************************************************
        </td></tr>       
    <tr>
        <td>Flag Link 5: </td>
        <td><cfinput name="lk_link_flag_5" value="#get_links.lk_link_flag_5#" size="10"></td>
    </tr>
    <tr>
        <td>Link 5: </td>
        <td><cfinput name="lk_link_5" value="#get_links.lk_link_5#" size="150"></td>
    </tr> 
    <tr>
        <td>Desc Link 5: </td>
        <td><cfinput name="lk_link_desc_5" value="#get_links.lk_link_desc_5#" size="150"></td>
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
<cfform name="LGedit" method="post" action="welcome.cfm">
 
        <input type="submit" name="editemp2" value="Back to menu">
</cfform>  
</td>
</tr>
</table>      
</body>
</html>