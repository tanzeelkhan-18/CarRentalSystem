package com.carRentalSystem.dao;

import java.sql.SQLException;
import java.util.List;

import com.carRentalSystem.model.Booking;

public interface BookingDao {

	public void saveOrUpdate(Booking bk) throws SQLException;

	public void deleteBooking(Booking bk) throws SQLException;

	public void deleteBookingbyCId(int id) throws SQLException;

	public Booking getBookingById(int id) throws SQLException;

	public List<Booking> showAllbookings() throws SQLException;

	public Booking getBookingByCId(int id) throws SQLException;

}
