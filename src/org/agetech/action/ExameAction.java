package org.agetech.action;

import com.opensymphony.xwork2.ActionSupport;
import org.agetech.model.Exame;
import org.agetech.dao.*;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

public class ExameAction extends ActionSupport
{

	private static final long serialVersionUID = 6329394260276112660L;
	
	public List<Exame> todosExames;
	
	public ExameDao exameDao;
	
	
	public int id;
	
	public String paciente,medico,observacao,tipoExame;
	
	public String resultado;
	
	
	
	public ExameAction()
	{
		this.exameDao =  new ExameDao();
	}
	
	
	
	
	
	public String index()
	{
		this.todosExames = exameDao.getAllExames();
		return "INDEX";
		
	}
	
	

	public String insertExame()
	{
		this.todosExames = exameDao.getAllExames();
		this.resultado = "danger";
		if (exameDao.insert(paciente, medico, tipoExame, observacao)) {
			this.resultado = "success";
			return "INSERT";
		}
		return "ERROR";
	}

	
	


	public List<Exame> getTodosExames() {
		return todosExames;
	}



	public void setTodosExames(List<Exame> todosExames) {
		this.todosExames = todosExames;
	}



	public String getResultado() {
		return resultado;
	}



	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	
	
	
	
}
