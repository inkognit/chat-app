{
"version": "2.0.0",
"tasks": [
{
"label": "Orders",
"dependsOrder": "sequence",
"dependsOn": [
"Start Docker Postgres",
"Sleep for 10 seconds",
"Build Docker Postgres",
]
},
{
"label": "Start Docker Postgres",
"type": "shell",
"command": "docker run --name chatDB -v \"${input:path}\"/://app -p 5003:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=verysecretpassword -e POSTGRES_DB=docker_chat_app_service_db -d postgres:14.2-alpine"
        },
        {
            "label": "Sleep for 10 seconds",
            "type": "shell",
            "command": "ping 127.0.0.1 -n 10"
            "command": "ping -c 3 127.0.0.1"
        },
        {
            "label": "Build Docker Postgres",
            "type": "shell",
            "command": "docker exec chatDB sh -c 'psql -U admin -d docker_chat_app_service_db < /app/\"${input:sql}\".sql'"
},
{
"label": "Remove Docker Postgres",
"type": "shell",
"command": "docker container rm -vf chatDB"
}
],
"inputs": [
{
"type": "pickString",
"id": "path",
"description": "Path to sql file",
"options": [
"D:\\home\\chat-app\\db",/home/michael/w/chat-app/db",
],
"default": "D:\\home\\chat-app\\db",/home/michael/w/chat-app/db",
},
{
"type": "pickString",
"id": "sql",
"description": "Sql file",
"options": [
"initial",
"full_initial"
],
"default": "initial"
},
]
}
