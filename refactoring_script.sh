#!/bin/bash
# =============================================================
# DB 테이블/컬럼명 리팩토링 치환 스크립트
# 기준: refactoring guid.text의 치환 규칙
# 대상: Java, MyBatis XML, JS, HTML 파일
# 주의: password는 Spring Security UserDetails 인터페이스 충돌로 제외
# =============================================================

PROJECT_DIR="/Users/ikyoungtae/work/M-VIMS-PRJ_FOLDER"

echo "=== 리팩토링 치환 스크립트 시작 ==="
echo "대상 디렉토리: $PROJECT_DIR"

# 대상 파일 목록 생성 (라이브러리 제외)
TARGET_FILES=$(find "$PROJECT_DIR" -type f \( -name '*.java' -o -name '*.xml' -o -name '*.js' -o -name '*.html' -o -name '*.properties' \) \
    -not -path '*/target/*' \
    -not -path '*/build/*' \
    -not -path '*/.git/*' \
    -not -path '*/node_modules/*' \
    -not -path '*/refactoring*' \
    -not -path '*/fontawesome/*' \
    -not -path '*/jquery*' \
    -not -path '*/quill*' \
    -not -path '*/xlsx*' \
    -not -path '*/image-resize*' \
    -not -path '*/axios.js')

FILE_COUNT=$(echo "$TARGET_FILES" | wc -l | tr -d ' ')
echo "대상 파일 수: $FILE_COUNT"

# 치환 함수
do_replace() {
    local OLD="$1"
    local NEW="$2"
    local DESC="$3"
    
    if [ "$OLD" = "$NEW" ]; then
        return
    fi
    
    local matched_files=$(echo "$TARGET_FILES" | tr '\n' '\0' | xargs -0 grep -l "$OLD" 2>/dev/null)
    local count=$(echo "$matched_files" | grep -c '.' 2>/dev/null || echo "0")
    
    if [ "$count" -gt 0 ]; then
        echo "  [$DESC] $OLD → $NEW ($count 파일)"
        echo "$matched_files" | while read f; do
            if [ -n "$f" ]; then
                sed -i '' "s|${OLD}|${NEW}|g" "$f"
            fi
        done
    fi
}

# =============================================================
# 1단계: 테이블명 치환 (긴 것부터 - 부분매칭 방지)
# =============================================================
echo ""
echo "=== 1단계: 테이블명 치환 ==="

do_replace "SYS_ACCS_GROUP_MENU" "SYS_ACS_GRP_MENU" "테이블"
do_replace "SYS_SITE_CONFIG_GROUP" "SYS_SITE_CFG_GRP" "테이블"
do_replace "SYS_SITE_CONFIG" "SYS_SITE_CFG" "테이블"
do_replace "SYS_CODE_GROUP" "SYS_CD_GRP" "테이블"
do_replace "SYS_DEPT_GROUP" "SYS_DEPT_GRP" "테이블"
do_replace "SYS_USER_GROUP" "SYS_USER_GRP" "테이블"
do_replace "SYS_EVENT_LOG" "SYS_EVT_LOG" "테이블"
do_replace "SYS_ACCS_LOG" "SYS_ACS_LOG" "테이블"
do_replace "SYS_FILE_DETAIL" "SYS_FILE_DTL" "테이블"
do_replace "SYS_BBS_BOARD" "SYS_BBS_BRD" "테이블"
do_replace "SYS_BBS_REPLY" "SYS_BBS_RPLY" "테이블"
do_replace "SYS_OFFICE" "SYS_OFFC" "테이블"

# =============================================================
# 2단계: 컬럼명 치환 - 대문자 (Message.js key, HTML id 등)
# 긴 패턴부터
# =============================================================
echo ""
echo "=== 2단계: 컬럼명 치환 (대문자) ==="

# 공통 SYSTEM 컬럼들
do_replace "ACCESS_RIGHTS_GROUP_ID" "ACS_RTS_GRP_ID" "대문자"
do_replace "SYSTEM_CREATE_USERID" "SYS_CRT_USR_ID" "대문자"
do_replace "SYSTEM_UPDATE_USERID" "SYS_UPD_USR_ID" "대문자"
do_replace "SYSTEM_CREATE_DATE" "SYS_CRT_DT" "대문자"
do_replace "SYSTEM_UPDATE_DATE" "SYS_UPD_DT" "대문자"
do_replace "SYSTEM_LOGIN_DATE" "SYS_LOGIN_DT" "대문자"
do_replace "SYSTEM_LOGOUT_DATE" "SYS_LOGOUT_DT" "대문자"

