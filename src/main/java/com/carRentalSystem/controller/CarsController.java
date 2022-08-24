package com.carRentalSystem.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carRentalSystem.model.Cars;
import com.carRentalSystem.services.CarServices;

@Controller
@RequestMapping("cars")
public class CarsController {

	@Autowired
	private CarServices carServices;

	@GetMapping("list")
	public String showCarsList(Model model) throws SQLException {
		List<Cars> cars = carServices.listCars();
		model.addAttribute("car", cars);
		return "list-car";
	}

	@GetMapping("add-car")
	public String showAddCars() throws SQLException {
		return "add-car";
	}

	@PostMapping("addCar")
	public String addCars(Model model, @RequestParam String name, @RequestParam String category,
			@RequestParam String rentCharge, @RequestParam String status) throws SQLException {
		Cars car = new Cars();
		car.setName(name);
		car.setCategory(category);
		car.setRentCharge(rentCharge);
		car.setStatus(status);
		carServices.saveCar(car);
		List<Cars> cars = carServices.listCars();
		model.addAttribute("car", cars);
		return "list-car";
	}

	@GetMapping("deleteCar")
	public String deleteCars(Model model, @RequestParam String id) throws SQLException {
		int tempId = Integer.parseInt(id);
		carServices.deleteCar(tempId);
		List<Cars> cars = carServices.listCars();
		model.addAttribute("car", cars);
		return "list-car";
	}

	@GetMapping("editCar")
	public String editCars(Model model, @RequestParam String id) throws SQLException {
		int tempId = Integer.parseInt(id);
		Cars cars = carServices.getCarbyId(tempId);
		model.addAttribute("car", cars);
		return "edit-car";
	}

	@PostMapping("updateCar")
	public String updateCars(Model model, @RequestParam String id, @RequestParam String name,
			@RequestParam String category, @RequestParam String rentCharge, @RequestParam String status)
			throws SQLException {
		int tempId = Integer.parseInt(id);
		Cars car = new Cars();
		car.setId(tempId);
		car.setName(name);
		car.setCategory(category);
		car.setRentCharge(rentCharge);
		car.setStatus(status);
		carServices.updateCar(car);
		List<Cars> cars = carServices.listCars();
		model.addAttribute("car", cars);
		return "list-car";
	}
}
