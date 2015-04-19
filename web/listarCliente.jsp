<%-- 
    Document   : listarCliente
    Created on : 18/04/2015, 09:54:05 PM
    Author     : Emmanuelsg
--%>

<%@page import="java.util.List"%>
<%@page import="dao.ClienteDaoImpl"%>
<%@page import="dao.ClienteDao"%>
<jsp:useBean id="clien" class="bean.Cliente"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><a href="Menu.jsp">Menu</a></h1><br><br>
        <table>
            <tr>
                <th>ID</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>DNI</th>
                <th>Sexo</th>
            </tr>
            <%
            ClienteDao clienteDao = new ClienteDaoImpl();    
            
            for(int i=0;i<clienteDao.listarCliente().size();i++){
                clien = clienteDao.listarCliente().get(i);
              
            
            %>
            <tr>
                <td><%=clien.getIdcliente()%></td>                
                <td><%=clien.getNombres()%></td>
                <td><%=clien.getApellidos()%></td>
                <td><%=clien.getDni()%></td>
                <td><%=clien.getSexo()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
