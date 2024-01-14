<%@ page contentType = "text/html; charset=euc-kr" %>

 

<html>
<head><title>아이템 등록</title></head>
<body>
      <h3>아이템 등록함</h3>
 
      <form method = "post" action = "iteminsert.jsp">
            아이템명 : <input type = "text" name = "iname"><p>
            종류 : <input type = "text" name = "ikind"><p>
            공격력업 : <input type = "text" name = "att"><p>
             방어력업 : <input type = "text" name = "den"><p>
            에너지업 : <input type = "text" name = "ene"><p>
            지능업 : <input type = "text" name = "inte"><p>
            <input type = "submit" value = "등록">
      </form>
</body>
</html>
