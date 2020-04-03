package civilize;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SavedBookController {
	@Autowired
	SavedBookDAO dao;

	@PostMapping("/savedbook/create")
	public String create(@ModelAttribute SavedBook b, Model model, HttpServletRequest request) {
		if (dao.findSaveByPK(b.getBookId(), b.getUsername()) != null) {
			dao.delete(b.getBookId(), b.getUsername());
		} else {
			dao.save(b);
		}

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@PostMapping("/savedbook/delete")
	public String delete(@ModelAttribute SavedBook b, Model model, HttpServletRequest request) {
		dao.delete(b.getBookId(), b.getUsername());
		// สง่ ไปยงั path แสดงข้อมูลลูกค้ำทั้งหมด
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
}
