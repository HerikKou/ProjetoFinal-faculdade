<%-- 
    Document   : ConsultaGeral
    Created on : 11 de nov. de 2025, 13:18:48
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
        <title>Lista de Clientes</title>
        <style>
            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                background-color: #f4f7fb;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }

            .container {
                width: 80%;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
                text-align: left;
            }

            th, td {
                padding: 12px 15px;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #007bff;
                color: #fff;
                text-transform: uppercase;
                font-size: 14px;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .empty {
                text-align: center;
                color: #555;
                font-size: 18px;
                margin-top: 20px;
            }

            a {
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                color: #fff;
                background: #28a745;
                padding: 10px 20px;
                border-radius: 6px;
                transition: background 0.3s;
            }

            a:hover {
                background: #218838;
            }

            .btn-center {
                text-align: center;
                margin-top: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Lista de Clientes Cadastrados</h2>
            <%
                PessoaDao dao = new PessoaDao();
                List<Cliente> clientes = dao.consultarGeral();
                if(clientes.isEmpty()){
            %>
                <p class="empty">Nenhum cliente cadastrado!</p>
            <%
                } else {
            %>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Saldo</th>
                        <th>Email</th>
                    </tr>
                    <%
                        for(Cliente cliente : clientes){
                    %>
                    <tr>
                        <td><%= cliente.getPk_id() %></td>
                        <td><%= cliente.getNome() %></td>
                        <td><%= cliente.getCpf() %></td>
                        <td>R$ <%= cliente.getSaldo() %></td>
                        <td><%= cliente.getEmail() %></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            <%
                }
            %>
            <div class="btn-center">
                <a href="../Pessoa/Pessoa.html">Voltar</a>
            </div>
        </div>
    </body>
</html>
