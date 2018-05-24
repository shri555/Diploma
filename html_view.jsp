<html>
<head>
  <%    session.setAttribute("a","full" );
                    if( session.getAttribute("userid")== null)           
                    {
                        response.sendRedirect("alogin.jsp");
                    }
                   
                                         
                    %>  
  
<title>HTML Editor</title>

<script type="text/javascript">

var editboxHTML = 
'<html class="expand close">' +
'<head>' +
'<style type="text/css">' +
'.expand { width: 100%; height: 100%; }' +
'.close { border: none; margin: 0px; padding: 0px; }' +
'html,body { overflow: hidden; }' +
'<\/style>' +
'<\/head>' +
'<body class="expand close" onload="document.f.ta.focus(); document.f.ta.select();">' +
'<form class="expand close" name="f">' +
'<textarea class="expand close" style="background: #def;" name="ta" wrap="hard" spellcheck="false">' +
'<\/textarea>' +
'<\/form>' +
'<\/body>' +
'<\/html>';


var defaultStuff = '<h3>Welcome to the HTML editor!<\/h3>\n' +
'<p>Try this HTML editor. Output will appear in the frame below.<\/p>';

var extraStuff = '<center><div style="position:absolute; margin:.3em; bottom:0em; right:0em; font-size: 3.5em;"><small>\n  Go to <a href="index.jsp" target="_top"> Home<\/a>     <a href="Application.jsp" target="_top"> Back<\/a>\n<\/small><\/div>';

var old = '';
         
function init()
{
  window.editbox.document.write(editboxHTML);
  window.editbox.document.close();
  window.editbox.document.f.ta.value = defaultStuff;
  update();
}

function update()
{
  var textarea = window.editbox.document.f.ta;
  var d = dynamicframe.document; 

 
  if (old != textarea.value) {
    old = textarea.value;
    d.open();
    d.write(old);
      d.write(extraStuff);
    if (old.replace(/[\r\n]/g,'') == defaultStuff.replace(/[\r\n]/g,''))
        {
              d.write(extraStuff);
        }
      //d.write(extraStuff);
   d.close();
  }

  window.setTimeout(update, 150);
}

</script>
</head>

<frameset resizable="yes" rows="50%,*" onload="init();">>
  <frame name="editbox" src="javascript:'';">
  <frame name="dynamicframe" src="javascript:'';">
</frameset>

</html>

