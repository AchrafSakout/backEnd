package ma.androidapp.beSafe.service;

import java.util.Date;
import java.util.stream.Stream;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.androidapp.beSafe.entities.Anomalie;
import ma.androidapp.beSafe.entities.Commentaire;
import ma.androidapp.beSafe.entities.StatutAnomalie;
import ma.androidapp.beSafe.entities.User;
import ma.androidapp.beSafe.repositories.AnomalieRepository;
import ma.androidapp.beSafe.repositories.CommentaireRepository;
import ma.androidapp.beSafe.repositories.UserRepository;
@Service
@Transactional
public class BeSafeInitServiceImpl implements IBeSafeInitService{

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private AnomalieRepository anomalieRepository;
	@Autowired
	private CommentaireRepository commentairerepository;
	
	@Override
	public void initUser() {
		
		Stream.of("Achraf", "Zahira", "Oumaima").forEach(v -> {
			User user = new User();
			user.setNom(v);
			user.setPrenom(v);
			user.setEmail("test1@hotmail.com");
			user.setPassword("1231");
			user.setActive(true);
			userRepository.save(user);
		});
		
	}

	@Override
	public void initAnomalie() {
		userRepository.findAll().forEach(user -> {
			for(int i = 0; i<3;i++) {
				Anomalie anomalie = new Anomalie();
				anomalie.setDescription("Ceci est un test de description pour une anomalie !");
				anomalie.setLaltitude("31.626598");
				anomalie.setLongitude("8.008577");
				anomalie.setDate_annomalie(new Date());
				anomalie.setNombreLike(0);
				anomalie.setStatutAnomalie(StatutAnomalie.ENATTENTE.toString());
				anomalie.setUser(user);
				anomalieRepository.save(anomalie);
			}
		});		
	}

	@Override
	public void initCommentaire() {
		anomalieRepository.findAll().forEach(anomalie -> {
			Commentaire commentaire = new Commentaire();
			commentaire.setCommentaire("ceci est un test commentaire !");
			commentaire.setAnomalie(anomalie);
			commentairerepository.save(commentaire);
		});
	}

}
