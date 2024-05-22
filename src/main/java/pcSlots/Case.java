package pcSlots;

public class Case {
	private int idCase;
	private int idProduct;
	private float value;
	private String type;
	private String description;
	private String name;

	public Case(int idCase, int idProduct, float value, String type, String description, String name) {
		super();
		this.idCase = idCase;
		this.idProduct = idProduct;
		this.value = value;
		this.type = type;
		this.description = description;
		this.name = name;
	}

	public Case() {
		super();
	}

	public int getIdCase() {
		return idCase;
	}

	public void setIdCase(int idCase) {
		this.idCase = idCase;
	}

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public float getValue() {
		return value;
	}

	public void setValue(float value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
