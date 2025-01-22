import java.rmi.RemoteException;

public class RRecordImpl implements RRecord {

    private String name;
    private String email; 

    public RRecordImpl(String name, String email) {
        this.name = name;
        this.email = email;
    }

    @Override
    public String getName() throws RemoteException {
        return name;
    }

    @Override
    public String getEmail() throws RemoteException {
        return email;
    }
    
}
