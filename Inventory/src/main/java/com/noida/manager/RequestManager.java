package com.noida.manager;

import java.util.List;
import java.util.Map;

import com.noida.model.Request;
import com.noida.model.Users;
import com.noida.util.RequestStatus;

public interface RequestManager {
	
	public Request raiseNewRequest(Long assetTypeNo, Long assetSubTypeNo, String requester, int quantity, String desc);
	
	public List<Request> getRequestByStatus(RequestStatus status);

	public void approveRequest(Long requestNumber, int approvedQty, String remark);

	public void rejectRequest(Long requestNumber, String remark);

	public Map<String, Object> issueAsset(Long requestNumber, String[] barcodes, String remark);
	
	public List<Request> getAllRequest();
	
	public void revertRequest(Long requestNumber, String remark);
	
	public List<Request> getUserRequest(Users user);
}
