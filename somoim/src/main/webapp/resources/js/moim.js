let partList = document.querySelectorAll('.partList');

partList.forEach( (item) => {
    item.addEventListener('mouseover', function(){  //  mouseover 시 hover 클래스 추가
        item.classList.add('hoverMem');
    });
});
partList.forEach( (item) => {
    item.addEventListener('mouseout', function(){   //  mouseout 시 hover 클래스 삭제
        item.classList.remove('hoverMem');
    });
});
partList.forEach( (item) => {  // 클릭시 해당 유저정보창으로 이동
    item.addEventListener('click', () => {
        const userId = item.lastElementChild.getAttribute("id");
        location.href = "/somoim/info/userInfo?id=" + userId;
    });
});