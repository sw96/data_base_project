<%@ page contentType = "text/html; charset=euc-kr" %>

 

<html>
<head><title>마물군단 등록</title></head>
<body>
      <h3>마물군단 등록함</h3>
 
      <form method = "post" action = "monsterinsert.jsp">
            마물군단명 : <input type = "text" name = "mname"><p>
            병력수 : <input type = "text" name = "num"><p>
            공격력 : <input type = "text" name = "matt"><p>
            방어력 : <input type = "text" name = "mden"><p>
            이동력 : <input type = "text" name = "mov"><p>
            사기 : <input type = "text" name = "mor"><p>
            <input type = "submit" value = "등록">
      </form>
</body>
</html>
