/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.tecmm.modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author miguel
 */
@Entity
@Table(name = "detalle_venta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleVenta.findAll", query = "SELECT d FROM DetalleVenta d")
    , @NamedQuery(name = "DetalleVenta.findById", query = "SELECT d FROM DetalleVenta d WHERE d.id = :id")
    , @NamedQuery(name = "DetalleVenta.findByNombreProducto", query = "SELECT d FROM DetalleVenta d WHERE d.nombreProducto = :nombreProducto")
    , @NamedQuery(name = "DetalleVenta.findByCantidad", query = "SELECT d FROM DetalleVenta d WHERE d.cantidad = :cantidad")
    , @NamedQuery(name = "DetalleVenta.findByPrecioVenta", query = "SELECT d FROM DetalleVenta d WHERE d.precioVenta = :precioVenta")
    , @NamedQuery(name = "DetalleVenta.findByTotalVenta", query = "SELECT d FROM DetalleVenta d WHERE d.totalVenta = :totalVenta")})
public class DetalleVenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombreProducto")
    private String nombreProducto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precioVenta")
    private int precioVenta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "totalVenta")
    private int totalVenta;
    @JoinColumn(name = "Venta_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Venta ventaid;

    public DetalleVenta() {
    }

    public DetalleVenta(Integer id) {
        this.id = id;
    }

    public DetalleVenta(Integer id, String nombreProducto, int cantidad, int precioVenta, int totalVenta) {
        this.id = id;
        this.nombreProducto = nombreProducto;
        this.cantidad = cantidad;
        this.precioVenta = precioVenta;
        this.totalVenta = totalVenta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(int precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(int totalVenta) {
        this.totalVenta = totalVenta;
    }

    public Venta getVentaid() {
        return ventaid;
    }

    public void setVentaid(Venta ventaid) {
        this.ventaid = ventaid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleVenta)) {
            return false;
        }
        DetalleVenta other = (DetalleVenta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mx.edu.tecmm.modelo.DetalleVenta[ id=" + id + " ]";
    }
    
}
