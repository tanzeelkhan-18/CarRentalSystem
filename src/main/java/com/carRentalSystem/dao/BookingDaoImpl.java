package com.carRentalSystem.dao;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carRentalSystem.model.Booking;

@Repository
public class BookingDaoImpl implements BookingDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void saveOrUpdate(Booking bk) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(bk);
	}

	@Override
	@Transactional
	public void deleteBooking(Booking bk) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.delete(bk);
	}

	@Override
	@Transactional
	public Booking getBookingById(int id) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Booking booking = session.get(Booking.class, id);
		return booking;
	}

	@Override
	@Transactional
	public List<Booking> showAllbookings() throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Booking", Booking.class);
		try {
			List<Booking> bookings = query.getResultList();
			return bookings;
		} catch (PersistenceException e) {
			try {
				return null;
			} catch (HibernateException ee) {
				return null;
			}
		}

	}

	@Override
	@Transactional
	public Booking getBookingByCId(int id) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Booking where customer_id=:customer_id", Booking.class);
		query.setParameter("customer_id", id);
		try {
			Booking booking = (Booking)query.getSingleResult();
			return booking;
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	@Transactional
	public void deleteBookingbyCId(int id) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Booking where customer_id=:customer_id", Booking.class);
		query.setParameter("customer_id", id);
		Booking booking = (Booking)query.getSingleResult();
		session.delete(booking);
	}

}
