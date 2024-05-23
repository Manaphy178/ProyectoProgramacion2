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

	public Product giveProduct(int cod) {
		Product p = new Product();
		String sql = "SELECT * FROM products WHERE idProduct = " + cod;
		Statement mySt;
		try {
			mySt = con.createStatement();

			ResultSet rs = mySt.executeQuery(sql);
			while (rs.next()) {
				p = new Product(rs.getInt("idProduct"), rs.getFloat("value"), rs.getString("brand"),
						rs.getString("type"), rs.getString("description"), rs.getString("name"),
						rs.getString("caract"));
			}
			rs.close();
			mySt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
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
