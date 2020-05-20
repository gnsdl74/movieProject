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

import com.cannes.movie.domain.TheaterVO;
import com.cannes.movie.service.TheaterService;



@RestController
@RequestMapping(value="/theater")
public class TheaterRESTController {
	private static final Logger logger = LoggerFactory.getLogger(TheaterRESTController.class);
	
	@Autowired
	private TheaterService theaterService;
	
	@GetMapping(value = "/all/{theaterNo}")
	public ResponseEntity<TheaterVO> readDetail(
			@PathVariable("theaterNo") int theaterNo) {
		logger.info("readDetail() 호출");
		
		TheaterVO vo= theaterService.readDetail(theaterNo);
		logger.info(vo.toString());
		return new ResponseEntity<TheaterVO>(vo, HttpStatus.OK);
	} // ent readDetail()

} // end TheaterRESTController





