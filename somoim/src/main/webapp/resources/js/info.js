// info, member 이미지 div, img 선택
const infoImgSelect = document.querySelector('#infoImg-input');
const infoImg = document.querySelector('#infoImg');
const infoImgBtn = document.querySelector('#infoImg-btn');
const profileImgSelect = document.querySelector('#profileImg-input');
const profileImg = document.querySelector('#profileImg');


infoImg.addEventListener('click', (e) => infoImgSelect.click());
infoImgBtn.addEventListener('click', (e) => infoImgSelect.click());
infoImgSelect.addEventListener("change", infoImageUpload);

profileImg.addEventListener('click', (e) => profileImgSelect.click());
profileImgSelect.addEventListener("change", profileImageUpload);

function infoImageUpload(e) {
    const file = e.target.files[0];
    let fData = new FormData();
    fData.append("uploadImage", file, file.name);

    $.ajax({
        type: "post",
        enctype: "multipart/form-data",
        url: "/somoim/ajax/infoUpload",
        data: fData,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function(data) {
            infoImg.src = data.infoUrl;
        }
    });
}

function profileImageUpload(e) {
    const file = e.target.files[0];
    let fData = new FormData();
    fData.append("uploadImage", file, file.name);

    $.ajax({
        type: "post",
        enctype: "multipart/form-data",
        url: "/somoim/ajax/profileUpload",
        data: fData,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function(data) {
            profileImg.src = data.profileUrl;
        }
    });
}




