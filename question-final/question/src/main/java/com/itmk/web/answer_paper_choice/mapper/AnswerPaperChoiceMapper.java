package com.itmk.web.answer_paper_choice.mapper;

import com.itmk.web.answer_paper_choice.entity.AnswerPaperChoice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnswerPaperChoiceMapper {
    //批量保存
    boolean saveBatch(@Param("list") List<AnswerPaperChoice> list);
}
