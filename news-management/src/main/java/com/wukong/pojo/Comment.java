package com.wukong.pojo;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@ToString
public class Comment {
    private Integer id;
    private  Integer newsId;
    private  String content;
    private Date createDate;
    private Integer createBy;
    private Date modifyDate;
    private Integer modifyBy;

}
