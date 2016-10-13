package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.AMCRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AMCManager;
import com.noida.model.AMC;
import com.noida.util.Message;

@Service
public class AMCManagerImpl implements AMCManager {

	@Autowired
	AMCRepository amcRepo;

	@Override
	public AMC createAMC(String amcNumber,Date startDate, Date endDate,String vendor, String desc) {
		try {
			return amcRepo.save(new AMC(amcNumber,startDate, endDate, vendor,desc, new Date(), new Date()));
		} catch (DataIntegrityViolationException e) {
			throw new InventoryException(Message.DUPLICATE_AMC, e);
		}
	}

	@Override
	public List<AMC> getAllAMC() {
		return Lists.newArrayList(amcRepo.findAll());
	}

	@Override
	public void updateAMC(Long id,String amcNumber, Date startDate, Date endDate,String vendor, String desc) {
		try {
			amcRepo.save(new AMC(id, amcNumber,startDate, endDate, vendor,desc, new Date()));
		} catch (DataIntegrityViolationException e) {
			throw new InventoryException(Message.DUPLICATE_AMC, e);
		}

	}

	@Override
	public void deleteAMC(Long id) {
		try {
			amcRepo.delete(id);
		} catch (DataIntegrityViolationException e) {
			throw new InventoryException(Message.UNKNOW_ERROR, e);
		}

	}

}
