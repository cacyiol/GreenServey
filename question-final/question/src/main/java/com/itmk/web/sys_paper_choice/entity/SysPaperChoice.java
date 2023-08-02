package com.itmk.web.sys_paper_choice.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class SysPaperChoice implements Serializable {
    private Long chioceId;
    //试题id
    private Long paperId;
    //选项标题
    private String choiceText;
    //序号
    private Integer choiceOrder;
}
