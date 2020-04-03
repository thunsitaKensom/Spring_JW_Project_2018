package civilize;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

@Repository
	public class SavedBookDAO {
		@PersistenceContext
		private EntityManager entityMng;

		@Transactional
		public SavedBook save(SavedBook newSavedBook) {
			entityMng.persist(newSavedBook);
			return newSavedBook;
		}
		public SavedBook findSaveByPK(Integer bookId,String username) {
			Query nativeQuery = entityMng.createNativeQuery("select * from saved_book where book_id=:BOOKID AND username=:USERNAME",SavedBook.class);
			nativeQuery.setParameter("BOOKID",bookId);
			nativeQuery.setParameter("USERNAME",username);
			List resultList = nativeQuery.getResultList();
			return resultList.isEmpty() ? null : (SavedBook) resultList.get(0);
			
		}
		public List<SavedBook> findByUsername(String username) {
			Query nativeQuery = entityMng.createNativeQuery("select * from saved_book where username=:USERNAME",SavedBook.class);
			nativeQuery.setParameter("USERNAME",username);
			List resultList = nativeQuery.getResultList();
			return resultList.isEmpty() ? null :resultList;
			
		}
		
		public List<SavedBook> findAll() {
			Query query = entityMng.createQuery("from SavedBook");
			return query.getResultList();
		}
		
		public List<SavedBook> findAllSaved(Integer bookId,String username) {
			Query nativeQuery = entityMng.createNativeQuery("SELECT * FROM bookdb.saved_book,bookdb.book where saved_book.book_id=book.book_id and username=:USERNAME;",
					SavedBook.class);
			nativeQuery.setParameter("USERNAME", username);
			List resultList = nativeQuery.getResultList();
			return resultList.isEmpty()? null : resultList;
		}
		
		@Modifying
		@Transactional
		public void delete(Integer bookId, String username) {
			Query nativeQuery = entityMng.createNativeQuery("delete from saved_book where book_id=:BOOKID and username=:USERNAME",SavedBook.class);
			nativeQuery.setParameter("USERNAME", username);
			nativeQuery.setParameter("BOOKID", bookId);
			nativeQuery.executeUpdate();
		}


	}

