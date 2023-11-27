package com.store.controller;

import java.io.InputStream;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.store.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.domain.Article;
import com.store.domain.ArticleBuilder;
import com.store.domain.Type;
import com.store.domain.Category;
import com.store.domain.Color;

import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;


	@RequestMapping("/add")
	public String addArticle(Model model) {
		Article article = new Article();
		model.addAttribute("article", article);
		model.addAttribute("allColors", articleService.getAllColors());
		model.addAttribute("allTypes", articleService.getAllTypes());
		model.addAttribute("allCategories", articleService.getAllCategories());
		return "addArticle";
	}

	//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public String addArticlePost(@ModelAttribute("article") Article article, HttpServletRequest request) {
//        Article newArticle = new ArticleBuilder()
//                .withTitle(article.getTitle())
//                .stockAvailable(article.getStock())
//                .withPrice(article.getPrice())
//                .imageLink(article.getPicture())
//                .color(Arrays.asList(request.getParameter("color").split("\\s*,\\s*")))
//                .ofCategories(Arrays.asList(request.getParameter("category").split("\\s*,\\s*")))
//                .ofType(Arrays.asList(request.getParameter("type").split("\\s*,\\s*")))
//                .build();
//        articleService.saveArticle(newArticle);
//        return "redirect:article-list";
//    }
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@PostMapping("/add")
	public String addArticlePost(@RequestParam("title") String title,
	                             @RequestParam("category") String category,
	                             @RequestParam("color") String color,
	                             @RequestParam("type") String type,
	                             @RequestParam("price") double price,
	                             @RequestParam("stock") int stock,
	                             @RequestParam("picture") MultipartFile picture) {
		try {
			// Xử lý tệp ảnh và lưu vào thư mục uploads
			String fileName = StringUtils.cleanPath(picture.getOriginalFilename());
//			Path uploadDir = Paths.get("C:\\Users\\datha\\Desktop\\PTITShop-Project\\eshop\\src\\main\\resources\\static\\image\\QD09");
			Path uploadDir = Paths.get("./static/image/QD09/");
			if (!Files.exists(uploadDir)) {
				Files.createDirectories(uploadDir);
			}
			try (InputStream inputStream = picture.getInputStream()) {
				Path filePath = uploadDir.resolve(fileName);
				Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			}

			String imageLink = "/image/QD09/" + fileName; // Đường dẫn tới file ảnh

			// Tạo đối tượng Article và cập nhật đường dẫn ảnh
			Article newArticle = new ArticleBuilder()
					.withTitle(title)
					.stockAvailable(stock)
					.withPrice(price)
					.imageLink(imageLink)
					.color(Arrays.asList(color.split("\\s*,\\s*")))
					.ofCategories(Arrays.asList(category.split("\\s*,\\s*")))
					.ofType(Arrays.asList(type.split("\\s*,\\s*")))
					.build();

			articleService.saveArticle(newArticle);
			return "redirect:/article/article-list";
		} catch (IOException e) {
			e.printStackTrace();
			// Xử lý lỗi nếu cần
			return "error";
		}
	}

	@RequestMapping("/article-list")
	public String articleList(Model model) {
		List<Article> articles = articleService.findAllArticles();
		model.addAttribute("articles", articles);
		return "articleList";
	}

	@RequestMapping("/edit")
	public String editArticle(@RequestParam("id") Long id, Model model) {
		Article article = articleService.findArticleById(id);
		StringBuilder preselectedColors = new StringBuilder();
		for (Color color : article.getColors()) {
			preselectedColors.append(color.getValue()).append(",");
		}
		StringBuilder preselectedTypes = new StringBuilder();
		for (Type type : article.getTypes()) {
			preselectedTypes.append(type.getName()).append(",");
		}
		StringBuilder preselectedCategories = new StringBuilder();
		for (Category category : article.getCategories()) {
			preselectedCategories.append(category.getName()).append(",");
		}
		model.addAttribute("article", article);
		model.addAttribute("preselectedColors", preselectedColors.toString());
		model.addAttribute("preselectedTypes", preselectedTypes.toString());
		model.addAttribute("preselectedCategories", preselectedCategories.toString());
		model.addAttribute("allColors", articleService.getAllColors());
		model.addAttribute("allTypes", articleService.getAllTypes());
		model.addAttribute("allCategories", articleService.getAllCategories());
		return "editArticle";
	}


//	@RequestMapping(value = "/edit", method = RequestMethod.POST)
//	@PostMapping("/edit")
//	public String editArticlePost(@ModelAttribute("article") Article article, HttpServletRequest request) {
//		Article newArticle = new ArticleBuilder()
//				.withTitle(article.getTitle())
//				.stockAvailable(article.getStock())
//				.withPrice(article.getPrice())
//				.imageLink(article.getPicture())
//				.color(Arrays.asList(request.getParameter("color").split("\\s*,\\s*")))
//				.ofCategories(Arrays.asList(request.getParameter("category").split("\\s*,\\s*")))
//				.ofType(Arrays.asList(request.getParameter("type").split("\\s*,\\s*")))
//				.build();
//		newArticle.setId(article.getId());
//		articleService.saveArticle(newArticle);
//		return "redirect:article-list";
//	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@PostMapping("/edit")
	public String editArticlePost(HttpServletRequest request,
	                              @RequestParam("id") Long id,
	                              @RequestParam("title") String title,
	                              @RequestParam("category") String category,
	                              @RequestParam("color") String color,
	                              @RequestParam("type") String type,
	                              @RequestParam("price") double price,
	                              @RequestParam("stock") int stock,
	                              @RequestParam("picture") MultipartFile picture) throws IOException {
		String imageLink=null;
		if (picture != null && !picture.isEmpty()) {
			// Xử lý tệp ảnh và lưu vào thư mục uploads
			String fileName = StringUtils.cleanPath(picture.getOriginalFilename());
//			Path uploadDir = Paths.get("C:\\Users\\datha\\Desktop\\PTITShop-Project\\eshop\\src\\main\\resources\\static\\image\\QD09");
			Path uploadDir = Paths.get("./static/image/QD09/");
			if (!Files.exists(uploadDir)) {
				Files.createDirectories(uploadDir);
			}
			try (InputStream inputStream = picture.getInputStream()) {
				Path filePath = uploadDir.resolve(fileName);
				Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			}
			imageLink = "/image/QD09/" + fileName; // Đường dẫn tới file ảnh
		}
		Article existingArticle = articleService.findArticleById(id);
		if(imageLink==null)
		{
			imageLink = existingArticle.getPicture();
		}
		Article newArticle = new ArticleBuilder()
				.withTitle(title)
				.stockAvailable(stock)
				.withPrice(price)
				.imageLink(imageLink)
				.color(Arrays.asList(request.getParameter("color").split("\\s*,\\s*")))
				.ofCategories(Arrays.asList(request.getParameter("category").split("\\s*,\\s*")))
				.ofType(Arrays.asList(request.getParameter("type").split("\\s*,\\s*")))
				.build();
		newArticle.setId(id);
		articleService.saveArticle(newArticle);
		return "redirect:article-list";
	}

	@RequestMapping("/delete")
	public String deleteArticle(@RequestParam("id") Long id) {
		articleService.deleteArticleById(id);
		return "redirect:article-list";
	}

}
