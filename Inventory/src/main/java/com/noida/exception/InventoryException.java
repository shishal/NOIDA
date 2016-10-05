package com.noida.exception;

public class InventoryException extends RuntimeException{
	
	public InventoryException(String msg, Exception e){
		super(msg, e);
	}
}
