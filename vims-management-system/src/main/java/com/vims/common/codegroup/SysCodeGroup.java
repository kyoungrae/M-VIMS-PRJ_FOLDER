package com.vims.common.codegroup;

import com.system.common.base.Common;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

import java.util.Arrays;
import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@ToString(callSuper = true)
public class SysCodeGroup extends Common {
    @Transient
    private String keys = Arrays.toString(new String[] { "grp_id" });

    /***
     * <pre>
     *  grp_id :
     * </pre>
     */
    @Id
    private String grp_id;

    /***
     * <pre>
     *  grp_nm :
     * </pre>
     */
    private String grp_nm;

    /***
     * <pre>
     *  use_yn :
     * </pre>
     */
    private String use_yn;

    /***
     * <pre>
     *  comment : 설명
     * </pre>
     */
    private String comment;

    /***
     * <pre>
     *  grp_id :
     * </pre>
     */
    @Transient
    private String _grp_id;

    /***
     * <pre>
     *  grp_nm :
     * </pre>
     */
    @Transient
    private String _grp_nm;

    /***
     * <pre>
     *  use_yn :
     * </pre>
     */
    @Transient
    private String _use_yn;

    @Transient
    private Date sys_crt_dt;
    @Transient
    private String sys_crt_usr_id;
    @Transient
    private Date sys_upd_dt;
    @Transient
    private String sys_upd_usr_id;

    /***
     * <pre>
     *  sys_crt_dt : 작성일자
     * </pre>
     */
    @Transient
    private java.sql.Date _sys_crt_dt;

    /***
     * <pre>
     *  sys_crt_usr_id : 작성자ID
     * </pre>
     */
    @Transient
    private String _sys_crt_usr_id;

    /***
     * <pre>
     *  sys_upd_dt : 수정일자
     * </pre>
     */
    @Transient
    private java.sql.Date _sys_upd_dt;

    /***
     * <pre>
     *  sys_upd_usr_id : 수정자ID
     * </pre>
     */
    @Transient
    private String _sys_upd_usr_id;
}