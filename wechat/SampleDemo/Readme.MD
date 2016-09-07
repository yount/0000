#Environment
##wechat project is a project running on liferay portal
##the database is liferay database 
##there also need to create to two table "p_info" and "p_info_user" the sql language like this:
### table p_info:
	create table p_info (
	uuid varchar(75) primary key,
	createId bigint(20),
	createTime datetime null,
	endTime datetime null,
	title varchar(50) not null,
	content longtext null,
	imageUrl varchar(50),
	status integer,
	startTime datetime null,
	event_location varchar(100),
	target_audience varchar(150),
	mediaUrl varchar(100),
	mainImageUrl varchar(50)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;
### table p_info_user	
	create table p_info_user (
	uuid varchar(75) not null primary key,
	userId bigint(20) not null,
	info_Id varchar(75) not null,
	registerTime datetime null,
	status integer
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
##in liferay need to add some css style in Admin->Pages->CSS like this:

.aui body {
    padding-left: 0;
    padding-right: 0;
}
#wrapper {
    padding: 0;
}
.aui .btn {
    	padding: 0px;
}

##video upload suport format .mov and .mp4





liferay admin account:
	test@perficient.com
password:
	test

Admin->Pages:
Select theme for classic


start mysql:
docker run --name lep-mysql  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_USER=lportal -e MYSQL_PASSWORD=lportal -e MYSQL_DATABASE=lportal -d gaumire/mysql5.5


start liferay:
docker run  -it -v /root/home/LiferayPortal:/var/liferay-home/deploy -v /root/home/LiferaySource:/opt/LiferaySource -v /root/home/LiferaySource/portal-ext.properties:/opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/webapps/ROOT/WEB-INF/classes/portal-ext.properties -p 8888:8080 --link mysqlServer:db_lep -e DB_TYPE=MYSQL dh1006/liferay6.2





(1)
add 	'jdbc.default.driverClassName=com.mysql.jdbc.Driver
	jdbc.default.url=jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
	jdbc.default.username=root
	jdbc.default.password=root
	auto.login.hooks=com.liferay.portal.security.auth.ParameterAutoLogin'
in '/opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/webapps/ROOT/WEB-INF/classes/portal-ext.properties'

(2)
replace
'
<div style="display:none;" id="portal_normal_dockbar">
	#dockbar()
</div>
'
with
'#dockbar()'
in '/opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/webapps/ROOT/html/themes/classic/templates/portal_normal.vm'

(3)
Hide out those lines of code:
(/opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/webapps/ROOT/html/themes/classic/templates/portal_normal.vm)
	3.1
	<h1 class="site-title">
		<a class="$logo_css_class" href="$site_default_url" title="#language_format ("go-to-x", [$site_name])">
			<img alt="$logo_description" height="$site_logo_height" src="$site_logo" width="$site_logo_width" />
			#if ($show_site_name)
				<span class="site-name" title="#language_format ("go-to-x", [$site_name])">
					$site_name
				</span>
			#end
		</a>

	</h1>
	3.2
	#if ($has_navigation || $is_signed_in)
		#parse ("$full_templates_path/navigation.vm")
	#end
	3.3
	<nav id="breadcrumbs">#breadcrumbs()</nav>






TEAM: Bootcamp20 BTF



	
