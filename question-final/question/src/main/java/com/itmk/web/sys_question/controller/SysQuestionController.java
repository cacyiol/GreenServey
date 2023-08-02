package com.itmk.web.sys_question.controller;

import com.github.pagehelper.PageInfo;
import com.itmk.common.ResultMap;
import com.itmk.common.ResultUtils;
import com.itmk.common.ResultVo;
import com.itmk.common.StatusCode;
import com.itmk.web.sys_paper.entity.SysPaperParm;
import com.itmk.web.sys_paper.service.SysPaperService;
import com.itmk.web.sys_paper_choice.entity.ResultPaperChoice;
import com.itmk.web.sys_paper_choice.service.SysPaperChoiceService;
import com.itmk.web.sys_question.entity.QuestionParm;
import com.itmk.web.sys_question.entity.ResultPaper;
import com.itmk.web.sys_question.entity.SysQuestion;
import com.itmk.web.sys_question.service.SysQuestionService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * 问卷管理模块控制器
 */
@Controller
@RequestMapping("/api/sysQuestion")
public class SysQuestionController {
    @Autowired
    private SysQuestionService sysQuestionService;
    @Autowired
    private SysPaperService sysPaperService;
    @Autowired
    private SysPaperChoiceService sysPaperChoiceService;

    /**
     * 问卷列表页
     */
    @GetMapping("/index")
    public String index() {
        return "system/question/index";

    }

    /**
     * 新增页面
     */
    @GetMapping("/addUI")
    public String addUI() {
        return "system/question/add";
    }

    /**
     * 新增
     */
    @RequestMapping("/add")
    @ResponseBody
    public ResultVo add(SysQuestion sysQuestion) {
        boolean b = sysQuestionService.addQuestion(sysQuestion);
        if (b) {
            return ResultUtils.success("Add Successfully");
        }
        return ResultUtils.error("Add Fail");
    }

    /**
     * 列表查询
     */
    @GetMapping("/list")
    @ResponseBody
    public ResultMap list(QuestionParm parm) {
        List<SysQuestion> list = sysQuestionService.getTableList(parm);
        PageInfo<SysQuestion> pageInfo = new PageInfo<>(list);
        //返回code = 0  返回的数据需要从pageIfo里面获取
        return ResultUtils.pageResult(StatusCode.SUCCESS_LAYUI_CODE, "查询成功", pageInfo.getList(), pageInfo.getTotal());
    }

    /**
     * 编辑问卷视图
     */
    @GetMapping("/editUI")
    public String editUI(Long questionId, ModelMap map) {
        SysQuestion question = sysQuestionService.getById(questionId);
        map.put("question", question);
        return "system/question/edit";
    }

    /**
     * 编辑
     */
    @PostMapping("/edit")
    @ResponseBody
    public ResultVo edit(SysQuestion sysQuestion) {
        boolean b = sysQuestionService.editQuestion(sysQuestion);
        if (b) {
            return ResultUtils.success("Edit Successfully");
        }
        return ResultUtils.error("Edit Fail");
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResultVo delete(Long questionId) {
        boolean b = sysQuestionService.deleteQuestion(questionId);
        if (b) {
            return ResultUtils.success("Delete Successfully");
        }
        return ResultUtils.error("Delete Fail");
    }

    /**
     * 普通用户问卷列表页
     *
     * @return
     */
    @GetMapping("/commonlist")
    public String commonlist() {
        return "system/question/commonlist";
    }

    /**
     * 我的问卷列表页
     */
    @GetMapping("/myListUI")
    public String myListUI() {
        return "system/question/mylist";
    }

    /**
     * 我的问卷列表数据
     */
    @GetMapping("/mylist")
    @ResponseBody
    public ResultMap mylist(QuestionParm parm) {
        List<SysQuestion> list = sysQuestionService.getMyList(parm);
        PageInfo<SysQuestion> pageInfo = new PageInfo<>(list);
        //返回code = 0  返回的数据需要从pageIfo里面获取
        return ResultUtils.pageResult(StatusCode.SUCCESS_LAYUI_CODE, "Successfully", pageInfo.getList(), pageInfo.getTotal());
    }

    /**
     * 返回统计管理列表
     *
     * @return
     */
    @GetMapping("/countList")
    public String countList() {
        return "system/question/countList";
    }

    /**
     * 返回统计分析
     *
     * @return
     */
    @GetMapping("/lookList")
    public String lookList(Long questionId, String questionTitle, ModelMap map) {
        map.put("questionId", questionId);
        map.put("questionTitle", questionTitle);
        return "system/question/lookList";
    }

    /**
     * 返回统计打印
     *
     * @return
     */
    @GetMapping("/count")
    public String count(Long questionId, String questionTitle, ModelMap map) {
        map.put("questionId", questionId);
        map.put("questionTitle", questionTitle);
        return "system/question/count";
    }

    @GetMapping("/getTotalList")
    @ResponseBody
    public ResultVo getTotalList(Long questionId) {
        //根据问卷id查询所有的试题
        List<SysPaperParm> paperList = sysPaperService.getPaperList(questionId);
        //存放返回值
        List<ResultPaper> resultList = new ArrayList<>();
        //查询试题对应的选项
        List<ResultPaperChoice> choiceList = sysPaperChoiceService.getListPaperChoice(questionId);
        if (paperList.size() > 0) {
            for (int i = 0; i < paperList.size(); i++) {
                //定义返回值
                ResultPaper parm = new ResultPaper();
                //定义存放试题选项
                List<ResultPaperChoice> paperChoices = new ArrayList<>();
                //获取试题的id
                Long paperId = paperList.get(i).getPaperId();
                choiceList.stream().filter(item -> item.getPaperId().equals(paperId)).forEach(item -> {
                    ResultPaperChoice choice = new ResultPaperChoice();
                    BeanUtils.copyProperties(item, choice);
                    //把选项添加到试题
                    paperChoices.add(choice);
                });
                BeanUtils.copyProperties(paperList.get(i), parm);
                parm.setPaperChoice(paperChoices);
                resultList.add(parm);
            }
        }
        return ResultUtils.success("查询成功", resultList);
    }
}
