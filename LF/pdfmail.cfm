

<cfhtmltopdf destination="pdfs/archivo.pdf" name="pdfdoc"
  source="https://www.keybyme.com/LF/Reporte_upd3_pdf.cfm?claveU=153&ws_id=alexg" overwrite="true"  
  orientation="portrait"  pagetype="A4" margintop="1" marginbottom="1" 
  marginleft="1" marginright="1" /> 


<cfmail from="lfjsafetydepartment@gmail.com" 
                      <!--- to="#TRIM(GetReporte.emp_email)#" --->
                       to="marcowolff619@gmail.com"
                       bcc =""        
                       subject="test doc" type="HTML"
                       server="smtp.gmail.com:587"
                       username="flooringsvc@gmail.com" 
                       password="vzqxtznrmtiruvts" 
                       useTLS = "yes">  
                      <cfmailparam file="doc.pdf" content="#pdfdoc#">
<!---     <cfmailparam file="#getdirectoryfrompath(getbasetemplatepath())#holly.pdf" type="application/pdf"> --->

    Reply, bla bla bla

</cfmail>

<p>se fue !!!!!</p>
