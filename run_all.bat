cd bin/ApiGateway && start "APIGateway" "APIGatewayMain.exe" && cd ../..
cd bin/KeyService && start "KeyService" "KeyService.exe" && cd ../..
cd bin/LicenseService && start "LicenseService" "LicenseService.exe" && cd ../..
cd bin/StreamGateway && start "StreamGateway" "StreamGatewayMain.exe" && cd ../..
rem cd AuthorizationService && start "AuthorizationService" "AuthorizationService.exe" && cd ..