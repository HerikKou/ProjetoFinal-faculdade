
<%@page import="Produtos.Produtos"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Produtos</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef3f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            width: 600px;
        }

        h1 {
            color: #004aad;
            text-align: center;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #004aad;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4f7fb;
        }

        .mensagem {
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }

        .sucesso {
            color: green;
        }

        .erro {
            color: red;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
            color: #004aad;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Cadastro de Produto</h1>

        <%
            Produtos prod = new Produtos();

            prod.setId(Integer.parseInt(request.getParameter("ident")));
            prod.setNome(request.getParameter("nome"));
            prod.setValor(Float.parseFloat(request.getParameter("valor")));            
            prod.setQtd(Integer.parseInt(request.getParameter("qtd")));

            ProdutoDAO prodDAO = new ProdutoDAO();

            if (prodDAO.cadastrar(prod)) {
        %>
                <p class="mensagem sucesso"> Produto inserido com sucesso!</p>
                <table>
                    <tr><th>ID</th><td><%= prod.getId() %></td></tr>
                    <tr><th>Nome</th><td><%= prod.getNome() %></td></tr>
                    <tr><th>Valor</th><td>R$ <%= prod.getValor() %></td></tr>
                    <tr><th>Quantidade</th><td><%= prod.getQtd() %></td></tr>
                </table>
        <%
            } else {
        %>
                <p class="mensagem erro"> Erro ao cadastrar produto!</p>
        <%
            }
        %>

        <a href="../Menu/Menu.html">Voltar ao menu</a>
    </div>
</body>
</html>
