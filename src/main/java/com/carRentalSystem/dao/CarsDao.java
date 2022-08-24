package com.carRentalSystem.dao;

import java.sql.SQLException;
import java.util.List;

import com.carRentalSystem.model.Cars;

public interface CarsDao {

	public void saveOrUpdate(Cars car) throws SQLException;

	public void deleteCar(Cars car) throws SQLException;

	public Cars getCarById(int id) throws SQLException;

	public Cars getCarByName(String name) throws SQLException;

	public List<Cars> getAllCars() throws SQLException;

}
