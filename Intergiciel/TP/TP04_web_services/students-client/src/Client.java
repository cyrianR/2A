import javax.ws.rs.core.UriBuilder;

import org.jboss.resteasy.client.jaxrs.ResteasyClient;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.jboss.resteasy.client.jaxrs.ResteasyWebTarget;

public class Client {
    public static void main(String[] args) throws Exception {
        
        final String path = "http://localhost:8080/";

        ResteasyClient client = new ResteasyClientBuilder().build();
        ResteasyWebTarget target = client.target(UriBuilder.fromPath(path));
        ServiceInterface proxy = target.proxy(ServiceInterface.class);

        Record rec = proxy.getRecord("1111111111");
        Student student = proxy.getStudent("Alain", "Tchana");

        System.out.println(rec.architecture);
        System.out.println(student.address);

    }
}
