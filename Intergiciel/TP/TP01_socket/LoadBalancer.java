import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;

public class LoadBalancer extends Thread {

    Socket SI;
    static String hosts[] = {"localhost", "localhost"};
    static int ports[] = {8081,8082};
    static int nbHosts = 2;
    static Random rand = new Random();

    public LoadBalancer(Socket s) {
        SI = s;
    }

    public static void main(String[] args) throws IOException {
        ServerSocket ss = new ServerSocket(8080);
        while (true) {
            Thread t = new LoadBalancer(ss.accept());
            t.start();
        }
    }

    public void run() {
        try {
            int target = rand.nextInt(2);
            Socket SO = new Socket(hosts[target], ports[target]);
            InputStream SIIS = SI.getInputStream();
            InputStream SOIS = SO.getInputStream();
            OutputStream SIOS = SI.getOutputStream();
            OutputStream SOOS = SO.getOutputStream();
            int nbLu;
            byte buff[] = new byte[1024];
            nbLu = SIIS.read(buff);
            SOOS.write(buff,0,nbLu);
            nbLu = SOIS.read(buff);
            SIOS.write(buff,0,nbLu);
            SO.close();
            SI.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
}
