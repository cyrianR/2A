import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;
import java.util.Map;

public class PadImpl extends UnicastRemoteObject implements Pad {

    private PadImpl forwardServer; 
    private Map<String, SRecord> records = new HashMap<>();

    public static void main(String[] args) {
        try {
            PadImpl server1 = new PadImpl();
            PadImpl server2 = new PadImpl();
            server1.setForwardServer(server2);
            server2.setForwardServer(server1);

            Naming.rebind("//localhost/server1", server1);
            Naming.rebind("//localhost/server2", server2);

            System.out.println("Servers are running ...");
        } catch (RemoteException | MalformedURLException e) {
            e.printStackTrace();
        }
    }

    protected PadImpl() throws RemoteException {
        super();
    }

    public void setForwardServer(PadImpl server) {
        this.forwardServer = server;
    }

    @Override
    public void add(SRecord sr) throws RemoteException {
        records.put(sr.getName(), sr);
    }

    @Override
    public RRecord consult(String n, boolean forward) throws RemoteException {
        
    }
    
}
