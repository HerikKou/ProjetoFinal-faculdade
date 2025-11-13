<%-- 
    Document   : AtualizarCliente
    Created on : 11 de nov. de 2025, 12:43:12
    Author     : herik
--%>

<%@page import="Clientes.Cliente"%>
<%@page import="DAO.PessoaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualizar Pessoa</title>
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
            color: #333;
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

        .info {
            text-align: left;
            margin-top: 10px;
            line-height: 1.6;
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
        <h2>Resultado da Atualização</h2>
        <%
            try {
                Cliente cliente = new Cliente();
                cliente.setPk_id(Integer.parseInt(request.getParameter("id")));
                cliente.setNome(request.getParameter("nome"));
                cliente.setCpf(request.getParameter("cpf"));
                cliente.setSaldo(Double.parseDouble(request.getParameter("saldo")));
                cliente.setEmail(request.getParameter("email"));

                PessoaDao dao = new PessoaDao();

                if (dao.atualizar(cliente)) {
                    out.println("<p class='success'>Pessoa atualizada com sucesso!</p>");
                    out.println("<div class='info'>");
                    out.println("<b>ID:</b> " + cliente.getPk_id() + "<br>");
                    out.println("<b>Nome:</b> " + cliente.getNome() + "<br>");
                    out.println("<b>CPF:</b> " + cliente.getCpf() + "<br>");
                    out.println("<b>Saldo:</b> R$ " + cliente.getSaldo() + "<br>");
                    out.println("<b>Email:</b> " + cliente.getEmail() + "<br>");
                    out.println("</div>");
                } else {
                    out.println("<p class='error'>Erro ao atualizar pessoa!</p>");
                }
            } catch (Exception e) {
                out.println("<p class='error'>Erro: " + e.getMessage() + "</p>");
            }
        %>

        <div class="btn-center">
                <a href="../Pessoa/Pessoa.html">Voltar</a>
            </div>
    </div>
</body>
</html>
