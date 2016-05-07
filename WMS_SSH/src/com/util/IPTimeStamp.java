package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class IPTimeStamp {
	private String ip;

	public IPTimeStamp() {
	}

	public IPTimeStamp(String ip) {
		this.ip = ip;
	}

	public String getIPTimeStame() {
		String str = "";
		String[] ips = this.ip.split("\\.");
		for (int i = 0; i < ips.length; i++) {
			str = str + addZero(3, ips[i]);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmssSSS");
		str = str + sdf.format(new Date());
		String num = new Random().nextInt(1000)+"";
		num = this.addZero(3,num);
		str = str+num;
		return str;
	}

	public String addZero(int len, String source) {
		for (int i = source.length(); i < len; i++) {
			source = "0" + source;
		}
		return source;
	}
	public static void main(String[] args) {
		IPTimeStamp ip = new IPTimeStamp("127.0.0.1");
	}
}
