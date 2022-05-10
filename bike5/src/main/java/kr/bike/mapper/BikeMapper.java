package kr.bike.mapper;

import java.awt.print.Book;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;

import kr.bike.entity.user;

public interface BikeMapper {
	
	public user memberLogin(user uvo);
}
