<%-- 
    Document   : matriz_dinamica
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="centertable">
    <tr>
        <td></td>
        <%
        int i,j,slinesA=0,scolumnsA=0,linesA=0,columnsA=0;
        String operation = "";
        
            if(request.getParameter("operation") != null){
                operation = request.getParameter("operation");
            }

        if(session.getAttribute("result_"+operation+"_linesA") != null){
                linesA = (Integer)session.getAttribute("result_"+operation+"_linesA");
        }
        if(session.getAttribute("result_"+operation+"_columnsA") != null){
                columnsA = (Integer)session.getAttribute("result_"+operation+"_columnsA");
        }
        
        double resultado[][] = new double[linesA][columnsA];
        
        if(session.getAttribute("result_"+operation) != null){
                resultado = (double[][])session.getAttribute("result_"+operation);
        }
        
        for(i=0;i<columnsA;i++){
            %>
        <td><%=i%></td>
        <%}%>
        </tr>
        <%for(i=0;i<linesA;i++){
            %>
        <tr>
        <td><%=i%></td>
            <%
            for(j=0;j<columnsA;j++){
        %>
        <td> <input type="text" size="10" value="<%=resultado[i][j]%>" name="a<%=i%><%=j%>" id="a<%=i%><%=j%>" /></td>
        <%}%>
        </tr>
        <%}%>
</table>

