<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous">
    </script>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <style>
        body {
            background-color: white; /* 하얀 배경 */
            font-family: Arial, sans-serif; /* 폰트 설정 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 전체 높이 */
            margin: 0;
        }

        .member-info-container {
            background-color: #f9f9f9; /* 연한 회색 배경 */
            padding: 30px;
            border-radius: 8px; /* 둥근 모서리 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            width: 350px; /* 폼 박스 너비 */
            position: relative; /* 홈 버튼을 오른쪽에 배치할 공간을 확보 */
        }

        h1 {
            text-align: center;
            color: #333;
        }

        p {
            margin-bottom: 15px;
        }

        .home-link {
            position: absolute;
            top: 30px;
            right: 30px;
            font-size: 14px;
            text-decoration: none;
            color: #333;
        }

        .home-link:hover {
            color: #66b3cc; /* 호버시 색 변경 */
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        .button-container a {
            background-color: #87CEEB; /* 하늘색 */
            color: white;
            padding: 8px 0;
            border: none;
            border-radius: 4px;
            width: 48%; /* 버튼 크기를 50%로 설정 */
            text-align: center;
            display: inline-block;
            text-decoration: none;
        }

        .button-container a:hover {
            background-color: #66b3cc; /* 하늘색 버튼 hover 효과 */
        }

        /* 회원 정보 텍스트 */
        .member-info p {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>

    <div class="member-info-container">
        <!-- 홈 링크 오른쪽 정렬 -->

        <h1>로그인 성공^0^</h1>

        <div class="member-info">
            <p><strong>학생 ID:</strong> ${hakjumDTO.studentId}</p>
            <p><strong>학생 이름:</strong> ${hakjumDTO.studentName}</p>
            <p><strong>국어 점수:</strong> ${hakjumDTO.koreanScore}</p>
            <p><strong>영어 점수:</strong> ${hakjumDTO.englishScore}</p>
            <p><strong>수학 점수:</strong> ${hakjumDTO.mathScore}</p>
        </div>

        <!-- 회원 정보 확인 후 '홈' 버튼 -->
        <div class="button-container">
            <a href="/Hakjum/index">학점관리로 돌아가기</a>
            <a href="/Hakjum/index">집으로 돌아가기</a>
        
        </div>
    </div>

    <script>
        // 쿼리스트링에서 'message' 파라미터 값이 있으면 alert 띄우기
        const message = getQueryStringParameter('message');
        if (message) {
            alert(message);
        }

        // 쿼리스트링에서 파라미터 가져오는 함수
        function getQueryStringParameter(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }
    </script>

</body>
</html>
