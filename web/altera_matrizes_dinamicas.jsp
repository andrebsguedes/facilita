<%-- 
    Document   : alterar_matrizes_dinamicas
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="centertable">
            <tr>
                <td>
                    <table class="centertable">
                        <tr>
                            <td></td>
        <%
        int i,j,linesA=0,columnsA=0,linesB=0,columnsB=0,slinesA=0,scolumnsA=0,slinesB=0,scolumnsB=0;
        String operation ="";
            if(request.getParameter("linesA") != null){
                linesA = Integer.parseInt(request.getParameter("linesA"));
            }
            if(request.getParameter("columnsA") != null){
                columnsA = Integer.parseInt(request.getParameter("columnsA"));
            }
            if(request.getParameter("linesB") != null){
                linesB = Integer.parseInt(request.getParameter("linesB"));
            }
            if(request.getParameter("columnsB") != null){
                columnsB = Integer.parseInt(request.getParameter("columnsB"));
            }
            if(request.getParameter("operation") != null){
                operation = request.getParameter("operation");
            }
        
        if(session.getAttribute("data_"+operation+"_linesA") != null){
                slinesA = (Integer)session.getAttribute("data_"+operation+"_linesA");
        }
        if(session.getAttribute("data_"+operation+"_columnsA") != null){
                scolumnsA = (Integer)session.getAttribute("data_"+operation+"_columnsA");
        }
        if(session.getAttribute("data_"+operation+"_linesB") != null){
                slinesB = (Integer)session.getAttribute("data_"+operation+"_linesB");
        }
        if(session.getAttribute("data_"+operation+"_columnsB") != null){
                scolumnsB = (Integer)session.getAttribute("data_"+operation+"_columnsB");
        }
        double matrixA[][] = new double[slinesA][scolumnsA];
        double matrixB[][] = new double[slinesB][scolumnsB];
        if(session.getAttribute("data_"+operation+"_matrixA") != null){
                matrixA = (double[][])session.getAttribute("data_"+operation+"_matrixA");
            }
        if(session.getAttribute("data_"+operation+"_matrixB") != null){
                matrixB = (double[][])session.getAttribute("data_"+operation+"_matrixB");
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
            <td><input size="10" type="text" value="<%if(i<slinesA && j<scolumnsA){out.print(matrixA[i][j]);}else{out.print(0.0);}%>" name="matrixA<%=i%><%=j%>" id="matrixA<%=i%><%=j%>" /></td>
        <%}%>
        </tr>
        <%}%>
        </table>
        </td><td>
            <table class="centertable">
            <tr>
                <td></td>
        <%
        
        for(i=0;i<columnsB;i++){
            %>
        <td><%=i%></td>
        <%}%>
        </tr>
        <%for(i=0;i<linesB;i++){
            %>
        <tr>
        <td><%=i%></td>
            <%
            for(j=0;j<columnsB;j++){
        %>
        <td><input size="10" type="text" value="<%if(i<slinesB && j<scolumnsB){out.print(matrixB[i][j]);}else{out.print(0.0);}%>" name="matrixB<%=i%><%=j%>" id="matrixB<%=i%><%=j%>" /></td>
        <%}%>
        </tr>
        <%}%>
        </table>
        </td>
        </tr>
</table>
