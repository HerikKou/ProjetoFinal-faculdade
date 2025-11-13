<%-- 
    Document   : Deletar
    Created on : 11 de nov. de 2025, 16:04:24
    Author     : herik kato 
    RGM: 11241101814
--%>

<%@page import="DAO.VendedorDao"%>
<%@page import="Vendedor.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Excluir Vendedor</title>
    <link href="../CSS_global/css_global.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef1f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 30px;
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .success {
            color: #28a745;
            font-weight: bold;
        }

        .error {
            color: #dc3545;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 6px;
            transition: background 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    

         <div class="container">
        <h2>Resultado da Exclusão</h2>

        <%
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                VendedorDao dao = new VendedorDao();

                if (dao.deletar(id)) {
                    out.println("<p class='success'>Cliente deletado com sucesso!</p>");
                } else {
                    out.println("<p class='error'>Falha ao deletar o vendedor!</p>");
                }
            } catch (Exception e) {
                out.println("<p class='error'>Erro: " + e.getMessage() + "</p>");
            }
        %>
        %>

        <div style="text-align:center;margin-top:20px;">
            <a href="../Menu/Menu.html">Voltar</a>
        </div>
    </div>
</body>
</html>
