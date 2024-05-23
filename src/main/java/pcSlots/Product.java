package pcSlots;

public class Product {
	private int idProduct;
	private float value;
	private String brand;
	private String type;
	private String description;
	private String name;
	private String caract;

	public Product() {
		super();
	}

	public Product(int idProduct, float value, String brand, String type, String description, String name,
			String caract) {
		super();
		this.idProduct = idProduct;
		this.value = value;
		this.brand = brand;
		this.type = type;
		this.description = description;
		this.name = name;
		this.caract = caract;
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

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

	public String getCaract() {
		return caract;
	}

	public void setCaract(String caract) {
		this.caract = caract;
	}

}
