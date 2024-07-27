@echo off
setlocal

REM Definiowanie zmiennej dla ścieżki relatywnej publikacji
set PublishDir=..\..\bin
set DatabaseDir=..\..\data
set ConfigDir=..\..\config

REM Publikowanie API Gateway
cd APIGateway
echo Publishing API Gateway... %PublishDir%\APIGateway
dotnet publish -c Release -o %PublishDir%\APIGateway

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\APIGateway
copy /Y APIGatewayMain\appsettings.json %ConfigDir%\APIGateway\appsettings.json

echo moving initial content database to data folder... 
mkdir %DatabaseDir%\ContentMetadataService
copy /Y MicroServicesClients\ContentMetadataServiceMock\content.db %DatabaseDir%\ContentMetadataService\content.db
cd ..

REM Publikowanie Authorization Service
cd AuthorizationService
echo Publishing Authorization Service...
dotnet publish -c Release -o %PublishDir%\AuthorizationService

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\AuthorizationService
copy /Y AuthorizationService\appsettings.json %ConfigDir%\AuthorizationService\appsettings.json

echo moving initial user database to data folder... 
mkdir %DatabaseDir%\AuthorizationService
copy /Y AuthorizationService\users.db %DatabaseDir%\AuthorizationService\users.db
cd ..

REM Publikowanie Key Service
cd KeyService
echo Publishing Key Service...
dotnet publish -c Release -o %PublishDir%\KeyService
cd ..

REM Publikowanie License Service
cd LicenseService
echo Publishing License Service... %PublishDir%\LicenseService
dotnet publish -c Release -o %PublishDir%\LicenseService
cd ..

REM Publikowanie Stream Gateway
cd StreamGateway
echo Publishing Stream Gateway...
dotnet publish -c Release -o %PublishDir%\StreamGateway
cd ..

echo All services have been published to %PublishDir%
endlocal
rem pause
