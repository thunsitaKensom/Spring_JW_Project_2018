package civilize;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
	@Autowired
	UserDAO dao;
	@Autowired
	BookDAO bDAO;
	@Autowired
	SavedBookDAO sbDAO;

	@RequestMapping("/user/create")
	public String create(@ModelAttribute User u, Model model, RedirectAttributes rm) {
		User check = dao.findByUsername(u.getUsername());
		if (check == null) {
			dao.create(u);
		} else {
			rm.addFlashAttribute("wrong", "Username was taken");

		}
		model.addAttribute("username", u.getUsername());
		model.addAttribute("password", u.getPassword());
		return "redirect:/books";
	}

	@RequestMapping("/user/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, HttpServletRequest request, Model model) {
		
		 if (null != dao.checkLogin(username, password)) { User user =
		 dao.findByUsername(username); session.setAttribute("session", user);
		 session.setAttribute("username", user.getUsername()); } else {
		 model.addAttribute("wrong", "wrong"); session.setAttribute("wrong", null); }
		 
		
		return "redirect:/books ";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/books";
	}

	@GetMapping("/user/profile/{username}")
	public String profile(@PathVariable String username, Model model) {
		User user = dao.findByUsername(username);
		model.addAttribute("user", user);
		List<SavedBook> sbList = sbDAO.findByUsername(username);
		model.addAttribute("sbList", sbList);
		List<Book> bookList = bDAO.findAll();
		model.addAttribute("bookList", bookList);
		return "/profile";
	}
}
