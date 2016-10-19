package com.noida.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;

public class Util {
	
	public static Map<String, Object> toMap(String k1, Object v1){
		Map<String,Object> m = new HashMap<>();
		m.put(k1, v1);
		return m;
	}
	public static Map<String,Object> toMap(String k1, Object v1, String k2, Object v2){
		Map<String,Object> m = new HashMap<>();
		m.put(k1, v1);
		m.put(k2, v2);
		return m;
	}
	public static Map<String,Object> toMap(String k1, Object v1, String k2, Object v2, String k3, Object v3){
		Map<String,Object> m = new HashMap<>();
		m.put(k1, v1);
		m.put(k2, v2);
		m.put(k3, v3);
		return m;
	}
	public static Map<String,Object> toMap(String k1, Object v1, String k2, Object v2,String k3, Object v3,String k4, Object v4){
		Map<String,Object> m = new HashMap<>();
		m.put(k1, v1);
		m.put(k2, v2);
		m.put(k3, v3);
		m.put(k4, v4);
		return m;
	}
	public static Map<String,Object> toMap(String k1, Object v1,String k2, Object v2,String k3, Object v3,String k4, Object v4,String k5, Object v5){
		Map<String,Object> m = new HashMap<>();
		m.put(k1, v1);
		m.put(k2, v2);
		m.put(k3, v3);
		m.put(k4, v4);
		m.put(k5, v5);
		return m;
	}
	public static Map<String,Object> toMap(String k1, Object v1,String k2, Object v2,String k3, Object v3,String k4, Object v4,String k5, Object v5,String k6, Object v6){
		Map<String,Object> m = new HashMap<>();
		m.put(k1, v1);
		m.put(k2, v2);
		m.put(k3, v3);
		m.put(k4, v4);
		m.put(k5, v5);
		m.put(k6, v6);
		return m;
	}
	public static Map<String,Object> toMap(String k1, Object v1,String k2, Object v2,String k3, Object v3,String k4, Object v4,String k5, Object v5,String k6, Object v6,String k7, Object v7){
		Map<String,Object> m = new HashMap<>();
		m.put(k1, v1);
		m.put(k2, v2);
		m.put(k3, v3);
		m.put(k4, v4);
		m.put(k5, v5);
		m.put(k6, v6);
		m.put(k7, k7);
		return m;
	}
	public static Object[] toAttay(String a1){
		Object[] arr = {a1};
		return arr;
	}
	public static Object[] toAttay(String a1, String a2){
		Object[] arr = {a1,a2};
		return arr;
	}
	public static Object[] toAttay(String a1, String a2, String a3){
		Object[] arr = {a1,a2,a3};
		return arr;
	}
	 public static String getLoggedInUsername(){
		 return SecurityContextHolder.getContext().getAuthentication().getName();
	 }
}
