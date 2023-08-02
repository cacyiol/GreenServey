package com.itmk.web.answer_paper.controller;

import com.itmk.common.ResultUtils;
import com.itmk.common.ResultVo;
import com.itmk.web.answer_paper.entity.CommitParm;
import com.itmk.web.answer_paper.service.AnswerPaperService;
import com.itmk.web.answer_question.entity.AnswerQuestion;
import com.itmk.web.answer_question.service.AnswerQuestionService;
import com.itmk.web.sys_paper.entity.SysPaperParm;
import com.itmk.web.sys_paper.service.SysPaperService;
import com.itmk.web.sys_question.entity.SysQuestion;
import com.itmk.web.sys_question.service.SysQuestionService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/api/answerPaper")
public class AnswerPaperController {
    @Autowired
    private AnswerPaperService answerPaperService;
    @Autowired
    private AnswerQuestionService answerQuestionService;
    @Autowired
    private SysQuestionService sysQuestionService;
    @Autowired
    private SysPaperService sysPaperService;

    @RequestMapping("/saveCommit")
    @ResponseBody
    public ResultVo saveCommit(@RequestBody CommitParm parm){
        //判断是否已经答卷
        AnswerQuestion answer = answerQuestionService.getAnswerById(parm.getQuestionId(), parm.getUserId());
        if(answer != null){
            return ResultUtils.error("Thank you for your participation, please do not repeat the questionnaire!");
        }
        answerPaperService.saveCommit(parm);
        return ResultUtils.success("Commit Successfully");
    }

    @SneakyThrows
    @ResponseBody
    @GetMapping("/isTrue")
    public ResultVo isTrue(Long questionId){
        SysQuestion byId = sysQuestionService.getById(questionId);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        long now = new Date().getTime();

        List<SysPaperParm> paperList = sysPaperService.getPaperList(questionId);
        if(CollectionUtils.isEmpty(paperList)){
            return ResultUtils.error("此问卷还未设置题目，暂时不能做答");
        }
        return ResultUtils.success("成功");
    }

}
