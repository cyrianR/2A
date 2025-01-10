package n7.students_marks;

import java.util.Hashtable;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClient;

@RestController
public class MarksController {

	final static String path = "http://localhost:8080/students-server/";
	int mark = 0;
	@GetMapping("/getmark")
	public int getMark(@RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname, @RequestParam("lecture") String lecture) {

		int mark = 0;
		try {
			RestClient client = RestClient.create();
			String ine = client.get().uri(path + "getstudent?firstname=" + firstname + "&lastname=" + lastname).retrieve().body(Student.class).INE;
			mark = Integer.parseInt(client.get().uri(path + "getrecord?ine=" + ine).retrieve().body(Record.class).getLectureMark(lecture));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mark;

	}



}
