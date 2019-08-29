package org.agetech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.agetech.dao.ConnDb;
import org.agetech.model.Exame;

public class ExameDao {

	
	
	public boolean insert(String paciente, String medico, String tipoExame, String observacao)
	{
		try 
		{
			String sqlInsert = " insert into exame (medico,paciente,tipo_exame,observacao) values (?,?,?,?)";
			PreparedStatement insertStmt = ConnDb.getConnection().prepareStatement(sqlInsert);
			String uuidExame = UUID.randomUUID().toString();
			insertStmt.setString(1, medico);
			insertStmt.setString(2, paciente);
			insertStmt.setString(3, tipoExame);
			insertStmt.setString(4, observacao);
			insertStmt.execute();
			insertStmt.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	

	public List<Exame> getAllExames() {
		List<Exame> listaExames = new ArrayList<Exame>();
		String sql = "select * from exame order by id desc";
		try {
			PreparedStatement selectStmt = ConnDb.getConnection().prepareStatement(sql);
			ResultSet recordset = selectStmt.executeQuery();
			while (recordset.next()) {
				Exame exame = new Exame();
				exame.setId(recordset.getInt("id"));
				exame.setMedico(recordset.getString("medico"));
				exame.setPaciente(recordset.getString("paciente"));
				exame.setTipoExame(recordset.getString("tipo_exame"));
				listaExames.add(exame);
			}
			selectStmt.close();
			recordset.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaExames;
	}

}
