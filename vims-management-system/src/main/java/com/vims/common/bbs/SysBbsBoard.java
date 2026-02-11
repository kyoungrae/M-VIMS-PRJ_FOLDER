package com.vims.common.bbs;

import com.system.common.base.Common;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Arrays;
import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class SysBbsBoard extends Common {
    @Transient
    @Builder.Default
    private String keys = Arrays.toString(new String[] { "board_id" });

    @Id
    private String board_id; // 게시물 ID (UUID)
    private String bbs_id; // 소속 게시판 ID
    private String title; // 제목
    private String content; // 내용
    private String wrtr_nm; // 작성자 이름
    private int hit_cnt; // 조회수
    private String file_uuid; // 파일 UUID
    private String thmbnl; // 썸네일 UUID or Path

    private String sys_crt_usr_id;
    private Date sys_crt_dt;
    private String sys_upd_usr_id;
    private Date sys_upd_dt;

    // 댓글 갯수 (서브쿼리로 조회)
    @Transient
    private int reply_count;

    // 검색용 필드
    @Transient
    private String _title;
    @Transient
    private String _content;
}
