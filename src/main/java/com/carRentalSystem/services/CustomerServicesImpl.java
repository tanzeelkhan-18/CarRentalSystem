package com.carRentalSystem.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carRentalSystem.dao.CustomerDao;
import com.carRentalSystem.model.Customer;

@Service
public class CustomerServicesImpl implements CustomerServices {

	@Autowired
	private CustomerDao customerDao;

	@Override
	public void saveCustomer(Customer cst) throws SQLException {
		customerDao.saveOrUpdate(cst);
	}

	@Override
	public void updateCustomer(Customer cst) throws SQLException {
		customerDao.saveOrUpdate(cst);
	}

	@Override
	public void deleteCustomer(int id) throws SQLException {
		Customer customer = customerDao.getCstById(id);
		customerDao.deleteCst(customer);
	}

	@Override
	public Customer getCustomerbyId(int id) throws SQLException {
		Customer customer = customerDao.getCstById(id);
		return customer;
	}

	@Override
	public List<Customer> listCustomers() throws SQLException {
		List<Customer> customers = customerDao.getAllCsts();
		return customers;
	}

	@Override
	public Customer authenticate(String userName, String password) throws SQLException {
		Customer cst = customerDao.authenticate(userName, password);
		return cst;
	}
}
