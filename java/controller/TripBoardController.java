package org.example.goSeoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripBoardController {

	 // 여행 지역별 게시판 이동
	 @RequestMapping("tripBoard_form.do") 
	 private String tripBoard_form() { 
		 System.out.println("지역별게시판");
		 return "tripBoard/tripBoard_form"; 
	 }
	 // 여행 종류별 게시판 이동
	 @RequestMapping("tripBoard2_form.do") 
	 private String tripBoard2_form() { 
		 System.out.println("종류별게시판");
		 return "tripBoard/tripBoard2_form"; 
	 }
	 // 여행코스 게시판 이동
	 @RequestMapping("tripBoard3_form.do") 
	 private String tripBoard3_form() { 
		 System.out.println("여행코스게시판");
		 return "tripBoard/tripBoard3_form"; 
	 }
	 // 여행 상세게시판 이동
	 @RequestMapping("tripDetail_form.do") 
	 private String tripDetail_form() { 
		 System.out.println("상세페이지");
		 return "tripBoard/tripDetail_form"; 
	 }
	
	 // 여행 종류별 - 관광지 이동
	 @RequestMapping("travel_board.do")
	 private String travelBoard_form() {
		 System.out.println("관광지이동");
		 return "tripBoard/travel_board";
	 }
	 // 여행 종류별 - 문화시설 이동
	 @RequestMapping("culture_board.do")
	 private String culture_form() {
		 System.out.println("문화시설이동");
		 return "tripBoard/culture_board";
	 }
	 // 여행 종류별 - 레포츠 이동
	 @RequestMapping("leisure_board.do")
	 private String leisure_form() {
		 System.out.println("레포츠이동");
		 return "tripBoard/leisure_board";
	 }
	 // 여행 종류별 - 숙박시설 이동
	 @RequestMapping("hotel_board.do")
	 private String hotel_form() {
		 System.out.println("숙박시설 이동");
		 return "tripBoard/hotel_board";
	 }
	 // 여행 종류별 - 쇼핑 이동
	 @RequestMapping("shopping_board.do")
	 private String shopping_form() {
		 System.out.println("쇼핑 이동");
		 return "tripBoard/shopping_board";
	 }
	 // 여행 종류별 - 음식점 이동
	 @RequestMapping("restaurant_board.do")
	 private String restaurant_form() {
		 System.out.println("음식점 이동");
		 return "tripBoard/restaurant_board";
	 }	 
	 // 여행 지역별 - 강남
	 @RequestMapping("gangnam_board.do")
	 private String gangnam_form() {
		 System.out.println("강남이동");
		 return "tripBoard/gangnam_board";
	 }
	 // 여행 지역별 - 강서
	 @RequestMapping("gangseo_board.do")
	 private String gangseo_form() {
		 System.out.println("강서이동");
		 return "tripBoard/gangseo_board";
	 }
	 // 여행 지역별 - 마포
	 @RequestMapping("mapo_board.do")
	 private String mapo_form() {
		 System.out.println("마포이동");
		 return "tripBoard/mapo_board";
	 }
	 // 여행 지역별 - 종로
	 @RequestMapping("jongro_board.do")
	 private String jongro_form() {
		 System.out.println("종로이동");
		 return "tripBoard/jongro_board";
	 }
}
