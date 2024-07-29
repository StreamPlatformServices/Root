@echo off
setlocal

set PublishDir=..\..\..\bin
set DatabaseDir=..\..\..\data
set ConfigDir=..\..\..\config

cd Repository/APIGateway
echo Publishing API Gateway... %PublishDir%\APIGateway
dotnet publish -c Release -o %PublishDir%\APIGateway

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\APIGateway
copy /Y APIGatewayMain\appsettings.json %ConfigDir%\APIGateway\appsettings.json

echo moving initial content database to data folder... 
mkdir %DatabaseDir%\ContentMetadataService
copy /Y MicroServicesClients\ContentMetadataServiceMock\content.db %DatabaseDir%\ContentMetadataService\content.db
cd ../..

cd Repository/AuthorizationService
echo Publishing Authorization Service...
dotnet publish -c Release -o %PublishDir%\AuthorizationService

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\AuthorizationService
copy /Y AuthorizationService\appsettings.json %ConfigDir%\AuthorizationService\appsettings.json

echo moving initial user database to data folder... 
mkdir %DatabaseDir%\AuthorizationService
copy /Y AuthorizationService\users.db %DatabaseDir%\AuthorizationService\users.db
cd ../..

cd Repository/KeyService
echo Publishing Key Service...
dotnet publish -c Release -o %PublishDir%\KeyService

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\KeyService
copy /Y KeyService\appsettings.json %ConfigDir%\KeyService\appsettings.json

echo moving initial user database to data folder... 
mkdir %DatabaseDir%\KeyService
copy /Y KeyService\keys.db %DatabaseDir%\KeyService\keys.db
cd ../..

cd Repository/LicenseService
echo Publishing License Service... %PublishDir%\LicenseService
dotnet publish -c Release -o %PublishDir%\LicenseService

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\LicenseService
copy /Y LicenseService\appsettings.json %ConfigDir%\LicenseService\appsettings.json

echo moving initial user database to data folder... 
mkdir %DatabaseDir%\LicenseService
copy /Y LicenseService\license.db %DatabaseDir%\LicenseService\license.db
cd ../..

cd Repository/StreamGateway
echo Publishing Stream Gateway...
dotnet publish -c Release -o %PublishDir%\StreamGateway

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\StreamGateway
copy /Y StreamGateway\appsettings.json %ConfigDir%\StreamGateway\appsettings.json
cd ../..

echo All services have been published to %PublishDir%
endlocal
