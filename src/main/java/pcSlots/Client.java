package pcSlots;

public class Client {
	private int idCliente;
	private String username;
	private String password;
	private String name;
	private String lastName;
	private int cp;
	private String address;

	public Client() {
		super();
	}

	

	public Client(int idCliente, String username, String password, String name, String lastName, int cp,
			String address) {
		super();
		this.idCliente = idCliente;
		this.username = username;
		this.password = password;
		this.name = name;
		this.lastName = lastName;
		this.cp = cp;
		this.address = address;
	}



	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}


	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
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
