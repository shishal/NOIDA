package com.noida.util;

public enum RequestType {
	
	NEW(1),
	REPAIR(2);
	private int value;
    private RequestType(int value) {
            this.value = value;
    }
}
