package pcSlots;

import java.sql.*;
import java.util.*;

public class BDController {
	private Connection con;

	public BDController() {
		super();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Error de mierda");
			e.printStackTrace();
		}
		try {
			this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcslots", "root", "");
		} catch (SQLException e) {
			System.out.println("Error en el constructor del BDControler");
			e.printStackTrace();
		}
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public ArrayList<Client> allClient() {
		ArrayList<Client> clients = new ArrayList<>();
		String sql = "SELECT * FROM client";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				clients.add(new Client(rs.getInt("idClient"), rs.getString("dni"), rs.getString("username"),
						rs.getString("name"), rs.getString("lastname"), rs.getString("province"), rs.getInt("cp"),
						rs.getString("address")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clients;
	}

	public Client giveClient(int id) {
		Client c = null;
		String sql = "SELECT * FROM client WHERE idClient = ?";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, id);

			try (ResultSet rs = mySt.executeQuery()) {
				if (rs.next()) {
					c = new Client(rs.getInt("idClient"), rs.getString("dni"), rs.getString("username"),
							rs.getString("name"), rs.getString("lastname"), rs.getString("province"), rs.getInt("cp"),
							rs.getString("address"));
				}
			}
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	public void insertClient(int idClient, String dni, String user, String name, String last, String province, int cp,
			String address) {
		String sql = "INSERT INTO client (idClient,dni, username, name, lastname, province, cp,address) VALUES (?,?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, idClient);
			mySt.setString(2, dni);
			mySt.setString(3, user);
			mySt.setString(4, name);
			mySt.setString(5, last);
			mySt.setString(6, province);
			mySt.setInt(7, cp);
			mySt.setString(8, address);
			mySt.executeUpdate();
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int giveLastClientCod() {
		int cod = 0;
		String sql = "Select idClient from client order by idClient DESC limit 1";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cod = rs.getInt("idClient");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cod + 1;
	}

//	public ArrayList<Case> allCases() {
//		ArrayList<Case> cases = new ArrayList<>();
//		String sql = "SELECT * FROM cases";
//		Statement mySt;
//		try {
//			mySt = con.createStatement();
//			ResultSet rs = mySt.executeQuery(sql);
//			while (rs.next()) {
//				cases.add(new Case(rs.getInt("idCase"), rs.getInt("idProduct"), rs.getFloat("value"),
//						rs.getString("type"), rs.getString("description"), rs.getString("name")));
//			}
//			rs.close();
//			mySt.close();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return cases;
//	}

	public ArrayList<Product> allProduct() {
		ArrayList<Product> products = new ArrayList<>();
		String sql = "SELECT * FROM products";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				products.add(new Product(rs.getInt("idProduct"), rs.getFloat("value"), rs.getString("brand"),
						rs.getString("type"), rs.getString("description"), rs.getString("name"),
						rs.getString("caract")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public Product giveProductCod(int codP) {
		Product p = null;
		String sql = "SELECT * FROM products WHERE idProduct = ?";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, codP);

			try (ResultSet rs = mySt.executeQuery()) {
				if (rs.next()) {
					p = new Product(rs.getInt("idProduct"), rs.getFloat("value"), rs.getString("brand"),
							rs.getString("type"), rs.getString("description"), rs.getString("name"),
							rs.getString("caract"));
				}
			}
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	public Product giveProductName(String name) {
		Product p = null;
		String sql = "SELECT * FROM products WHERE name LIKE ?";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setString(1, name);

			try (ResultSet rs = mySt.executeQuery()) {
				if (rs.next()) {
					p = new Product(rs.getInt("idProduct"), rs.getFloat("value"), rs.getString("brand"),
							rs.getString("type"), rs.getString("description"), rs.getString("name"),
							rs.getString("caract"));
				}
			}
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	public void insertProduct(int codP, float value, String brand, String type, String description, String name,
			String caract) {

		String sql = "INSERT INTO products (idProduct,value, brand, type, description, name, caract) VALUES (?,?, ?, ?, ?, ?, ?)";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, codP);
			mySt.setFloat(2, value);
			mySt.setString(3, brand);
			mySt.setString(4, type);
			mySt.setString(5, description);
			mySt.setString(6, name);
			mySt.setString(7, caract);
			mySt.executeUpdate();
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateProduct(int codP, float value, String brand, String type, String description, String name,
			String caract) {
		String sql = "UPDATE products SET value = ?, brand = ?, type = ?, description = ?, name = ?, caract = ? WHERE idProduct = ?";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setFloat(1, value);
			mySt.setString(2, brand);
			mySt.setString(3, type);
			mySt.setString(4, description);
			mySt.setString(5, name);
			mySt.setString(6, caract);
			mySt.setInt(7, codP);
			mySt.executeUpdate();
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int giveLastProCod() {
		int cod = 0;
		String sql = "Select idProduct from products order by idProduct DESC limit 1";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cod = rs.getInt("idProduct");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cod + 1;
	}

	public void deleteProduct(String name, int codP) {
		String sql = "";
		if (codP != 0) {
			sql = "DELETE FROM products WHERE idProduct = " + codP;
		} else {
			codP = giveProductID(name);
			sql = "DELETE FROM products WHERE idProduct = " + codP;
		}
		try (PreparedStatement mySt = con.prepareStatement(sql)) {

			mySt.executeUpdate(sql);
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int giveProductID(String name) {
		int cod = 0;
		String sql = "SELECT idProduct from products where `name` LIKE '" + name + "'";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cod = rs.getInt("idProduct");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cod;
	}

	public boolean productExistsNum(int codP) {
		for (Product p : allProduct()) {
			if (p.getIdProduct() == codP) {
				return true;
			}
		}
		return false;
	}

	public boolean productExistsName(String name) {
		for (Product p : allProduct()) {
			if (p.getName().equalsIgnoreCase(name)) {
				return true;
			}
		}
		return false;
	}

	public ArrayList<Product> allCart() {
		ArrayList<Product> cart = new ArrayList<>();
		String sql = "SELECT * FROM cart";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cart.add(new Product(rs.getInt("idProduct"), rs.getFloat("value"), rs.getString("brand"),
						rs.getString("type"), rs.getString("description"), rs.getString("name"),
						rs.getString("caract")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cart;
	}

	public void insertCart(int codP) {
		Product p = giveProductCod(codP);
		if (p == null) {
			System.out.println("Product not found: " + codP);
			return;
		}
		String sql = "INSERT INTO cart (idProduct, value, brand, type, description, name, caract) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, p.getIdProduct());
			mySt.setFloat(2, p.getValue());
			mySt.setString(3, p.getBrand());
			mySt.setString(4, p.getType());
			mySt.setString(5, p.getDescription());
			mySt.setString(6, p.getName());
			mySt.setString(7, p.getCaract());

			mySt.executeUpdate();
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Sale> allSales() {
		ArrayList<Sale> sales = new ArrayList<>();
		String sql = "SELECT * FROM sale";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				String fecha = rs.getDate("saleDate").toString();
				sales.add(new Sale(rs.getInt("idSales"), fecha, rs.getDouble("total"), rs.getInt("idClient")));
			}

			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sales;
	}

	public int giveClientSale(int clientID) {
		int saleCod = 0;
		String sql = "Select idSales from sale where idClient = ?";
		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, clientID);

			try (ResultSet rs = mySt.executeQuery()) {
				if (rs.next()) {
					saleCod = rs.getInt("idSales");
				}
			}
			mySt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return saleCod;

	}
	public ArrayList<Sale> saleClient(int idClient){
		ArrayList<Sale> sales = new ArrayList<Sale>();
		String sql = "select * from sale where idClient = "+idClient;
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				String fecha = rs.getDate("saleDate").toString();
				sales.add(new Sale(rs.getInt("idSales"), fecha, rs.getDouble("total"), rs.getInt("idClient")));
			}

			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sales;
	}

//	public void insertSale() {
//		String sql = "INSERT INTO cart (idProduct, value, brand, type, description, name, caract) VALUES (?, ?, ?, ?, ?, ?, ?)";
//		try (PreparedStatement mySt = con.prepareStatement(sql)) {
//			mySt.setInt(1, p.getIdProduct());
//			mySt.setFloat(2, p.getValue());
//			mySt.setString(3, p.getBrand());
//			mySt.setString(4, p.getType());
//			mySt.setString(5, p.getDescription());
//			mySt.setString(6, p.getName());
//			mySt.setString(7, p.getCaract());
//
//			mySt.executeUpdate();
//			mySt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

	public ArrayList<SaleLine> allSaleLine() {
		ArrayList<SaleLine> lines = new ArrayList<>();
		String sql = "SELECT * FROM sales_line";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				lines.add(new SaleLine(rs.getInt("idLines"), rs.getInt("idSales"), rs.getInt("product"),
						rs.getInt("units"), rs.getFloat("unit_price")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lines;
	}

	public ArrayList<SaleLine> saleLineClient(int cliente) {
		ArrayList<SaleLine> lines = new ArrayList<>();

		String sql = "SELECT * FROM sales_line WHERE idSales IN (SELECT idSales FROM sale WHERE idClient = " + cliente
				+ ")";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				lines.add(new SaleLine(rs.getInt("idLines"), rs.getInt("idSales"), rs.getInt("product"),
						rs.getInt("units"), rs.getFloat("unit_price")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lines;
	}
	public ArrayList<SaleLine> saleLineSale(int idSale) {
		ArrayList<SaleLine> lines = new ArrayList<>();

		String sql = "SELECT * FROM sales_line WHERE idSales  = " + idSale;
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				lines.add(new SaleLine(rs.getInt("idLines"), rs.getInt("idSales"), rs.getInt("product"),
						rs.getInt("units"), rs.getFloat("unit_price")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lines;
	}
	public ArrayList<SaleLine> saleLineProduct(int product) {
		ArrayList<SaleLine> lines = new ArrayList<>();

		String sql = "SELECT * FROM sales_line WHERE product IN (SELECT idProduct FROM products WHERE idProduct = "
				+ product + ")";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				lines.add(new SaleLine(rs.getInt("idLines"), rs.getInt("idSales"), rs.getInt("product"),
						rs.getInt("units"), rs.getFloat("unit_price")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lines;
	}

	public int contarUnidadesConcretas(int idProducto) {
		int cont = 0;
		String sql = "SELECT COUNT(idProduct) AS 'Unidades' from cart where idProduct = " + idProducto;
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cont = rs.getInt("Unidades");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cont;
	}

	public int contarUnidades() {
		int cont = 0;
		String sql = "SELECT COUNT(idProduct) AS 'Unidades' from cart";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cont = rs.getInt("Unidades");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cont;
	}

	public int precioTotal() {
		int cont = 0;
		String sql = "SELECT (COUNT(idProduct)*`value`) AS 'Total' from cart GROUP BY idProduct;";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cont += rs.getInt("Total");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cont;
	}

	public int giveLastSaleCod() {
		int cod = 0;
		String sql = "Select idSales from sale order by idSales DESC limit 1";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cod = rs.getInt("idSales");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cod + 1;
	}

	public void insertSale(int codS, float total, int idClient) {
		String sql = "INSERT INTO sale (idSales, saleDate, total, idClient) VALUES (?, CURRENT_DATE, ?, ?)";

		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, codS);
			mySt.setFloat(2, total);
			mySt.setInt(3, idClient);

			mySt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int giveLastSaleLCod() {
		int cod = 0;
		String sql = "Select idLines from sales_line order by idLines DESC limit 1";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cod = rs.getInt("idLines");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cod + 1;
	}

	public void insertSaleLine(int codL, int codS, int product, int units, float unitPrice) {
		String sql = "INSERT INTO sales_line (idLines, idSales, product, units, unit_price) VALUES (?, ?, ?, ?, ?)";

		try (PreparedStatement mySt = con.prepareStatement(sql)) {
			mySt.setInt(1, codL);
			mySt.setInt(2, codS);
			mySt.setInt(3, product);
			mySt.setInt(4, units);
			mySt.setFloat(5, unitPrice);

			mySt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void borrarCarro() {
		String sql = "Delete from cart";
		Statement mySt;
		try {
			mySt = con.createStatement();
			mySt.executeUpdate(sql);
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int unitsSale(int idSale) {
		int num=0;
		String sql = "SELECT SUM(units) as 'Unidades' FROM sales_line WHERE idSales = "+idSale;
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				num = rs.getInt("Unidades");
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

}
