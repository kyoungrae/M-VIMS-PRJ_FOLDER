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
@Table(name = "SYS_FILE_DTL")
public class SysFileDetail extends Common {

    @Transient
    @Builder.Default
    private String keys = Arrays.toString(new String[] { "file_id", "file_uuid" });

    /***
     * <pre>
     *  file_id : 파일아이디
     * </pre>
     */
    @Id
    private String file_id;

    /***
     * <pre>
     *  file_uuid : 공통아이디
     * </pre>
     */
    private String file_uuid;

    /***
     * <pre>
     *  file_nm : 파일이름
     * </pre>
     */
    private String file_nm;

    /***
     * <pre>
     *  file_sz : 파일크기
     * </pre>
     */
    private String file_sz;

    /***
     * <pre>
     *  file_ext : 파일확장자
     * </pre>
     */
    private String file_ext;

    /***
     * <pre>
     *  file_path : 파일경로
     * </pre>
     */
    private String file_path;

    /***
     * <pre>
     *  sys_crt_dt : 작성일
     * </pre>
     */
    private Date sys_crt_dt;
    private Date _sys_crt_dt;

    /***
     * <pre>
     *  sys_crt_usr_id : 작성자 아이디
     * </pre>
     */
    private String sys_crt_usr_id;
    private String _sys_crt_usr_id;

    /***
     * <pre>
     *  sys_upd_dt : 수정일자
     * </pre>
     */
    private Date sys_upd_dt;
    private Date _sys_upd_dt;

    /***
     * <pre>
     *  sys_upd_usr_id : 수정자 아이디
     * </pre>
     */
    private String sys_upd_usr_id;
    private String _sys_upd_usr_id;

    /***
     * <pre>
     *  menu_cd : 메뉴코드
     * </pre>
     */
    private String menu_cd;

    /***
     * <pre>
     *  file_id : 파일아이디
     * </pre>
     */
    @Transient
    private String _file_id;

    /***
     * <pre>
     *  file_uuid : 공통아이디
     * </pre>
     */
    @Transient
    private String _file_uuid;

    /***
     * <pre>
     *  file_nm : 파일이름
     * </pre>
     */
    @Transient
    private String _file_nm;

    /***
     * <pre>
     *  file_sz : 파일크기
     * </pre>
     */
    @Transient
    private String _file_sz;

    /***
     * <pre>
     *  file_ext : 파일확장자
     * </pre>
     */
    @Transient
    private String _file_ext;

    /***
     * <pre>
     *  file_path : 파일경로
     * </pre>
     */
    @Transient
    private String _file_path;

}