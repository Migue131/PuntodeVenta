/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.tecmm.bl;

import javax.ejb.Local;
import mx.edu.tecmm.modelo.Categorias;

/**
 *
 * @author miguel
 */
@Local
public interface CategoriaBLLocal {

    int agregar(Categorias parameter);
    
}
