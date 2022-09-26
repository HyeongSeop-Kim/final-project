let category;
let prof;
let modjob;
let addmeeting;
let modmeeting;
let id;
let pw;
let join;

// 아이디 찾기 팝업
function popId(){
    if (!id){       //최초 클릭이면 팝업을 띄운다
        let popUrl = "findId";
        idClip =window.open(popUrl, '_blank', 'width=500, height=600, resizable=no, location=no');
        id = true;
    }
    else{           //최초 클릭이 아니면
        if(!idClip.closed && idClip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
            idClip.focus();
        }
        else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
            let popUrl = "findId";
            idClip =window.open(popUrl, '_blank', 'width=500, height=600');
            id = true;
        }
    }
};

// 비밀번호 찾기 팝업
function popPw(){
    if (!pw){       //최초 클릭이면 팝업을 띄운다
        let popUrl = "findPw";
        pwClip =window.open(popUrl, '_blank', 'width=500, height=600 ');
        pw = true;
    }
    else{           //최초 클릭이 아니면
        if(!pwClip.closed && pwClip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
            pwClip.focus();
        }
        else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
            let popUrl = "findPw";
            pwClip =window.open(popUrl, '_blank', 'width=500, height=600');
            pw = true;
        }
    }
};

// 회원가입 팝업
function popJoin(){
    if (!join){       //최초 클릭이면 팝업을 띄운다
        let popUrl = "join";
        joinClip =window.open(popUrl, '_blank', 'width=550, height=920');
        join = true;
    }
    else{           //최초 클릭이 아니면
        if(!joinClip.closed && joinClip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
            joinClip.focus();
        }
        else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
            let popUrl = "join";
            joinClip =window.open(popUrl, '_blank', 'width=550, height=920');
            join = true;
        }
    }
};

// 관심사 선택 팝업
function popCategory(){
    if (!category){
        let popUrl = "/somoim/category";
        Clip =window.open(popUrl, '_blank', 'width=550, height=900');
        category = true;
    }
    else{
        if(!Clip.closed && Clip){
            Clip.focus();
        }
        else{
            let popUrl = "/somoim/category";
            Clip =window.open(popUrl, '_blank', 'width=550, height=900');
            category = true;
        }
    }
};

// 프로필 편집 팝업
function popModProfile(){
    if (!prof){
        let popUrl = "modProfile";
        Clip =window.open(popUrl, '_blank', 'width=550, height=900');
        prof = true;
    }
    else{
        if(!Clip.closed && Clip){
            Clip.focus();
        }
        else{
            let popUrl = "modProfile";
            Clip =window.open(popUrl, '_blank', 'width=550, height=900');
            prof = true;
        }
    }
};

function popModJob(param){
    if (!modjob){
        let popUrl = "modJob?id=" + param;
        Clip =window.open(popUrl, '_blank', 'width=550, height=900');
        modjob = true;
    }
    else{
        if(!Clip.closed && Clip){
            Clip.focus();
        }
        else{
            let popUrl = "modJob?id=" + param;
            Clip =window.open(popUrl, '_blank', 'width=550, height=900');
            modjob = true;
        }
    }
};

function popAddMeeting(param){
    if (!addmeeting){
        let popUrl = "addMeeting?id=" + param;
        Clip =window.open(popUrl, '_blank', 'width=550, height=900');
        addmeeting = true;
    }
    else{
        if(!Clip.closed && Clip){
            Clip.focus();
        }
        else{
            let popUrl = "addMeeting?id=" + param;
            Clip =window.open(popUrl, '_blank', 'width=550, height=900');
            addmeeting = true;
        }
    }
};

function popModMeeting(meetingId, moimId){
    if (!modmeeting){
        let popUrl = "modMeeting?meetingId=" + meetingId + "&moimId=" + moimId;
        Clip =window.open(popUrl, '_blank', 'width=550, height=900');
        modmeeting = true;
    }
    else{
        if(!Clip.closed && Clip){
            Clip.focus();
        }
        else{
            let popUrl = "modMeeting?meetingId=" + meetingId + "&moimId=" + moimId;
            Clip =window.open(popUrl, '_blank', 'width=550, height=900');
            modmeeting = true;
        }
    }
};

// 팝업 닫기
function popClose() {
    window.close();
}