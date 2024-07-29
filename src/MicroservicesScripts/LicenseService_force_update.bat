set PublishDir=..\..\..\bin
set DatabaseDir=..\..\..\data
set ConfigDir=..\..\..\config

cd ../Repository/LicenseService
git fetch
git reset --hard origin/master

echo Publishing License Service... %PublishDir%\LicenseService
dotnet publish -c Release -o %PublishDir%\LicenseService

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\LicenseService
copy /Y LicenseService\appsettings.json %ConfigDir%\LicenseService\appsettings.json

echo moving initial user database to data folder... 
mkdir %DatabaseDir%\LicenseService
copy /Y LicenseService\license.db %DatabaseDir%\LicenseService\license.db
cd ..