package mybatis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;

import mybatis.vo.ProductVo;

// 2JSTL 프로젝트의 TblProductDao 를 마이바티스 프레임웍 Dao로 변경
//	product.xml SQL 매퍼 파일을 새로 만드세요.
//  ProductVo 는 2JSTL 에서 복사하기.
//  mybatisTest.jsp 에서 dao 테스트하기
public class MybatisProductDao {
	private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();
	
public ProductVo selectByPk(String pcode) {
	SqlSession sqlSession=sessionFactory.openSession();
	ProductVo vo=sqlSession.selectOne("tbl_product.selectByPk",pcode);
	sqlSession.close();
	return vo;
	}

	
public List<ProductVo> selectAll(){
	SqlSession sqlSession = sessionFactory.openSession();
	// select SQL 조회 결과 행이 여러개 : selectList 메소드
	List<ProductVo> list = sqlSession.selectList("tbl_product.selectAll");
	sqlSession.close();
	return list;
}


public int insert(ProductVo vo) {
	SqlSession sqlSession = sessionFactory.openSession();
	
	int result = sqlSession.insert("tbl_product.insert",vo);
	sqlSession.commit();
	sqlSession.close();
	return result;
}

public int update(ProductVo vo) {
	SqlSession sqlSession = sessionFactory.openSession();
	int result = sqlSession.update("tbl_product.update", vo);
	sqlSession.commit();
	sqlSession.close();
	return result;
}

public int delete(String pcode) {
	SqlSession sqlSession = sessionFactory.openSession();
	int result = sqlSession.delete("tbl_product.delete",pcode);
	sqlSession.commit();
	sqlSession.close();
	return result;
}

public List<ProductVo> selectByCategory(String category){
	SqlSession sqlSession = sessionFactory.openSession();
	List<ProductVo> list=sqlSession.selectOne("tbl_product.selectByCategory",category);
	sqlSession.close();
	return list;
	}



}