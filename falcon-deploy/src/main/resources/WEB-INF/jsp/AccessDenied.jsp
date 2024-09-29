<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%@include file="/static/js/pages/AccessDeniedCSS.jsp"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="error-template">
					<h1>Oops!</h1>
					<h2>Access Denied</h2>
					<div class="error-details">
						<h3>Sorry, You Don't Have Access To View This Page!!!</h3>
					</div>
					<div class="error-actions">
						<a href="${pageContext.request.contextPath}/home" class="btn btn-primary btn-lg" data-toggle="click-ripple"><span
							class="fa fa-home"></span>  Home</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>