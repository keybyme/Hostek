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
   
body,td,th {
	font-size: 16px;
	color: #003399;
	font-weight: bold;
	font-style: italic;
}
a:link {
	color: #F00;
}
</style>
<style type="text/css">
p {color:blue;}
</style>
</head>

<body>

<!---<cfinclude template="Header.cfm">--->
 
<cfquery name = "GetFicha" dataSource = "wolffdb_dsn">
    SELECT *         
    FROM Ficha_Tecnica
  <!---  WHERE ficha_marca = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 
      and ficha_modelo = <cfqueryparam value="#URL.claveU2#" cfsqltype="cf_sql_varchar">--->
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        
                        <cfoutput>#GetFicha.ficha_marca# &nbsp;&nbsp;</span>#GetFicha.ficha_modelo#</cfoutput>
                        
                        </h2>
                      
	     </div>
	</div>
</div>
<div id="main">
	<div class="shell">
		
		<!-- Cols -->
		<div class="cols">
			<div class="cl">&nbsp;</div>
			
			<!-- Col -->
			<div class="col1"> 
      


<table align="center" bordercolor="#CCCCCC" bgcolor="#FFFFFF" width="700">
 <cfoutput query="GetFicha" group="ficha_id_key">        
 <cfoutput>  
 <tr>
 	<td colspan="2"><h2><p style="color:black;" align="center"> Eficiencia Energ&eacute;tica</p></h2></td>
 </tr>  
 <tr>
 	<td align="center" width="210"><img src="img/Rend.gif" width="176" height="117" /></td>
    <td height="117">
    	<table style="background-color:blue;" width="490">
        	<tr>
            	<td style="color:white;">
                	Marca:<cfoutput>#TRIM(GetFicha.ficha_marca)#</cfoutput>
                </td>
            </tr>
            <tr>
             	<td style="color:white;">
                	Modelo:<cfoutput>#TRIM(GetFicha.ficha_modelo)#</cfoutput><br /><br />
                </td>           
            </tr>
            <tr>
            	<td style="color:white;">
                	Combustible:<cfoutput>#TRIM(GetFicha.ficha_combustible)#</cfoutput>
                </td>
            </tr>
            <tr>
            	<td style="color:white;">
                	Norma de Emisi&oacute;n:<cfoutput>#TRIM(GetFicha.ficha_emisiones_CO2)#</cfoutput>
                </td>
            </tr>
            <tr>
            	<td style="color:white;">
                	C&oacute;digo de informe T&eacute;nico: 27A-2013
                </td>
            </tr>                        
        </table>
    </td>
 </tr>
<tr>
	<td colspan="2">
    	<table>
        	<tr style="background-color:yellow;">
  				<td width="210" align="center"><h2><p style="color:black;">Ciudad</p></h2> <br>
                <p style="font-size:24px; color:black;">
                #TRIM(GetFicha.ficha_gas_city)#&nbsp;km/l</p></td>
                <td>
                	<table width="490" align="center">
                    	<tr style="background-color:blue;">
  							<td style="color:white; font-size:24" align="center" height="50">Emisiones de CO<sub>2</sub> &nbsp; #TRIM(GetFicha.ficha_emision_CO2)# &nbsp;g/km</td>
						</tr>
						<tr style="background-color:yellow;">
  							<td style="color:black; font-size:24px" align="center" height="25"><strong>Mixto &nbsp; #TRIM(GetFicha.ficha_gas_mixto)# &nbsp; km/l</strong></td>
						</tr>
						<tr style="background-color:yellow;">  
  							<td style="color:black; font-size:24px" align="center" height="25"><strong>Carretera &nbsp; #TRIM(GetFicha.ficha_gas_hwy)# &nbsp; km/l</strong></td>
						</tr>
                 	</table>
             ``</td>
        	</tr>
    	</table>
   	</td>
</tr>

<tr>
	<td colspan="2">
    <p>
    Los valores reportados en esta etiqueta son referenciales.
    </p>
    <p>
    El rendimiento de combustible y emisiones de CO<sub>2</sub> corresponde al valor constatado en el proceso de homologaci&oacute;n 
    desarrollado por el Ministerio de Transporte y Telecomunicaciones, a trav&eacute;s del Centro de Control y Certificaci&oacute;n 
    Vehicular (3CV).
    </p>
    El rendimiento efectivamente obtenido porcada conductor depender&aacute; de sus h&aacute;bitos de conducci&oacute;n, de la 
    frecuencia de mantenci&oacute;n del vehiculo, de las condiciones ambientales y geogr&aacute;ficas, entre otras.
    <p>
    El CO<sub>2</sub> es el principal gas efecto invernadero responsable del cambio clim&aacute;tico.
    </p>
    </td>
