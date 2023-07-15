package ar.com.codoacodo.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class AdministradorDeConexiones {

	public static Connection getConnection() {
		String hosts = "127.0.0.1";			// localhost
		String port = "3306";
		String username = "root";
		String password = "1259";
		String dbName = "proyecto-db";		// nombre base de datos
		String driverClassName = "com.mysql.cj.jdbc.Driver";
		Connection connection;
		try {
			Class.forName(driverClassName);
			String url = "jdbc:mysql://" + hosts + ":"+ port +"/"+ dbName +"?allowPublicKeyRetrieval=true&serverTimeZone=UTC&useSSL=false";
			connection = DriverManager.getConnection(url, username, password);
			System.out.println("Conexion a base exitosa");
		}catch(Exception e) {
			System.out.println("Error al conectarse a la base de datos");
			connection = null;
		}
		return connection;
	}
}