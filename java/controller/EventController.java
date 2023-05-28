package org.example.goSeoul.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("eventDetail.do")
	public String eventDetailwoocheol() {
	    // contentId를 이용하여 필요한 로직을 처리하고, eventDetail 페이지를 반환합니다.
	    return "eventDetail";
	}
	
	@RequestMapping("event.do")
	public String event() {
		return "event";
	}
}