</tr>
  
<tr>
	<td colspan="2">
    	<h2><strong><p style="color:black;">FICHA T&Eacute;CNICA</p></strong></h2>
    </td>
</tr>
  
<tr>
	<td colspan="2">
    	<h3><strong>MOTOR</strong></h3>
    </td>
</tr>
                             
<tr> 
  <TD>Combustible:
  </TD> 
  <td>#TRIM(GetFicha.ficha_combustible)#</td>
</tr>
<tr>  
  <TD>Arquitectura:
  </TD>
  <td>#TRIM(GetFicha.ficha_arquitectura)#</td>
</tr>
<tr> 
  <TD>Disposici&oacute;n:
  </TD> 
  <td>#TRIM(GetFicha.ficha_disposicion)#</td>
</tr>
<tr>  
  <TD>Di&aacute;metro x carrera (mm):
  </TD>
  <td>#TRIM(GetFicha.ficha_diam_carrera)#</td>
</tr>
<tr>  
  <TD>Cilindrada(cc):
  </TD>
  <td>#TRIM(GetFicha.ficha_cilindrada)#</td>
</tr>
<tr>  
  <TD>Rel.compresi&oacute;n:
  </TD>
  <td>#TRIM(GetFicha.ficha_rel_compresion)#</td>
</tr>
<tr>  
  <TD>Alimentaci&oacute;n:
  </TD>
  <td>#TRIM(GetFicha.ficha_alimentacion)#</td>
</tr>
<tr>  
  <TD>Potencia(CV/rpm):
  </TD>
  <td>#TRIM(GetFicha.ficha_potencia)#</td>
</tr>
<tr>  
  <TD>Par motor (Nm/rpm):
  </TD>
  <td>#TRIM(GetFicha.ficha_par_motor)#</td>
</tr>

<tr>
	<td colspan="2">
    	<h3><strong>TRANSMISION</strong></h3>
    </td>
</tr>

<tr>  
  <TD>Tipo:
  </TD>
  <td>#TRIM(GetFicha.ficha_tipo)#</td>
</tr>
<tr>  
  <TD>Cambio:
  </TD>
  <td>#TRIM(GetFicha.ficha_cambio)#</td>
</tr>
<tr>  
  <TD>Velocidad a 1.000 rpm:
  </TD>
  <td>#TRIM(GetFicha.ficha_velocidad)#</td>
</tr>

<tr>
	<td colspan="2">
    	<h3><strong>CHASIS</strong></h3>
    </td>
</tr>

<tr>  
  <TD>Suspensi&oacute;n del:
  </TD>
  <td>#TRIM(GetFicha.ficha_susp_del)#</td>
</tr>
<tr>  
  <TD>Suspensi&oacute;n tras:
  </TD>
  <td>#TRIM(GetFicha.ficha_susp_tras)#</td>
</tr>
<tr>  
  <TD>Freno del (&Oslash; mm):
  </TD>
  <td>#TRIM(GetFicha.ficha_freno_del)#</td>
</tr>
<tr>  
  <TD>Freno tras (&Oslash; mm):
  </TD>
  <td>#TRIM(GetFicha.ficha_freno_tras)#</td>
</tr>
<tr>  
  <TD>Direcci&oacute;n:
  </TD>
  <td>#TRIM(GetFicha.ficha_direccion)#</td>
</tr>

<tr>
	<td colspan="2">
    	<h3><strong>DIMENSIONES</strong></h3>
    </td>
</tr>

<tr>  
  <TD>Batalla (mm.):
  </TD>
  <td>#TRIM(GetFicha.ficha_batalla)#</td>
</tr>
<tr>  
  <TD>Via del/tras (mm.):
  </TD>
  <td>#TRIM(GetFicha.ficha_via_del_tras)#</td>
</tr>
<tr>  
  <TD>Di&aacute;. giro (m):
  </TD>
  <td>#TRIM(GetFicha.ficha_diam_giro)#</td>
</tr>
<tr>  
  <TD>Longitud (mm.):
  </TD>
  <td>#TRIM(GetFicha.ficha_longitud)#</td>
</tr>
<tr>  
  <TD>Anchura (mm):
  </TD>
  <td>#TRIM(GetFicha.ficha_anchura)#</td>
