<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<script>
    const deleteMember = (id) => {
        console.log(id);
        location.href = "/Hakjum/delete?id=" + id;
    }
</script>
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
        
           /* div 전체를 감싸는 큰 테두리 */
        .container2 {
            width:400px;
            margin: 0 auto;
            padding: 20px;
            border: none* 테두리 추가 */
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

		h1{
		 text-align: center;
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
    <div class="container">
        <div class="header">
            <h3>학점 관리</h3>
            <p><a href="/Hakjum/">찾기</a></p>
        </div>
        <p><a href="/Hakjum/login">로그인</a></p>
        <p><a href="/Hakjum/save">학생 등록</a></p>
    </div>
     <div class="container2">
   
   	<tr>
     <h1>List</h1>
    <table>
        <tr>
            <th>학번</th>
            <th>이름</th>
            <th>국어</th>
            <th>영어</th>
            <th>수학</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
      
        <c:forEach items="${hakjumList}" var="hakjum">
            <tr>
                <td>${hakjum.studentId}</td>
                <td>${hakjum.studentName}</td>
                <td>${hakjum.koreanScore}</td>
                <td>${hakjum.englishScore}</td>
                <td>${hakjum.mathScore}</td>
                <td>
                    <a href="/Hakjum/modify?studentId=${hakjum.studentId}">수정</a>
                </td>
                <td>
                    <button onclick="deleteMember('${hakjum.studentId}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
     </div>
</body>

</html>
