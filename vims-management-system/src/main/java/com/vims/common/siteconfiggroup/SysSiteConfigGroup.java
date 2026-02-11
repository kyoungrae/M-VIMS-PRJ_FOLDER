package com.vims.common.siteconfiggroup;

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
public class SysSiteConfigGroup extends Common {
    @Transient
	private String keys = Arrays.toString(new String[]{"cfg_grp_id"});

    @Id
    /***<pre> cfg_grp_id : 설정그룹아이디 </pre> */
	private String cfg_grp_id;

    /***<pre> cfg_grp_nm : 설정그룹이름 </pre> */
	private String cfg_grp_nm;

    /***<pre> use_yn : 사용여부 </pre> */
	private String use_yn;

    /***<pre> sys_crt_dt : 등록일자 </pre> */
	private Date sys_crt_dt;

    /***<pre> sys_crt_usr_id : 작성자ID </pre> */
	private String sys_crt_usr_id;

    /***<pre> sys_upd_dt : 수정일자 </pre> */
	private Date sys_upd_dt;

    /***<pre> sys_upd_usr_id : 수정자ID </pre> */
	private String sys_upd_usr_id;



    /***<pre> cfg_grp_id : 설정그룹아이디 </pre> */
    @Transient
	private String _cfg_grp_id;

    /***<pre> cfg_grp_nm : 설정그룹이름 </pre> */
    @Transient
	private String _cfg_grp_nm;

    /***<pre> use_yn : 사용여부 </pre> */
    @Transient
	private String _use_yn;

    /***<pre> sys_crt_dt : 등록일자 </pre> */
    @Transient
	private Date _sys_crt_dt;

    /***<pre> sys_crt_usr_id : 작성자ID </pre> */
    @Transient
	private String _sys_crt_usr_id;

    /***<pre> sys_upd_dt : 수정일자 </pre> */
    @Transient
	private Date _sys_upd_dt;

    /***<pre> sys_upd_usr_id : 수정자ID </pre> */
    @Transient
	private String _sys_upd_usr_id;


}