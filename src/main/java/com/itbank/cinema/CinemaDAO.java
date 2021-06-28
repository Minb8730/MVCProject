package com.itbank.cinema;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

public interface CinemaDAO {

	int insertCinema(CinemaDTO cinema);

	@Select("select * from theater order by screen_code")
	List<CinemaDTO> selectAllCinema();

	@Select("select count(distinct branch) from theater where branch = #{branch}")
	int getBranch(String branch);

	@Select("select distinct branch_code from theater where branch = #{branch}")
	String getBranchCode(String branch);

	@Select("select screen_code from theater where branch = #{branch} order by screen_code")
	List<CinemaDTO> selectAllScreen(String branch);

	@Delete("delete from theater where screen_code = #{screen_code}")
	int deleteScreen(String screen_code);

	int insertTheater_info(Theater_infoDTO info);

	@Select("select start_date, end_date, start_time, end_time, runtime from theater_info where screen_code=#{screen_code}")
	List<Theater_infoDTO> screenCodes(String screenName);

	@Select("select start_date, end_date, substr(start_time, 1,2)||':'|| substr(start_time, 3,4) as start_time, substr(end_time, 1,2)||':'|| substr(end_time, 3,4) as end_time, runtime from theater_info where screen_code=#{screen_code}")
	List<Theater_infoDTO> screenCodes2(String screenName);

	@Select("select * from theater_info")
	List<Theater_infoDTO> selectAlltheater_info();





}