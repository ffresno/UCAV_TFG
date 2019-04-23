package tfg.ucav.model.usuarios;

import tfg.ucav.model.usuarios.User;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Model class of ROLE.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Role implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** ID_ROLE. */
	private Integer idRole;

	/** DESCRIPTION. */
	private String description;

	/** The set of USER. */
	private Set<User> userSet;

	/**
	 * Constructor.
	 */
	public Role() {
		this.userSet = new HashSet<User>();
	}

    public Role(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

	/**
	 * Set the ID_ROLE.
	 * 
	 * @param idRole
	 *            ID_ROLE
	 */
	public void setIdRole(Integer idRole) {
		this.idRole = idRole;
	}

	/**
	 * Get the ID_ROLE.
	 * 
	 * @return ID_ROLE
	 */
	public Integer getIdRole() {
		return this.idRole;
	}

	/**
	 * Set the DESCRIPTION.
	 * 
	 * @param description
	 *            DESCRIPTION
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Get the DESCRIPTION.
	 * 
	 * @return DESCRIPTION
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * Set the set of the USER.
	 * 
	 * @param userSet
	 *            The set of USER
	 */
	public void setUserSet(Set<User> userSet) {
		this.userSet = userSet;
	}

	/**
	 * Add the USER.
	 * 
	 * @param user
	 *            USER
	 */
	public void addUser(User user) {
		this.userSet.add(user);
	}

	/**
	 * Get the set of the USER.
	 * 
	 * @return The set of USER
	 */
	public Set<User> getUserSet() {
		return this.userSet;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idRole == null) ? 0 : idRole.hashCode());
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
		Role other = (Role) obj;
		if (idRole == null) {
			if (other.idRole != null) {
				return false;
			}
		} else if (!idRole.equals(other.idRole)) {
			return false;
		}
		return true;
	}

}