<%@page import="java.util.List,java.util.Iterator" %>
<%@page import="proyecto_uoct.usuario.VO.AnexoVO" %>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
List anexos=(List)request.getAttribute("anx");
%>
<html>
<head>
<title>
Cuadro de Anexos
</title>


</head>
<body>


<h2>Administrar anexos telefónicos</h2>
<div class="box boxpost">
<h4>Anexos telefónicos<br> <small><strong>No</strong> pertenecen a usuarios</small></h4>
  <%
        if(anexos!=null){
          Iterator inx=anexos.iterator();
          request.setAttribute("anexoses",inx);
          %>
           <display:table name="anexoses" id="anx" pagesize="15" class="table table-striped table-bordered table-hover" requestURI="usuarioAction.do">
              <display:caption>Anexos de UOCT</display:caption> <display:column title="Nombre del Anexo"><%=((AnexoVO)anx).getNomAnexo() %>
              </display:column> <display:column title="Anexo"><%=((AnexoVO)anx).getAnexo() %>
              </display:column> <display:column title="Editar"  paramId="idAnx" paramProperty="idAnexo">
              <a href="javascript:Llamadalink('aeditarAnexo','<%=((AnexoVO)anx).getIdAnexo() %>')" class="botoGris botoMini">Editar</a> </display:column>


            <display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
        <display:setProperty name="basic.empty.showtable" value="true"/> <display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
        <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
        <display:setProperty name="paging.banner.placement" value="bottom"/> <display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
        <display:setProperty name="paging.banner.one_item_found" value="<span class='pagebanner'>Se encontr&oacute; un {0}.</span>"/>
        <display:setProperty name="paging.banner.all_items_found" value="<span class='pagebanner'>{0} {1} encontrados.</span>"/>
        <display:setProperty name="paging.banner.some_items_found" value="<span class='pagebanner'>{0} {1} encontrados.Mostrando {2} a {3}.</span>"/>
        <display:setProperty name="paging.banner.full" value="<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Ant</a>]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
        <display:setProperty name="paging.banner.first" value="	<span class=\"pagelinks\">[Primero/Prev]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
        <display:setProperty name="paging.banner.last" value="	<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Prev</a>]{0}[Sgte/Ultimo]"></display:setProperty>
        <display:setProperty name="export.csv" value="false"/> <display:setProperty name="export.xml" value="false"/>
        <display:setProperty name="export.rtf" value="false"/> <display:setProperty name="export.excel.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.pdf.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.xml.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.csv.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.pdf.label" value="<img src='../util/img/pdf.gif' width='10' height='10'>"/>
        <display:setProperty name="export.excel.label" value="<img src='../util/img/excel.gif' width='10' height='10'>"/>
        <display:setProperty name="export.amount" value="boxOpciones"/>

            </display:table> 
            <%} %>
 
 </div>

 
 <div class="box boxpost">
		<h4>Agregar nuevo anexo <br> <small>Anexo <strong>no</strong> relacionado a un usuario</small></h4>
			<form id="formNuevoAnexo" name="form1" action="usuarioAction.do" class="form-horizontal">
			 <input type="hidden" name="hacia" value="registraAnx"/>
  								<div class="form-group">
    								<label for="inputNombreAnexo" class="col-sm-4 control-label">Nombre</label>
    								<div class="col-sm-8">
      								<input name="nomAnx" type="text" class="form-control" id="inputNombreAnexo">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputAnexo"   class="col-sm-4 control-label">Anexo</label>
    								<div class="col-sm-8">
      								<input maxlength="10" name="anx" type="text" class="form-control" id="inputAnexo">
    								</div>
  								</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a  href="javascript:submitThisform()" class="botoVerde">Agregar</a>
    									</div>
  									</div>
    							</div>
  							</form>
</div>
 

<jsp:include page="/comunes/pieContenido.jsp" />

  <script language="JavaScript" type="text/javascript">
/*var frmvalidator  = new Validator("form1");
frmvalidator.addValidation("nomAnx","req","Indique el nombre del anexo");
frmvalidator.addValidation("nomAnx","maxlen=30","Nombre del anexo no puede superar los 30 caracteres");
frmvalidator.addValidation("nomAnx","alnumspace");

frmvalidator.addValidation("anx","req","Debe Ingresar el anexo telefónico nuevo");
frmvalidator.addValidation("anx","maxlen=10","Anexo no puede superar los 10 caracteres");
frmvalidator.addValidation("anx","num");*/
</script>




<script type="text/javascript">
function submitThisform()
{
	
	var form= $('#formNuevoAnexo')
	var action='usuario/usuarioAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    nomAnx: {
		    	required:true,
		    	alphanumeric:true
		    },
		   
		    anx:{
		    	required:true,
		    	digits:true
		    }
		  
		    },
		    messages: {
		    	nomAnx: {
			    	required:"Indique el nombre del anexo",
			    	alphanumeric:true
			    },
			   
			    anx:{
			    	required:"Debe Ingresar el anexo telefónico nuevo",
			    	digits:"El anexo debe ser un número"
			    }
            }
		  });
	
	 if(form.valid()) 
	 {
	  SubmitFormulario(action, form);
	 }
		
}
function Llamadalink(hacia,link){
	link=link.replace('#','');
	link='usuario/usuarioAction.do?idAnx='+link+'&hacia='+hacia;
	LlamadaPagina(link);
	
}
</script>

</body>
</html>
