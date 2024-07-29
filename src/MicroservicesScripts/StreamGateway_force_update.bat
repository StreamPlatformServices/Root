set PublishDir=..\..\..\bin
set DatabaseDir=..\..\..\data
set ConfigDir=..\..\..\config

cd ../Repository/StreamGateway
git fetch
git reset --hard origin/master

echo Publishing Stream Gateway...
dotnet publish -c Release -o %PublishDir%\StreamGateway

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\StreamGateway
copy /Y StreamGateway\appsettings.json %ConfigDir%\StreamGateway\appsettings.json
cd ..