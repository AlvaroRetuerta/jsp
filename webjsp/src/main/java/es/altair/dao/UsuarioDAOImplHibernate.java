package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Usuario;
import es.altair.bean.Vehiculo;
import es.altair.util.SessionProvider;

public class UsuarioDAOImplHibernate implements UsuarioDAO {

	private String pass = "Altair123$%";
	
	public boolean validarEmail(Usuario usu) {
		boolean correcto = true;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			if ((Usuario) sesion.createQuery("From Usuario Where email=:e")
					.setParameter("e", usu.getEmail())
					.uniqueResult() != null)
				correcto = false;

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return correcto;
	}

	public int insertar(Usuario usu) {
		int filas = 0;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			filas = sesion
					.createSQLQuery("INSERT INTO users (nombre, apellidos, username, password, email, tipo)"
							+ "values (:n, :a, :u, AES_ENCRYPT(:p, :passphrase), :e, :t)")
					.setParameter("u", usu.getUsername()).setParameter("p", usu.getPassword()).setParameter("passphrase", pass).setParameter("a", usu.getApellidos())
					.setParameter("n", usu.getNombre()).setParameter("e", usu.getEmail()).setParameter("t", usu.getTipo()).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		return filas;
	}
	
	public Usuario comprobarUsuario(String login, String password) {
		Usuario usu = null;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();
			usu = (Usuario) sesion
					.createQuery(
							"SELECT u FROM Usuario u WHERE username=:u " + "AND password=AES_ENCRYPT(:p, :passphrase)")
					.setParameter("u", login).setParameter("p", password).setParameter("passphrase", pass)
					.uniqueResult();
			sesion.getTransaction().commit();
		} catch (Exception e) {
				
		} finally {
			sesion.close();
			
		}

		return usu;
	}

	public List<Usuario> listarTodos() {
		List<Usuario> lista = new ArrayList<Usuario>();
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			
			lista = sesion.createQuery("FROM Usuario u").list();
				

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return lista;
	}

	public void actualizar(Usuario u) {
		
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			
			sesion.update(u);
				

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public Usuario obtener(int id) {
		
		Usuario u = null;
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			u = (Usuario) sesion.createQuery("SELECT u FROM Usuario u WHERE id=:id ").setParameter("id", id)
					.uniqueResult();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return u;

	}

	
	
}
