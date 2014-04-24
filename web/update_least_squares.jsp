<%-- 
    Document   : update_least_squares
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
    int option=0,quantity=0;
        if(session.getAttribute("data_least_squares_option") != null){
                option = (Integer) session.getAttribute("data_least_squares_option");
            }
        if(session.getAttribute("data_least_squares_quantity") != null){
                quantity = (Integer) session.getAttribute("data_least_squares_quantity");
            }

%>
<body class="centertable" onload="refreshPage('least_squares','dynamic_update_least_squares.jsp?auxiliarQuantity=<%=quantity%>');">
        <form action="compute_least_squares.do" method="POST" name="compute_least_squares">
            Quantidade <input type="text" value="<%=quantity%>" name="quantity" id="quantity" onkeyup="refreshPage('least_squares','dynamic_update_least_squares.jsp?auxiliarQuantity='+getElementById('quantity').value)" /><br>
        Ajuste <input type="radio" <%if(option == 1){out.print("checked");}%> name="option" value="1">Linear 
              <input type="radio" <%if(option == 2){out.print("checked");}%> name="option" value="2">Gaussiano
              <input type="radio" <%if(option == 3){out.print("checked");}%> name="option" value="3">Parabólico
              <input type="radio" <%if(option == 4){out.print("checked");}%> name="option" value="4">Exponencial
        <div id="least_squares"></div>
        <input class="button"type="submit" name="OK"/>
        </form>
    </body>
</html>