# CONFIG 관련
do_replace "CONFIG_GROUP_NAME" "CFG_GRP_NM" "대문자"
do_replace "CONFIG_GROUP_ID" "CFG_GRP_ID" "대문자"
do_replace "CONFIG_VALUE" "CFG_VAL" "대문자"
do_replace "CONFIG_KEY" "CFG_KEY" "대문자"

# OFFICE 관련
do_replace "TOP_OFFICE_CODE" "TOP_OFFC_CD" "대문자"
do_replace "OFFICE_TYPE_CODE" "OFFC_TYPE_CD" "대문자"
do_replace "OFFICE_CODE" "OFFC_CD" "대문자"
do_replace "OFFICE_NAME" "OFFC_NM" "대문자"
do_replace "OFFICE_TYPE" "OFFC_TYPE" "대문자"

# MENU 관련
do_replace "TOP_MENU_CODE" "TOP_MENU_CD" "대문자"
do_replace "MENU_NAME_KR" "MENU_NM_KR" "대문자"
do_replace "MENU_NAME_EN" "MENU_NM_EN" "대문자"
do_replace "MENU_NAME_MN" "MENU_NM_MN" "대문자"
do_replace "MENU_NUMBER" "MENU_NO" "대문자"
do_replace "MENU_LEVEL" "MENU_LVL" "대문자"
do_replace "MENU_SEQUENCE" "MENU_SEQ" "대문자"
do_replace "P_MENU_CODE" "P_MENU_CD" "대문자"
do_replace "MENU_CODE" "MENU_CD" "대문자"

# GROUP 관련
do_replace "TOP_GROUP_ID" "TOP_GRP_ID" "대문자"
do_replace "GROUP_LEVEL" "GRP_LVL" "대문자"
do_replace "GROUP_NAME" "GRP_NM" "대문자"
do_replace "GROUP_ID" "GRP_ID" "대문자"

# CODE 관련
do_replace "CODE_NUMBER" "CD_NO" "대문자"
do_replace "CODE_NAME" "CD_NM" "대문자"
do_replace "CODE_ID" "CD_ID" "대문자"

# USER 관련
do_replace "USER_NAME" "USER_NM" "대문자"
do_replace "ADDRESS_DETAIL" "ADDR_DTL" "대문자"
do_replace "POSTAL_CODE" "POST_CD" "대문자"
do_replace "IP_ADDRESS" "IP_ADDR" "대문자"
# 단독 ADDRESS (IP_ADDRESS 이미 치환 후)
do_replace "ADDRESS" "ADDR" "대문자"
do_replace "PASSWORD" "PWD" "대문자"

# 디바이스/브라우저 관련
do_replace "DEVICE_TYPE" "DEV_TYPE" "대문자"
do_replace "OS_NAME" "OS_NM" "대문자"
do_replace "BROWSER_NAME" "BRWSR_NM" "대문자"

# BBS 관련
do_replace "WRITER_NAME" "WRTR_NM" "대문자"
do_replace "HIT_COUNT" "HIT_CNT" "대문자"
do_replace "THUMBNAIL" "THMBNL" "대문자"

# FILE 관련
do_replace "FILE_NAME" "FILE_NM" "대문자"
do_replace "FILE_SIZE" "FILE_SZ" "대문자"
do_replace "FILE_EXTENSION" "FILE_EXT" "대문자"

# ICON 관련
do_replace "ICON_CODE" "ICON_CD" "대문자"
do_replace "ICON_NAME" "ICON_NM" "대문자"
do_replace "ICON_CLASS" "ICON_CLS" "대문자"

# EVENT LOG 관련
do_replace "ACTION_TYPE" "ACT_TYPE" "대문자"
do_replace "TARGET_TABLE" "TGT_TBL" "대문자"
do_replace "TARGET_ID" "TGT_ID" "대문자"
do_replace "BEFORE_DATA" "BFR_DATA" "대문자"
do_replace "AFTER_DATA" "AFT_DATA" "대문자"

# TOKEN 관련
do_replace "EXPIRED" "EXP" "대문자"
do_replace "REVOKED" "REVOK" "대문자"

# =============================================================
# 3단계: 컬럼명 치환 - 소문자 (Java 필드명, MyBatis 바인딩)
# =============================================================
echo ""
echo "=== 3단계: 컬럼명 치환 (소문자) ==="

# 공통 SYSTEM 컬럼들
do_replace "access_rights_group_id" "acs_rts_grp_id" "소문자"
do_replace "system_create_userid" "sys_crt_usr_id" "소문자"
do_replace "system_update_userid" "sys_upd_usr_id" "소문자"
do_replace "system_create_date" "sys_crt_dt" "소문자"
do_replace "system_update_date" "sys_upd_dt" "소문자"
do_replace "system_login_date" "sys_login_dt" "소문자"
do_replace "system_logout_date" "sys_logout_dt" "소문자"

