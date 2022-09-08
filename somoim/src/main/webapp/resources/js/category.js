// 변수 선언
let category;
const items = document.querySelectorAll(".col-4 .service-items");

// hover 기능
items.forEach( (item) => {
    item.addEventListener('mouseover', function(){  //  mouseover 시 hover 클래스 추가
        item.classList.add('hover');
    });
});
items.forEach( (item) => {
    item.addEventListener('mouseout', function(){   //  mouseout 시 hover 클래스 추가
        item.classList.remove('hover');
    });
});

// 관심사 선택 기능
items.forEach( (item) => {
    item.addEventListener('click', function (){
        const childs = item.children;
        let chk = true;

        for(child of childs) {  // 이미 선택되었는지 확인
            if(child.className == 'check-badge'){
                var sel = child;
                chk = false;
            }
        };
        if(chk){    //  선택이 안되었으면 추가
            if(selectCntCheck() < 3) {  // 선택된 갯수 확인
                const span = document.createElement('span');
                const i = document.createElement('i');
                span.classList.add('check-badge');
                i.classList.add('fa-solid', 'fa-check');
                span.appendChild(i);
                item.appendChild(span);
                item.classList.add('selected');
            } else {
                alert('관심사는 최대 3개까지만 선택 할 수 있습니다.');
            }
        } else {    //  선택이 되어있으면 제거
            sel.parentNode.removeChild(sel);
            item.classList.remove('selected');
        }
    });
});

function selectCntCheck() { // 선택된 관심사 갯수 확인 함수
    const cnt = document.querySelectorAll('.check-badge').length;
    return cnt;
}

//  개인정보창 관심사 변경
function modifyCategory(selectDatas) {  // DB 수정 확인 후 작동 하도록
    const cate = document.querySelector('#cate');
    const before = document.querySelectorAll('#cate i');

    for(const data of before) {
        cate.removeChild(data);
    }

    for(const data of selectDatas){
        const i = document.createElement('i');
        const classList = 'icon-green service-sm-items ' + data
        i.setAttribute('class', classList);
        cate.insertBefore(i, cate.firstChild);
    }
}

//  개인정보창 관심사 변경 데이터 전송
function sendCategory() {
    if(selectCntCheck() < 1) {  // 관심사 미체크시 알람
        return alert('관심사는 적어도 하나 이상 선택해야합니다.');
    }

    let selectDatas = [];

    for(const data of document.querySelectorAll('.check-badge')) {
        let selectData = data.previousElementSibling.classList.value
        selectDatas.push(selectData);
    }
    // submitCategory()
    opener.modifyCategory(selectDatas);
    window.close();

}

// 데이터 전송후 db저장

// function submitCategory() {
//     let selectDatas = [];
//
//     for(const data of document.querySelectorAll('.check-badge')) {
//         let selectData = {};
//         selectData = { 'id' : data.parentElement.getAttribute('id') };
//         selectDatas.push(selectData);
//     }
//
//     console.log(selectDatas);
//     const jsonEncode = JSON.stringify(selectDatas);
//     console.log(jsonEncode);
//     $.ajax({
//         type: "post",
//         url: "ajax/cate",
//         contentType: "application/json",
//         data: jsonEncode,
//         dataType: "json",
//         success: (result) => {
//             console.log('성공');
//         },
//         error: () => {
//             console.log('실패');
//         }
//
//     })
// }


// 팝업 띄우기
function popCategory(){
    if (!category){       //최초 클릭이면 팝업을 띄운다
        let popUrl = "category";
        Clip =window.open(popUrl, '_blank', 'width=550, height=900');
        category = true;
    }
    else{           //최초 클릭이 아니면
        if(!Clip.closed && Clip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
            Clip.focus();
        }
        else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
            let popUrl = "category";
            Clip =window.open(popUrl, '_blank', 'width=550, height=900');
            category = true;
        }
    }
};

// 팝업 닫기
function popClose() {
    window.close();
}