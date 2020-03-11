/*
Copyright (c) 2009 Helsinki University of Technology (TKK)

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

import java.util.Properties;

import fi.hut.ics.lime.tester.communication.*;

/**
 * Class for remotely sending messages (such as stop and pause) to
 * the test server. The class can also be used to request information
 * from the server via TCP.
 */
public class Messenger
{
    public static void main (String Argv[])
    {
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

        Communication communication = new TCPCommunication(host, port);

        int connectionCounter = 0;

        while (!communication.isConnected() && connectionCounter < 2) {
            System.out.println("Could not connect to the test server. Trying again in a few moments.");
            connectionCounter++;

            try {
                Thread.sleep(3000);
            }
            catch (InterruptedException e) {

            }

            communication  = new TCPCommunication(host, port);
        }

        if (!communication.isConnected()) {
            System.out.println("Could not connect to the test server.");
            System.exit(0);
        }

        communication.sendMessage(Argv[0]);

        communication.end();
    }
}
