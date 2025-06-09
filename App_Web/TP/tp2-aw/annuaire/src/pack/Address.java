package pack;

public class Address {
    //private static long nextId = 0L;
    
    private final long id;
    private String street;
    private String city;

    public Address(String street, String city, long id)  {
        //this.id = nextId++;
        this.id = id;
        this.street = street;
        this.city = city;
    }

    public long getId() {
        return id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
}
