package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.ProductVo;

public class MybatisProductDao2 {
	private SqlSessionFactory sessFactory = SqlSessionBean.getSessionFactory();
	
	public List<ProductVo> searchByKeyword(String keyword){
		SqlSession sqlSession=sessFactory.openSession();
		List<ProductVo> list=sqlSession.selectList("tblproduct.searchByKeyword",keyword);
		sqlSession.close();
		return list;
	}
	
	public ProductVo selectByPk(String pcode) {
		SqlSession sqlSession = sessFactory.openSession();
		ProductVo vo = sqlSession.selectOne("tblproduct.selectByPk",pcode);
		sqlSession.close();
		return vo;
	}
	
	public List<ProductVo> selectAll(){
		SqlSession sqlSession = sessFactory.openSession();
		// select SQL 조회 결과 행이 여러개 : selectList 메소드 
		List<ProductVo> list = sqlSession.selectList("tblproduct.selectAll");
		sqlSession.close();
		return list;
	}
	
	public int insert(ProductVo vo) {
		SqlSession sqlSession = sessFactory.openSession();
		int result = sqlSession.insert("tblproduct.insert",vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int update(ProductVo vo) {
		SqlSession sqlSession = sessFactory.openSession();
		int result = sqlSession.update("tblproduct.update",vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int delete(String pcode) {
		SqlSession sqlSession = sessFactory.openSession();
		int result = sqlSession.delete("tblproduct.delete",pcode);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	
	

}
