<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>    
<style>
.myDiv {
  border: 5px outset red;
  background-color: lightblue;    
  text-align: center;
}
</style>
</head>    
<body>
<div class="container-fluid">
 <!---+++++++++++++++++++++++++++++++++++++++---> 
	<cfset ws_red = 75>
	<cfoutput>	
		<cfset aa ="#ws_red#%"> #aa#<br>
	<table style="width: #aa#">
	<tr>
	<td style="background-color: red">.</td>
	</tr>
	</table>	
	<table style="width: #ws_red#">
	<tr>	
	<td style="background-color: darkgreen">.</td>	
	</tr>
	</table>
	<table width="10%">
	<tr>	
	<td style="background-color: blue">.</td>	
	</tr>
	</table>
		</cfoutput>
	
	
 <!---++++++++++++++++++++++++++++++++++++++--->   
<!---<video  controls autoplay muted>
  <source src="KeyByMe/image/MASTER.mp4" type="video/mp4"  id="vid">  
</video>--->


	
<!---++++++++++++++++++++++++++++++++++++++---> 	
<!--- <cfset ws_foto_random = RandRange(001, 700)> 
   
<CFQUERY NAME="GetFoto" datasource="wolffdb_dsn"> 
   SELECT * 
    FROM Fotos 
    WHERE foto_random = #ws_foto_random#
   </cfquery>  

 <cfloop query="GetFoto">   
    <div align="center">  
       <cfoutput>   
          <img class="img-responsive" src="../Fotos/Wolff/#GetFoto.foto_pic#" alt="Chania"> 
       </cfoutput><br>  
    </div>   
 </cfloop>    --->
<!---++++++++++++++++++++++++++++++++++++++--->       
 <div class="container" style="bg-info">
  <h2>Contextual Backgrounds</h2>
  <p>Use the contextual background classes to provide "meaning through colors"</p>
  <p class="bg-primary">This text is important.</p>
  <p class="bg-success">This text indicates success.</p>
  <p class="bg-info">This text represents some information.</p>
  <p class="bg-warning">This text represents a warning.</p>
  <p class="bg-danger">This text represents danger.</p>
</div>   
<!---++++++++++++++++++++++++++++++++++++++---> 
<div class="container">
  <h2>Contextual Colors</h2>
  <p>Use the contextual classes to provide "meaning through colors":</p>
  <p class="text-muted">This text is muted.</p>
  <p class="text-primary">This text is important.</p>
  <p class="text-success">This text indicates success.</p>
  <p class="text-info">This text represents some information.</p>
  <p class="text-warning">This text represents a warning.</p>
  <p class="text-danger">This text represents danger.</p>
</div>    
<!---++++++++++++++++++++++++++++++++++++++---> 
 <div class="container">
  <h1>Keyboard Inputs</h1>
  <p>To indicate input that is typically entered via the keyboard, use the kbd element:</p>
  <p>Use <kbd>ctrl + p</kbd> to open the Print dialog box.</p>
</div>   
<!---++++++++++++++++++++++++++++++++++++++--->     
 <div class="container">
  <h1>Code Snippets</h1>
  <p>Inline snippets of code should be embedded in the code element:</p>
  <p>The following HTML elements: <code>span</code>, <code>section</code>, and <code>div</code> defines a section in a document.</p>
</div>   
<!---++++++++++++++++++++++++++++++++++++++--->  
<div class="container">
  <h1>Description Lists</h1>    
  <p>The dl element indicates a description list:</p>
  <dl>
    <dt>Coffee</dt>
    <dd>- black hot drink</dd>
    <dt>Milk</dt>
    <dd>- white cold drink</dd>
  </dl>     
</div>    
<!---++++++++++++++++++++++++++++++++++++++--->  
<div class="container">
  <h1>Blockquotes</h1>
  <p>The blockquote element is used to present content from another source:</p>
  <blockquote>
    <p>For 50 years, WWF has been protecting the future of nature. The world's leading conservation organization, WWF works in 100 countries and is supported by 1.2 million members in the United States and close to 5 million globally.</p>
    <footer>From WWF's website</footer>
  </blockquote>
