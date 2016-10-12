package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.AssetTypeRepository;
import com.noida.dao.PORepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AssetTypeManager;
import com.noida.manager.POManager;
import com.noida.model.AssetMainType;
import com.noida.model.PO;
import com.noida.util.Message;

@Service
public class POManagerImpl implements POManager{

	@Autowired
	PORepository poRepo;

	@Override
	public PO createPO(String poNumber, String company, Date PoDate,String desc) {
		try{
			return  poRepo.save(new PO(poNumber, company, PoDate,desc, new Date(), new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_PO,e);
	    }
	}

	@Override
	public List<PO> getAllPO() {
		return Lists.newArrayList(poRepo.findAll());
	}

	@Override
	public void updatePO(Long id,String poNumber, String company, Date PoDate,String desc) {
		try{
			poRepo.save(new PO(id, poNumber,company, PoDate,desc, new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_PO,e);
	    }
		
	}

	@Override
	public void deletePO(Long id) {
		try{
			poRepo.delete(id);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}
	
}
