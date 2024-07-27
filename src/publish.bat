@echo off
setlocal

REM Definiowanie zmiennej dla ścieżki relatywnej publikacji
set PublishDir=..\..\bin

REM Publikowanie API Gateway
cd APIGateway
echo Publishing API Gateway... %PublishDir%\APIGateway
dotnet publish -c Release -o %PublishDir%\APIGateway
cd ..

REM Publikowanie Authorization Service
cd AuthorizationService
echo Publishing Authorization Service...
dotnet publish -c Release -o %PublishDir%\AuthorizationService
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
