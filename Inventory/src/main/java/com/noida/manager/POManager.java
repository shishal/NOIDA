package com.noida.manager;

import java.util.Date;
import java.util.List;

import com.noida.model.PO;

public interface POManager {
	
	public PO createPO(String poNumber, String company, Date PoDate,String desc);

	public List<PO> getAllPO();

	public void updatePO(Long id, String poNumber, String company, Date PoDate, String desc);

	public void deletePO(Long id);

}
