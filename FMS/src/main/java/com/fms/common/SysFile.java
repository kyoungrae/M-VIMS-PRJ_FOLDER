package com.fms.common;

import com.system.common.base.Common;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.Date;
import java.util.Arrays;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Table(name = "SYS_FILE")
public class SysFile extends Common {
    @Transient
    @Builder.Default
    private String keys = Arrays.toString(new String[] { "file_uuid" });

    /***
     * <pre>
     *  file_uuid : 공통아이디
     * </pre>
     */
    @Id
    private String file_uuid;

    /***
     * <pre>
     *  temp_yn : 임시파일 여부
     * </pre>
     */
    private Integer temp_yn;
    /***
     * <pre>
     *  sys_crt_dt : 작성일
     * </pre>
     */
    private Date sys_crt_dt;

    /***
     * <pre>
     *  sys_crt_usr_id : 작성자 아이디
     * </pre>
     */
    private String sys_crt_usr_id;

    /***
     * <pre>
     *  sys_upd_dt : 수정일자
     * </pre>
     */
    private Date sys_upd_dt;

    /***
     * <pre>
     *  sys_upd_usr_id : 수정자 아이디
     * </pre>
     */
    private String sys_upd_usr_id;

    /***
     * <pre>
     *  file_uuid : 공통아이디
     * </pre>
     */
    @Transient
    private String _file_uuid;

    /***
     * <pre>
     *  sys_crt_dt : 작성일
     * </pre>
     */
    @Transient
    private Date _sys_crt_dt;

    /***
     * <pre>
     *  sys_crt_usr_id : 작성자 아이디
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
    private Date _sys_upd_dt;

    /***
     * <pre>
     *  sys_upd_usr_id : 수정자 아이디
     * </pre>
     */
    @Transient
    private String _sys_upd_usr_id;

}