{
"version": "0.2.0",
"configurations": [
{
"type": "node",
"request": "launch",
"console": "integratedTerminal",
"name": "dev - db",
"runtimeExecutable": "npm",
"runtimeArgs": [
"run",
"dev"
],
"env": {
"SERVER_PORT": "6000",
"PORT": "6001",
"NODE_ENV": "dev",
"SALT": "jsf5f4er3ds4f2(54256hqasdu6*20q#%!hq(*3(*!&%GDWKH23",
"JWT_SECRET": "m*8&7Ge#fHgxUDWBrX^m*X^m*8&7Ge#F!cJs)Z2Y",
"DB_PORT": "5003",
"DB_HOST": "127.0.0.1",
"DB_USERNAME": "admin",
"DB_PASSWORD": "verysecretpassword",
"DB_NAME": "docker_chat_app_service_db",
"DATABASE_URL": "postgresql://admin:verysecretpassword@localhost:5002/docker_chat_app_service_db?schema=public",
"CORS": "198.162.1.1;", // ip пишутся через ; если он один, то заканчивается ;
"ALLOWED_ORIGIN": "http://localhost:3000",
"USER_KEY": "chat_app_user",
"SERVER_URI": "http://localhost:6000"
}
},
{
"type": "node",
"request": "launch",
"name": "dev + db",
"console": "integratedTerminal",
"runtimeExecutable": "npm",
"preLaunchTask": "Orders",
"postDebugTask": "Remove Docker Postgres",
"runtimeArgs": [
"run",
"dev:server"
],
"env": {
"SERVER_PORT": "6000",
"PORT": "6001",
"NODE_ENV": "dev",
"SALT": "jsf5f4er3ds4f2(54256hqasdu6*20q#%!hq(*3(*!&%GDWKH23",
"JWT_SECRET": "m*8&7Ge#fHgxUDWBrX^m*X^m*8&7Ge#F!cJs)Z2Y",
"DB_PORT": "5003",
"DB_HOST": "127.0.0.1",
"DB_USERNAME": "admin",
"DB_PASSWORD": "verysecretpassword",
"DB_NAME": "docker_chat_app_service_db",
"DATABASE_URL": "postgresql://admin:verysecretpassword@localhost:5002/docker_chat_app_service_db?schema=public",
"CORS": "198.162.1.1;",
"ALLOWED_ORIGIN": "http://localhost:3000",
"USER_KEY": "chat_app_user",
"SERVER_URI": "http://localhost:6000"
}
},
{
"type": "node",
"request": "launch",
"name": "dev remote db",
"console": "integratedTerminal",
"runtimeExecutable": "npm",
"runtimeArgs": [
"run",
"dev:server"
],
"env": {
"SERVER_PORT": "6000",
"PORT": "6001",
"NODE_ENV": "dev",
"SALT": "jsf5f4er3ds4f2(54256hqasdu6*20q#%!hq(*3(*!&%GDWKH23",
"JWT_SECRET": "m*8&7Ge#fHgxUDWBrX^m*X^m*8&7Ge#F!cJs)Z2Y",
"DB_NAME": "generators_service_db",
"DATABASE_URL": "postgresql://admin:verysecretpassword@45.12.18.194:5432/generators_service_db?schema=public",
"USER_KEY": "chat_app_user",
"SERVER_URI": "http://localhost:6000"
// "CORS": "198.162.1.1;"
}
},
]
}
