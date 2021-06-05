@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  FXApp startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and FX_APP_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\FXApp-1.0-SNAPSHOT-plain.jar;%APP_HOME%\lib\firebase-admin-7.3.0.jar;%APP_HOME%\lib\spring-boot-starter-web-2.5.0.jar;%APP_HOME%\lib\spring-boot-starter-data-jpa-2.5.0.jar;%APP_HOME%\lib\firebase-analytics-19.0.0.aar;%APP_HOME%\lib\javafx-fxml-16-linux.jar;%APP_HOME%\lib\javafx-controls-16-linux.jar;%APP_HOME%\lib\javafx-controls-16.jar;%APP_HOME%\lib\javafx-graphics-16-linux.jar;%APP_HOME%\lib\javafx-graphics-16.jar;%APP_HOME%\lib\javafx-base-16-linux.jar;%APP_HOME%\lib\javafx-base-16.jar;%APP_HOME%\lib\play-services-measurement-api-19.0.0.aar;%APP_HOME%\lib\firebase-installations-17.0.0.aar;%APP_HOME%\lib\firebase-common-20.0.0.aar;%APP_HOME%\lib\google-api-client-gson-1.31.4.jar;%APP_HOME%\lib\google-cloud-storage-1.110.0.jar;%APP_HOME%\lib\google-api-client-1.31.4.jar;%APP_HOME%\lib\google-cloud-firestore-1.35.0.jar;%APP_HOME%\lib\google-auth-library-oauth2-http-0.20.0.jar;%APP_HOME%\lib\google-oauth-client-1.31.5.jar;%APP_HOME%\lib\google-http-client-gson-1.39.2.jar;%APP_HOME%\lib\google-http-client-apache-v2-1.39.2.jar;%APP_HOME%\lib\google-http-client-jackson2-1.35.0.jar;%APP_HOME%\lib\google-http-client-1.39.2.jar;%APP_HOME%\lib\api-common-1.9.2.jar;%APP_HOME%\lib\opencensus-contrib-http-util-0.28.0.jar;%APP_HOME%\lib\guava-30.1.1-android.jar;%APP_HOME%\lib\spring-data-jpa-2.5.1.jar;%APP_HOME%\lib\spring-boot-starter-jdbc-2.5.0.jar;%APP_HOME%\lib\HikariCP-4.0.3.jar;%APP_HOME%\lib\spring-data-commons-2.5.1.jar;%APP_HOME%\lib\spring-boot-starter-json-2.5.0.jar;%APP_HOME%\lib\spring-boot-starter-aop-2.5.0.jar;%APP_HOME%\lib\spring-boot-starter-2.5.0.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.5.0.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\log4j-to-slf4j-2.14.1.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.30.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\netty-codec-http-4.1.65.Final.jar;%APP_HOME%\lib\netty-handler-4.1.65.Final.jar;%APP_HOME%\lib\netty-codec-4.1.65.Final.jar;%APP_HOME%\lib\netty-transport-4.1.65.Final.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-2.5.0.jar;%APP_HOME%\lib\spring-webmvc-5.3.7.jar;%APP_HOME%\lib\spring-web-5.3.7.jar;%APP_HOME%\lib\jakarta.transaction-api-1.3.3.jar;%APP_HOME%\lib\jakarta.persistence-api-2.2.3.jar;%APP_HOME%\lib\hibernate-core-5.4.31.Final.jar;%APP_HOME%\lib\spring-aspects-5.3.7.jar;%APP_HOME%\lib\play-services-measurement-19.0.0.aar;%APP_HOME%\lib\play-services-measurement-sdk-19.0.0.aar;%APP_HOME%\lib\httpclient-4.5.13.jar;%APP_HOME%\lib\httpcore-4.4.14.jar;%APP_HOME%\lib\proto-google-cloud-firestore-admin-v1-1.35.0.jar;%APP_HOME%\lib\proto-google-cloud-firestore-v1-1.35.0.jar;%APP_HOME%\lib\proto-google-cloud-firestore-v1beta1-0.88.0.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\auto-value-annotations-1.7.2.jar;%APP_HOME%\lib\google-auth-library-credentials-0.20.0.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\checker-compat-qual-2.5.5.jar;%APP_HOME%\lib\error_prone_annotations-2.5.1.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.12.3.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.12.3.jar;%APP_HOME%\lib\jackson-annotations-2.12.3.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.12.3.jar;%APP_HOME%\lib\jackson-databind-2.12.3.jar;%APP_HOME%\lib\jackson-core-2.12.3.jar;%APP_HOME%\lib\google-api-services-storage-v1-rev20200430-1.30.9.jar;%APP_HOME%\lib\gson-2.8.6.jar;%APP_HOME%\lib\google-cloud-core-1.93.6.jar;%APP_HOME%\lib\proto-google-common-protos-1.18.0.jar;%APP_HOME%\lib\google-cloud-core-http-1.93.6.jar;%APP_HOME%\lib\google-http-client-appengine-1.35.0.jar;%APP_HOME%\lib\gax-httpjson-0.74.0.jar;%APP_HOME%\lib\gax-1.57.0.jar;%APP_HOME%\lib\opencensus-api-0.28.0.jar;%APP_HOME%\lib\grpc-context-1.30.0.jar;%APP_HOME%\lib\proto-google-iam-v1-0.13.0.jar;%APP_HOME%\lib\protobuf-java-3.12.2.jar;%APP_HOME%\lib\protobuf-java-util-3.12.2.jar;%APP_HOME%\lib\threetenbp-1.4.4.jar;%APP_HOME%\lib\google-cloud-core-grpc-1.93.6.jar;%APP_HOME%\lib\grpc-core-1.30.0.jar;%APP_HOME%\lib\annotations-4.1.1.4.jar;%APP_HOME%\lib\perfmark-api-0.19.0.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.15.jar;%APP_HOME%\lib\opencensus-contrib-grpc-util-0.24.0.jar;%APP_HOME%\lib\grpc-protobuf-1.30.0.jar;%APP_HOME%\lib\grpc-protobuf-lite-1.30.0.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.18.jar;%APP_HOME%\lib\grpc-api-1.30.0.jar;%APP_HOME%\lib\gax-grpc-1.57.0.jar;%APP_HOME%\lib\grpc-auth-1.30.0.jar;%APP_HOME%\lib\grpc-netty-shaded-1.30.0.jar;%APP_HOME%\lib\grpc-alts-1.30.0.jar;%APP_HOME%\lib\grpc-grpclb-1.30.0.jar;%APP_HOME%\lib\commons-lang3-3.12.0.jar;%APP_HOME%\lib\conscrypt-openjdk-uber-2.2.1.jar;%APP_HOME%\lib\grpc-stub-1.30.0.jar;%APP_HOME%\lib\netty-buffer-4.1.65.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.65.Final.jar;%APP_HOME%\lib\netty-common-4.1.65.Final.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.5.0.jar;%APP_HOME%\lib\spring-boot-2.5.0.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\spring-context-5.3.7.jar;%APP_HOME%\lib\spring-aop-5.3.7.jar;%APP_HOME%\lib\spring-orm-5.3.7.jar;%APP_HOME%\lib\spring-jdbc-5.3.7.jar;%APP_HOME%\lib\spring-tx-5.3.7.jar;%APP_HOME%\lib\spring-beans-5.3.7.jar;%APP_HOME%\lib\spring-expression-5.3.7.jar;%APP_HOME%\lib\spring-core-5.3.7.jar;%APP_HOME%\lib\snakeyaml-1.28.jar;%APP_HOME%\lib\tomcat-embed-websocket-9.0.46.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.46.jar;%APP_HOME%\lib\tomcat-embed-el-9.0.46.jar;%APP_HOME%\lib\aspectjweaver-1.9.6.jar;%APP_HOME%\lib\hibernate-commons-annotations-5.1.2.Final.jar;%APP_HOME%\lib\jboss-logging-3.4.1.Final.jar;%APP_HOME%\lib\javassist-3.27.0-GA.jar;%APP_HOME%\lib\byte-buddy-1.10.22.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\jandex-2.2.3.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\dom4j-2.1.3.jar;%APP_HOME%\lib\jaxb-runtime-2.3.4.jar;%APP_HOME%\lib\play-services-measurement-impl-19.0.0.aar;%APP_HOME%\lib\play-services-ads-identifier-17.0.0.aar;%APP_HOME%\lib\play-services-measurement-sdk-api-19.0.0.aar;%APP_HOME%\lib\play-services-measurement-base-19.0.0.aar;%APP_HOME%\lib\play-services-stats-17.0.0.aar;%APP_HOME%\lib\firebase-installations-interop-17.0.0.aar;%APP_HOME%\lib\play-services-tasks-17.0.0.aar;%APP_HOME%\lib\firebase-measurement-connector-19.0.0.aar;%APP_HOME%\lib\play-services-basement-17.0.0.aar;%APP_HOME%\lib\fragment-1.0.0.aar;%APP_HOME%\lib\legacy-support-core-ui-1.0.0.aar;%APP_HOME%\lib\legacy-support-core-utils-1.0.0.aar;%APP_HOME%\lib\loader-1.0.0.aar;%APP_HOME%\lib\viewpager-1.0.0.aar;%APP_HOME%\lib\coordinatorlayout-1.0.0.aar;%APP_HOME%\lib\drawerlayout-1.0.0.aar;%APP_HOME%\lib\slidingpanelayout-1.0.0.aar;%APP_HOME%\lib\customview-1.0.0.aar;%APP_HOME%\lib\swiperefreshlayout-1.0.0.aar;%APP_HOME%\lib\asynclayoutinflater-1.0.0.aar;%APP_HOME%\lib\core-1.0.0.aar;%APP_HOME%\lib\versionedparcelable-1.0.0.aar;%APP_HOME%\lib\collection-1.0.0.jar;%APP_HOME%\lib\firebase-components-17.0.0.aar;%APP_HOME%\lib\spring-jcl-5.3.7.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.3.jar;%APP_HOME%\lib\txw2-2.3.4.jar;%APP_HOME%\lib\istack-commons-runtime-3.0.12.jar;%APP_HOME%\lib\jakarta.activation-1.2.2.jar;%APP_HOME%\lib\documentfile-1.0.0.aar;%APP_HOME%\lib\localbroadcastmanager-1.0.0.aar;%APP_HOME%\lib\print-1.0.0.aar;%APP_HOME%\lib\lifecycle-runtime-2.0.0.aar;%APP_HOME%\lib\lifecycle-viewmodel-2.0.0.aar;%APP_HOME%\lib\lifecycle-livedata-2.0.0.aar;%APP_HOME%\lib\lifecycle-livedata-core-2.0.0.aar;%APP_HOME%\lib\lifecycle-common-2.0.0.jar;%APP_HOME%\lib\core-runtime-2.0.0.aar;%APP_HOME%\lib\core-common-2.0.0.jar;%APP_HOME%\lib\interpolator-1.0.0.aar;%APP_HOME%\lib\cursoradapter-1.0.0.aar;%APP_HOME%\lib\annotation-1.1.0.jar;%APP_HOME%\lib\firebase-annotations-16.0.0.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\log4j-api-2.14.1.jar


@rem Execute FXApp
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %FX_APP_OPTS%  -classpath "%CLASSPATH%" com.srvraj311.App %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable FX_APP_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%FX_APP_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
