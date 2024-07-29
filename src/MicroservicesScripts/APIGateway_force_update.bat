set PublishDir=..\..\..\bin
set DatabaseDir=..\..\..\data
set ConfigDir=..\..\..\config

cd ../Repository/APIGateway
git fetch
git reset --hard origin/master

echo Publishing API Gateway... %PublishDir%\APIGateway
dotnet publish -c Release -o %PublishDir%\APIGateway

echo moving default appsettings.json to config folder... 
mkdir %ConfigDir%\APIGateway
copy /Y APIGatewayMain\appsettings.json %ConfigDir%\APIGateway\appsettings.json

echo moving initial content database to data folder... 
mkdir %DatabaseDir%\ContentMetadataService
copy /Y MicroServicesClients\ContentMetadataServiceMock\content.db %DatabaseDir%\ContentMetadataService\content.db
cd ..