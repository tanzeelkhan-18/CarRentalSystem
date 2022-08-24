package com.carRentalSystem.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carRentalSystem.dao.BookingDao;
import com.carRentalSystem.model.Booking;

@Service
public class BookingServicesImpl implements BookingServices {

	@Autowired
	private BookingDao bookingDao;

	@Override
	public void saveBooking(Booking booking) throws SQLException {
		bookingDao.saveOrUpdate(booking);
	}

	@Override
	public void updateBooking(Booking booking) throws SQLException {
		bookingDao.saveOrUpdate(booking);
	}

	@Override
	public void deleteBooking(int id) throws SQLException {
		Booking booking = bookingDao.getBookingById(id);
		bookingDao.deleteBooking(booking);
	}

	@Override
	public Booking getBookingbyId(int id) throws SQLException {
		Booking booking = bookingDao.getBookingById(id);
		return booking;
	}

	@Override
	public List<Booking> listBooking() throws SQLException {
		List<Booking> cars = bookingDao.showAllbookings();
		return cars;
	}

	@Override
	public Booking getBookingbyCId(int id) throws SQLException {
		Booking booking = bookingDao.getBookingByCId(id);
		return booking;
	}

	@Override
	public void deleteBookingbyCId(int id) throws SQLException {
		bookingDao.deleteBookingbyCId(id);
	}
}