</tr>
<tr>  
  <TD>Altura (mm):
  </TD>
  <td>#TRIM(GetFicha.ficha_altura)#</td>
</tr>
<tr>  
  <TD>Peso (kg):
  </TD>
  <td>#TRIM(GetFicha.ficha_peso)#</td>
</tr>
<tr>  
  <TD>Vol&uacute;men maletero (lit.):
  </TD>
  <td>#TRIM(GetFicha.ficha_vol_maletero)#</td>
</tr>
<tr>  
  <TD>Dep&oacute;sito combustible (lit.):
  </TD>
  <td>#TRIM(GetFicha.ficha_dep_comb)#</td>
</tr>
<tr>  
  <TD>Neum&aacute;ticos:
  </TD>
  <td>#TRIM(GetFicha.ficha_neumaticos)#</td>
</tr>
<tr>  
  <TD>Llantas:
  </TD>
  <td>#TRIM(GetFicha.ficha_llantas)#</td>
</tr>

<tr>
	<td colspan="2">
    	<h3><strong>PRESTACIONES</strong></h3>
    </td>
</tr>

<tr>  
  <TD>Velocidad m&aacute;xima (km/h):
  </TD>
  <td>#TRIM(GetFicha.ficha_vel_max)#</td>
</tr>
<tr>  
  <TD>0-100 km/h (seg.):
  </TD>
  <td>#TRIM(GetFicha.ficha_zero_a_cien)#</td>
</tr>
<tr>  
  <TD>Consumo ECE:
  </TD>
  <td>#TRIM(GetFicha.ficha_consumo_ECE)#</td>
</tr>
<tr>  
  <TD>Emisiones CO<sub>2</sub> (gr/km)
  </TD>
  <td>#TRIM(GetFicha.ficha_emisiones_CO2)#</td>
</tr>
<tr>  
  <TD>Precio unidad probada (euros):
  </TD>
  <td>#TRIM(GetFicha.ficha_precio_unidad)#</td>
</tr>
<tr>  
  <TD>Precio de salida (euros):
  </TD>
  <td>#TRIM(GetFicha.ficha_precio_salida)#</td>
 </tr>
 </cfoutput>
 </cfoutput>
 
</table>

<table width="100%">

    <tr>
      <td bgcolor="#FFFFFF"  style="color:red;">
      <strong>Para solicitar cotizaci&oacute;n, favor llenar el siguiente formulario:</strong></td>
  </tr>
<tr>
    	<td>
        	<table>
            	<tr>
                	<td>   <cfoutput>           
						<form name="jwform" method="post" action="enviarficha.cfm?marcaU=#TRIM(GetFicha.ficha_marca)#&modeloU=#TRIM(GetFicha.ficha_modelo)#"></cfoutput>
							<table align="center" bgcolor="#666666" width="100%">
								<tr>
    								<td width="100" style="color:white;"><strong>Name: </strong></td>
        							<td>
            							<input
             							type="text"
            							name="Nombre"
             							size="70"
             							value=""
             							maxlength="100"
             							required="yes"
             							message="Favor ponga su nombre.">
         							</td>
    							</tr>
                                <tr>
    								<td width="100" style="color:white;"><strong>Telephone: </strong></td>
        							<td>
            							<input
             							type="text"
            							name="Telefono"
             							size="70"
             							value=""
             							maxlength="100"
             							required="yes"
             							message="Favor ponga su tel&eacute;fono">
         							</td>
    							</tr>
								<tr>
    								<td width="100" style="color:white;"><strong>E-mail: </strong></td>
        							<td>
           								<input
             							type="text"
             							name="email"
             							size="70"
             							value=""
             							maxlength="100">
         							</td>
     							</tr> 

                               <tr>
     								<td valign="top" width="100" style="color:white;"><strong>Comentario: </strong></td>
        							<td>
            							<textarea name="texto" rows="7" cols="40"> 
            							</textarea>
        							</td>
     							</tr>  
     							<tr>
        							<td width="100"> 
           								<input name="enviar" type="submit" value="Enviar" width="50">
        							</td>
        						
     							</tr>          
							</table>
         			</form>                   
					</td>
                
               </tr>     
           </table>         
       </td>  
               
	</tr>
    
</table>              
               
			</div>
			<!-- End Col -->
			
			<div class="cl">&nbsp;</div>
		</div>
		<!-- End Cols -->
		
	</div>
</div>


</body>
</html>