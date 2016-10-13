package com.noida.util;

public enum AssetStatus {
	
	RESERVED(1),
	ASSIGNED(2),
	AVAIABLE(3),
	DAMAGED(4);
	
	private int value;
    private AssetStatus(int value) {
            this.value = value;
    }
}