# CONFIG 관련
do_replace "config_group_name" "cfg_grp_nm" "소문자"
do_replace "config_group_id" "cfg_grp_id" "소문자"
do_replace "config_value" "cfg_val" "소문자"
do_replace "config_key" "cfg_key" "소문자"

# OFFICE 관련
do_replace "top_office_code" "top_offc_cd" "소문자"
do_replace "office_type_code" "offc_type_cd" "소문자"
do_replace "office_code" "offc_cd" "소문자"
do_replace "office_name" "offc_nm" "소문자"
do_replace "office_type" "offc_type" "소문자"

# MENU 관련
do_replace "top_menu_code" "top_menu_cd" "소문자"
do_replace "menu_name_kr" "menu_nm_kr" "소문자"
do_replace "menu_name_en" "menu_nm_en" "소문자"
do_replace "menu_name_mn" "menu_nm_mn" "소문자"
do_replace "menu_number" "menu_no" "소문자"
do_replace "menu_level" "menu_lvl" "소문자"
do_replace "menu_sequence" "menu_seq" "소문자"
do_replace "p_menu_code" "p_menu_cd" "소문자"
do_replace "menu_code" "menu_cd" "소문자"

# GROUP 관련
do_replace "top_group_id" "top_grp_id" "소문자"
do_replace "group_level" "grp_lvl" "소문자"
do_replace "group_name" "grp_nm" "소문자"
do_replace "group_id" "grp_id" "소문자"

# CODE 관련
do_replace "code_number" "cd_no" "소문자"
do_replace "code_name" "cd_nm" "소문자"
do_replace "code_id" "cd_id" "소문자"

# USER 관련
do_replace "user_name" "user_nm" "소문자"
do_replace "address_detail" "addr_dtl" "소문자"
do_replace "postal_code" "post_cd" "소문자"
do_replace "ip_address" "ip_addr" "소문자"

# 디바이스/브라우저 관련
do_replace "device_type" "dev_type" "소문자"
do_replace "browser_name" "brwsr_nm" "소문자"
do_replace "os_name" "os_nm" "소문자"

# BBS 관련
do_replace "writer_name" "wrtr_nm" "소문자"
do_replace "hit_count" "hit_cnt" "소문자"

# FILE 관련
do_replace "file_name" "file_nm" "소문자"
do_replace "file_size" "file_sz" "소문자"
do_replace "file_extension" "file_ext" "소문자"

# ICON 관련
do_replace "icon_code" "icon_cd" "소문자"
do_replace "icon_name" "icon_nm" "소문자"
do_replace "icon_class" "icon_cls" "소문자"

# EVENT LOG 관련
do_replace "action_type" "act_type" "소문자"
do_replace "target_table" "tgt_tbl" "소문자"
do_replace "target_id" "tgt_id" "소문자"
do_replace "before_data" "bfr_data" "소문자"
do_replace "after_data" "aft_data" "소문자"

# =============================================================
# 4단계: 특수 처리 (password, address, expired, revoked)
# password: Java 필드 'password'를 'pwd'로 변경하면 
#           Spring Security UserDetails.getPassword()와 충돌
#           → MyBatis XML에서 컬럼 alias 사용 또는 resultMap 사용 권장
#           → 여기서는 Java 필드 'password'와 MyBatis XML 모두 변경
#              단, getPassword() 오버라이드 메서드는 pwd를 반환하도록 수정
# address: 단독 필드 (ip_address, address_detail은 이미 처리됨)
# =============================================================
echo ""
echo "=== 4단계: 특수 컬럼 치환 ==="

# password → pwd (Java 필드 + MyBatis)
# AuthUser.java 등에서 private String password → private String pwd
# 그리고 getPassword()에서 return password → return pwd
echo "  password → pwd..."
for f in $(echo "$TARGET_FILES" | tr '\n' '\0' | xargs -0 grep -rl 'password' 2>/dev/null | grep -v fontawesome | grep -v jquery); do
    if [ -n "$f" ]; then
        # MyBatis XML: password 컬럼과 바인딩 모두 변경
        # Java: 필드명 변경
        sed -i '' 's/private String password;/private String pwd;/g' "$f"
        sed -i '' 's/private String password /private String pwd /g' "$f"
        # MyBatis #{password} → #{pwd}
        sed -i '' 's/#{password}/#{pwd}/g' "$f"
        # MyBatis password = (SQL 컬럼) → pwd = 
        sed -i '' 's/password = #{pwd}/pwd = #{pwd}/g' "$f"
        # SQL 내 컬럼 참조 (SELECT 목록 등)
        sed -i '' 's/, password/, pwd/g' "$f"
        sed -i '' 's/password,/pwd,/g' "$f"
        # test="password 조건
        sed -i '' 's/test="password/test="pwd/g' "$f"
        sed -i '' 's/test="_password/test="_pwd/g' "$f"
        # #{_password} → #{_pwd}
        sed -i '' 's/#{_password}/#{_pwd}/g' "$f"
        sed -i '' 's/_password/_pwd/g' "$f"
        # getPassword return
        sed -i '' 's/return password;/return pwd;/g' "$f"
    fi
