package ma.androidapp.beSafe.entities;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Anomalie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String description;
	private String longitude;
	private String laltitude;
	@Temporal(TemporalType.TIMESTAMP)
	private Date date_annomalie;
	private int nombreLike;
	@OneToMany(mappedBy = "anomalie")
	private Collection<Commentaire> commentaires;
	@ManyToOne
	private Users users;
	private String statutAnomalie;
}
