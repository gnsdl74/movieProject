package com.cannes.movie.persistance;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cannes.movie.domain.MovieVO;

@Repository
public class MovieDAOImple implements MovieDAO {
	private static final String NAMESPACE =
			"com.cannes.movie.MovieMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(MovieDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieVO> movieSelectAll() {
		logger.info("movieSelectAll() 호출");
		return sqlSession.selectList(NAMESPACE + ".movieSelectAll");
	} // end movieSelectAll()

	@Override
	public List<MovieVO> movieSelectByTitle(String movieTitle) {
		logger.info("movieSelectByTitle() 호출");
		movieTitle = "%" + movieTitle + "%";
		return sqlSession.selectList(NAMESPACE + ".movieSelectByTitle", movieTitle);
	} // end movieSelectByTitle()

	@Override
	public MovieVO movieSelectDetail(int movieNo) {
		logger.info("movieSelectDetail() 호출");
		return sqlSession.selectOne(NAMESPACE + ".movieSelectDetail", movieNo);
	} // end movieSelectDetail()
	
	@Override
	public MovieVO posterSelect(int movieNo) {
		logger.info("movieSelectDetail() 호출");
		return sqlSession.selectOne(NAMESPACE + ".posterSelect", movieNo);
	} // end posterSelect()

	@Override
	public List<MovieVO> movieSelectBoxOffice(String[] movieNums) {
		logger.info("movieSelectBoxOffice() 호출");
		return sqlSession.selectList(NAMESPACE + ".movieSelectBoxOffice", movieNums);
	} // end movieSelectBoxOffice()
	
	@Override
	public int movieInsert(MovieVO vo) {
		logger.info("movieInsert() 호출");
		return sqlSession.insert(NAMESPACE + ".movieInsert", vo);
	} // end movieInsert()

	@Override
	public int movieUpdate(MovieVO vo) {
		logger.info("movieUpdate() 호출");
		return sqlSession.insert(NAMESPACE + ".movieUpdate", vo);
	} // end movieUpdate()

	@Override
	public int movieDelete(int movieNo) {
		logger.info("movieDelete() 호출");
		return sqlSession.insert(NAMESPACE + ".movieDelete", movieNo);
	} // end movieDelete()

	@Override
	public List<MovieVO> movieSelectByDate(Date scheduleDate) {
		logger.info("movieSelectBooking() 호출");
		return sqlSession.selectList(NAMESPACE + ".movieSelectByDate", scheduleDate);
	} // end movieSelectBooking()



} // end MovieDAOImple
