package com.carRentalSystem.dao;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carRentalSystem.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void saveOrUpdate(Customer cst) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cst);
	}

	@Override
	@Transactional
	public void deleteCst(Customer cst) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		session.delete(cst);
	}

	@Override
	@Transactional
	public Customer getCstById(int id) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Customer cst = session.get(Customer.class, id);
		return cst;
	}

	@Override
	@Transactional
	public Customer getCstByName(String name) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Customer C WHERE C.name = :customer_name";
		Query query = session.createQuery(hql, Customer.class);
		query.setParameter("customer_name", name);
		Customer cst = (Customer) query.getSingleResult();
		return cst;
	}

	@Override
	@Transactional
	public List<Customer> getAllCsts() throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Customer", Customer.class);
		List<Customer> csts = query.getResultList();
		return csts;
	}

	@Override
	@Transactional
	public Customer authenticate(String userName, String password) throws SQLException {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "FROM Customer C WHERE C.username = :customer_userName and C.password = :customer_password";
			Query query = session.createQuery(hql, Customer.class);
			query.setParameter("customer_userName", userName);
			query.setParameter("customer_password", password);
			Customer cst = (Customer) query.getSingleResult();
			return cst;
		} catch (HibernateException e) {
			return null;
		} catch (NoResultException e) {
			return null;
		}
	}

}
