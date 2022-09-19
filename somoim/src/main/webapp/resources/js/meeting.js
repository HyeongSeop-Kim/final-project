// 유효성 검사 : 생년월일 월
const meetingMonthEl = document.querySelector('#meetingMonth')
// option 목록 생성 여부 확인
isMonthOptionExisted = false;
meetingMonthEl.addEventListener('focus', function () {
    // month 목록 생성되지 않았을 때 (최초 클릭 시)
    if(!isMonthOptionExisted) {
        isMonthOptionExisted = true
        for(var i = 1; i <= 12; i++) {
            // option element 생성
            const MonthOption = document.createElement('option')
            MonthOption.setAttribute('value', i)
            MonthOption.innerText = i
            // meetingmonthEl의 자식 요소로 추가
            this.appendChild(MonthOption);
        }
    }
});

// 유효성 검사 : 생년월일 일
const meetingDayEl = document.querySelector('#meetingDay')
// option 목록 생성 여부 확인
isDayOptionExisted = false;
meetingDayEl.addEventListener('focus', function () {
    // Day 목록 생성되지 않았을 때 (최초 클릭 시)
    if(!isDayOptionExisted) {
        isDayOptionExisted = true
        for(var i = 1; i <= 31; i++) {
            const DayOption = document.createElement('option')
            DayOption.setAttribute('value', i)
            DayOption.innerText = i
            this.appendChild(DayOption);
        }
    }
});

//유효 날짜 여부 확인
// [year, month, day]
const meetingArr = [-1, -1, -1]
const meetingErrorMsgEl =
    document.querySelector('#info__meeting .error-msg')

meetingMonthEl.addEventListener('change', () => {
    meetingArr[1] = meetingMonthEl.value
    checkMeetingValid(meetingArr)
});

meetingDayEl.addEventListener('change', () => {
    meetingArr[2] = meetingDayEl.value
    checkMeetingValid(meetingArr)
});

/* 유효한 날짜인지 여부 확인 (윤년/평년) */
function checkMeetingValid(meetingArr) {
    const date = new Date();
    var account =

        isMeetingValid = true

    y = date.getFullYear();
    m = meetingArr[1]
    d = meetingArr[2]
    // 생년월일 모두 선택 완료 시
    if(y > 0 && m > 0 && d > 0) {
        if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) {
            isMeetingValid = false
        }
        else if (m == 2) {
            if(((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) { // 윤년
                if(d > 29) { // 윤년은 29일까지
                    isMeetingValid = false
                }
            } else { // 평년
                if(d > 28) { // 평년은 28일까지
                    isMeetingValid = false
                }
            }
        }

        if(isMeetingValid) { // 유효한 날짜
            meetingErrorMsgEl.textContent = ""
            account.meeting = meetingArr.join('')
        } else { // 유효하지 않은 날짜
            meetingErrorMsgEl.textContent = errMsg.meeting
            account.meeting = null
        }
    }
};

function formCheck(form, moimId) {
    let meetingTitle = document.getElementById('meetingTitle');
    let meetingMonth = document.getElementsByName("month");
    let meetingDay = document.getElementsByName("day");
    let meetingTime = document.getElementById("meetingTime");
    let meetingPlace = document.getElementById('meetingPlace');
    let meetingPrice = document.getElementById('meetingPrice');
    let meetingLimit = document.getElementById('meetingLimit');

    if (meetingTitle.value === undefined || meetingTitle.value.trim() === "") {
        alert("정모 이름을 입력해주세요.");
        meetingTitle.focus();
        return false;
    }
    for (month of meetingMonth) {
        month.value;
    }

    if (month.value.trim() === "") {
        alert("정모 날짜를 입력해주세요.")
        return false;
    }
    for (day of meetingDay) {
        day.value;
    }

    if (day.value.trim() === "") {
        alert("정모 날짜를 입력해주세요.")
        return false;
    }

    if (meetingTime.value === undefined || meetingTime.value.trim() === "") {
        alert("정모 시간을 입력해주세요.");
        meetingTime.focus();
        return false;
    }
    if (meetingPlace.value === undefined || meetingPlace.value.trim() === "") {
        alert("정모 장소를 입력해주세요.");
        meetingPlace.focus();
        return false;
    }
    if (meetingPrice.value === undefined || meetingPrice.value.trim() === "") {
        alert("정모 지참금을 입력해주세요.");
        meetingPrice.focus();
        return false;
    }
    if (meetingLimit.value === undefined || meetingLimit.value.trim() === "") {
        alert("정원을 입력해주세요.");
        meetingLimit.focus();
        return false;
    }

    alert('정모가 등록되었습니다.');

    form.submit();

    move();

    function move() {
        setTimeout(() => {
            window.opener.location.href = "/somoim/moim/meeting?id=" + moimId;
            window.close();
        }, 2);
    }
}