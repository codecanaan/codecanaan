package com.codecanaan;

import groovy.lang.Binding;
import groovy.lang.GroovyShell;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Hex;

public class ScriptLoader
{
	public ScriptLoader() {
	}

	public static void main(String args[])
	{
		ScriptLoader loader = new ScriptLoader();
		
		try {
			loader.loadGroovy(System.getProperty("core.script.url"));
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	private GroovyShell shell = null;

	public void loadGroovy(String scriptURL) throws Exception {
		System.out.println("Load Groovy " + scriptURL);

		URL url = new URL(scriptURL);
		URLConnection conn = url.openConnection();
		BufferedReader reader = new BufferedReader(
			new InputStreamReader(conn.getInputStream(), "UTF-8")
		);
		
		//讀取成字串
		StringBuilder builder = new StringBuilder();
		String line;
        while ((line = reader.readLine()) != null) {
            builder.append(line);
        }
        reader.close();
        String script = builder.toString();
        
        //使用 AES 演算法解密
		Key key = new SecretKeySpec("thebestsecretkey".getBytes(), "AES");
        Cipher c = Cipher.getInstance("AES");
        c.init(Cipher.DECRYPT_MODE, key);
        byte[] decValue = c.doFinal(Hex.decodeHex(script.toCharArray()));
        script = new String(decValue, "UTF-8");

		if (shell==null) {
			Binding binding = new Binding();
			binding.setVariable("loader", this);
			shell = new GroovyShell(binding);
			binding.setVariable("shell", shell);
		}
		shell.evaluate(script);
	}
}
