package org.example.goSeoul.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping("eventList.do")
	public String eventList() {
		return "event/eventList";
	}
	
	@RequestMapping("eventDetail.do")
	public String eventDetail() {
		return "event/eventDetail";
	}
	
}
