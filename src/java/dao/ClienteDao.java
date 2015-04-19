/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Cliente;
import java.util.List;

/**
 *
 * @author Emmanuelsg
 */
public interface ClienteDao {
    
    public boolean agregarCliente(Cliente cliente);
    public List<Cliente> listarCliente();
    
}
