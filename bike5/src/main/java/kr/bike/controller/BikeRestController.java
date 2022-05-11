package kr.bike.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.bike.entity.Analysis;
import kr.bike.entity.Board;
import kr.bike.mapper.BikeMapper;

@RestController
public class BikeRestController {
	@Autowired
	private BikeMapper bikemapper;

	@PostMapping("/fileload")
	public Analysis fileLoad(Analysis vo, HttpServletRequest request) {
		Analysis avo = bikemapper.fileLoad(vo);
		return avo;
		
	}
	
}
