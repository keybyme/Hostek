
  <cfhtmltopdf destination="pdfs/holly.pdf"
  source="https://www.keybyme.com/LF/Reporte_upd2.cfm?claveU=158&ws_id=jesusz" overwrite="true"  
  orientation="portrait"  pagetype="A4" margintop="1" marginbottom="1" 
  marginleft="1" marginright="1" />
 
<cfcontent file="#getdirectoryfrompath(getbasetemplatepath())#test.pdf" type="application/pdf" >

<cflocation url = "pdfmail.cfm">



