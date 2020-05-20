package com.cannes.movie.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cannes.movie.domain.MovieVO;
import com.cannes.movie.service.MovieService;

@Controller
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;
	
	@GetMapping(value = "/movieList")
	public String movieMain(Model model) {
		logger.info("movieMain() 호출");
		List<MovieVO> list = movieService.readAll();
		for(MovieVO vo : list) { 
			logger.info(vo + "");
		}
		model.addAttribute("movieAll", list);
		
		return "/movie/movieList";
	} // end movieMain()
	
} // end MovieController
