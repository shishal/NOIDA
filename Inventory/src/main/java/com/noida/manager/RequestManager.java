package com.noida.manager;

import com.noida.model.Request;

public interface RequestManager {
	
	public Request raiseNewRequest(Long assetTypeNo, Long assetSubTypeNo, String requester, int quantity, String desc);
}
