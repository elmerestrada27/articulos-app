package ar.com.codoacodo.oop;

import java.time.LocalDateTime;

public class Articulo {

    protected Long id;
    protected String titulo;
    protected String imagen;
    protected String autor; 
    protected boolean novedad;
    protected LocalDateTime fechaCreacion;
    protected String codigo;
    protected double precio;
    
    public Articulo(Long id, String titulo, String imagen, String autor, boolean novedad, LocalDateTime fechaCreacion,
			String codigo, double precio) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.imagen = imagen;
		this.autor = autor;
		this.novedad = novedad;
		this.fechaCreacion = fechaCreacion;
		this.codigo = codigo;
		this.precio = precio;
	}

	public Articulo(String titulo, String imagen, String autor, double precio, 
    		boolean novedad, String codigo, LocalDateTime fechaCreacion) {
    	extracted(titulo, imagen, autor, precio, novedad, codigo, fechaCreacion);
    }

    public Articulo(Long id, String titulo, String imagen, String autor, double precio,
    		boolean novedad,  String codigo, LocalDateTime fechaCreacion) {
    	extracted(titulo, imagen, autor, precio, novedad, codigo, fechaCreacion);
        this.id = id;
    }

    private void extracted(String titulo, String imagen, String autor, double precio, 
    		boolean novedad, String codigo, LocalDateTime fechaCreacion) {
        this.imagen = imagen;
        this.titulo = titulo;
        this.autor = autor;
        this.novedad = false;
        this.fechaCreacion = fechaCreacion;
        this.precio = precio;
        this.novedad = novedad;
        this.codigo = codigo;
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public boolean isNovedad() {
		return novedad;
	}

	public void setNovedad(boolean novedad) {
		this.novedad = novedad;
	}

	public LocalDateTime getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(LocalDateTime fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	@Override
	public String toString() {
		return "Articulo [id=" + id + ", titulo=" + titulo + ", imagen=" + imagen + ", autor=" + autor + ", novedad="
				+ novedad + ", fechaCreacion=" + fechaCreacion + ", codigo=" + codigo + ", precio=" + precio + "]";
	}
	
	
}
