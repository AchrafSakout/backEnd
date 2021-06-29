package ma.androidapp.beSafe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ma.androidapp.beSafe.entities.Users;

@RepositoryRestResource
public interface UsersRepository extends JpaRepository<Users, Long> {

}
