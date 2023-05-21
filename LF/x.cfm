

<cfhtmltopdf destination="hollyq.pdf" name="pdfdoc"
  source="https://www.keybyme.com/LF/Reporte_upd2_pdf.cfm?claveU=154&ws_id=jesusz" overwrite="true"  
  orientation="portrait"  unit="in" pageheight="8" pagewidth="4" marginleft="1" marginright="1" /> 


<cfmail from="lfjsafetydepartment@gmail.com" 
                      <!--- to="#TRIM(GetReporte.emp_email)#" --->
                       to="marcowolff619@gmail.com"
                       bcc =""        
                       subject="prueba doc" type="HTML"
                       server="smtp.gmail.com:587"
                       username="lfjsafetydepartment@gmail.com" 
                       password="nqfzjjuhruegkacq" 
                       useTLS = "yes">  
                      <cfmailparam file="doc.pdf" content="#pdfdoc#" type="pdf">
<!---     <cfmailparam file="#getdirectoryfrompath(getbasetemplatepath())#holly.pdf" type="application/pdf"> --->

    Reply, bla bla bla

</cfmail>

<p>se fue !!!!!</p>
