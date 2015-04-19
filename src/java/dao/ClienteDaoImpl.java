/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Cliente;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Emmanuelsg
 */
public class ClienteDaoImpl implements ClienteDao{
    
    public Connection abrirConexion(){
       return conexion.ConexionOracle.conecta();
    }
    
    public void cerrarConexion(){
        try {
            conexion.ConexionOracle.conecta().close();
        } catch (Exception e) {
        }
    }
    
    public void Guardar(){
        try {
             abrirConexion().commit();
        } catch (Exception e) {
        }       
    }
    
    public void Revertir(){
        try {
             abrirConexion().rollback();
        } catch (Exception e) {
        }       
    }

    @Override
    public boolean agregarCliente(Cliente cliente) {
        boolean estado = true;
        Statement st = null;
        String query = "INSERT INTO cliente VALUES ("+cliente.getIdcliente()+
                ",'"+cliente.getNombres()+"','"+
                cliente.getApellidos()+"',"+
                cliente.getDni()+",'"+
                cliente.getSexo()+"')";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            Guardar(); //commit();
            cerrarConexion();//cerrar la conexion
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            estado = false;
            try {
                Revertir();
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    @Override
    public List<Cliente> listarCliente() {
        Statement st = null;
        ResultSet rs = null;
        String query = "SELECT * FROM cliente";
        Cliente cliente = null;
        List<Cliente> lista = new ArrayList<>();
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            while (rs.next()) {   
                cliente = new Cliente();
                cliente.setIdcliente(rs.getInt("idcliente"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setDni(rs.getInt("dni"));
                cliente.setSexo(rs.getString("sexo"));
                lista.add(cliente);
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return lista;
    }
    
}
