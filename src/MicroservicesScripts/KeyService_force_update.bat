set PublishDir=..\..\..\bin
set DatabaseDir=..\..\..\data
set ConfigDir=..\..\..\config

cd ../Repository/KeyService
echo Publishing Key Service...
dotnet publish -c Release -o %PublishDir%\KeyService

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\KeyService
copy /Y KeyService\appsettings.json %ConfigDir%\KeyService\appsettings.json

echo moving initial user database to data folder... 
mkdir %DatabaseDir%\KeyService
copy /Y KeyService\keys.db %DatabaseDir%\KeyService\keys.db
cd ..