package com.cannes.movie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cannes.movie.domain.MovieVO;
import com.cannes.movie.service.MovieService;

@RestController
@RequestMapping(value = "/movie")
public class MovieRESTController {
	private static final Logger logger = LoggerFactory.getLogger(MovieRESTController.class);
	@Autowired
	private MovieService movieService;
	
	@GetMapping(value="/all/{movieNo}")
	public ResponseEntity<MovieVO> readByDetail(
			@PathVariable("movieNo") int movieNo){
		logger.info("readByDetail() 호출");
		
		MovieVO vo = movieService.readDetail(movieNo);	
		return new ResponseEntity<MovieVO>(vo, HttpStatus.OK);
	}
	
} // end MovieRESTController
