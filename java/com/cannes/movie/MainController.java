package com.cannes.movie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@GetMapping(value = { "/", "/main" })
	public String main(Model model) {
		logger.info("main페이지 호출");

		return "/main";
	} // end main()

} // end HomeController
