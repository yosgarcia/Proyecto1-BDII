
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="stylesheet" href="bot.css">
        <title>Iniciar sesión</title>
        
    </head>
    <body>
        <div align="center" class="login-container" >
            <h1>Iniciar sesión</h1>
        <form action="login" method="post">
            Usuario: <input class="inpt" type="text" name="usuario"><br>
            Contraseña: <input class="inpt" type="password" name="contrasena"><br>
            <input class="btn" type="submit" value="Iniciar sesión">
        </form>
        </div>
        
    </body>
</html>
