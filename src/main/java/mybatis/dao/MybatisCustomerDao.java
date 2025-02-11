package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.CustomerVo;

public class MybatisCustomerDao {

	private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();
	
	public List<CustomerVo> selectAll(){
		SqlSession sqlSession = sessionFactory.openSession();
		List<CustomerVo> list = sqlSession.selectList("tblcustomer.selectAll");
		sqlSession.close();
		return list;
	}
	
	//마이바티스는 auto commit 이 아닙니다.
	public int insert(CustomerVo vo) {
		SqlSession sqlSession = sessionFactory.openSession();
		
		int result = sqlSession.insert("tblcustomer.insert",vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int update(CustomerVo dto) {
		SqlSession sqlSession = sessionFactory.openSession();
		int result = sqlSession.update("tblcustomer.update",dto);
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
	
	public CustomerVo getCustomer(String customId ) {
		SqlSession sqlSession = sessionFactory.openSession();
		CustomerVo dto = sqlSession.selectOne("tblcustomer.getCustomer",customId);
		sqlSession.close();
		return dto;
	}
	
	public List<CustomerVo> selectByNameAge(Map<String,Object> map){
		SqlSession sqlSession = sessionFactory.openSession();
		List<CustomerVo> list 
			= sqlSession.selectList("tblcustomer.selectByNameAge",map);
		sqlSession.close();
		return list;
	}
}








