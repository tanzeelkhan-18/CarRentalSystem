package com.carRentalSystem.controller;

import java.sql.SQLException;
import java.util.List;

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
@RequestMapping("booking")
public class BookingController {

	@Autowired
	private BookingServices bookingServices;

	@Autowired
	private CustomerServices customerServices;

	@Autowired
	private CarServices carServices;

	@GetMapping("list")
	public String showBookingList(Model model) throws SQLException {
		List<Booking> bookings = bookingServices.listBooking();
		model.addAttribute("booking", bookings);
		return "list-booking";
	}

	@GetMapping("add-booking")
	public String showAddBooking() throws SQLException {
		return "add-booking";
	}

	@PostMapping("addBooking")
	public String addBooking(Model model, @RequestParam String bookingPeriod, @RequestParam String customer_id,
			@RequestParam String car_id) throws SQLException {
		Booking booking = new Booking();
		Customer customer = customerServices.getCustomerbyId(Integer.parseInt(customer_id));
		Cars car = carServices.getCarbyId(Integer.parseInt(car_id));
		car.setStatus("Booked");
		booking.setBookingPeriod(bookingPeriod);
		booking.setCustomer(customer);
		booking.setCar(car);
		bookingServices.saveBooking(booking);
		List<Booking> bookings = bookingServices.listBooking();
		model.addAttribute("booking", bookings);
		return "list-booking";
	}

	@GetMapping("cust-booking")
	public String showCustBooking() throws SQLException {
		return "cust-booking";
	}

	@PostMapping("custBooking")
	public String custBooking(Model model, @RequestParam String bookingPeriod, @RequestParam String customer_id,
			@RequestParam String car_id) throws SQLException {
		Booking booking = new Booking();
		Customer customer = customerServices.getCustomerbyId(Integer.parseInt(customer_id));
		Cars car = carServices.getCarbyId(Integer.parseInt(car_id));
		car.setStatus("Booked");
		booking.setBookingPeriod(bookingPeriod);
		booking.setCustomer(customer);
		booking.setCar(car);
		bookingServices.saveBooking(booking);
		carServices.updateCar(car);
		List<Booking> bookings = bookingServices.listBooking();
		model.addAttribute("booking", bookings);
		return "booking-success";
	}

	@GetMapping("deleteBooking")
	public String deleteBooking(Model model, @RequestParam String id) throws SQLException {
		int tempId = Integer.parseInt(id);
		bookingServices.deleteBooking(tempId);
		List<Booking> bookings = bookingServices.listBooking();
		model.addAttribute("booking", bookings);
		return "list-booking";
	}

	@GetMapping("deleteBookingbyCst")
	public String deleteBookingbyCst(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String cust_id, @RequestParam String car_id) throws SQLException {
		HttpSession session = request.getSession(false);
		Cars car = carServices.getCarbyId(Integer.parseInt(car_id));
		car.setStatus("Available");
		carServices.updateCar(car);
		int CId = Integer.parseInt(cust_id);
		bookingServices.deleteBookingbyCId(CId);
		session.removeAttribute("car_id");
		session.removeAttribute("bookedCar");
		return "customer-ui";
	}

	@GetMapping("editBooking")
	public String editBooking(Model model, @RequestParam String id) throws SQLException {
		int tempId = Integer.parseInt(id);
		Booking booking = bookingServices.getBookingbyId(tempId);
		model.addAttribute("booking", booking);
		return "edit-booking";
	}

	@PostMapping("updateBooking")
	public String updateBooking(Model model, @RequestParam String id, @RequestParam String bookingPeriod,
			@RequestParam String customer_id, @RequestParam String car_id) throws SQLException {
		int bookingId = Integer.parseInt(id);
		int customerId = Integer.parseInt(customer_id);
		int carId = Integer.parseInt(car_id);
		Booking booking = bookingServices.getBookingbyId(bookingId);
		Customer cst = customerServices.getCustomerbyId(customerId);
		Cars car = carServices.getCarbyId(carId);
		booking.setId(bookingId);
		booking.setBookingPeriod(bookingPeriod);
		booking.setCustomer(cst);
		booking.setCar(car);
		bookingServices.saveBooking(booking);
		List<Booking> bookings = bookingServices.listBooking();
		model.addAttribute("booking", bookings);
		return "list-booking";
	}
}
