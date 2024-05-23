package pcSlots;

import java.util.*;
public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BDController bd = new BDController();
		ArrayList<Product> p = bd.allProduct();
		for (Product pa : p) {
			System.out.println(pa.getName());
		}
	}

}
