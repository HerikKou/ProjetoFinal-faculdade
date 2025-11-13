<%-- 
    Document   : Atualizar
    Created on : 11 de nov. de 2025, 15:53:07
    Author     : herik
--%>

<%@page import="DAO.VendedorDao"%>
<%@page import="Vendedor.Vendedor"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Atualizar Vendedor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 50px auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        .mensagem {
            text-align: center;
            font-weight: bold;
            margin-top: 15px;
        }

        .voltar {
            text-align: center;
            margin-top: 20px;
        }

        .voltar a {
            text-decoration: none;
            color: #333;
            border: 1px solid #333;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .voltar a:hover {
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Atualizar Vendedor</h2>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            try {
                Vendedor v = new Vendedor();
                v.setPk_id(Integer.parseInt(request.getParameter("id")));
                v.setNome(request.getParameter("nome"));
                v.setCpf(request.getParameter("cpf"));
                v.setEmail(request.getParameter("email"));
                v.setSaldo(Double.parseDouble(request.getParameter("saldo")));
                v.setTelefone(request.getParameter("telefone"));
                v.setEndereco(request.getParameter("endereco"));
                v.setCidade(request.getParameter("cidade"));
                v.setEstado(request.getParameter("estado"));
                v.setCep(request.getParameter("cep"));
                v.setCnpj(request.getParameter("cnpj"));

                VendedorDao dao = new VendedorDao();
                boolean atualizado = dao.atualizar(v);

                if (atualizado) {
                    out.println("<table>");
                    out.println("<tr><th>Status</th><th>Mensagem</th></tr>");
                    out.println("<tr><td style='color:green;'>Sucesso</td><td>Vendedor atualizado com sucesso!</td></tr>");
                    out.println("</table>");
                } else {
                    out.println("<table>");
                    out.println("<tr><th>Status</th><th>Mensagem</th></tr>");
                    out.println("<tr><td style='color:red;'>Erro</td><td>Erro ao atualizar vendedor!</td></tr>");
                    out.println("</table>");
                }
            } catch (Exception e) {
                out.println("<table>");
                out.println("<tr><th>Status</th><th>Mensagem</th></tr>");
                out.println("<tr><td style='color:red;'>Exceção</td><td>" + e.getMessage() + "</td></tr>");
                out.println("</table>");
            }
        }
    %>

    <div class="voltar">
        <a href="../Menu/Menu.html">Voltar</a>
    </div>
</div>

</body>
</html>
    </div>
</body>
</html>
