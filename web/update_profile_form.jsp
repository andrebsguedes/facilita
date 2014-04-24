<%-- 
    Document   : update_profile_form
    Author     : André
--%>


<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Alteração - Perfil</title>
        <link href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="js/querySets.js"></script>
        <script type="text/javascript" src="js/canvasManager.js"></script>
        <script type="text/javascript" language="JavaScript">
            function validateForm(){

                var update_profile_form=document.update_profile_form;
                var field_profile=update_profile_form.profile;

                if(field_profile.value==""){
                    alert("Todos os campos devem ser preenchidos!");
                    field_profile.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div class="selfcontainer" align="center">
        <div class="header">
            <%@include file="menu.jsp" %>
        </div>
                    <div class="content">
                    <table class="filled tableMin">
                <tr>
                    <td class="filled" valign="top">
                        <table  align="center" >
                            <tr>
                                <td align="left" ><h1>Alterar Perfil</h1></td>
                            </tr>
                        </table>
                        <%

                                        try {

                                            int id = Integer.parseInt(request.getParameter("id"));

                                            PerfilDAO profileDB = new PerfilDAO();

                                            profileDB.conectar();

                                            Perfil profile = profileDB.selectById(id);

                                            profileDB.desconectar();

                        if(profile.getId()>0){%>
                        <table align="center">
                            <form name="update_profile_form" action="update_profile.do" method="POST" onsubmit="return validateForm()">
                                <tr>
                                    <td>Id</td>
                                    <td><input type="text" name="id" readonly value="<%out.print(profile.getId());%>"/> </td>
                                </tr>
                                <tr>
                                    <td>Perfil</td>
                                    <td><input type="text" name="profile" value="<%out.print(profile.getPerfil());%>"/> </td>
                                </tr>
                                <tr>
                                    <td><input class="button" type="reset" value="Limpar"/> </td>
                                    <td><input class="button" type="submit" value="Alterar" /></td>
                                </tr>
                            </form>
                        </table>
                                <%}

                                }catch(SQLException e){

                                        out.println(e);

                                        }

%>
                    </td>
                </tr>
            </table>
        </div>
                    <div class="footer">
            </div>
</div>
<%

    if(logged){
    if(session.getAttribute("profile") == null){
       response.sendRedirect("index.jsp?erro=1");
    }
    }

%>
    </body>
</html>