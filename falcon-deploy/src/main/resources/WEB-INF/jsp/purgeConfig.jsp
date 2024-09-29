<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<style>
.select2-container--default .select2-results__group
{
color: #236eb9;
}
</style>
<body>
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

 <main id="main-container">
<div class="content">
	<div class="block">
		<div class="block block-bordered">
			<div id="fixedSet">						
						<div class="block-header block-header-default">

							<h3 class="block-title">PURGE CONFIGURATION <br>
							<small class="mb-0 " style="font-size: small;">Note:<span> By default, the purge is set to run at 3:00 AM server time during installation. This is based on the timezone of the server where Falcon Deploy is installed. You can change the schedule on this page.</span></small>
							</h3>
						
						</div>
						<div class="col-md-12">
		<ul class="bg-none padding-left-0 breadcrumb mb-0">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
			<li class="breadcrumb-item active">Purge Confugration</li>
		</ul>
	</div>
						<div  class="">
						<c:choose>
							<c:when
								test="${status!=null}">
								<div class="modal fade" id="memberModal" tabindex="-1"
									role="dialog" aria-labelledby="memberModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
												<h4 class="modal-title block-title col-md-12 pl-0 pr-0 "
													id="memberModalLabel">
													Update Status
												</h4>

											</div>
											<div class="modal-body">
												<span>${reason}</span>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-alt-danger"
													data-dismiss="modal" data-toggle="click-ripple">Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
						<br>
						<form class="form-horizontal col-md-12" action=<c:url value='update-purge' /> method="post">
						                         <div class="form-group row">
														<label class="col-md-4 control-label text-right" for="purgeDays"><b>Retention in days:</b></label>
														<div class="col-md-6">
															<input id="purgeDays" name="purgeDays" type="number" min="7" max="365" value='${purgeDays}'
																	class="form-control col-md-9" autocomplete="off">
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-md-4 control-label text-right" for="purgeDaysHistory"><b>History in days:</b></label>
														<div class="col-md-6">
															<input id="purgeDaysHistory" name="purgeDaysHistory" type="number" min="7" max="365" value='${purgeDaysToKeep}'
																	class="form-control col-md-9" autocomplete="off">
														</div>
													</div>
												
												<div class="form-group  row">
													<div class="input-group ">
														<label class="col-md-4 control-label text-right" for="time"><b>Timezone:</b></label>
														<div class="col-md-6">									
<select id="timezone" name="selectedTZ" class="js-select2 form-control width-100 select-validation col-md-9" data-placeholder="Select timezone for scheduling" required>
		<option></option>  

