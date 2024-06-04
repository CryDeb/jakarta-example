<%@ page import="java.security.cert.X509Certificate" %>
<%@ page import="java.security.Principal" %><%--
  Created by IntelliJ IDEA.
  User: edw01
  Date: 29.05.24
  Time: 07:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="Find Certificate Info" var="title" />
<html>
<head>
    <title>
        <c:out value="${title}" />
    </title>
</head>
<head><title>SSL JSP from <%=request.getServerName() %> </title></head>
<body>
<%
    out.println ("Scheme: " + request.getScheme());
    out.println ("Protocol: " + request.getProtocol());
%>
<% X509Certificate certChain[] = (X509Certificate[]) request.getAttribute("jakarta.servlet.request.X509Certificate");
    if (certChain != null) {
    /* for debug ...
    for (int i = 0; i < certChain.length; i++) {
      out.println ("Client Certificate [" + i + "] = "
                      + certChain[i].toString());
    }
     */
        X509Certificate principalCert = certChain[0];
        Principal principal = principalCert.getSubjectX500Principal();
        out.println ("Name: " + principal.getName());
    } else {
        out.println ("Fail no cert :-(");
    }

%>
</body>
</html>