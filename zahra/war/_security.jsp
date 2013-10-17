    <%@ page import="java.util.*" %>
    <script type="text/javascript">
    function check_number()
    {
    var r_number = document.getElementById("number").value;
    var u_number =document.getElementById("userI").value;
    if(r_number==u_number)
    alert("Good!");
    else
    alert("no pal");
    }
    </script>
    <%
    Random Generator = new Random();
    int r = Generator.nextInt(10000);
    %>
    <input id="number" type="hidden" value="<%=r%>" />
    <br/>
    <br/>
    <h2><%=r%></h2>
    <br/>
    <b>Enter Above Number:</b><input type="text" id="userI" /><input type="button" value="Check" onclick="check_number();" />