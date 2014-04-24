<%-- 
    Document   : recebe_escalar
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/querySets.js"></script>
        <script type="text/javascript" src="js/canvasManager.js"></script>
        <title>JSP Page</title>
    </head>
    <%
    double n = 0;
    if(session.getAttribute("result_determinant") != null){
                n = (Double)session.getAttribute("result_determinant");
    }
    %>
    <body class="centertable">
        <%@include file="menu.jsp" %>
        <form action="escalar_matriz.do" method="POST" name="escalar_matriz">
            Escalar <input type="text" name="n" value="<%=n%>" id="n"/>
        Linhas <input type="text" name="linesA" id="linesA" onkeyup="refreshPage('matrixes', 'matriz_dinamica.jsp?linesA='+getElementById('linesA').value+'&columnsA='+getElementById('columnsA').value)" />
        Colunas <input type="text" name="columnsA" id="columnsA" onkeyup="refreshPage('matrixes', 'matriz_dinamica.jsp?linesA='+getElementById('linesA').value+'&columnsA='+getElementById('columnsA').value)" />
        
        <div id="matrixes" ></div>
        <input class="button" type="submit" name="OK"/>
        </form>
    </body>
</html>