<optgroup label="America">
<option value="America/Adak" label="Adak">(GMT-10) America/Adak</option>
<option value="America/Anchorage" label="Anchorage">(GMT-9) America/Anchorage</option>
<option value="America/Anguilla" label="Anguilla">(GMT-4) America/Anguilla</option>
<option value="America/Antigua" label="Antigua">(GMT-4) America/Antigua</option>
<option value="America/Araguaina" label="Araguaina">(GMT-3) America/Araguaina</option>
<option value="America/Argentina/Buenos_Aires" label="Argentina (Buenos Aires)">(GMT-3) America/Argentina (Buenos Aires)</option>
<option value="America/Argentina/Catamarca" label="Argentina (Catamarca)">(GMT-3) America/Argentina (Catamarca)</option>
<option value="America/Argentina/ComodRivadavia" label="Argentina (ComodRivadavia)">(GMT-3) America/Argentina (ComodRivadavia)</option>
<option value="America/Argentina/Cordoba" label="Argentina (Cordoba)">(GMT-3) America/Argentina (Cordoba)</option>
<option value="America/Argentina/Jujuy" label="Argentina (Jujuy)">(GMT-3) America/Argentina (Jujuy)</option>
<option value="America/Argentina/La_Rioja" label="Argentina (La Rioja)">(GMT-3) America/Argentina (La Rioja)</option>
<option value="America/Argentina/Mendoza" label="Argentina (Mendoza)">(GMT-3) America/Argentina (Mendoza)</option>
<option value="America/Argentina/Rio_Gallegos" label="Argentina (Rio Gallegos)">(GMT-3) America/Argentina (Rio Gallegos)</option>
<option value="America/Argentina/Salta" label="Argentina (Salta)">(GMT-3) America/Argentina (Salta)</option>
<option value="America/Argentina/San_Juan" label="Argentina (San Juan)">(GMT-3) America/Argentina (San Juan)</option>
<option value="America/Argentina/San_Luis" label="Argentina (San Luis)">(GMT-3) America/Argentina (San Luis)</option>
<option value="America/Argentina/Tucuman" label="Argentina (Tucuman)">(GMT-3) America/Argentina (Tucuman)</option>
<option value="America/Argentina/Ushuaia" label="Argentina (Ushuaia)">(GMT-3) America/Argentina (Ushuaia)</option>
<option value="America/Aruba" label="Aruba">(GMT-4) America/Aruba</option>
<option value="America/Asuncion" label="Asuncion">(GMT-3) America/Asuncion</option>
<option value="America/Atikokan" label="Atikokan">(GMT-5) America/Atikokan</option>
<option value="America/Atka" label="Atka">(GMT-10) America/Atka</option>
<option value="America/Bahia" label="Bahia">(GMT-3) America/Bahia</option>
<option value="America/Barbados" label="Barbados">(GMT-4) America/Barbados</option>
<option value="America/Belem" label="Belem">(GMT-3) America/Belem</option>
<option value="America/Belize" label="Belize">(GMT-6) America/Belize</option>
<option value="America/Blanc-Sablon" label="Blanc-Sablon">(GMT-4) America/Blanc-Sablon</option>
<option value="America/Boa_Vista" label="Boa Vista">(GMT-4) America/Boa Vista</option>
<option value="America/Bogota" label="Bogota">(GMT-5) America/Bogota</option>
<option value="America/Boise" label="Boise">(GMT-7) America/Boise</option>
<option value="America/Buenos_Aires" label="Buenos Aires">(GMT-3) America/Buenos Aires</option>
<option value="America/Cambridge_Bay" label="Cambridge Bay">(GMT-7) America/Cambridge Bay</option>
<option value="America/Campo_Grande" label="Campo Grande">(GMT-3) America/Campo Grande</option>
<option value="America/Cancun" label="Cancun">(GMT-5) America/Cancun</option>
<option value="America/Caracas" label="Caracas">(GMT-4) America/Caracas</option>
<option value="America/Catamarca" label="Catamarca">(GMT-3) America/Catamarca</option>
<option value="America/Cayenne" label="Cayenne">(GMT-3) America/Cayenne</option>
<option value="America/Cayman" label="Cayman">(GMT-5) America/Cayman</option>
<option value="America/Chicago" label="Chicago">(GMT-6) America/Chicago</option>
<option value="America/Chihuahua" label="Chihuahua">(GMT-7) America/Chihuahua</option>
<option value="America/Coral_Harbour" label="Coral Harbour">(GMT-5) America/Coral Harbour</option>
<option value="America/Cordoba" label="Cordoba">(GMT-3) America/Cordoba</option>
<option value="America/Costa_Rica" label="Costa Rica">(GMT-6) America/Costa Rica</option>
<option value="America/Cuiaba" label="Cuiaba">(GMT-3) America/Cuiaba</option>
<option value="America/Curacao" label="Curacao">(GMT-4) America/Curacao</option>
<option value="America/Danmarkshavn" label="Danmarkshavn">(GMT) America/Danmarkshavn</option>
<option value="America/Dawson" label="Dawson">(GMT-8) America/Dawson</option>
<option value="America/Dawson_Creek" label="Dawson Creek">(GMT-7) America/Dawson Creek</option>
<option value="America/Denver" label="Denver">(GMT-7) America/Denver</option>
<option value="America/Detroit" label="Detroit">(GMT-5) America/Detroit</option>
<option value="America/Dominica" label="Dominica">(GMT-4) America/Dominica</option>
<option value="America/Edmonton" label="Edmonton">(GMT-7) America/Edmonton</option>
<option value="America/Eirunepe" label="Eirunepe">(GMT-5) America/Eirunepe</option>
<option value="America/El_Salvador" label="El Salvador">(GMT-6) America/El Salvador</option>
<option value="America/Ensenada" label="Ensenada">(GMT-8) America/Ensenada</option>
<option value="America/Fort_Wayne" label="Fort Wayne">(GMT-5) America/Fort Wayne</option>
<option value="America/Fortaleza" label="Fortaleza">(GMT-3) America/Fortaleza</option>
<option value="America/Glace_Bay" label="Glace Bay">(GMT-4) America/Glace Bay</option>
<option value="America/Godthab" label="Godthab">(GMT-3) America/Godthab</option>
<option value="America/Goose_Bay" label="Goose Bay">(GMT-4) America/Goose Bay</option>
<option value="America/Grand_Turk" label="Grand Turk">(GMT-5) America/Grand Turk</option>
<option value="America/Grenada" label="Grenada">(GMT-4) America/Grenada</option>
<option value="America/Guadeloupe" label="Guadeloupe">(GMT-4) America/Guadeloupe</option>
<option value="America/Guatemala" label="Guatemala">(GMT-6) America/Guatemala</option>
<option value="America/Guayaquil" label="Guayaquil">(GMT-5) America/Guayaquil</option>
<option value="America/Guyana" label="Guyana">(GMT-4) America/Guyana</option>
<option value="America/Halifax" label="Halifax">(GMT-4) America/Halifax</option>
<option value="America/Havana" label="Havana">(GMT-5) America/Havana</option>
<option value="America/Hermosillo" label="Hermosillo">(GMT-7) America/Hermosillo</option>
<option value="America/Indiana/Indianapolis" label="Indiana (Indianapolis)">(GMT-5) America/Indiana (Indianapolis)</option>
<option value="America/Indiana/Knox" label="Indiana (Knox)">(GMT-6) America/Indiana (Knox)</option>
<option value="America/Indiana/Marengo" label="Indiana (Marengo)">(GMT-5) America/Indiana (Marengo)</option>
<option value="America/Indiana/Petersburg" label="Indiana (Petersburg)">(GMT-5) America/Indiana (Petersburg)</option>
<option value="America/Indiana/Tell_City" label="Indiana (Tell City)">(GMT-6) America/Indiana (Tell City)</option>
<option value="America/Indiana/Vevay" label="Indiana (Vevay)">(GMT-5) America/Indiana (Vevay)</option>
<option value="America/Indiana/Vincennes" label="Indiana (Vincennes)">(GMT-5) America/Indiana (Vincennes)</option>
<option value="America/Indiana/Winamac" label="Indiana (Winamac)">(GMT-5) America/Indiana (Winamac)</option>
<option value="America/Indianapolis" label="Indianapolis">(GMT-5) America/Indianapolis</option>
<option value="America/Inuvik" label="Inuvik">(GMT-7) America/Inuvik</option>
<option value="America/Iqaluit" label="Iqaluit">(GMT-5) America/Iqaluit</option>
<option value="America/Jamaica" label="Jamaica">(GMT-5) America/Jamaica</option>
<option value="America/Jujuy" label="Jujuy">(GMT-3) America/Jujuy</option>
<option value="America/Juneau" label="Juneau">(GMT-9) America/Juneau</option>
<option value="America/Kentucky/Louisville" label="Kentucky (Louisville)">(GMT-5) America/Kentucky (Louisville)</option>
<option value="America/Kentucky/Monticello" label="Kentucky (Monticello)">(GMT-5) America/Kentucky (Monticello)</option>
<option value="America/Knox_IN" label="Knox IN">(GMT-5) America/Knox IN</option>
<option value="America/La_Paz" label="La Paz">(GMT-4) America/La Paz</option>
<option value="America/Lima" label="Lima">(GMT-5) America/Lima</option>
<option value="America/Los_Angeles" label="Los Angeles">(GMT-8) America/Los Angeles</option>
<option value="America/Louisville" label="Louisville">(GMT-5) America/Louisville</option>
<option value="America/Maceio" label="Maceio">(GMT-3) America/Maceio</option>
<option value="America/Managua" label="Managua">(GMT-6) America/Managua</option>
<option value="America/Manaus" label="Manaus">(GMT-4) America/Manaus</option>
<option value="America/Marigot" label="Marigot">(GMT-4) America/Marigot</option>
<option value="America/Martinique" label="Martinique">(GMT-4) America/Martinique</option>
<option value="America/Mazatlan" label="Mazatlan">(GMT-7) America/Mazatlan</option>
<option value="America/Mendoza" label="Mendoza">(GMT-3) America/Mendoza</option>
<option value="America/Menominee" label="Menominee">(GMT-6) America/Menominee</option>
<option value="America/Merida" label="Merida">(GMT-6) America/Merida</option>
<option value="America/Mexico_City" label="Mexico City">(GMT-6) America/Mexico City</option>
<option value="America/Miquelon" label="Miquelon">(GMT-3) America/Miquelon</option>
<option value="America/Moncton" label="Moncton">(GMT-4) America/Moncton</option>
<option value="America/Monterrey" label="Monterrey">(GMT-6) America/Monterrey</option>
<option value="America/Montevideo" label="Montevideo">(GMT-3) America/Montevideo</option>
<option value="America/Montreal" label="Montreal">(GMT-5) America/Montreal</option>
<option value="America/Montserrat" label="Montserrat">(GMT-4) America/Montserrat</option>
<option value="America/Nassau" label="Nassau">(GMT-5) America/Nassau</option>
<option value="America/New_York" label="New York">(GMT-5) America/New York</option>
<option value="America/Nipigon" label="Nipigon">(GMT-5) America/Nipigon</option>
<option value="America/Nome" label="Nome">(GMT-9) America/Nome</option>
<option value="America/Noronha" label="Noronha">(GMT-2) America/Noronha</option>
<option value="America/North_Dakota/Center" label="North Dakota (Center)">(GMT-6) America/North Dakota (Center)</option>
<option value="America/North_Dakota/New_Salem" label="North Dakota (New Salem)">(GMT-6) America/North Dakota (New Salem)</option>
<option value="America/Panama" label="Panama">(GMT-5) America/Panama</option>
<option value="America/Pangnirtung" label="Pangnirtung">(GMT-5) America/Pangnirtung</option>
<option value="America/Paramaribo" label="Paramaribo">(GMT-3) America/Paramaribo</option>
<option value="America/Phoenix" label="Phoenix">(GMT-7) America/Phoenix</option>
<option value="America/Port-au-Prince" label="Port-au-Prince">(GMT-5) America/Port-au-Prince</option>
<option value="America/Port_of_Spain" label="Port of Spain">(GMT-4) America/Port of Spain</option>
<option value="America/Porto_Acre" label="Porto Acre">(GMT-5) America/Porto Acre</option>
<option value="America/Porto_Velho" label="Porto Velho">(GMT-4) America/Porto Velho</option>
<option value="America/Puerto_Rico" label="Puerto Rico">(GMT-4) America/Puerto Rico</option>
<option value="America/Rainy_River" label="Rainy River">(GMT-6) America/Rainy River</option>
<option value="America/Rankin_Inlet" label="Rankin Inlet">(GMT-6) America/Rankin Inlet</option>
<option value="America/Recife" label="Recife">(GMT-3) America/Recife</option>
<option value="America/Regina" label="Regina">(GMT-6) America/Regina</option>
<option value="America/Resolute" label="Resolute">(GMT-6) America/Resolute</option>
<option value="America/Rio_Branco" label="Rio Branco">(GMT-5) America/Rio Branco</option>
<option value="America/Rosario" label="Rosario">(GMT-3) America/Rosario</option>
<option value="America/Santarem" label="Santarem">(GMT-3) America/Santarem</option>
<option value="America/Santiago" label="Santiago">(GMT-4) America/Santiago</option>
<option value="America/Santo_Domingo" label="Santo Domingo">(GMT-4) America/Santo Domingo</option>
<option value="America/Sao_Paulo" label="Sao Paulo">(GMT-3) America/Sao Paulo</option>
<option value="America/Scoresbysund" label="Scoresbysund">(GMT-1) America/Scoresbysund</option>
<option value="America/Shiprock" label="Shiprock">(GMT-7) America/Shiprock</option>
<option value="America/St_Barthelemy" label="St Barthelemy">(GMT-4) America/St Barthelemy</option>
<option value="America/St_Johns" label="St Johns">(GMT-04:30) America/St Johns</option>
<option value="America/St_Kitts" label="St Kitts">(GMT-4) America/St Kitts</option>
<option value="America/St_Lucia" label="St Lucia">(GMT-4) America/St Lucia</option>
<option value="America/St_Thomas" label="St Thomas">(GMT-4) America/St Thomas</option>
<option value="America/St_Vincent" label="St Vincent">(GMT-4) America/St Vincent</option>
<option value="America/Swift_Current" label="Swift Current">(GMT-6) America/Swift Current</option>
<option value="America/Tegucigalpa" label="Tegucigalpa">(GMT-6) America/Tegucigalpa</option>
<option value="America/Thule" label="Thule">(GMT-4) America/Thule</option>
<option value="America/Thunder_Bay" label="Thunder Bay">(GMT-5) America/Thunder Bay</option>
<option value="America/Tijuana" label="Tijuana">(GMT-8) America/Tijuana</option>
<option value="America/Toronto" label="Toronto">(GMT-5) America/Toronto</option>
<option value="America/Tortola" label="Tortola">(GMT-4) America/Tortola</option>
<option value="America/Vancouver" label="Vancouver">(GMT-8) America/Vancouver</option>
<option value="America/Virgin" label="Virgin">(GMT-4) America/Virgin</option>
<option value="America/Whitehorse" label="Whitehorse">(GMT-8) America/Whitehorse</option>
<option value="America/Winnipeg" label="Winnipeg">(GMT-6) America/Winnipeg</option>
<option value="America/Yakutat" label="Yakutat">(GMT-9) America/Yakutat</option>
<option value="America/Yellowknife" label="Yellowknife">(GMT-7) America/Yellowknife</option>
</optgroup>		
		      
