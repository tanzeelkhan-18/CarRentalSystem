package com.carRentalSystem.dao;

import java.sql.SQLException;
import java.util.List;

import com.carRentalSystem.model.Customer;

public interface CustomerDao {

	public void saveOrUpdate(Customer cst) throws SQLException;

	public void deleteCst(Customer cst) throws SQLException;

	public Customer getCstById(int id) throws SQLException;

	public Customer getCstByName(String name) throws SQLException;

	public List<Customer> getAllCsts() throws SQLException;

	public Customer authenticate(String userName, String password) throws SQLException;
}
