<cfhtmltopdf destination="holly.pdf"
  source="https://www.keybyme.com/LF/Reporte_upd2.cfm?claveU=150&ws_id=angelc" overwrite="true"  
  orientation="portrait"  pagetype="A4" margintop="1" marginbottom="1" 
  marginleft="1" marginright="1" /> 
 
<!--- <cfcontent file="#getdirectoryfrompath(getbasetemplatepath())#test.pdf" type="application/pdf" >  --->

<!--- <cfdocument format="PDF" src="https://www.google.com/" filename="#expandPath('myDocument.pdf')#" overwrite="true" /> --->

<cflocation url = "pdfmail.cfm">


