<%@ page contentType = "text/html; charset=euc-kr" %>

 

<html>
<head><title>스킬 등록</title></head>
<body>
      <h3>스킬 등록함</h3>
 
      <form method = "post" action = "mongeneralinsert.jsp">
            장군이름 : <input type = "text" name = "mgname"><p>
            나이 : <input type = "text" name = "mage"><p>
            공격력보정 : <input type = "text" name = "matt"><p>
 	   방어력보정 : <input type = "text" name = "mden"><p>
  	   이동력보정 : <input type = "text" name = "mov"><p>
            사기보정 : <input type = "text" name = "mor"><p>
            천적종족 : <input type = "text" name = "kind"><p>
            <input type = "submit" value = "등록">
      </form>
</body>
</html>
