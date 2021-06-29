package ma.androidapp.beSafe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import ma.androidapp.beSafe.service.IBeSafeInitService;

@SpringBootApplication
public class BeSafeApplication implements CommandLineRunner{
	@Autowired
	private IBeSafeInitService beSafeInitService;
	
	public static void main(String[] args) {
		SpringApplication.run(BeSafeApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		beSafeInitService.initUser();
		beSafeInitService.initAnomalie();
		beSafeInitService.initCommentaire();		
	}

}
