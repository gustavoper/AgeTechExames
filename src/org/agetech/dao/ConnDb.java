/**
 * Conector default (MYSQL) para as classes
 * 
 * @author Gustavo Pereira <gustavoper@gmail.com>
 * @since 2019-08-25
 */
package org.agetech.dao;


import java.sql.Connection;
import java.sql.DriverManager;


public class ConnDb {

	
	/**
	 * Define a conexão
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(
					"jdbc:mysql://10.0.0.6:3306/exames", 
					"root", 
					"123456"
			);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
}
