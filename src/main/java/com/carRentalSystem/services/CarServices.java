package com.carRentalSystem.services;

import java.sql.SQLException;
import java.util.List;

import com.carRentalSystem.model.Cars;

public interface CarServices {

	public void saveCar(Cars car) throws SQLException;

	public void updateCar(Cars car) throws SQLException;

	public void deleteCar(int id) throws SQLException;

	public Cars getCarbyId(int id) throws SQLException;

	public List<Cars> listCars() throws SQLException;
}
