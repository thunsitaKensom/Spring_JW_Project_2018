package civilize;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BookController {

	@Autowired
	BookDAO dao;
	@Autowired
	SavedBookDAO sbDAO;

	@PostMapping("/book/create")
	public String create(@ModelAttribute Book b, Model model) {
		b.setPostDate(b.getPostDate());
		String st = b.getSubType();
		//System.out.println("\t\t\t"+st);
		if (st.equals("BS") || st.equals("CS") || st.equals("LAW") || st.equals("EN") || st.equals("MATH")) {
			b.setBookType("textbooks");
		} else if (st.equals("AA") || st.equals("CC") || st.equals("FT") || st.equals("FS")) {
			b.setBookType("childrenAudiobooks");
		} else if (st.equals("DC") || st.equals("FC") || st.equals("HC") || st.equals("RC")) {
			b.setBookType("classics");
		} else if (st.equals("other") ) {
			b.setBookType("others");
		}
		
		dao.create(b);
		model.addAttribute(b);
		return "redirect:/book/editform/" +b.getBookId();
	}

	@GetMapping("/book/{id}")
	public String getone(@PathVariable Integer id, Model model) {
		Book b = dao.getBook(id);
		model.addAttribute(b);
		System.out.println(b.getBookName());
		return "/getbook-id";
	}

	@GetMapping("/books")
	public String getBookList(Model model) {
		List<Book> bookList = dao.findAll();
		model.addAttribute("bookList", bookList);
		List<SavedBook> sbList = sbDAO.findAll();
		model.addAttribute("sbList", sbList);
		return "/book-list";
	}
	@GetMapping("/search")
	public String search(@RequestParam("key") String key,Model model) {
		List<Book> bookList = dao.findByKeyword(key);
		model.addAttribute("bookList", bookList);
		List<SavedBook> sbList = sbDAO.findAll();
		model.addAttribute("sbList", sbList);
		
		return "/book-list";
	}

	@PostMapping("/book/edit")
	public String update(@ModelAttribute Book editBook, Model model) {
		// แก้ไขข้อมูลลูกค้ำ
		Book b = dao.getBook(editBook.getBookId());
		b.setBookName(editBook.getBookName());
		b.setAuthor(editBook.getAuthor());
		b.setSubType(editBook.getSubType());
		b.setContent(editBook.getContent());
		String st = editBook.getSubType();
		if (st.equals("BS") || st.equals("CS") || st.equals("LAW") || st.equals("EN") || st.equals("MATH")) {
			b.setBookType("textbooks");
		} else if (st.equals("AA") || st.equals("CC") || st.equals("FT") || st.equals("FS")) {
			b.setBookType("childrenAudiobooks");
		} else if (st.equals("DC") || st.equals("FC") || st.equals("HC") || st.equals("RC")) {
			b.setBookType("classics");
		} else if (st.equals("other") ) {
			b.setBookType("others");
		}
		dao.save(b);
		
				return "redirect:/book/" + b.getBookId();
			
	}

	@GetMapping("/book/editform/{id}")
	public String load(@PathVariable Integer id, Model model) {
		// ดึงข้อมูลลูกค้ำ 1 คน ตำมรหัส
		Book book = dao.getBook(id);
		model.addAttribute("book", book);
		return "/editform";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	@GetMapping("create")
	public String createform(){
		return "/add-form";
	}
	
	@GetMapping("/book/delete/{id}")
	public String delete(@PathVariable Integer id) {
	dao.delete(id);
	// สง่ ไปยงั path แสดงข้อมูลลูกค้ำทั้งหมด
	return "redirect:/books";
	}

	
	
	@GetMapping("/books/{key}")
	public String getBookByKey(@PathVariable String key, Model model) {
		List<Book> bookList = dao.findByKey(key);
		model.addAttribute("bookList", bookList);
		model.addAttribute("type",key);
	
		return "/book-list";
	}
	
}
