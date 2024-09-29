<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<style>
.upload-demo .upload-demo-wrap,
.upload-demo .upload-result,
.upload-demo.ready .upload-msg {
    display: none;
}
.upload-demo.ready .upload-demo-wrap {
    display: block;
}
.upload-demo.ready .upload-result {
    display:block;
    margin: 5% auto;
    padding: 4px 8px;
    font-size: 16px 
}

.upload-demo-wrap {
     width: 100%;
    height: 300px;
    margin: 0 auto;
}

.upload-msg {
  text-align: center;
    padding: 50px;
    font-size: 22px;
    color: #171717;
    width: 100%;
    margin: 50px auto;
    border: 1px dashed #c0d9f3;
}
.upload-result{text-align: center;
   
  }
</style>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
	<div id="page-container"
		class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
		<!-- Main Container -->
		<main id="main-container"> 
		<!-- Page Content --> 
		<!-- Image Cropper functionality (initialized in js/pages/be_comp_image_cropper.js), for more info and examples you can check out https://fengyuanchen.github.io/cropperjs/ -->
		<div class="content">
			<!-- Toolbar -->
			<div class="block mb-10">
               <div class="demo-wrap upload-demo">
                    <div class="">
                    <div class="block block-bordered">
                    <div class="block-header block-header-default mb-20">
                    <h3 class="block-title text-uppercase">UPLOAD PROFILE PICTURE</h3>
							<div class="block-options">
						<a href="javascript:void(0);" class="btn btn-alt-danger" onclick="goBack()" data-toggle="click-ripple">Back</a>
					</div>
					
					
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/myprofile">Profile</a></li>
								<li class="breadcrumb-item active">Upload profile picture</li>
							</ul>
						</div>
                        <div class="col-md-12">
                        	<div class="col-1-2">
         
                            <div class="actions text-center select-img-btn" id="initialDiv">
                               <label class="custom-file-upload btn btn-alt-primary btn-lg">
                                    <input type="file" id="upload" value="Choose a file" accept="image/*" data-toggle="click-ripple"/>
                                    Select Image
                                    </label>
                            </div>
                        </div>
                        <div class="col-1-2">
                           <!--  <div class="upload-msg">
                                 Use 'Select Image' button to upload your picture
                            </div> -->
                            <div class="upload-demo-wrap">
                                <div id="upload-demo"></div>
                                <div id="upload-demo-result"></div>
                            </div>
                            <form id="form1" action="upload-profile-pic" method="post" >
                            <input type="hidden" id="imgbyte" name="image" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                                <div class="text-center upload-result">
<button class="btn btn-primary" type="button" id="upload_cropped" data-toggle="click-ripple">Crop & Upload</button>
                            
                            <label class="custom-file-upload btn btn-primary">
                             <input type="file" id="upload1" style="display: none;" value="" accept="image/*" data-toggle="click-ripple"/>
                                    Select Another Image
                             </label>
                           <button class="btn btn-danger" type="button" data-toggle="click-ripple" onclick="goBack()">Cancel</button>
                          </div>

                           </div>
                        </div>
                        </div> 
                    </div>
                </div>
                </div>
			</div>
		</div>
	</main>          
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<!-- Page JS Plugins -->
	<script src="${pageContext.request.contextPath}/static/js/plugins/croppie/croppie.min.js"></script>
	<script>
	var Demo = (function() {
		function demoUpload() {
			var $uploadCrop;
			function readFile(input) {
	 			if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            
		            reader.onload = function (e) {
						$('.upload-demo').addClass('ready');
		            	$uploadCrop.croppie('bind', {
		            		url: e.target.result
		            	}).then(function(){
		            		console.log('jQuery bind complete');
		            	});
		            	
		            }
		            
		            reader.readAsDataURL(input.files[0]);
		            $('#initialDiv').hide();
		        }
		        else {
			        alert("Sorry - you're browser doesn't support the FileReader API");
			    }
			}

			$uploadCrop = $('#upload-demo').croppie({
				viewport: {
					width: 180,
					height: 180,
					type: 'square'
				},
				enableExif: true
			});

			$('#upload').on('change', function () { readFile(this); });
			$('#upload1').on('change', function () { readFile(this); });
			$('#upload_cropped').on('click', function (ev) {
				$uploadCrop.croppie('result', {
					type: 'canvas',
					size: 'viewport'
				}).then(function (resp) {
					$("#imgbyte").val(resp);
					console.log(resp);
					$('#form1').submit();
				});
			});
		}


		function init() {
			demoUpload();
		}
		return {
			init: init
		};
	})();
	Demo.init();
</script>
</body>
</html>