<optgroup label="Africa">
<option value="Africa/Abidjan" label="Abidjan">(GMT) Africa/Abidjan</option>
<option value="Africa/Accra" label="Accra">(GMT) Africa/Accra</option>
<option value="Africa/Addis_Ababa" label="Addis Ababa">(GMT+3) Africa/Addis_Ababa</option>
<option value="Africa/Algiers" label="Algiers">(GMT+1) Africa/Algiers</option>
<option value="Africa/Asmara" label="Asmara">(GMT+3) Africa/Asmara</option>
<option value="Africa/Asmera" label="Asmera">(GMT+3) Africa/Asmera</option>
<option value="Africa/Bamako" label="Bamako">(GMT) Africa/Bamako</option>
<option value="Africa/Bangui" label="Bangui">(GMT+1) Africa/Bangui</option>
<option value="Africa/Banjul" label="Banjul">(GMT) Africa/Banjul</option>
<option value="Africa/Bissau" label="Bissau">(GMT) Africa/Bissau</option>
<option value="Africa/Blantyre" label="Blantyre">(GMT+2) Africa/Blantyre</option>
<option value="Africa/Brazzaville" label="Brazzaville">(GMT+1) Africa/Brazzaville</option>
<option value="Africa/Bujumbura" label="Bujumbura">(GMT+2) Africa/Bujumbura</option>
<option value="Africa/Cairo" label="Cairo">(GMT+2) Africa/Cairo</option>
<option value="Africa/Casablanca" label="Casablanca">(GMT+1) Africa/Casablanca</option>
<option value="Africa/Ceuta" label="Ceuta">(GMT+1) Africa/Ceuta</option>
<option value="Africa/Conakry" label="Conakry">(GMT) Africa/Conakry</option>
<option value="Africa/Dakar" label="Dakar">(GMT) Africa/Dakar</option>
<option value="Africa/Dar_es_Salaam" label="Dar es Salaam">(GMT+3) Africa/Dar_es_Salaam</option>
<option value="Africa/Djibouti" label="Djibouti">(GMT+3) Africa/Djibouti</option>
<option value="Africa/Douala" label="Douala">(GMT+1) Africa/Douala</option>
<option value="Africa/El_Aaiun" label="El Aaiun">(GMT) Africa/El_Aaiun</option>
<option value="Africa/Freetown" label="Freetown">(GMT) Africa/Freetown</option>
<option value="Africa/Gaborone" label="Gaborone">(GMT+2) Africa/Gaborone</option>
<option value="Africa/Harare" label="Harare">(GMT+2) Africa/Harare</option>
<option value="Africa/Johannesburg" label="Johannesburg">(GMT+2) Africa/Johannesburg</option>
<option value="Africa/Kampala" label="Kampala">(GMT+3) Africa/Kampala</option>
<option value="Africa/Khartoum" label="Khartoum">(GMT+2) Africa/Khartoum</option>
<option value="Africa/Kigali" label="Kigali">(GMT+2) Africa/Kigali</option>
<option value="Africa/Kinshasa" label="Kinshasa">(GMT+1) Africa/Kinshasa</option>
<option value="Africa/Lagos" label="Lagos">(GMT+1) Africa/Lagos</option>
<option value="Africa/Libreville" label="Libreville">(GMT+1) Africa/Libreville</option>
<option value="Africa/Lome" label="Lome">(GMT) Africa/Lome</option>
<option value="Africa/Luanda" label="Luanda">(GMT+1) Africa/Luanda</option>
<option value="Africa/Lubumbashi" label="Lubumbashi">(GMT+2) Africa/Lubumbashi</option>
<option value="Africa/Lusaka" label="Lusaka">(GMT+2) Africa/Lusaka</option>
<option value="Africa/Malabo" label="Malabo">(GMT+1) Africa/Malabo</option>
<option value="Africa/Maputo" label="Maputo">(GMT+2) Africa/Maputo</option>
<option value="Africa/Maseru" label="Maseru">(GMT+2) Africa/Maseru</option>
<option value="Africa/Mbabane" label="Mbabane">(GMT+2) Africa/Mbabane</option>
<option value="Africa/Mogadishu" label="Mogadishu">(GMT+3) Africa/Mogadishu</option>
<option value="Africa/Monrovia" label="Monrovia">(GMT) Africa/Monrovia</option>
<option value="Africa/Nairobi" label="Nairobi">(GMT+3) Africa/Nairobi</option>
<option value="Africa/Ndjamena" label="Ndjamena">(GMT+1) Africa/Ndjamena</option>
<option value="Africa/Niamey" label="Niamey">(GMT+1) Africa/Niamey</option>
<option value="Africa/Nouakchott" label="Nouakchott">(GMT) Africa/Nouakchott</option>
<option value="Africa/Ouagadougou" label="Ouagadougou">(GMT) Africa/Ouagadougou</option>
<option value="Africa/Porto-Novo" label="Porto-Novo">(GMT+1) Africa/Porto-Novo</option>
<option value="Africa/Sao_Tome" label="Sao Tome">(GMT+1) Africa/Sao_Tome</option>
<option value="Africa/Timbuktu" label="Timbuktu">(GMT) Africa/Timbuktu</option>
<option value="Africa/Tripoli" label="Tripoli">(GMT+2) Africa/Tripoli</option>
<option value="Africa/Tunis" label="Tunis">(GMT+1) Africa/Tunis</option>
<option value="Africa/Windhoek" label="Windhoek">(GMT+2) Africa/Windhoek</option>
</optgroup>		

