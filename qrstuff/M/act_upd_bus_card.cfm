<!--- update --->



<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Misc 
SET       
    	m_password  = '#TRIM(Form.m_password)#',         
        m_titulo  = '#TRIM(Form.m_titulo)#',
 		m_subtitulo   = '#TRIM(Form.m_subtitulo)#',
        m_parrafo1    = '#TRIM(Form.m_parrafo1)#',
        m_parrafo2   = '#TRIM(Form.m_parrafo2)#',
        m_parrafo4   = '#TRIM(Form.m_parrafo4)#',
        m_link  = '#TRIM(Form.m_link)#',
        m_parrafo5  = '#TRIM(Form.m_parrafo5)#'

WHERE 
        m_id_key = #Form.m_id_key#       
</cfquery>
 
 <cfinclude template="../menu/index.cfm">
Updated !!!