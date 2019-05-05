package tfg.ucav.model.configuracion.cursos;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Model class of CURSO.
 * 
 * @author fernandofresno
 * @version $Id$
 */
public class Curso2 implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** ID_CURSO. */
	private Integer idCurso;

	/** NOMBRE. */
	private String nombre;


	/**
	 * Constructor.
	 */
	public Curso2() {
		
	}

	/**
	 * Set the ID_CURSO.
	 * 
	 * @param idCurso
	 *            ID_CURSO
	 */
	public void setIdCurso(Integer idCurso) {
		this.idCurso = idCurso;
	}

	/**
	 * Get the ID_CURSO.
	 * 
	 * @return ID_CURSO
	 */
	public Integer getIdCurso() {
		return this.idCurso;
	}

	/**
	 * Set the NOMBRE.
	 * 
	 * @param nombre
	 *            NOMBRE
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Get the NOMBRE.
	 * 
	 * @return NOMBRE
	 */
	public String getNombre() {
		return this.nombre;
	}


	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idCurso == null) ? 0 : idCurso.hashCode());
		return result;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Curso2 other = (Curso2) obj;
		if (idCurso == null) {
			if (other.idCurso != null) {
				return false;
			}
		} else if (!idCurso.equals(other.idCurso)) {
			return false;
		}
		return true;
	}

}
