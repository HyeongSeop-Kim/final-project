const partList = document.querySelectorAll('.moim-member-info');

partList.forEach( (item) => {  // 클릭시 해당 유저정보창으로 이동
    item.addEventListener('click', () => {
        const userId = item.lastElementChild.getAttribute("id");
        location.href = "/somoim/info/userInfo?id=" + userId;
    });
});

const commentBtn = document.querySelector('#commentBtn');
const commentBox = document.querySelector('#commentBox');
commentBtn.addEventListener('click', () => {
    commentBox.classList.toggle('hidden');
})

const dropdownBtn = document.querySelector('#dropdownBtn');
const dropdownContent = document.querySelector('#dropdownContent');

dropdownBtn.addEventListener('click', () => {
    dropdownContent.classList.toggle('hidden');
});