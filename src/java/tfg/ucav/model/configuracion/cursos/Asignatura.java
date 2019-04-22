
package tfg.ucav.model.configuracion.cursos;
import java.io.Serializable;

/**
 * Model class of ASIGNATURA.
 * 
 * @author fernandofresno
 * @version $Id$
 */
public class Asignatura implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** ID_ASIGNATURA. */
	private Integer idAsignatura;

	/** DESCRIPCION. */
	private String descripcion;

	/** CURSO. */
	private Curso curso;

	/**
	 * Constructor.
	 */
	public Asignatura() {
	}

	/**
	 * Set the ID_ASIGNATURA.
	 * 
	 * @param idAsignatura
	 *            ID_ASIGNATURA
	 */
	public void setIdAsignatura(Integer idAsignatura) {
		this.idAsignatura = idAsignatura;
	}

	/**
	 * Get the ID_ASIGNATURA.
	 * 
	 * @return ID_ASIGNATURA
	 */
	public Integer getIdAsignatura() {
		return this.idAsignatura;
	}

	/**
	 * Set the DESCRIPCION.
	 * 
	 * @param descripcion
	 *            DESCRIPCION
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	/**
	 * Get the DESCRIPCION.
	 * 
	 * @return DESCRIPCION
	 */
	public String getDescripcion() {
		return this.descripcion;
	}

	/**
	 * Set the CURSO.
	 * 
	 * @param curso
	 *            CURSO
	 */
	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	/**
	 * Get the CURSO.
	 * 
	 * @return CURSO
	 */
	public Curso getCurso() {
		return this.curso;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idAsignatura == null) ? 0 : idAsignatura.hashCode());
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
		Asignatura other = (Asignatura) obj;
		if (idAsignatura == null) {
			if (other.idAsignatura != null) {
				return false;
			}
		} else if (!idAsignatura.equals(other.idAsignatura)) {
			return false;
		}
		return true;
	}

}
