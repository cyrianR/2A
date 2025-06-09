package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

public class Facade {

    final String db_url;
    final String db_user;
    Connection con;
    
    //private Collection<Address> addresses = new HashSet<Address>();
    //private Collection<Person> persons = new HashSet<Person>();

    public Facade() {
        db_url = "jdbc:hsqldb:hsql://localhost/xdb";
        db_user = "sa";
        try {
            Class.forName("org.hsqldb.jdbcDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection(db_url, db_user, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addPerson(String firstName, String lastName) {
        //persons.add(new Person(firstName, lastName));
        Statement st = null;
        try {
            st = con.createStatement();
            st.executeQuery("insert into Person (firstName, lastName) values ('" + firstName + "','" + lastName + "')");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (st != null) try { st.close(); } catch (SQLException e) {e.printStackTrace();}
        }
    }

    public void addAddress(String street, String city) {
        //addresses.add(new Address(street, city));
        Statement st = null;
        try {
            st = con.createStatement();
            st.executeQuery("insert into Address (street, city) values ('" + street + "','" + city + "')");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (st != null) try { st.close(); } catch (SQLException e) {e.printStackTrace();}
        }
    }

    public Collection<Person> listPersons() {
        //return this.persons;
        Statement st;
        ResultSet rs = null;
        Collection<Person> persons = new HashSet<Person>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from Person");
            Map<Long, Address> linkedAddresses = linkedAddresses();
            while (rs.next()) {
                Person person = new Person(rs.getString("firstName"), rs.getString("lastName"), rs.getLong("id"));
                if (linkedAddresses.containsKey(rs.getLong("id"))) {
                    person.addAdress(linkedAddresses.get(rs.getLong("id")));
                }
                persons.add(person);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return persons;
    }

    private Map<Long, Address> linkedAddresses() {
        Statement st;
        ResultSet rs = null;
        Map<Long, Address> linkedAddresses = new HashMap<Long, Address>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from Address where personId is not null");
            while (rs.next()) {
                Address address = new Address(rs.getString("street"), rs.getString("city"), rs.getLong("id"));
                linkedAddresses.put(rs.getLong("personId"), address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return linkedAddresses;
    }

    public Collection<Address> listAddresses() {
        //return this.addresses;
        Statement st;
        ResultSet rs = null;
        Collection<Address> addresses = new HashSet<Address>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from Address");
            while (rs.next()) {
                Address address = new Address(rs.getString("street"), rs.getString("city"), rs.getLong("id"));
                addresses.add(address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return addresses;
    }

    public void bindPersonAddress(long personId, long addressId) {
        //Address address = addresses.stream().filter(a -> (a.getId() == addressId)).findFirst().get();
        //Person person = persons.stream().filter(p -> (p.getId() == personId)).findFirst().get();
        //person.addAdress(address);
        Statement st = null;
        try {
            st = con.createStatement();
            st.executeQuery("update Address set personId = '" + String.valueOf(personId) + "' where id = " + String.valueOf(addressId));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (st != null) try { st.close(); } catch (SQLException e) {e.printStackTrace();}
        }
    }
    
}
