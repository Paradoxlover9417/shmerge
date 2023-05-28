package org.example.goSeoul.service;

import org.example.goSeoul.dao.QuestionDao;
import org.example.goSeoul.dao.WithDao;
import org.example.goSeoul.model.QuestionBean;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {

    @Autowired
    private QuestionDao questionDao;

    public int questionInsert(QuestionBean qb) throws Exception {
        System.out.println("QuestionBean_questionInsert");
        return questionDao.questionInsert(qb);
    }

}
