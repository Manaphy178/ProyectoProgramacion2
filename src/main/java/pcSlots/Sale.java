package pcSlots;

public class Sale {
	private int idSales;
	private String saleDate;
	private double total;
	private int idClient;

	public Sale() {
		super();
	}

	public Sale(int idSales, String saleDate, double total, int idClient) {
		super();
		this.idSales = idSales;
		this.saleDate = saleDate;
		this.total = total;
		this.idClient = idClient;
	}

	public int getIdSales() {
		return idSales;
	}

	public void setIdSales(int idSales) {
		this.idSales = idSales;
	}

	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getIdClient() {
		return idClient;
	}

	public void setIdClient(int idClient) {
		this.idClient = idClient;
	}
}
