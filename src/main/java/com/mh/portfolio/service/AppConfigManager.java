package com.mh.portfolio.service;

import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AppConfigManager {
	
	private static final AppConfigManager instance = new AppConfigManager();
	String filePath = "config/password.json";
	JsonNode jsonConfig;
	
	private AppConfigManager() {
		try {
			jsonConfig = new ObjectMapper().readTree(new String(Files.readAllBytes(Paths.get(new ClassPathResource(filePath).getURI()))));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static AppConfigManager getInstance() {
        return instance;
    }
	
	public String getConfig(String keyPath) {
		String[] keys = keyPath.split("\\.");
		
		Object current = jsonConfig;
		
		for (int i = 0; i < keys.length; i++) {
			if (current instanceof JsonNode) {
				if (i == keys.length - 1) {
					return ((JsonNode) current).get(keys[i]).asText();
				} else {
					current = ((JsonNode) current).get(keys[i]);
				}
			} else {
				return "";
			}
		}
		return "";
	}
	
}