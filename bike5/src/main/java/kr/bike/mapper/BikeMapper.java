package kr.bike.mapper;

import java.awt.print.Book;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;

import kr.bike.entity.User;

public interface BikeMapper {

	public User userLogin(User uvo);
}
