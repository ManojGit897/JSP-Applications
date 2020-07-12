<%

  // read from the data 
  int v1=Integer.parseInt(request.getParameter("t1"));
  int v2=Integer.parseInt(request.getParameter("t2"));

// sum of two numbers 

int sum=v1+v2;
%>
   <b> Sum of two Numbers :<%= sum %></b>
   <br/>

  <% if(sum>1000){%>
   <b> sum is too Big</b>
  <% }
  
    else { %>
    <b>Sum is two Small</b>
   <% }






















%>