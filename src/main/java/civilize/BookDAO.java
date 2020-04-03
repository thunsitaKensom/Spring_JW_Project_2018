package civilize;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

@Repository
public class BookDAO {
	@PersistenceContext
	private EntityManager entityMng;
	
	@Transactional
	public void create(Book b) {
		entityMng.persist(b);
	}
	
	public Book getBook(Integer id) {
		return entityMng.find(Book.class, id);
	}
	
	public List<Book> findAll() {
		// สร้ำง Query ดึงข้อมูลทั้งหมดจำกตำรำง customer
		Query query = entityMng.createQuery("from Book");
		// ดึงรำยกำรผลลัพธ์จำกกำร Query สง่ กลบั
		return query.getResultList();
		}
	
	public List<Book> findByKey(String key){
		Query query = entityMng.createNativeQuery("select * from book where book_type=:KEY or sub_type=:KEY",Book.class);
			query.setParameter("KEY", key);
			List<Book> resultList = query.getResultList();
			return resultList;
	}
	public List<Book> findByKeyword(String key){
		Query query = entityMng.createNativeQuery("select * from book where book_name LIKE CONCAT('%', :KEY, '%') or author LIKE CONCAT('%', :KEY, '%') or book_type LIKE CONCAT('%', :KEY, '%') or sub_type LIKE CONCAT('%', :KEY, '%')",Book.class);
			query.setParameter("KEY", key);
			List<Book> resultList = query.getResultList();
			return resultList;
	}
	
	@Transactional
	public Book save(Book book) {
	// insert กรณีไม่มีค่ำ id ใน object หรือ update กรณีมีค่ำ id ใน object
	entityMng.persist(book);
	return book;
	}

	@Transactional
	public void delete(Integer id) {
	// ค้นหำตำม id ที่ต้องกำรลบ
	Book b = entityMng.find(Book.class, id);
	entityMng.remove(b); // เริ่มลบจริง
	}
}
