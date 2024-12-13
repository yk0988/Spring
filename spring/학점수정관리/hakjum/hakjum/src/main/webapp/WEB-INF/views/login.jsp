<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
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

        .login-container {
            background-color: #f9f9f9; /* 연한 회색 배경 */
            padding: 30px;
            border-radius: 8px; /* 둥근 모서리 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            width: 300px; /* 로그인 박스 너비 */
        }

        h1 {
            text-align: center;
            color: #333;
        }

        p {
            margin-bottom: 15px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #87CEEB; /* 하늘색 */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #66b3cc; /* 하늘색 버튼 hover 효과 */
        }

        input::placeholder {
            color: #888;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h1>로그인</h1>
        <form action="/Hakjum/login" method="post">
            <p>ID(이름): <input type="text" name="studentName" placeholder="학생이름"></p>
            <p>PW(학번): <input type="password" name="studentId" placeholder="학번"></p>
            <input type="submit" value="로그인">
        </form>
    </div>

</body>
</html>
