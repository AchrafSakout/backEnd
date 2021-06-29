package ma.androidapp.beSafe.service;

import java.util.Date;
import java.util.stream.Stream;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.androidapp.beSafe.entities.Anomalie;
import ma.androidapp.beSafe.entities.Commentaire;
import ma.androidapp.beSafe.entities.StatutAnomalie;
import ma.androidapp.beSafe.entities.Users;
import ma.androidapp.beSafe.repositories.AnomalieRepository;
import ma.androidapp.beSafe.repositories.CommentaireRepository;
import ma.androidapp.beSafe.repositories.UsersRepository;
@Service
@Transactional
public class BeSafeInitServiceImpl implements IBeSafeInitService{

	@Autowired
	private UsersRepository usersRepository;
	@Autowired
	private AnomalieRepository anomalieRepository;
	@Autowired
	private CommentaireRepository commentairerepository;
	
	@Override
	public void initUser() {
		
		Stream.of("Achraf", "Zahira", "Oumaima").forEach(v -> {
			Users users = new Users();
			users.setNom(v);
			users.setPrenom(v);
			users.setEmail("test1@hotmail.com");
			users.setPassword("$2a$10$UCui452QVD.yRBinvpzl/et9XtIQH0tsdctfbv6GZblpSE7zBttEi");
			users.setActive(true);
			usersRepository.save(users);
		});
		
	}

	@Override
	public void initAnomalie() {
		usersRepository.findAll().forEach(user -> {
			for(int i = 0; i<3;i++) {
				Anomalie anomalie = new Anomalie();
				anomalie.setDescription("Ceci est un test de description pour une anomalie !");
				anomalie.setLaltitude("31.626598");
				anomalie.setLongitude("8.008577");
				anomalie.setDate_annomalie(new Date());
				anomalie.setNombreLike(0);
				anomalie.setStatutAnomalie(StatutAnomalie.ENATTENTE.toString());
				anomalie.setUsers(user);
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
