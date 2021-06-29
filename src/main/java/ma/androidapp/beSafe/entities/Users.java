package ma.androidapp.beSafe.entities;


import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotNull
	@Size(min = 4, max = 20)
	private String nom;
	@NotNull
	@Size(min = 4, max = 20)
	private String prenom;
	@NotNull
	@Size(min = 4, max = 50)
	private String email;
	private boolean active;
	private String password;
	@OneToMany(mappedBy = "users")
	private Collection<Anomalie> anomalies;
}
