package pack;

import java.util.Collection;
import java.util.HashSet;

public class Person {
    //private static long nextId = 0L;
    
    private final long id;
    private String lastName;
    private String firstName;
    private Collection<Address> addresses = new HashSet<Address>();

    public Person(String lastName, String firstName, long id) {
        //this.id = nextId++;
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
    }

    public Collection<Address> getAddresses() {
        return addresses;
    }

    public void addAdress(Address address) {
        this.addresses.add(address);
    }

    public long getId() {
        return id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

}
