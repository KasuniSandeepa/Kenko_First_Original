<%@ page import="models.Crops" %>
<%@ page import="services.CropsServices" %>
<%@ page import="models.CropTypes" %>
<%@ page import="services.CropTypesServices" %>
<%--
  Created by IntelliJ IDEA.
  User: NCCS
  Date: 2021-08-25
  Time: 7:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
</head>
<body>

<%@include file="CacheControl.jsp" %>

<%
    String CropIdString = request.getParameter("CropId");
    int CropId = Integer.parseInt(CropIdString);
    //--
    Crops Crops = new CropsServices().CropsGet(CropId);
    System.out.println(Crops.getCropTypes().getName());
    CropTypes CropTypes = new CropTypesServices().CropTypesGet(Crops.getPkCrops());
    String ImageUrl = "dist-assets/images/crops/".concat(CropTypes.getDefaultImage());
%>

<%=Crops.getCropTypes().getName()%>
<br>
<%=CropTypes.getDefaultImage()%>
<br>
<%=ImageUrl%>
<br>
<img src="<%=ImageUrl%>">

</body>
</html>
