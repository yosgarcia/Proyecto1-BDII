
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar sesión</title>
        <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            width: 300px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .login-container input {
            margin-bottom: 10px;
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
    </style>
    </head>
    <body>
        <div align="center" class="login-container" >
            <h1>Iniciar sesión</h1>
            <form action="login" method="post">
                Usuario: <input type="text" name="usuario"><br>
                Contraseña: <input type="password" name="contrasena"><br>
                <input type="submit" value="Iniciar sesión">
            </form>
        </div>
        
    </body>
</html>
