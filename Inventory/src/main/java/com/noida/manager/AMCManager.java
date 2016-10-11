package com.noida.manager;

import java.util.Date;
import java.util.List;

import com.noida.model.AMC;
import com.noida.model.PO;

public interface AMCManager {
	
	public AMC createAMC(String amcNumber,Date startDate, Date endDate, String vendor, String desc);

	public List<AMC> getAllAMC();

	public void updateAMC(Long id,String amcNumber, Date startDate, Date endDate,String vendor, String desc);

	public void deleteAMC(Long id);

}
