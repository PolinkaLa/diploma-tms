# Test Management System #
## Настройка
### tomcat:  
< role rolename="manager-script"/>   
< user username="admin" password="admin" roles="manager-script" />
### maven:  
< server>  
< id>tomcat< /id>   
< username>admin< /username>  
< password>admin< /password>  
< /server> 
### Idea run
конфиг мавен  
1) для деплоя на запущеный сервер  
tomcat7:deploy
2) для старта томката и деплоя  
tomcat7:run + локально настройки что в начале