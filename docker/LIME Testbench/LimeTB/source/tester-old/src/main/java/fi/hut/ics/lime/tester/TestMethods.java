package fi.hut.ics.lime.tester;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import fi.hut.ics.lime.tester.communication.TCPCommunication;

public class TestMethods {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 /* Loading settings */
        Properties defaults = new java.util.Properties();
        java.net.URL url = ClassLoader.getSystemResource("testerproperties/defaultsettings.properties");

        try {
            defaults.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open defaultsettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }

        Properties properties = new java.util.Properties(defaults);
        url = ClassLoader.getSystemResource("testerproperties/usersettings.properties");

        try {
            properties.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open usersettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }


        int port = Integer.valueOf(properties.getProperty("serverPort")).intValue();
        String host = properties.getProperty("serverIP");

        File changed_methods_file = new File(args[0]);
        if(changed_methods_file.exists()) {
        	TCPCommunication communication = new TCPCommunication(host, port);
        	
        	if(!communication.isConnected()) {
        		System.err.println("Could not connect to the test server.");
        		System.exit(0);
        	}
        		
        	
        	communication.sendMessage("changed methods");
        	try {
				BufferedReader reader = new BufferedReader(new FileReader(changed_methods_file));
				
				String line = null;
				while((line = reader.readLine()) != null) {
					communication.sendMessage(line);
				}
								
			} catch (FileNotFoundException e) {
				System.err.println(e);
				System.exit(0);
			} catch (IOException e) {
				System.err.println(e);
				System.exit(0);
			}
        	
        }

	}

}
