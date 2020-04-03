package civilize;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	@RequestMapping(value = "/uploadBook", method = RequestMethod.POST)
	public
	String uploadFileHandler(@RequestParam("name") String name,@RequestParam("file") MultipartFile file,Model model) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("user.dir");
				File dir = new File(rootPath + "/src/main/resources/static/file/");
				if (!dir.exists())dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name+".pdf");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());

				String a = "You successfully uploaded file= " + name+".pdf<br>"+serverFile.getAbsolutePath();
				
				
				model.addAttribute("UploadStatus",a);
				model.addAttribute("color","green");
				model.addAttribute("path",name);
				return "/uploadStatus";
				
			} catch (Exception e) {
				String a= "You failed to upload " + name + " => " + e.getMessage();
				model.addAttribute("UploadStatus",a);
				model.addAttribute("color","red");
				model.addAttribute("path",name);
				return "/uploadStatus";
			}
		} else {
			String a = "You failed to upload " + name
					+ " because the file was empty.";
			model.addAttribute("UploadStatus",a);
			model.addAttribute("color","red");
			model.addAttribute("path",name);
			return "/uploadStatus";
		}
	}
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public
	String uploadFileHandler2(@RequestParam("name") String name,@RequestParam("file") MultipartFile file,Model model) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("user.dir");
				File dir = new File(rootPath + "/src/main/resources/static/");
				if (!dir.exists())dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name+".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());

				String a = "You successfully uploaded file= " + name+".jpg<br>"+serverFile.getAbsolutePath();
				
				
				model.addAttribute("UploadStatus",a);
				model.addAttribute("color","green");
				model.addAttribute("path",name);
				return "/uploadStatus";
				
			} catch (Exception e) {
				String a= "You failed to upload " + name + " => " + e.getMessage();
				model.addAttribute("UploadStatus",a);
				model.addAttribute("color","red");
				model.addAttribute("path",name);
				return "/uploadStatus";
			}
		} else {
			String a = "You failed to upload " + name
					+ " because the file was empty.";
			model.addAttribute("UploadStatus",a);
			model.addAttribute("color","red");
			model.addAttribute("path",name);
			return "/uploadStatus";
		}
	}
}
