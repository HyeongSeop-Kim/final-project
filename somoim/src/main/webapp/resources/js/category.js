// 변수 선언
var category;
var items = document.querySelectorAll(".col-4 .service-items");

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
        var childs = item.children;
        var chk = true;

        for(child of childs) {  // 이미 선택되었는지 확인
            if(child.className == 'check-badge'){
                var sel = child;
                chk = false;
            }
        };
        if(chk){    //  선택이 안되었으면 추가
            if(selectCntCheck()) {  // 선택된 갯수 확인
                var span = document.createElement('span');
                var i = document.createElement('i');
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
    var cnt = document.querySelectorAll('.check-badge').length;
    if(cnt>=3) {
        return false;
    }
    return true;
}

function submitCategory() {
    // var selectData = document.querySelectorAll('.check-badge')
    // var
    // $.ajax({
    //     type: "post",
    //     url: "/",
    //     data:
    //
    // })
}


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