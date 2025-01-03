<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학점 관리</title>
    <style>
        /* 전체 페이지 배경을 하얀색으로 설정 */
        body {
            background-color: white;
            font-family: Arial, sans-serif; /* 글꼴 설정 */
            color: #333; /* 텍스트 색상 */
            margin: 0;
            padding: 0;
            margin-top: 50px; /* 위쪽 여백 추가 */
        }
        
        /* div 전체를 감싸는 큰 테두리 */
        .container {
            width: 200px;
            margin: 0 auto;
            padding: 20px;
            border: 3px solid #007bff; /* 테두리 추가 */
            border-radius: 10px; /* 모서리 둥글게 */
        }

        /* flexbox로 두 요소를 가로로 배치 */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* 학점 관리 스타일 */
        h3 {
            color: #444;
            margin: 0;
        }

        /* 링크 스타일 */
        a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }

        /* 링크 hover 효과 */
        a:hover {
            text-decoration: underline;
        }

        /* p 스타일 */
        p {
            text-align: center;
            margin: 10px 0;
        }
    </style>
</head>
<body>
        <p><a href="/Hakjum/list">home</a></p>
</body>
</html>
