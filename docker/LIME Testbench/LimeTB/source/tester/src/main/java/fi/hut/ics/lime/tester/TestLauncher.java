/*
Copyright (c) 2008 - 2009 Helsinki University of Technology (TKK)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
 */

package fi.hut.ics.lime.tester;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

import fi.hut.ics.lime.tester.communication.Communication;
import fi.hut.ics.lime.tester.communication.TCPCommunication;


/**
 * This class provides functionality to run instrumented programs multiple
 * times until the test server indicates that the testing has been completed.
 */
public class TestLauncher implements Runnable
{

    private Communication communication;
    private boolean finished;

    public TestLauncher()
    {
        finished  = false;

        /* Loading settings */
        Properties defaults = new java.util.Properties();
        java.net.URL url = ClassLoader.getSystemResource("testerproperties/defaultsettings.properties");

        try {
            defaults.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open testerproperties/defaultsettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }

        Properties properties = new java.util.Properties(defaults);
        url = ClassLoader.getSystemResource("testerproperties/usersettings.properties");

        try {
            properties.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open testerproperties/usersettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }


        int port = Integer.valueOf(properties.getProperty("serverPort")).intValue();
        String host = properties.getProperty("serverIP");

        communication = new TCPCommunication(host, port);

        int connectionCounter = 0;

        while (!communication.isConnected() && connectionCounter < 2) {
            System.out.println("Could not connect to the test server. Trying again in a few moments.");
            connectionCounter++;

            try {
                Thread.sleep(3000);
            }
            catch (InterruptedException e) {

            }

            communication   = new TCPCommunication(host, port);
        }

        if (!communication.isConnected()) {
            System.out.println("Could not connect to the test server.");
            System.exit(0);
        }
        
   
        
        communication.sendMessage("launcher");
    }
    


    public void run()
    {
        communication.getMessage();

        finished = true;
    }



    private void launchTests (String program)
    {
        boolean isInstrumented  = false;
        long time               = System.currentTimeMillis();
        long time2;
        
        while (!finished) {
            try {
                String  ls_str;
                String  ls_error_str;
                Process ls_proc = Runtime.getRuntime().exec("LCTrun " + program);

                BufferedReader ls_in  = new BufferedReader(new InputStreamReader(ls_proc.getInputStream()));
                BufferedReader ls_err = new BufferedReader(new InputStreamReader(ls_proc.getErrorStream()));

                try {
                    while ((ls_str = ls_in.readLine()) != null) {
                        if (!ls_str.equals("No I/O"))
                            System.out.println(ls_str);

                        if (ls_str.equals("| Starting a new test run |")) {
                            isInstrumented = true;
                        }
                    }

                    while ((ls_error_str = ls_err.readLine()) != null) {
                        System.out.println(ls_error_str);
                    }

                    System.out.println();

                } catch (IOException e) {
                    System.exit(0);
                }
            } catch (IOException e1) {
                System.err.println(e1);
                System.exit(1);
            }

            if (!isInstrumented) {
                System.out.println("Please run the instrumented version of the program located in /output directory");
                System.out.println("See the README.txt file for further information.");
                finished = true;
            }
        }
        time2 = System.currentTimeMillis();
        time = time2 - time;
    }


    public static void main (String Argv[]) {
        TestLauncher launcher = new TestLauncher();
        Thread thread = new Thread(launcher);
        thread.start();
        launcher.launchTests(Argv[0]);
    }
}
