package com.vims.common.office;

import com.system.common.base.Common;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Date;
import java.util.Arrays;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class SysOffice extends Common {
    @Transient
    private String keys = Arrays.toString(new String[] { "offc_cd" });

    @Id
    /***
     * <pre>
     *  top_offc_cd : 최상위 코드
     * </pre>
     */
    private String top_offc_cd;

    /***
     * <pre>
     *  offc_nm : 기관명
     * </pre>
     */
    private String offc_nm;

    /***
     * <pre>
     *  offc_cd : 기관코드
     * </pre>
     */
    private String offc_cd;

    /***
     * <pre>
     *  offc_type : 기관유형
     * </pre>
     */
    private String offc_type;

    /***
     * <pre>
     *  offc_type_cd : 등록관청 구분부호
     * </pre>
     */
    private String offc_type_cd;

    /***
     * <pre>
     *  sys_crt_usr_id : 생성자ID
     * </pre>
     */
    private String sys_crt_usr_id;

    /***
     * <pre>
     *  sys_crt_dt : 생성일자
     * </pre>
     */
    private Date sys_crt_dt;

    /***
     * <pre>
     *  sys_upd_usr_id : 수정자ID
     * </pre>
     */
    private String sys_upd_usr_id;

    /***
     * <pre>
     *  sys_upd_dt : 수정일자
     * </pre>
     */
    private Date sys_upd_dt;

    /***
     * <pre>
     *  top_offc_cd : 최상위 코드
     * </pre>
     */
    @Transient
    private String _top_offc_cd;

    /***
     * <pre>
     *  offc_nm : 기관명
     * </pre>
     */
    @Transient
    private String _offc_nm;

    /***
     * <pre>
     *  offc_cd : 기관코드
     * </pre>
     */
    @Transient
    private String _offc_cd;

    /***
     * <pre>
     *  offc_type : 기관유형
     * </pre>
     */
    @Transient
    private String _offc_type;

    /***
     * <pre>
     *  offc_type_cd : 등록관청 구분부호
     * </pre>
     */
    @Transient
    private String _offc_type_cd;

    /***
     * <pre>
     *  sys_crt_usr_id : 생성자ID
     * </pre>
     */
    @Transient
    private String _sys_crt_usr_id;

    /***
     * <pre>
     *  sys_crt_dt : 생성일자
     * </pre>
     */
    @Transient
    private Date _sys_crt_dt;

    /***
     * <pre>
     *  sys_upd_usr_id : 수정자ID
     * </pre>
     */
    @Transient
    private String _sys_upd_usr_id;

    /***
     * <pre>
     *  sys_upd_dt : 수정일자
     * </pre>
     */
    @Transient
    private Date _sys_upd_dt;

}