<optgroup label="Antarctica">
<option value="Antarctica/Casey" label="Casey">(GMT+11) Antarctica/Casey</option>
<option value="Antarctica/Davis" label="Davis">(GMT+7) Antarctica/Davis</option>
<option value="Antarctica/DumontDUrville" label="DumontDUrville">(GMT+10) Antarctica/DumontDUrville</option>
<option value="Antarctica/Mawson" label="Mawson">(GMT+5) Antarctica/Mawson</option>
<option value="Antarctica/McMurdo" label="McMurdo">(GMT+12) Antarctica/McMurdo</option>
<option value="Antarctica/Palmer" label="Palmer">(GMT-3) Antarctica/Palmer</option>
<option value="Antarctica/Rothera" label="Rothera">(GMT-3) Antarctica/Rothera</option>
<option value="Antarctica/South_Pole" label="South Pole">(GMT+12) Antarctica/South Pole</option>
<option value="Antarctica/Syowa" label="Syowa">(GMT+3) Antarctica/Syowa</option>
<option value="Antarctica/Vostok" label="Vostok">(GMT+6) Antarctica/Vostok</option>
</optgroup>
				
<optgroup label="Arctic">
			<option value="Arctic/Longyearbyen" label="Longyearbyen">(GMT+1) Arctic/Longyearbyen</option>
</optgroup>

