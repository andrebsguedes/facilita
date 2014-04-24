<%-- 
    Document   : recieve_determinant
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
    <body class="centertable">
        <%@include file="menu.jsp" %>
        <form action="compute_determinant.do" method="POST" name="compute_determinant">
        Linhas e Colunas <input type="text" name="linesA" id="linesA" onkeyup="refreshPage('matrixes', 'dynamic_matrix.jsp?linesA='+getElementById('linesA').value+'&columnsA='+getElementById('linesA').value)" />
        <div id="matrixes" ></div>
        <input class="button" type="submit" name="OK"/><img src="imagens/help.png" width="20" height="20"onclick="refreshPage('help', 'help.jsp?option=1');"/>
        </form>
        
        <br>
        <div id="help" ></div>
    </body>
</html>
