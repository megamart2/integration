/*
Copyright (c) 2008 Helsinki University of Technology (TKK)

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

package fi.hut.ics.lime.tester.communication;

import java.io.*;
import java.net.*;

/**
 * A class used for communication between test runs and the test server.
 * The communication is implemented by using TCP/IP sockets.
 *
 * NOTE: Calling new Socket() sometimes deadlocks the program. Reason for
 * this is not known (possibly platform specific). A temporary fix by using
 * class Foo has been implemented (the socket is created in a separate thread).
 *
 * TODO: Test if the problem mentioned in NOTE is still occuring and do a
 * better fix for the problem.
 *
 * @author ktkahkon
 */
public class TCPCommunication implements Communication
{
    protected Socket socket     = null;
    private PrintWriter out     = null;
    private BufferedReader in   = null;
    private boolean isConnected = false;

    public TCPCommunication (String host, int port)
    {
        try {
            Foo f = new Foo(this);
            f.start();

            try {
                f.join(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
                System.exit(-1);
            }

            if (socket == null) {
                System.err.println("ERROR: Failed to create a socket.");
                System.exit(-1);
            }

            InetSocketAddress ib = new InetSocketAddress(host, port);

            socket.connect(ib);

            out     = new PrintWriter (socket.getOutputStream(), true);
            in      = new BufferedReader (new InputStreamReader (socket.getInputStream()));

            isConnected = true;
        }
        catch (UnknownHostException e) {
            System.out.println("Unknown host");
            System.exit(-1);
        }
        catch  (IOException e) {
           // System.out.println("No I/O");
          //  System.exit(-1);
            isConnected = false;
        }
    }


    public boolean isConnected()
    {
       return isConnected;
    }

    public String getMessage()
    {
        String line = null;

        try {
            line = in.readLine();
        }
        catch (IOException e) {
            System.err.println("Read failed");
            System.exit(-1);
        }

        return line;
    }


    public void sendMessage(String message)
    {
        out.println(message);
    }



    public void end()
    {
        try {
            out.close();
            in.close();
            socket.close();
        }
        catch (IOException e) {
            System.out.println("Closing failed");
            System.exit(-1);
        }
    }
}

class Foo extends Thread
{
    private TCPCommunication a;

    public Foo (TCPCommunication t)
    {
        a = t;
    }

    @Override
    public void run()
    {
        a.socket = new Socket();
    }
}
