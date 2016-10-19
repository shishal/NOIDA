package com.noida.manager;

import java.util.List;

import com.noida.model.Request;
import com.noida.util.RequestStatus;

public interface RequestManager {
	
	public Request raiseNewRequest(Long assetTypeNo, Long assetSubTypeNo, String requester, int quantity, String desc);
	
	public List<Request> getRequestByStatus(RequestStatus status);

	public void approveRequest(Long requestNumber, int approvedQty, String remark);

	public void rejectRequest(Long requestNumber, String remark);
}
