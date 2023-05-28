package org.example.goSeoul.service;

import java.util.List;

import org.example.goSeoul.dao.FreeDao;
import org.example.goSeoul.model.FreeBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeService {

    @Autowired
    private FreeDao freeDao;

    // 글 저장
    public int freeInsert(FreeBean fb) throws Exception {
        System.out.println("FreeService_freeInsert");
        return freeDao.freeInsert(fb);
    }

    // 조회수
    public int freeHit(int num) throws Exception {
    	System.out.println("FreeService_freeHit");
    	return freeDao.freeHit(num);
    }
    
    // 글번호 조회
    public FreeBean numSelect(int num) throws Exception {
    	return freeDao.numSelect(num);
    }
    
    
    // 글 수정
	public int freeUpdate(FreeBean fb) throws Exception {
		System.out.println("FreeService_freeUpdate");
		return freeDao.freeUpdate(fb);
	}
	
	// 글 삭제
	public int freeDelete(int num) throws Exception {
		System.out.println("FreeService_freeDelete");
		return freeDao.freeDelete(num);
	}
	
	// public List<Board> list(int startRow, int endRow) {
		public List<FreeBean> list(FreeBean fb) {
			return freeDao.list(fb);
			// return bd.list(startRow, endRow);
		}
		
		public int getTotal(FreeBean fb) {
			return freeDao.getTotal(fb);
		}
		
		public int freeLikeUpdate(int free_no) {
	 		return freeDao.freeLikeUpdate(free_no);
	 	}
	 	
	 	public int freeDislikeUpdate(int free_no) {
	 		return freeDao.freeDislikeUpdate(free_no);
	 	}	

}
