<%@ page contentType = "text/html; charset=euc-kr" %>

 

<html>
<head><title>종족 등록</title></head>
<body>
      <h3>종족 등록함</h3>
 
      <form method = "post" action = kindinsertinsert.jsp>
            종족이름 : <input type = "text" name = "kname"><p>
            공격력 : <input type = "text" name = "att"><p>
            방어력 : <input type = "text" name = "den"><p>
            체력 : <input type = "text" name = "sta"><p>
	   마나 : <input type = "text" name = "mag"><p>
	    에너지: <input type = "text" name = "ene"><p>
	   지능 : <input type = "text" name = "inte"><p>
            
            <input type = "submit" value = "등록">
      </form>
</body>
</html>
