package pcSlots;

public class SaleLine {
	private int idLine;
	private int idSale;
	private int product;
	private int units;
	private float unit_price;

	public SaleLine() {
		super();
	}

	public SaleLine(int idLine, int idSale, int product, int units, float unit_price) {
		super();
		this.idLine = idLine;
		this.idSale = idSale;
		this.product = product;
		this.units = units;
		this.unit_price = unit_price;
	}

	public int getIdLine() {
		return idLine;
	}

	public void setIdLine(int idLine) {
		this.idLine = idLine;
	}

	public int getIdSale() {
		return idSale;
	}

	public void setIdSale(int idSale) {
		this.idSale = idSale;
	}

	public int getProduct() {
		return product;
	}

	public void setProduct(int product) {
		this.product = product;
	}

	public int getUnits() {
		return units;
	}

	public void setUnits(int units) {
		this.units = units;
	}

	public float getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(float unit_price) {
		this.unit_price = unit_price;
	}
}
