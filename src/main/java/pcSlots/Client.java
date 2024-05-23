package pcSlots;

public class Client {
	private int idCliente;
	private String dni;
	private String username;
	private String name;
	private String lastName;
	private String province;
	private int cp;
	private String address;

	public Client() {
		super();
	}

	public Client(int idCliente, String dni, String username, String name, String lastName, String province, int cp,
			String address) {
		super();
		this.idCliente = idCliente;
		this.dni = dni;
		this.username = username;
		this.name = name;
		this.lastName = lastName;
		this.province = province;
		this.cp = cp;
		this.address = address;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
