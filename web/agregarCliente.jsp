<%-- 
    Document   : agregarCliente
    Created on : 18/04/2015, 09:06:28 PM
    Author     : Emmanuelsg
--%>

<%@page import="dao.ClienteDaoImpl"%>
<%@page import="dao.ClienteDao"%>
<%@page import="bean.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> agregar Cliente</title>
    </head>
    <body>
        <h1><a href="Menu.jsp">Menu</a></h1><br><br>
        <form action="agregarCliente.jsp">
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input type="text" name="id" value="" placeholder="Ingrese id"></td>
                </tr>
                <tr>
                    <td>Nombres:</td>
                    <td><input type="text" name="nombres" value="" placeholder="Ingrese nombre"></td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td><input type="text" name="apellidos" value="" placeholder="Ingrese apellidos"></td>
                </tr>
                <tr>
                    <td>DNI:</td>
                    <td><input type="text" name="dni" value="" placeholder="Ingrese DNI"></td>
                </tr>
                <tr>
                    <td>Sexo:</td>
                    <td>
                        <select name="sexo">
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Guardar">
                    </td>
                </tr>
            </table>
        </form>
        
        <%
        String id = request.getParameter("id"); id = id==null?"":id;
        String nombres = request.getParameter("nombres"); nombres = nombres==null?"":nombres;
        String apellidos = request.getParameter("apellidos"); apellidos = apellidos==null?"":apellidos;
        String dni = request.getParameter("dni"); dni = dni==null?"":dni;
        String sexo = request.getParameter("sexo"); sexo = sexo==null?"":sexo;
        
        
        if(id != "" && nombres != "" && apellidos != "" && dni != "" && sexo != ""){
            
            Cliente cliente = new Cliente();
            ClienteDao clienteDao = new ClienteDaoImpl();
            
            //seteado de los obtenidos del formulario
            cliente.setIdcliente(Integer.parseInt(id));
            cliente.setNombres(nombres);
            cliente.setApellidos(apellidos);
            cliente.setDni(Integer.parseInt(dni));
            cliente.setSexo(sexo);
            
            //Envio del bean Cliente hacia el metodo agregar Cliente del DAO
            //clienteDao.agregarCliente(cliente);
            if(clienteDao.agregarCliente(cliente)){
                out.println("El Cliente se agrego Satisfactoriamente.");
            }else{
                out.println("Ocurrio un error al agregar el Cliente.");
            }
        }
        
        
        %>
    </body>
</html>