</div>
<!---++++++++++++++++++++++++++++++++++++++--->  
 <div class="container">
  <h1>Abbreviations</h1>
  <p>The abbr element is used to mark up an abbreviation or acronym:</p>
  <p>The <abbr title="World Health Organization">WHO</abbr> was founded in 1948.</p>
</div>   
<!---++++++++++++++++++++++++++++++++++++++--->      
<div class="container">
  <h1>Highlight Text</h1>    
  <p>Use the mark element to <mark>highlight</mark> text.</p>
</div>    
<!---++++++++++++++++++++++++++++++++++++++--->     

   
<h1>The pre element</h1>

<pre>
Text in a pre element
is displayed in a fixed-width
font, and it preserves
both      spaces and
line breaks
</pre>
<!---++++++++++++++++++++++++++++++++++++++--->
    
<h1>This is heading 1</h1>
<h2>This is heading 2</h2>
<h3>This is heading 3</h3>
<h4>This is heading 4</h4>
<h5>This is heading 5</h5>
<h6>This is heading 6</h6>
<!---++++++++++++++++++++++++++++++++++++++--->
    
<h1>The span element</h1>

<p>My mother has <span style="color:blue;font-weight:bold">blue</span> eyes and my father has <span style="color:darkolivegreen;font-weight:bold">dark green</span> eyes.</p>  
<!---++++++++++++++++++++++++++++++++++++++--->
 <h1>The nav element</h1>

<p>The nav element defines a set of navigation links:</p>

<nav>
<a href="/html/">HTML</a> |
<a href="/css/">CSS</a> |
<a href="/js/">JavaScript</a> |
<a href="/python/">Python</a>
</nav>   
<!---++++++++++++++++++++++++++++++++++++++--->
 <h1>The ins element</h1>

<p>My favorite color is <del>blue</del> <ins>red</ins>!</p>   
<!---++++++++++++++++++++++++++++++++++++++--->
 <h1>The div element</h1>

<div class="myDiv">
  <h2>This is a heading in a div element</h2>
  <p>This is some text in a div element.</p>
</div>

<p>This is some text outside the div element.</p>   
<!---++++++++++++++++++++++++++++++++++++++--->    
<h1>The article element</h1>

<article>
  <h2>Google Chrome</h2>
  <p>Google Chrome is a web browser developed by Google, released in 2008. Chrome is the world's most popular web browser today!</p>
</article>

<article>
  <h2>Mozilla Firefox</h2>
  <p>Mozilla Firefox is an open-source web browser developed by Mozilla. Firefox has been the second most popular web browser since January, 2018.</p>
</article>

<article>
  <h2>Microsoft Edge</h2>
  <p>Microsoft Edge is a web browser developed by Microsoft, released in 2015. Microsoft Edge replaced Internet Explorer.</p>
</article>
    
 <!---++++++++++++++++++++++++++++++++++++++--->  
    
<p>Same as color name "Tomato":</p>

<h1 style="background-color:rgb(255, 99, 71);">rgb(255, 99, 71)</h1>
<h1 style="background-color:#ff6347;">#ff6347</h1>
<h1 style="background-color:hsl(9, 100%, 64%);">hsl(9, 100%, 64%)</h1>

<p>Same as color name "Tomato", but 50% transparent:</p>
<h1 style="background-color:rgba(255, 99, 71, 0.5);">rgba(255, 99, 71, 0.5)</h1>
<h1 style="background-color:hsla(9, 100%, 64%, 0.5);">hsla(9, 100%, 64%, 0.5)</h1>

<p>In addition to the predefined color names, colors can be specified using RGB, HEX, HSL, or even transparent colors using RGBA or HSLA color values.</p>    
</div>
	</body>
</html>