<optgroup label="Asia">
<option value="Asia/Aden" label="Aden">(GMT+3) Asia/Aden</option>
<option value="Asia/Almaty" label="Almaty">(GMT+6) Asia/Almaty</option>
<option value="Asia/Amman" label="Amman">(GMT+2) Asia/Amman</option>
<option value="Asia/Anadyr" label="Anadyr">(GMT+12) Asia/Anadyr</option>
<option value="Asia/Aqtau" label="Aqtau">(GMT+5) Asia/Aqtau</option>
<option value="Asia/Aqtobe" label="Aqtobe">(GMT+5) Asia/Aqtobe</option>
<option value="Asia/Ashgabat" label="Ashgabat">(GMT+5) Asia/Ashgabat</option>
<option value="Asia/Ashkhabad" label="Ashkhabad">(GMT+5) Asia/Ashkhabad</option>
<option value="Asia/Baghdad" label="Baghdad">(GMT+3) Asia/Baghdad</option>
<option value="Asia/Bahrain" label="Bahrain">(GMT+3) Asia/Bahrain</option>
<option value="Asia/Baku" label="Baku">(GMT+4) Asia/Baku</option>
<option value="Asia/Bangkok" label="Bangkok">(GMT+7) Asia/Bangkok</option>
<option value="Asia/Beirut" label="Beirut">(GMT+2) Asia/Beirut</option>
<option value="Asia/Bishkek" label="Bishkek">(GMT+6) Asia/Bishkek</option>
<option value="Asia/Brunei" label="Brunei">(GMT+8) Asia/Brunei</option>
<option value="Asia/Calcutta" label="Calcutta">(GMT+05:30) Asia/Calcutta</option>
<option value="Asia/Choibalsan" label="Choibalsan">(GMT+8) Asia/Choibalsan</option>
<option value="Asia/Chongqing" label="Chongqing">(GMT+8) Asia/Chongqing</option>
<option value="Asia/Chungking" label="Chungking">(GMT+8) Asia/Chungking</option>
<option value="Asia/Colombo" label="Colombo">(GMT+05:30) Asia/Colombo</option>
<option value="Asia/Dacca" label="Dacca">(GMT+6) Asia/Dacca</option>
<option value="Asia/Damascus" label="Damascus">(GMT+2) Asia/Damascus</option>
<option value="Asia/Dhaka" label="Dhaka">(GMT+6) Asia/Dhaka</option>
<option value="Asia/Dili" label="Dili">(GMT+9) Asia/Dili</option>
<option value="Asia/Dubai" label="Dubai">(GMT+4) Asia/Dubai</option>
<option value="Asia/Dushanbe" label="Dushanbe">(GMT+5) Asia/Dushanbe</option>
<option value="Asia/Gaza" label="Gaza">(GMT+2) Asia/Gaza</option>
<option value="Asia/Harbin" label="Harbin">(GMT+8) Asia/Harbin</option>
<option value="Asia/Ho_Chi_Minh" label="Ho Chi Minh">(GMT+7) Asia/Ho Chi Minh</option>
<option value="Asia/Hong_Kong" label="Hong Kong">(GMT+8) Asia/Hong Kong</option>
<option value="Asia/Hovd" label="Hovd">(GMT+7) Asia/Hovd</option>
<option value="Asia/Irkutsk" label="Irkutsk">(GMT+8) Asia/Irkutsk</option>
<option value="Asia/Istanbul" label="Istanbul">(GMT+3) Asia/Istanbul</option>
<option value="Asia/Jakarta" label="Jakarta">(GMT+7) Asia/Jakarta</option>
<option value="Asia/Jayapura" label="Jayapura">(GMT+9) Asia/Jayapura</option>
<option value="Asia/Jerusalem" label="Jerusalem">(GMT+2) Asia/Jerusalem</option>
<option value="Asia/Kabul" label="Kabul">(GMT+04:30) Asia/Kabul</option>
<option value="Asia/Kamchatka" label="Kamchatka">(GMT+12) Asia/Kamchatka</option>
<option value="Asia/Karachi" label="Karachi">(GMT+5) Asia/Karachi</option>
<option value="Asia/Kashgar" label="Kashgar">(GMT+6) Asia/Kashgar</option>
<option value="Asia/Kathmandu" label="Kathmandu">(GMT+05:45) Asia/Kathmandu</option>
<option value="Asia/Katmandu" label="Katmandu">(GMT+05:45) Asia/Katmandu</option>
<option value="Asia/Kolkata" label="Kolkata">(GMT+05:30) Asia/Kolkata</option>
<option value="Asia/Krasnoyarsk" label="Krasnoyarsk">(GMT+7) Asia/Krasnoyarsk</option>
<option value="Asia/Kuala_Lumpur" label="Kuala Lumpur">(GMT+8) Asia/Kuala Lumpur</option>
<option value="Asia/Kuching" label="Kuching">(GMT+8) Asia/Kuching</option>
<option value="Asia/Kuwait" label="Kuwait">(GMT+3) Asia/Kuwait</option>
<option value="Asia/Macao" label="Macao">(GMT+8) Asia/Macao</option>
<option value="Asia/Macau" label="Macau">(GMT+8) Asia/Macau</option>
<option value="Asia/Magadan" label="Magadan">(GMT+11) Asia/Magadan</option>
<option value="Asia/Makassar" label="Makassar">(GMT+8) Asia/Makassar</option>
<option value="Asia/Manila" label="Manila">(GMT+8) Asia/Manila</option>
<option value="Asia/Muscat" label="Muscat">(GMT+4) Asia/Muscat</option>
<option value="Asia/Nicosia" label="Nicosia">(GMT+2) Asia/Nicosia</option>
<option value="Asia/Novosibirsk" label="Novosibirsk">(GMT+7) Asia/Novosibirsk</option>
<option value="Asia/Omsk" label="Omsk">(GMT+6) Asia/Omsk</option>
<option value="Asia/Oral" label="Oral">(GMT+5) Asia/Oral</option>
<option value="Asia/Phnom_Penh" label="Phnom Penh">(GMT+7) Asia/Phnom Penh</option>
<option value="Asia/Pontianak" label="Pontianak">(GMT+7) Asia/Pontianak</option>
<option value="Asia/Pyongyang" label="Pyongyang">(GMT+9) Asia/Pyongyang</option>
<option value="Asia/Qatar" label="Qatar">(GMT+3) Asia/Qatar</option>
<option value="Asia/Qyzylorda" label="Qyzylorda">(GMT+6) Asia/Qyzylorda</option>
<option value="Asia/Rangoon" label="Rangoon">(GMT+06:30) Asia/Rangoon</option>
<option value="Asia/Riyadh" label="Riyadh">(GMT+3) Asia/Riyadh</option>
<option value="Asia/Saigon" label="Saigon">(GMT+7) Asia/Saigon</option>
<option value="Asia/Sakhalin" label="Sakhalin">(GMT+11) Asia/Sakhalin</option>
<option value="Asia/Samarkand" label="Samarkand">(GMT+5) Asia/Samarkand</option>
<option value="Asia/Seoul" label="Seoul">(GMT+9) Asia/Seoul</option>
<option value="Asia/Shanghai" label="Shanghai">(GMT+8) Asia/Shanghai</option>
<option value="Asia/Singapore" label="Singapore">(GMT+8) Asia/Singapore</option>
<option value="Asia/Taipei" label="Taipei">(GMT+8) Asia/Taipei</option>
<option value="Asia/Tashkent" label="Tashkent">(GMT+5) Asia/Tashkent</option>
<option value="Asia/Tbilisi" label="Tbilisi">(GMT+4) Asia/Tbilisi</option>
<option value="Asia/Tehran" label="Tehran">(GMT+03:30) Asia/Tehran</option>
<option value="Asia/Tel_Aviv" label="Tel Aviv">(GMT+2) Asia/Tel Aviv</option>
<option value="Asia/Thimbu" label="Thimbu">(GMT+6) Asia/Thimbu</option>
<option value="Asia/Thimphu" label="Thimphu">(GMT+6) Asia/Thimphu</option>
<option value="Asia/Tokyo" label="Tokyo">(GMT+9) Asia/Tokyo</option>
<option value="Asia/Ujung_Pandang" label="Ujung Pandang">(GMT+8) Asia/Ujung Pandang</option>
<option value="Asia/Ulaanbaatar" label="Ulaanbaatar">(GMT+8) Asia/Ulaanbaatar</option>
<option value="Asia/Ulan_Bator" label="Ulan Bator">(GMT+8) Asia/Ulan Bator</option>
<option value="Asia/Urumqi" label="Urumqi">(GMT+6) Asia/Urumqi</option>
<option value="Asia/Vientiane" label="Vientiane">(GMT+7) Asia/Vientiane</option>
<option value="Asia/Vladivostok" label="Vladivostok">(GMT+10) Asia/Vladivostok</option>
<option value="Asia/Yakutsk" label="Yakutsk">(GMT+9) Asia/Yakutsk</option>
<option value="Asia/Yekaterinburg" label="Yekaterinburg">(GMT+5) Asia/Yekaterinburg</option>
<option value="Asia/Yerevan" label="Yerevan">(GMT+4) Asia/Yerevan</option>
</optgroup>
				
