package com.carRentalSystem.dao;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carRentalSystem.model.Cars;

@Repository
public class CarsDaoImpl implements CarsDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void saveOrUpdate(Cars car) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(car);
	}

	@Override
	@Transactional
	public void deleteCar(Cars car) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.delete(car);
	}

	@Override
	@Transactional
	public Cars getCarById(int id) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Cars car = session.get(Cars.class, id);
		return car;
	}

	@Override
	@Transactional
	public Cars getCarByName(String name) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Car C WHERE C.name = :car_name";
		Query query = session.createQuery(hql, Cars.class);
		query.setParameter("car_name", name);
		Cars car = (Cars) query.getSingleResult();
		return car;
	}

	@Override
	@Transactional
	public List<Cars> getAllCars() throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cars", Cars.class);
		List<Cars> cars = query.getResultList();
		return cars;
	}

}
