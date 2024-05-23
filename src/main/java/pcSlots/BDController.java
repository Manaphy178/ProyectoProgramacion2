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

	public ArrayList<Case> allCases() {
		ArrayList<Case> cases = new ArrayList<>();
		String sql = "SELECT * FROM cases";
		Statement mySt;
		try {
			mySt = con.createStatement();
			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				cases.add(new Case(rs.getInt("idCase"), rs.getInt("idProduct"), rs.getFloat("value"),
						rs.getString("type"), rs.getString("description"), rs.getString("name")));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cases;
	}

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
	public int giveLastProCod() {
		int cod=0;
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
		return cod+1;
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
}
