package es.altair.dao;

import java.util.List;

import es.altair.bean.Usuario;

public interface UsuarioDAO {

	boolean validarEmail(Usuario usu);

	int insertar(Usuario usu);

	Usuario comprobarUsuario(String login, String password);
	
	List<Usuario> listarTodos();
	
	void actualizar(Usuario u);
	
	Usuario obtener(int id);
}