<optgroup label="Atlantic">
<option value="Atlantic/Azores" label="Azores">(GMT-1) Atlantic/Azores</option>
<option value="Atlantic/Bermuda" label="Bermuda">(GMT-4) Atlantic/Bermuda</option>
<option value="Atlantic/Canary" label="Canary">(GMT) Atlantic/Canary</option>
<option value="Atlantic/Cape_Verde" label="Cape Verde">(GMT-1) Atlantic/Cape Verde</option>
<option value="Atlantic/Faeroe" label="Faeroe">(GMT) Atlantic/Faeroe</option>
<option value="Atlantic/Faroe" label="Faroe">(GMT) Atlantic/Faroe</option>
<option value="Atlantic/Jan_Mayen" label="Jan Mayen">(GMT+1) Atlantic/Jan Mayen</option>
<option value="Atlantic/Madeira" label="Madeira">(GMT) Atlantic/Madeira</option>
<option value="Atlantic/Reykjavik" label="Reykjavik">(GMT) Atlantic/Reykjavik</option>
<option value="Atlantic/South_Georgia" label="South Georgia">(GMT-2) Atlantic/South Georgia</option>
<option value="Atlantic/St_Helena" label="St Helena">(GMT) Atlantic/St Helena</option>
<option value="Atlantic/Stanley" label="Stanley">(GMT-3) Atlantic/Stanley</option>
</optgroup>

