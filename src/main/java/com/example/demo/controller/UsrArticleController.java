package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;

	public UsrArticleController() {

	}

	// 액션 메서드
	//글쓰기
	@RequestMapping("/usr/article/write")
	public String Write() {

		return "/usr/article/write";
	}
	
	
	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(String title, String body) {
		int id = articleService.writeArticle(title, body);

		Article article = articleService.getArticle(id);

		return Ut.jsReplace("S-1", id + "번글생성", "../article/detail?id=" + id);
	}
	
	
	//리스트
	@RequestMapping("/usr/article/list")
	public String showList(Model model) {
		List<Article> articles = articleService.getArticles();
		model.addAttribute("articles",articles);
		
		return "/usr/article/list";
	}
	
	//디테일
	@RequestMapping("/usr/article/detail")
	public String showDetail(Model model,int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", id + "번 글 없음");
		}
		
		model.addAttribute("article", article);
		
		return "usr/article/detail";

		
	}
	//수정
	@RequestMapping("/usr/article/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {

		Article article = articleService.getArticle(id);

		if (article == null) {
			return Ut.jsReplace("F-1",id+"번글은 없음", "/");
		}

		model.addAttribute("article", article);

		return "usr/article/modify";
	}
	
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public Object doModify(int id, String title, String body) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		articleService.modifyArticle(id, title, body);

		return Ut.jsReplace("S-1", id+"번글수정완료", "../article/detail?id=" + id);
	}
	
	//삭제
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id) {

		Article article = articleService.getArticle(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", id + "번글 없음");
		}

		articleService.deleteArticle(id);

		return Ut.jsReplace("S-1", "삭제완료", "/usr/article/list");
	}

	

	
}