<%-- 
    Document   : ConsultarNome
    Created on : 11 de nov. de 2025, 13:00:48
    Author     : herik
--%>

<%@page import="java.util.List"%>
<%@page import="Clientes.Cliente"%>

<%@page import="DAO.PessoaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Consulta por Nome</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #eef1f5;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                width: 80%;
                max-width: 900px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 30px;
            }

            h2 {
                text-align: center;
                color: #007bff;
                margin-bottom: 25px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #007bff;
                color: white;
                text-transform: uppercase;
                font-size: 14px;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            p {
                text-align: center;
                font-size: 18px;
                color: #555;
            }

            a {
                display: inline-block;
                margin-top: 25px;
                text-decoration: none;
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background 0.3s;
            }

            a:hover {
                background-color: #0056b3;
            }

            .btn-center {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Resultado da Consulta</h2>
            <%
                String nome = request.getParameter("nome");
                PessoaDao dao = new PessoaDao();
                List<Cliente> cliente = dao.consultarPorNome(nome);

                if (cliente.isEmpty()) {
                    out.println("<p>Nenhum cliente encontrado com esse nome!</p>");
                } else {
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<th>ID</th>");
                    out.println("<th>Nome</th>");
                    out.println("<th>CPF</th>");
                    out.println("<th>Saldo</th>");
                    out.println("<th>Email</th>");
                    out.println("</tr>");

                    for (Cliente c : cliente) {
                        out.println("<tr>");
                        out.println("<td>" + c.getPk_id() + "</td>");
                        out.println("<td>" + c.getNome() + "</td>");
                        out.println("<td>" + c.getCpf() + "</td>");
                        out.println("<td>R$ " + c.getSaldo() + "</td>");
                        out.println("<td>" + c.getEmail() + "</td>");
                        out.println("</tr>");
                    }

                    out.println("</table>");
                }
            %>

            <div class="btn-center">
                <a href="../Pessoa/Pessoa.html">Voltar</a>
            </div>
        </div>
    </body>
</html>
