package com.carRentalSystem.services;

import java.sql.SQLException;
import java.util.List;

import com.carRentalSystem.model.Booking;

public interface BookingServices {

	public void saveBooking(Booking booking) throws SQLException;

	public void updateBooking(Booking booking) throws SQLException;

	public void deleteBooking(int id) throws SQLException;

	public void deleteBookingbyCId(int id) throws SQLException;

	public Booking getBookingbyId(int id) throws SQLException;

	public List<Booking> listBooking() throws SQLException;

	public Booking getBookingbyCId(int id) throws SQLException;
}
