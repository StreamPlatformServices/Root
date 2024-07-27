cd bin/APIGateway && start "APIGateway" "APIGatewayMain.exe" --ConfigPath "..\..\config\APIGateway" --ContentDatabasePath "..\..\data\ContentMetadataService" && cd ../..
cd bin/KeyService && start "KeyService" "KeyService.exe" && cd ../..
cd bin/LicenseService && start "LicenseService" "LicenseService.exe" && cd ../..
cd bin/StreamGateway && start "StreamGateway" "StreamGatewayMain.exe" && cd ../..
cd bin/AuthorizationService && start "AuthorizationService" "AuthorizationService.exe" --ConfigPath "..\..\config\AuthorizationService" --DatabasePath "..\..\data\AuthorizationService" && cd ..