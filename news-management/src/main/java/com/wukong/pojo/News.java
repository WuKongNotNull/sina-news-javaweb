package com.wukong.pojo;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 新闻详情实体类
 */
@Setter
@Getter
@ToString
public class News {
    private Integer id;
    private Integer categoryId;
    private  String title;
    private  String summary;
    private  String content;
    private  String picPath;
    private  Integer createBy;
    private Date createDate;
    private Date modifyDate;
    private  Integer modifyBy;

}
