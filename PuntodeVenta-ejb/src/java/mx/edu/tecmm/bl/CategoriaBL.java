/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.tecmm.bl;

import javax.ejb.Stateless;
import mx.edu.tecmm.modelo.Categorias;

/**
 *
 * @author miguel
 */
@Stateless
public class CategoriaBL implements CategoriaBLLocal {

    @Override
    public int agregar(Categorias parameter) {
        return 0;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
}
