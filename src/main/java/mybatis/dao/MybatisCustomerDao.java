package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.CustomerVo;

public class MybatisCustomerDao {

	private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();
	
	public CustomerVo selectByPk(String customId) {
		SqlSession sqlSession=sessionFactory.openSession();
		
		// select SQL 조회 결과 행이 1개 : selectOne 메소드
		// sql 에 매개변수(파라미터)가 있으면 두번째 인자로 전달
		CustomerVo vo=sqlSession.selectOne("tblcustomer.selectByPk",customId);
		sqlSession.close();
		return vo;
	}
	
	public List<CustomerVo> selectAll(){
		SqlSession sqlSession = sessionFactory.openSession();
		// select SQL 조회 결과 행이 여러개 : selectList 메소드
		List<CustomerVo> list = sqlSession.selectList("tblcustomer.selectAll");
		sqlSession.close();
		return list;
	}
	
	// 마이바티스는 auto commit 이 아닙니다.(커밋 반드시 해줘라)
	public int insert(CustomerVo vo) {
		SqlSession sqlSession = sessionFactory.openSession();
		
		int result = sqlSession.insert("tblcustomer.insert",vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int update(CustomerVo vo) {
		SqlSession sqlSession = sessionFactory.openSession();
		int result = sqlSession.update("tblcustomer.update", vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int delete(String customId) {
		SqlSession sqlSession = sessionFactory.openSession();
		int result = sqlSession.delete("tblcustomer.delete",customId);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	

	

}








