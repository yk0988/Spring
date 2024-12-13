<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous">
    </script>
    <meta charset="UTF-8">
    <title>학생등록</title>
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

        .signup-container {
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

        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #87CEEB; /* 하늘색 */
            color: white;
            padding: 8px 0;
            border: none;
            border-radius: 4px;
            width: 48%; /* 버튼 크기를 50%로 설정 */
            cursor: pointer;
            font-size: 14px;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #66b3cc; /* 하늘색 버튼 hover 효과 */
        }

        #id-check-result {
            text-align: center;
            font-size: 14px;
            margin-top: 10px;
        }

        input::placeholder {
            color: #888;
        }

        /* 홈 버튼 오른쪽 정렬 */
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
    </style>
</head>
<body>

    <div class="signup-container">
        <!-- 홈 링크 오른쪽 정렬 -->
        <a href="/Hakjum/index" class="home-link">홈</a>

        <h1>점수 수정 & 삭제</h1>
        <form name="signupForm" action="/Hakjum/modify" method="post" onsubmit="return validateForm()">
            <!-- 학번 입력 필드 및 중복 체크 -->
            <input type="hidden" name="studentId" value="${hakjum.studentId}">
            <p>학번: <input type="text" id="studentId" value="${hakjum.studentId}" disabled></p>
            <p id="id-check-result"></p>
  			 <input type="hidden" name="studentName" value="${hakjum.studentName}">	
          	<p>이름: <input type="text" id="studentName" value="${hakjum.studentName}" disabled></p>
            <p>국어 점수: <input type="text" name="koreanScore" placeholder="국어 점수" value="${hakjum.koreanScore}" ></p>
            <p>영어 점수: <input type="text" name="englishScore" placeholder="영어 점수" value="${hakjum.englishScore}" ></p>
            <p>수학 점수: <input type="text" name="mathScore" placeholder="수학 점수" value="${hakjum.mathScore}" ></p>

            <div class="button-container">
                <input type="submit" value="수정">
                <input type="reset" value="삭제">
            </div>
        </form>
    </div>

 
</body>
</html>
