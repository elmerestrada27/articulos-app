package ar.com.codoacodo.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;

import ar.com.codoacodo.dao.DAO;
import ar.com.codoacodo.db.AdministradorDeConexiones;
import ar.com.codoacodo.oop.Articulo;

public class MySQLDAOImpl implements DAO {

  private String tableName;

  public MySQLDAOImpl()  {
      this.tableName = "articulo";
  }
  
  @Override
  public void create(Articulo articulo) throws Exception {
      String sql = "insert into "+this.tableName;
      sql += "(titulo,autor,precio,fechaCreacion,novedad,codigo) ";
      sql += "values (?,?,?,?,?,?) ";
      
      Connection con = AdministradorDeConexiones.getConnection();
      PreparedStatement pst = con.prepareStatement(sql);
      
      //sql injection!
      pst.setString(1,articulo.getTitulo());
      pst.setString(2,articulo.getAutor());
      pst.setDouble(3,articulo.getPrecio());
      pst.setDate(4, this.dateFrom(articulo.getFechaCreacion()));	//fecha LocalDateTime > jdbc > java.sql.Date
      pst.setInt(5,articulo.isNovedad() ? 1 : 0);        
      pst.setString(6,articulo.getCodigo());        

      //RestultSet
      pst.executeUpdate();//INSERT/UPDATE/DELETE
  }    

  @Override
  public void update(Articulo articulo) throws Exception {
      String sql = "update "+this.tableName+" set titulo= ?, autor= ?, precio= ? where id="+articulo.getId();
      
      Connection con = AdministradorDeConexiones.getConnection();
      PreparedStatement pst = con.prepareStatement(sql);
      
      //sql injection!
      pst.setString(1,articulo.getTitulo());
      pst.setString(2,articulo.getAutor());
      pst.setDouble(3,articulo.getPrecio());
      
      //RestultSet
      pst.executeUpdate();//INSERT/UPDATE/DELETE
      
  }
  
  @Override
  public void delete(Long id) throws Exception {
      String sql = "delete from "+this.tableName+" where id = ? ";
      
      Connection con = AdministradorDeConexiones.getConnection();
      PreparedStatement pst = con.prepareStatement(sql);

      pst.setLong(1,id);
      pst.executeUpdate();
  }
  
  public Articulo getById(Long id) throws Exception {//1
     
      Articulo articulo = null;
	  String sql = "select * from "+this.tableName+" where id =?";
      
      Connection con = AdministradorDeConexiones.getConnection();
      PreparedStatement pst = con.prepareStatement(sql);

      pst.setLong(1,id);
      ResultSet res = pst.executeQuery();

      if(res.next()) {
          Long _id = res.getLong(1);
          String titulo = res.getString(2);
          String imagen = res.getString(3);
          String autor = res.getString(4);
          String novedad = res.getString(5);
          Date fechaCreacion = res.getDate(6);
          String codigo = res.getString(7);
          Double precio = res.getDouble(8);

          articulo = new Articulo(_id, titulo, imagen, autor, precio, false, codigo, LocalDateTime.now());
      }
      return articulo;
  }

  @Override
  public ArrayList<Articulo> findAll() throws Exception{
      String sql = "select * from "+this.tableName+"";

      //Obtener la Conection
      Connection con = AdministradorDeConexiones.getConnection();

      //PreparedStatement con mi sql
      PreparedStatement pst = con.prepareStatement(sql);

      ArrayList<Articulo> listado = new ArrayList<>();

      ResultSet res = pst.executeQuery();

      while(res.next()) {
          Long id = res.getLong(1);
          String titulo = res.getString(2);
          String imagen = res.getString(3);
          String autor = res.getString(4);
          String novedad = res.getString(5);
          Date fechaCreacion = res.getDate(6);
          String codigo = res.getString(7);
          Double precio = res.getDouble(8);

          listado.add(new Articulo(id, titulo, imagen, autor, false, LocalDateTime.now(), codigo, precio));
      }					
      return listado;
  }
  
  @Override
  public ArrayList<Articulo> findAllByTitle(String clave) throws Exception {
	  return null;
  }

  private Date dateFrom(LocalDateTime ldt) {
      java.util.Date date = Date.from(ldt.toLocalDate().atStartOfDay(ZoneId.systemDefault()).toInstant());
      return new java.sql.Date(date.getTime());
  }
  
  public LocalDateTime fromDateToLocalDateTime(Date date) {
	LocalDateTime ldt = LocalDateTime.ofInstant(date.toInstant(),ZoneId.systemDefault());
	return ldt;
  }

}