<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L.F. Jennings</title>
</head>

<body>
 
<cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE RE_Employees
SET emp_name   = '#TRIM(Form.emp_name)#'  
  , emp_phone =	'#TRIM(Form.emp_phone)#'
  , emp_email =	'#TRIM(Form.emp_email)#'
WHERE 
        emp_key = #Form.emp_key#       
</cfquery>
 
 <cflocation url="Listar_Emp.cfm">

</body>
</html> 