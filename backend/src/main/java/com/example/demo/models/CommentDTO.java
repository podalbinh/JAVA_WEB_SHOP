package com.example.demo.models;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CommentDTO {
    private Long id;
    private String body;
    private Long userId;
    private Long postId;
    private Date createdAt;
}
