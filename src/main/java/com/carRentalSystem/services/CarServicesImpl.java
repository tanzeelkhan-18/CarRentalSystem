package com.carRentalSystem.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carRentalSystem.dao.CarsDao;
import com.carRentalSystem.model.Cars;

@Service
public class CarServicesImpl implements CarServices {

	@Autowired
	private CarsDao carsDao;

	@Override
	public void saveCar(Cars car) throws SQLException {
		carsDao.saveOrUpdate(car);
	}

	@Override
	public void updateCar(Cars cst) throws SQLException {
		carsDao.saveOrUpdate(cst);
	}

	@Override
	public void deleteCar(int id) throws SQLException {
		Cars car = carsDao.getCarById(id);
		carsDao.deleteCar(car);
	}

	@Override
	public Cars getCarbyId(int id) throws SQLException {
		Cars car = carsDao.getCarById(id);
		return car;
	}

	@Override
	public List<Cars> listCars() throws SQLException {
		List<Cars> cars = carsDao.getAllCars();
		return cars;
	}
}
