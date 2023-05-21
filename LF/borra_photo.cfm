 
 <cfoutput>
    #url.claveU# <br>
    #url.reporte#
    <cfset ws_url_reporte = 0>
    <cfparam name="url.reporte" default="">
    <cfset ws_url_reporte = url.reporte> 	
   
  </cfoutput>


              <cfquery name="deletecon" datasource="wolffdb_dsn">
                DELETE from LF_Photos
                WHERE 
                    ph_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
           </cfquery> 
 
 <cfoutput>     
    <cflocation url="Reporte_upd.cfm?claveU=#ws_url_reporte#"> 
  </cfoutput>    
 
 