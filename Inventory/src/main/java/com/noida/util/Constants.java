package com.noida.util;

public class Constants {
	// Properties (user configurable)
	public static final String APP_VERSION = PropFactory.getProp("noida.testprop.version");

	// Constants (not user configurable)
	public static final String PATH_CONFFILE = "config/config.properties";
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	}
