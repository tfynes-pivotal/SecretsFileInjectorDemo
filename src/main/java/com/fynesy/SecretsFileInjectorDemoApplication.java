package com.fynesy;

import java.io.BufferedReader;
import java.io.FileReader;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SecretsFileInjectorDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SecretsFileInjectorDemoApplication.class, args);
	}
	
	@RequestMapping("/")
	public String index() throws Exception {
		System.out.println("Secret File Printer Demo App");
		
//		Map<String,String> env = System.getenv();
//		for (Map.Entry<String,String> entry: env.entrySet()) {
//			System.out.println(entry.getKey() + " : " + entry.getValue());
//		}
		
		System.out.println("====================");
		String mySecretFile = "/home/vcap/secret.file";
		FileReader reader = new FileReader(mySecretFile);
		
		BufferedReader bufferedReader = new BufferedReader(reader);
		String line;
		while ((line = bufferedReader.readLine()) != null) {
			System.out.println(line);
		}
		reader.close();
		System.out.println("====================");
		
		
		return "root context\n";
	}

}
