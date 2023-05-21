 
 
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO RE_Employees(emp_name, emp_email, emp_phone)
	 VALUES('#Trim(FORM.emp_name)#', '#Trim(FORM.emp_email)#', '#Trim(FORM.emp_phone)#')
	</CFQUERY> 
 
	   
<cflocation url="Listar_Emp.cfm">