<optgroup label="Australia">
<option value="Australia/ACT" label="ACT">(GMT+10) Australia/ACT</option>
<option value="Australia/Adelaide" label="Adelaide">(GMT+09:30") Australia/Adelaide</option>
<option value="Australia/Brisbane" label="Brisbane">(GMT+10) Australia/Brisbane</option>
<option value="Australia/Broken_Hill" label="Broken Hill">(GMT+09:30) Australia/Broken Hill</option>
<option value="Australia/Canberra" label="Canberra">(GMT+10) Australia/Canberra</option>
<option value="Australia/Currie" label="Currie">(GMT+10) Australia/Currie</option>
<option value="Australia/Darwin" label="Darwin">(GMT+09:30) Australia/Darwin</option>
<option value="Australia/Eucla" label="Eucla">(GMT+08:45) Australia/Eucla</option>
<option value="Australia/Hobart" label="Hobart">(GMT+10) Australia/Hobart</option>
<option value="Australia/LHI" label="LHI">(GMT+10:30) Australia/LHI</option>
<option value="Australia/Lindeman" label="Lindeman">(GMT+10) Australia/Lindeman</option>
<option value="Australia/Lord_Howe" label="Lord Howe">(GMT+10:30) Australia/Lord Howe</option>
<option value="Australia/Melbourne" label="Melbourne">(GMT+10) Australia/Melbourne</option>
<option value="Australia/North" label="North">(GMT+09:30) Australia/North</option>
<option value="Australia/NSW" label="NSW">(GMT+10) Australia/NSW</option>
<option value="Australia/Perth" label="Perth">(GMT+8) Australia/Perth</option>
<option value="Australia/Queensland" label="Queensland">(GMT+10) Australia/Queensland</option>
<option value="Australia/South" label="South">(GMT+10:30) Australia/South</option>
<option value="Australia/Sydney" label="Sydney">(GMT+10) Australia/Sydney</option>
<option value="Australia/Tasmania" label="Tasmania">(GMT+10) Australia/Tasmania</option>
<option value="Australia/Victoria" label="Victoria">(GMT+10) Australia/Victoria</option>
<option value="Australia/West" label="West">(GMT+8) Australia/West</option>
<option value="Australia/Yancowinna" label="Yancowinna">(GMT+09:30) Australia/Yancowinna</option>
</optgroup>

<optgroup label="Europe">
<option value="Europe/Amsterdam" label="Amsterdam">(GMT+1) Europe/Amsterdam</option>
<option value="Europe/Andorra" label="Andorra">(GMT+1) Europe/Andorra</option>
<option value="Europe/Athens" label="Athens">(GMT+2) Europe/Athens</option>
<option value="Europe/Belfast" label="Belfast">(GMT) Europe/Belfast</option>
<option value="Europe/Belgrade" label="Belgrade">(GMT+1) Europe/Belgrade</option>
<option value="Europe/Berlin" label="Berlin">(GMT+1) Europe/Berlin</option>
<option value="Europe/Bratislava" label="Bratislava">(GMT+1) Europe/Bratislava</option>
<option value="Europe/Brussels" label="Brussels">(GMT+1) Europe/Brussels</option>
<option value="Europe/Bucharest" label="Bucharest">(GMT+2) Europe/Bucharest</option>
<option value="Europe/Budapest" label="Budapest">(GMT+1) Europe/Budapest</option>
<option value="Europe/Chisinau" label="Chisinau">(GMT+2) Europe/Chisinau</option>
<option value="Europe/Copenhagen" label="Copenhagen">(GMT+1) Europe/Copenhagen</option>
<option value="Europe/Dublin" label="Dublin">(GMT) Europe/Dublin</option>
<option value="Europe/Gibraltar" label="Gibraltar">(GMT+1) Europe/Gibraltar</option>
<option value="Europe/Guernsey" label="Guernsey">(GMT) Europe/Guernsey</option>
<option value="Europe/Helsinki" label="Helsinki">(GMT+2) Europe/Helsinki</option>
<option value="Europe/Isle_of_Man" label="Isle of Man">(GMT) Europe/Isle of Man</option>
<option value="Europe/Istanbul" label="Istanbul">(GMT+3) Europe/Istanbul</option>
<option value="Europe/Jersey" label="Jersey">(GMT) Europe/Jersey</option>
<option value="Europe/Kaliningrad" label="Kaliningrad">(GMT+2) Europe/Kaliningrad</option>
<option value="Europe/Kiev" label="Kiev">(GMT+2) Europe/Kiev</option>
<option value="Europe/Lisbon" label="Lisbon">(GMT) Europe/Lisbon</option>
<option value="Europe/Ljubljana" label="Ljubljana">(GMT+1) Europe/Ljubljana</option>
<option value="Europe/London" label="London" >(GMT) Europe/London</option>
<option value="Europe/Luxembourg" label="Luxembourg">(GMT+1) Europe/Luxembourg</option>
<option value="Europe/Madrid" label="Madrid">(GMT+1) Europe/Madrid</option>
<option value="Europe/Malta" label="Malta">(GMT+1) Europe/Malta</option>
<option value="Europe/Mariehamn" label="Mariehamn">(GMT+2) Europe/Mariehamn</option>
<option value="Europe/Minsk" label="Minsk">(GMT+3) Europe/Minsk</option>
<option value="Europe/Monaco" label="Monaco">(GMT+1) Europe/Monaco</option>
<option value="Europe/Moscow" label="Moscow">(GMT+3) Europe/Moscow</option>
<option value="Europe/Nicosia" label="Nicosia">(GMT+2) Europe/Nicosia</option>
<option value="Europe/Oslo" label="Oslo">(GMT+1) Europe/Oslo</option>
<option value="Europe/Paris" label="Paris">(GMT+1) Europe/Paris</option>
<option value="Europe/Podgorica" label="Podgorica">(GMT+1) Europe/Podgorica</option>
<option value="Europe/Prague" label="Prague">(GMT+1) Europe/Prague</option>
<option value="Europe/Riga" label="Riga">(GMT+2) Europe/Riga</option>
<option value="Europe/Rome" label="Rome">(GMT+1) Europe/Rome</option>
<option value="Europe/Samara" label="Samara">(GMT+4) Europe/Samara</option>
<option value="Europe/San_Marino" label="San Marino">(GMT+1) Europe/San Marino</option>
<option value="Europe/Sarajevo" label="Sarajevo">(GMT+4) Europe/Sarajevo</option>
<option value="Europe/Simferopol" label="Simferopol">(GMT+3) Europe/Simferopol</option>
<option value="Europe/Skopje" label="Skopje">(GMT+1) Europe/Skopje</option>
<option value="Europe/Sofia" label="Sofia">(GMT+2) Europe/Sofia</option>
<option value="Europe/Stockholm" label="Stockholm">(GMT+1) Europe/Stockholm</option>
<option value="Europe/Tallinn" label="Tallinn">(GMT+2) Europe/Tallinn</option>
<option value="Europe/Tirane" label="Tirane">(GMT+1) Europe/Tirane</option>
<option value="Europe/Tiraspol" label="Tiraspol">(GMT+2) Europe/Tiraspol</option>
<option value="Europe/Uzhgorod" label="Uzhgorod">(GMT+2) Europe/Uzhgorod</option>
<option value="Europe/Vaduz" label="Vaduz">(GMT+1) Europe/Vaduz</option>
<option value="Europe/Vatican" label="Vatican">(GMT+1) Europe/Vatican</option>
<option value="Europe/Vienna" label="Vienna">(GMT+1) Europe/Vienna</option>
<option value="Europe/Vilnius" label="Vilnius">(GMT+2) Europe/Vilnius</option>
<option value="Europe/Volgograd" label="Volgograd">(GMT+4) Europe/Volgograd</option>
<option value="Europe/Warsaw" label="Warsaw">(GMT+1) Europe/Warsaw</option>
<option value="Europe/Zagreb" label="Zagreb">(GMT+1) Europe/Zagreb</option>
<option value="Europe/Zaporozhye" label="Zaporozhye">(GMT+2) Europe/Zaporozhye</option>
<option value="Europe/Zurich" label="Zurich">(GMT+1) Europe/Zurich</option>
</optgroup>
				
<optgroup label="Indian">
<option value="Indian/Antananarivo" label="Antananarivo">(GMT+3) Indian/Antananarivo</option>
<option value="Indian/Chagos" label="Chagos">(GMT+6) Indian/Chagos</option>
<option value="Indian/Christmas" label="Christmas">(GMT+7) Indian/Christmas</option>
<option value="Indian/Cocos" label="Cocos">(GMT+06:30) Indian/Cocos</option>
<option value="Indian/Comoro" label="Comoro">(GMT+3) Indian/Comoro</option>
<option value="Indian/Kerguelen" label="Kerguelen">(GMT+5) Indian/Kerguelen</option>
<option value="Indian/Mahe" label="Mahe">(GMT+4) Indian/Mahe</option>
<option value="Indian/Maldives" label="Maldives">(GMT+5) Indian/Maldives</option>
<option value="Indian/Mauritius" label="Mauritius">(GMT+4) Indian/Mauritius</option>
<option value="Indian/Mayotte" label="Mayotte">(GMT+3) Indian/Mayotte</option>
<option value="Indian/Reunion" label="Reunion">(GMT+4) Indian/Reunion</option>
</optgroup>

<optgroup label="Pacific">
<option value="Pacific/Apia" label="Apia">(GMT+13) Pacific/Apia</option>
<option value="Pacific/Auckland" label="Auckland">(GMT+12) Pacific/Auckland</option>
<option value="Pacific/Chatham" label="Chatham">(GMT+12:45) Pacific/Chatham</option>
<option value="Pacific/Easter" label="Easter">(GMT-6) Pacific/Easter</option>
<option value="Pacific/Efate" label="Efate">(GMT+11) Pacific/Efate</option>
<option value="Pacific/Enderbury" label="Enderbury">(GMT+13) Pacific/Enderbury</option>
<option value="Pacific/Fakaofo" label="Fakaofo">(GMT+13) Pacific/Fakaofo</option>
<option value="Pacific/Fiji" label="Fiji">(GMT+12) Pacific/Fiji</option>
<option value="Pacific/Funafuti" label="Funafuti">(GMT+12 Pacific/Funafuti</option>
<option value="Pacific/Galapagos" label="Galapagos">(GMT-6) Pacific/Galapagos</option>
<option value="Pacific/Gambier" label="Gambier">(GMT-9) Pacific/Gambier</option>
<option value="Pacific/Guadalcanal" label="Guadalcanal">(GMT+11) Pacific/Guadalcanal</option>
<option value="Pacific/Guam" label="Guam">(GMT+10) Pacific/Guam</option>
<option value="Pacific/Honolulu" label="Honolulu">(GMT-10) Pacific/Honolulu</option>
<option value="Pacific/Johnston" label="Johnston">(GMT-10) Pacific/Johnston</option>
<option value="Pacific/Kiritimati" label="Kiritimati">(GMT+14) Pacific/Kiritimati</option>
<option value="Pacific/Kosrae" label="Kosrae">(GMT+11) Pacific/Kosrae</option>
<option value="Pacific/Kwajalein" label="Kwajalein">(GMT+12) Pacific/Kwajalein</option>
<option value="Pacific/Majuro" label="Majuro">(GMT+12) Pacific/Majuro</option>
<option value="Pacific/Marquesas" label="Marquesas">(GMT-09:30) Pacific/Marquesas</option>
<option value="Pacific/Midway" label="Midway">(GMT-11) Pacific/Midway</option>
<option value="Pacific/Nauru" label="Nauru">(GMT+12) Pacific/Nauru</option>
<option value="Pacific/Niue" label="Niue">(GMT-11) Pacific/Niue</option>
<option value="Pacific/Norfolk" label="Norfolk">(GMT+11) Pacific/Norfolk</option>
<option value="Pacific/Noumea" label="Noumea">(GMT+11) Pacific/Noumea</option>
<option value="Pacific/Pago_Pago" label="Pago Pago">(GMT-11) Pacific/Pago Pago</option>
<option value="Pacific/Palau" label="Palau">(GMT+9) Pacific/Palau</option>
<option value="Pacific/Pitcairn" label="Pitcairn">(GMT-8) Pacific/Pitcairn</option>
<option value="Pacific/Ponape" label="Ponape">(GMT+11) Pacific/Ponape</option>
<option value="Pacific/Port_Moresby" label="Port Moresby">(GMT+10) Pacific/Port Moresby</option>
<option value="Pacific/Rarotonga" label="Rarotonga">(GMT-10) Pacific/Rarotonga</option>
<option value="Pacific/Saipan" label="Saipan">(GMT+10) Pacific/Saipan</option>
<option value="Pacific/Samoa" label="Samoa">(GMT-11) Pacific/Samoa</option>
<option value="Pacific/Tahiti" label="Tahiti">(GMT-10) Pacific/Tahiti</option>
<option value="Pacific/Tarawa" label="Tarawa">(GMT+12) Pacific/Tarawa</option>
<option value="Pacific/Tongatapu" label="Tongatapu">(GMT+13) Pacific/Tongatapu</option>
<option value="Pacific/Truk" label="Truk">(GMT+10) Pacific/Truk</option>
<option value="Pacific/Wake" label="Wake">(GMT+12) Pacific/Wake</option>
<option value="Pacific/Wallis" label="Wallis">(GMT+12) Pacific/Wallis</option>
<option value="Pacific/Yap" label="Yap">(GMT+10) Pacific/Yap</option>
</optgroup>
</select>

</div>
	</div>
	</div>
													
													<div class="form-group  row">
													<div class="input-group ">
														<label class="col-md-4 control-label text-right" for="time"><b>Purge runtime:</b></label>
														<div class="col-md-2">
															<input id="time" name="time" data-minute-step="1" type="text" class="form-control timepicker" autocomplete="off">
																	<span class="input-group-addon cal-icon1" style="top: 8px;"><i class="fa fa-clock-o"></i></span>
														</div>
														</div>
													</div>										
													<div class="form-group ">
														<label class="col-md-6" for="submift"><b></b></label>
														<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
														<button type="submit" id="submit" class=" btn btn-primary" data-toggle="click-ripple">Update</button>
													</div>
						</form>
						</div>
			</div>
		</div>
	</div>
	</div>
	</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script	src="static/js/plugins/bootstrap-timepicker/bootstrap-timepicker.js"></script>
	<script	src="static/js/plugins/moment.js"></script>
	<script	src="static/js/plugins/moment-with-data.js"></script>
	<script>
	$("#timezone option").each(function()
			{
		var val=$(this).val();
		if(val)
			{
			   var gmt='(GMT'+ moment(new Date()).tz(val).format("Z")+') '+val;
			    $(this).text(gmt) 
			}
		});

	$(window).on('load',function(){
		$('.timepicker').timepicker({
			defaultTime: '${Purge_daily_at}',
			icons : {
				up : "fa fa-angle-double-up",
				down : "fa fa-angle-double-down",
			}
		});
		$('#timezone').val("${purgedTZ}").trigger('change.select2');
	});

	</script>
	<c:choose>
		<c:when test="${status!=null}">
		<script>
		 $(window).on('load',function(){
			    $('#memberModal').modal('show');
			});
		</script>
		
		</c:when>
	</c:choose>	
</body>
</html>
