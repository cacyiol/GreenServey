package com.itmk.web.answer_question.mapper;

import com.itmk.web.answer_question.entity.AnswerQuestion;
import org.apache.ibatis.annotations.Param;

public interface AnswerQuestionMapper {
    //新增答卷
    boolean add(@Param("answerQuestion") AnswerQuestion answerQuestion);
    AnswerQuestion getAnswerById(@Param("questionId") Long questionId,@Param("userId") Long userId);
}
