package org.example.goSeoul.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.FreeBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeDao {

    @Autowired
    private SqlSession sqlSession;

    // 글 저장
    public int freeInsert(FreeBean fb) {
        System.out.println("FreeDao_freeInsert");
        return sqlSession.insert("freeInsert", fb);
    }

    // 조회수
    public int freeHit(int num) {
    	System.out.println("FreeDao_freeHit");
    	return sqlSession.update("freeHit", num);
    }
    
    // 글번호 조회
    public FreeBean numSelect(int num) {
    	return sqlSession.selectOne("numSelect", num);
    }

    // 글 수정
	public int freeUpdate(FreeBean fb) {
		System.out.println("FreeDao_freeUpdate");
		return sqlSession.update("freeUpdate", fb);
	}
	
	// 글 식제
	public int freeDelete(FreeBean fb) {
		System.out.println("FreeDao_freeDelete");
		return sqlSession.delete("freeDelete", fb);
	}

	public int getTotal(FreeBean fb) {
		return sqlSession.selectOne("getTotal", fb);
	}
	
	// public List<Board> list(int startRow, int endRow) {
	public List<FreeBean> list(FreeBean fb) {
		/*
		 * HashMap<String, Integer> hm=new HashMap<String, Integer>();
		 * hm.put("startRow",startRow); 
		 * hm.put("endRow",endRow);
		 */ 
		return sqlSession.selectList("freens.list", fb);
	}
	
 	public int freeLikeUpdate(int free_no) {
 		return sqlSession.update("freens.freeLikeUpdate", free_no);
 	}
 	public int freeDislikeUpdate(int free_no) {
 		return sqlSession.update("freens.freeDislikeUpdate", free_no);
 	}
}
