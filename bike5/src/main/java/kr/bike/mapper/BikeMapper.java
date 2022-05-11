package kr.bike.mapper;

import java.util.List;

import kr.bike.entity.User;

public interface BikeMapper {

	public User userLogin(User uvo);

	public int userJoin(User uvo);

	//public User fileload(User uvo);
}
