document.getElementById("checkBtn").addEventListener('click', function() {

    var memberId = document.getElementById("memberId").value;

    if (memberId.trim() === "") {

        alert('아이디를 입력해주세요.');

        return;
    }

    fetch(`/api/${memberId}/duplicate`, {

        method: 'GET',

        headers: {

            'Content-Type': 'application/json'

        }
    })

    .then(response => {

        if (response.status === 409) {

            alert('아이디가 중복됩니다.');
            document.getElementById("isDuplicate").value = 'true';

        } else if (response.status === 200) {

            alert('사용 가능한 아이디입니다.');
            document.getElementById("isDuplicate").value = 'false';

        } else {

            throw new Error('Unexpected response status: ' + response.status);

        }
    })

    .catch(error => {

        console.error('Error:', error);

    });
});