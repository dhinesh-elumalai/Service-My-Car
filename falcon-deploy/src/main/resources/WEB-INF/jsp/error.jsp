<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>

        <div id="page-container" class="main-content-boxed">
            <!-- Main Container -->
            <main id="main-container">
                <!-- Page Content -->
                <div class="hero bg-white" style="background-image:url('${pageContext.request.contextPath}/static/img/photos/falcon1@2x.jpg');background-size: cover;background-repeat: no-repeat; overflow:hidden">
                    <div class="bg-primary-dark-op width-100" style="padding: 15% 0px;">
                        <div class="hero-inner">
                       	<div class="content content-full">
                            <div class="py-30 text-center">
                                <div 
                                <c:if test='${status==400||status==999}'>class="display-3 text-warning"</c:if>
                                <c:if test='${status==401}'>class="display-3 text-info"</c:if>
                                <c:if test='${status==403}'>class="display-3 text-corporate"</c:if>
                                <c:if test='${status==404}'>class="display-3 text-danger"</c:if>
                                <c:if test='${status==500}'>class="display-3 text-flat"</c:if>
                                <c:if test='${status==503}'>class="display-3 text-elegance"</c:if>
                               >
                               <c:if test='${status==401}'> <i class="fa fa-lock"></i> </c:if>
                                <c:if test='${status==403}'> <i class="fa fa-ban"></i> </c:if>
                                <c:if test='${status==404}'> <i class="fa fa-warning"></i> </c:if>
                                <c:if test='${status==500}'> <i class="fa fa-times-circle-o"></i> </c:if>
                                <c:if test='${status==503}'> <i class="fa fa-database"></i> </c:if>
                               ${status}</div>
                                <h1 class="h2 font-w700 mt-30 mb-10" style="color:#fff">Oops.. You just found an error page..</h1>
                                <h2 class="h3 font-w400 mb-50" style="color:#fff">${message}</h2>
                                <a class="btn btn-hero btn-rounded btn-alt-secondary"  onclick="goBack()" data-toggle="click-ripple">
                                    <i class="fa fa-arrow-left mr-10"></i> Back 
                                </a>
                            </div>
                        </div>
                    </div> 
                       </div>
                </div>
                <!-- END Page Content -->
            </main>
            <!-- END Main Container -->
        </div>
	
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>