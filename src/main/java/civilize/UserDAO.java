package civilize;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Repository
public class UserDAO {
	@PersistenceContext
	private EntityManager entityMng;
	
	@Transactional
	public void create(User u) {
		entityMng.persist(u);
	}
	
	public User findByUsername(String Username) {
		return entityMng.find(User.class, Username);
	}
	
	public User checkLogin(String username, String password) {
		Query query = entityMng.createNativeQuery("select * from User u where username=:USERNAME and password=:PASSWORD", User.class);
		query.setParameter("USERNAME", username);
		query.setParameter("PASSWORD", password);
		List resultList = query.getResultList();
		return resultList.isEmpty() ? null : (User) resultList.get(0);
	}
	
	@Transactional
	public User save(User user) {
	// insert กรณีไม่มีค่ำ id ใน object หรือ update กรณีมีค่ำ id ใน object
	entityMng.persist(user);
	return user;
	}

}
