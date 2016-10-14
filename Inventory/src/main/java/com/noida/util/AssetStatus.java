package com.noida.util;

public enum AssetStatus {
	
	NEW(1),
	OLD(2),
	DAMAGED(3);
	
	private int value;
    private AssetStatus(int value) {
            this.value = value;
    }
}
