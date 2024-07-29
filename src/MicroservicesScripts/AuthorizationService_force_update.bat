set PublishDir=..\..\..\bin
set DatabaseDir=..\..\..\data
set ConfigDir=..\..\..\config

cd ../Repository/AuthorizationService
git fetch
git reset --hard origin/auth

echo Publishing Authorization Service...
dotnet publish -c Release -o %PublishDir%\AuthorizationService

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\AuthorizationService
copy /Y AuthorizationService\appsettings.json %ConfigDir%\AuthorizationService\appsettings.json

echo moving initial user database to data folder... 
mkdir %DatabaseDir%\AuthorizationService
copy /Y AuthorizationService\users.db %DatabaseDir%\AuthorizationService\users.db
cd ..