
public class SRecordImpl implements SRecord {

    private String name;
    private String email; 

    public SRecordImpl(String name, String email) {
        this.name = name;
        this.email = email;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public String getEmail() {
        return email;
    }
    
}
