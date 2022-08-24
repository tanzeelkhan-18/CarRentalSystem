package com.carRentalSystem.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carRentalSystem.model.Booking;
import com.carRentalSystem.model.Cars;
import com.carRentalSystem.model.Customer;
import com.carRentalSystem.services.BookingServices;
import com.carRentalSystem.services.CarServices;
import com.carRentalSystem.services.CustomerServices;

@Controller
@RequestMapping("customer")
public class CustomerController {

	@Autowired
	private CustomerServices customerServices;

	@Autowired
	private CarServices carServices;

	@Autowired
	private BookingServices bookingServices;

	@GetMapping("loginPage")
	public String loginPage() {
		return "login";
	}

	@PostMapping("authenticate")
	public String authenticateUser(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String userName, @RequestParam String password) throws IOException, ServletException {
		response.setContentType("text/html");
		try {
			Customer cst = customerServices.authenticate(userName, password);
			if (cst != null) {
				HttpSession session = request.getSession();
				session.setAttribute("name", cst.getName());
				session.setAttribute("id", cst.getId());
				List<Cars> cars = carServices.listCars();
				Booking booking = bookingServices.getBookingbyCId(cst.getId());
				session.setAttribute("car", cars);
				if (booking != null) {
					session.setAttribute("car_id", booking.getCar().getId());
					session.setAttribute("bookedCar", booking.getCar().getName());
				}
				return "customer-ui";
			} else {
				String check = "Please Check Username or Password";
				request.setAttribute("loginError", check);
				return "login";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "login";
		}
	}

	@GetMapping("customerUi")
	public String customerUi(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		HttpSession session = request.getSession(false);
		int CId = (Integer) session.getAttribute("id");
		Customer cst = customerServices.getCustomerbyId(CId);
		session.setAttribute("name", cst.getName());
		session.setAttribute("id", cst.getId());
		List<Cars> cars = carServices.listCars();
		Booking booking = bookingServices.getBookingbyCId(cst.getId());
		session.setAttribute("car", cars);
		if (booking != null) {
			session.setAttribute("car_id", booking.getCar().getId());
			session.setAttribute("bookedCar", booking.getCar().getName());
		}
		return "customer-ui";
	}

	@GetMapping("logout")
	public void logoutUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		session.invalidate();
		response.sendRedirect("/CarRentalSystem/index.jsp");
	}

	@GetMapping("adminLoginPage")
	public String adminLoginPage() {
		return "admin-login";
	}

	@PostMapping("authenticateAdmin")
	public String authenticateAdmin(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String userName, @RequestParam String password) throws IOException, ServletException {
		response.setContentType("text/html");
		if (userName.equalsIgnoreCase("admin") && password.equalsIgnoreCase("123")) {
			HttpSession session = request.getSession();
			session.setAttribute("adminName", "Admin");
			return "admin-ui";
		} else {
			String check = "Please Enter Correct Admin Username or Password";
			request.setAttribute("loginError", check);
			return "admin-login";
		}
	}

	@GetMapping("adminUi")
	public String adminUi(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		return "admin-ui";
	}

	@GetMapping("adminLogout")
	public void logoutAdmin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		session.invalidate();
		response.sendRedirect("/CarRentalSystem/index.jsp");
	}

	@GetMapping("callIndex")
	public void callIndex(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/CarRentalSystem/index.jsp");
	}

	@GetMapping("list")
	public String showCustomerList(Model model) throws SQLException {
		List<Customer> customers = customerServices.listCustomers();
		model.addAttribute("cust", customers);
		return "list-customer";
	}

	@GetMapping("add-customer")
	public String showAddCustomer() throws SQLException {
		return "add-customer";
	}

	@PostMapping("addCustomer")
	public String addCustomer(Model model, @RequestParam String name, @RequestParam String contact,
			@RequestParam String address, @RequestParam String username, @RequestParam String password)
			throws SQLException {
		Customer tempCus = new Customer();
		tempCus.setName(name);
		tempCus.setContact(contact);
		tempCus.setAddress(address);
		tempCus.setUsername(username);
		tempCus.setPassword(password);
		customerServices.saveCustomer(tempCus);
		List<Customer> customers = customerServices.listCustomers();
		model.addAttribute("cust", customers);
		return "list-customer";
	}

	@PostMapping("register")
	public String register(Model model, @RequestParam String name, @RequestParam String contact,
			@RequestParam String address, @RequestParam String username, @RequestParam String password)
			throws SQLException {
		Customer tempCus = new Customer();
		tempCus.setName(name);
		tempCus.setContact(contact);
		tempCus.setAddress(address);
		tempCus.setUsername(username);
		tempCus.setPassword(password);
		customerServices.saveCustomer(tempCus);
		return "registration-success";
	}

	@GetMapping("deleteCustomer")
	public String deleteCustomer(Model model, @RequestParam String id) throws SQLException {
		int tempId = Integer.parseInt(id);
		customerServices.deleteCustomer(tempId);
		List<Customer> customers = customerServices.listCustomers();
		model.addAttribute("cust", customers);
		return "list-customer";
	}

	@GetMapping("editCustomer")
	public String editCustomer(Model model, @RequestParam String id) throws SQLException {
		int tempId = Integer.parseInt(id);
		Customer customer = customerServices.getCustomerbyId(tempId);
		model.addAttribute("cust", customer);
		return "edit-customer";
	}

	@PostMapping("updateCustomer")
	public String updateCustomer(Model model, @RequestParam String id, @RequestParam String name,
			@RequestParam String contact, @RequestParam String address, @RequestParam String username,
			@RequestParam String password) throws SQLException {
		int tempId = Integer.parseInt(id);
		Customer customer = new Customer();
		customer.setId(tempId);
		customer.setName(name);
		customer.setContact(contact);
		customer.setAddress(address);
		customer.setUsername(username);
		customer.setPassword(password);
		customerServices.updateCustomer(customer);
		List<Customer> customers = customerServices.listCustomers();
		model.addAttribute("cust", customers);
		return "list-customer";
	}
}
