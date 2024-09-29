<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<head>
 <!-- Favicons -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/img/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/static/img/site.webmanifest">
<link rel="mask-icon" href="${pageContext.request.contextPath}/static/img/safari-pinned-tab.svg" color="#283A63">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="theme-color" content="#ffffff">
</head>
<body style="white-space: pre-wrap;font-family: SFMono-Regular,Menlo,Monaco,Consolas,Liberation Mono,Courier New,monospace">
<c:forEach items="${contents}" var="line">${line}
</c:forEach>
</body>