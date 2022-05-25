package kr.bike.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.bike.entity.Analysis;
import kr.bike.entity.Board;
import kr.bike.entity.Original;
import kr.bike.entity.User;
import kr.bike.mapper.BikeMapper;

@RestController
public class BikeRestController {
	@Autowired
	private BikeMapper bikemapper;

	@PostMapping("/fileload")
	public @ResponseBody Analysis fileLoad(String vr_title, HttpServletRequest request) {
		vr_title = vr_title.substring(vr_title.lastIndexOf("\\") + 1);
		Analysis avo = bikemapper.fileLoad(vr_title);
		System.out.println(vr_title);
		return avo;

	}

	@GetMapping("/boardList")
	public @ResponseBody List<Board> boardList() {

		List<Board> list = bikemapper.boardList();

		return list;
	}

	@GetMapping("/cloud")
	public @ResponseBody List<Original> cloudList() {
		List<Original> clist = bikemapper.cloudList();
		return clist;

	}

	@PostMapping("/idCheck")
	public User idCheck(String id, HttpServletRequest request) {
		User uid = bikemapper.idCheck(id);
		return uid;
	}
	
	@PostMapping("/insert")
	public void boardAjaxInsert(Board vo) {
		bikemapper.boardInsert(vo);
	}
	
	   @RequestMapping(value = "/loadNow.do", method = RequestMethod.GET)
	   public ModelAndView loadNow() {
	      ModelAndView mav = new ModelAndView();

	      String url = "http://127.0.0.1:9000/loadNow";
	      String sb = "";
	      try {
	         HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
	         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	         String line = null;

	         while ((line = br.readLine()) != null) {
	            sb = sb + line + "\n";
	         }
	         System.out.println("========br======" + sb.toString());
	         if (sb.toString().contains("ok")) {
	            System.out.println("main");
	         }
	         br.close();

	         System.out.println("" + sb.toString());
	      } catch (MalformedURLException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      mav.addObject("loadNow", sb.toString()); // jsp파일에서 받을때 이름, sb.toString은 value값
	      mav.addObject("fail", false);
	      mav.setViewName("main"); // jsp파일 이름
	      return mav;
	   }

}
