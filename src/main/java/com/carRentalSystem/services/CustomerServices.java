package com.carRentalSystem.services;

import java.sql.SQLException;
import java.util.List;

import com.carRentalSystem.model.Customer;

public interface CustomerServices {

	public void saveCustomer(Customer cst) throws SQLException;

	public void updateCustomer(Customer cst) throws SQLException;

	public void deleteCustomer(int id) throws SQLException;

	public Customer getCustomerbyId(int id) throws SQLException;

	public List<Customer> listCustomers() throws SQLException;

	public Customer authenticate(String userName, String password) throws SQLException;
}
