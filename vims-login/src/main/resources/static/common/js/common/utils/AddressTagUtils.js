/**
 * @title : 주소
 * @text : 다음주소 api
 *  ex) owner_addr-btn / owner_addr / owner_addr_dtl / owner_post_cd (명명규칙 주의)
 * @see : button[gi-address]
 * @writer : 진은영
 */
class GiAddress {
    constructor() {
        this.initAddressSearch();
    }

    initAddressSearch() {
        const buttons = $("button[gi-address]");
        // 이벤트 리스너 중복 생성 방지
        buttons.off("click");
        buttons.each((i, button) => {
            $(button).on("click", (event) => {
                this.showAddressSearch(event);
            });
        });
    }

    showAddressSearch(event) {
        const button = $(event.target);
        // 공동소유자처럼 동일한 form이 반복되는 경우 끝에 인덱스('-1')를 붙여도 사용 가능 하도록 수정
        const id_parts = button.attr('id').split('-');
        let index = null;
        let id = undefined;

        id_parts.forEach(function (part) {
            if (!isNaN(part)) {
                index = part; // 숫자인 부분을 index로 저장
            } else if (part !== 'btn') {
                id = part;
            }
        });
        let input_addr, input_addr_dtl, input_post_cd;

        if (index) {
            input_addr = $('#' + id + '-' + index);                                    //transferee_use_addr-2
            input_addr_dtl = $('#' + id + '_detail' + '-' + index);                  //transferee_use_addr_dtl-2
            input_post_cd = $('#' + id.replace(/_addr$/, '') + '_post_cd' + '-' + index);  //transferee_use_post_cd-2
        } else {
            input_addr = $('#' + id);                                                  //transferee_use_addr
            input_addr_dtl = $('#' + id + '_detail');                               //transferee_use_addr_dtl
            input_post_cd = $('#' + id.replace(/_addr$/, '') + '_post_cd');    //transferee_use_post_cd

            if (id === 'address') input_post_cd = $('#post_cd'); // '내 정보 수정' 페이지
        }

        new daum.Postcode({
            oncomplete: (data) => {
                if (input_addr_dtl.val() && input_addr_dtl.val().length !== 0) {
                    input_addr_dtl.val('');
                }
                // focusing & data binding(addr, postal code)
                setTimeout(() => {
                    input_addr.focus();
                    input_addr.val(data.address).trigger("change");
                    if (input_post_cd.length) {
                        input_post_cd.val(data.zonecode);
                    }
                    input_addr_dtl.focus();
                }, 100);
                commonTag.inputTagFocus(input_addr);
            }
        }).open();
    }
}
