<%-- 
    Document   : ConsultaID
    Created on : 11 de nov. de 2025, 12:50:56
    Author     : herik
--%>
<%@page import="Clientes.Cliente"%>

<%@page import="DAO.PessoaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-commerce</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        .notfound {
            color: #d9534f;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s;
        }

        a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Consulta por ID</h1>
        <%
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                PessoaDao dao = new PessoaDao();
                Cliente cliente = dao.consultarPorId(id);

                if (cliente != null) {
                    out.println("<table>");
                    out.println("<tr><th>ID</th><th>Nome</th><th>CPF</th><th>Saldo</th><th>Email</th></tr>");
                    out.println("<tr>");
                    out.println("<td>" + cliente.getPk_id() + "</td>");
                    out.println("<td>" + cliente.getNome() + "</td>");
                    out.println("<td>" + cliente.getCpf() + "</td>");
                    out.println("<td>" + cliente.getSaldo() + "</td>");
                    out.println("<td>" + cliente.getEmail() + "</td>");
                    out.println("</tr>");
                    out.println("</table>");
                } else {
                    out.println("<p class='notfound'>Cliente não encontrado!</p>");
                }
            } catch (Exception e) {
                out.println("<p class='notfound'>Erro: " + e.getMessage() + "</p>");
            }
        %>

       <div class="btn-center">
                <a href="../Pessoa/Pessoa.html">Voltar</a>
            </div>
    </div>
</body>
</html>