done

# address (단독) → addr
# ip_address는 이미 ip_addr로 변경됨
# address_detail은 이미 addr_dtl로 변경됨
echo "  address → addr (단독 필드)..."
for f in $(echo "$TARGET_FILES" | tr '\n' '\0' | xargs -0 grep -rl '\baddress\b' 2>/dev/null | grep -v fontawesome | grep -v jquery); do
    if [ -n "$f" ]; then
        # Java 필드
        sed -i '' 's/private String address;/private String addr;/g' "$f"
        # MyBatis 바인딩
        sed -i '' 's/#{address}/#{addr}/g' "$f"
        sed -i '' 's/address = #{addr}/addr = #{addr}/g' "$f"
        # SQL 컬럼
        sed -i '' 's/, address/, addr/g' "$f"
        sed -i '' 's/address,/addr,/g' "$f"
        # _address (검색용)
        sed -i '' 's/_address/_addr/g' "$f"
        # test="address
        sed -i '' 's/test="address/test="addr/g' "$f"
    fi
done

# thumbnail → thmbnl (소문자)
do_replace "thumbnail" "thmbnl" "소문자"

# expired → exp (Token 관련 파일만)
echo "  expired → exp (Token관련)..."
for f in $(echo "$TARGET_FILES" | tr '\n' '\0' | xargs -0 grep -l 'expired' 2>/dev/null | grep -iE 'token|auth'); do
    if [ -n "$f" ]; then
        sed -i '' 's/expired/exp/g' "$f"
    fi
done

# revoked → revok (Token 관련 파일만)
echo "  revoked → revok (Token관련)..."
for f in $(echo "$TARGET_FILES" | tr '\n' '\0' | xargs -0 grep -l 'revoked' 2>/dev/null | grep -iE 'token|auth'); do
    if [ -n "$f" ]; then
        sed -i '' 's/revoked/revok/g' "$f"
    fi
done

# =============================================================
# 5단계: 함수명 치환
# =============================================================
echo ""
echo "=== 5단계: 함수명 치환 ==="

do_replace "FN_GET_OFFICE_NAME" "FN_GET_OFFC_NM" "함수"
do_replace "FN_GET_SYS_CODE_NAME" "FN_GET_SYS_CD_NM" "함수"

# =============================================================
# 6단계: 함수내 파라미터명 치환
# =============================================================
echo ""
echo "=== 6단계: 함수내 파라미터명 ==="

do_replace "p_OFFICE_CODE" "p_OFFC_CD" "파라미터"
do_replace "v_OFFICE_NAME" "v_OFFC_NM" "파라미터"
do_replace "p_GROUP_ID" "p_GRP_ID" "파라미터"
do_replace "p_CODE_ID" "p_CD_ID" "파라미터"
do_replace "v_COMMON_CODE_NAME" "v_COMMON_CD_NM" "파라미터"
do_replace "COM_CODE" "COM_CD" "파라미터"

# =============================================================
# 7단계: TOKEN_SEQ 관련 컬럼 치환
# =============================================================
echo ""
echo "=== 7단계: TOKEN_SEQ 관련 ==="

do_replace "next_not_cached_value" "nxt_not_chcd_val" "시퀀스"
do_replace "minimum_value" "min_val" "시퀀스"
do_replace "maximum_value" "max_val" "시퀀스"
do_replace "start_value" "start_val" "시퀀스"
do_replace "cache_size" "cache_sz" "시퀀스"
do_replace "cycle_option" "cycle_opt" "시퀀스"
do_replace "cycle_count" "cycle_cnt" "시퀀스"

echo ""
echo "=== 리팩토링 치환 완료 ==="
echo ""
echo "주의사항:"
echo "1. AuthUser.java의 getPassword()에서 return pwd; 로 변경됨 - 확인 필요"
echo "2. password Java 필드가 pwd로 변경됨 → Spring Security 연동 확인 필요"
echo "3. 빌드 및 테스트를 실행하여 정상 작동을 확인하세요"
