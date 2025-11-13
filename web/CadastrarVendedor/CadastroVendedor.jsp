<%-- 
    Document   : CadastroVendedor
    Created on : 11 de nov. de 2025, 15:43:43
    Author     : herik
--%>



<%@page import="DAO.VendedorDao"%>
<%@page import="Vendedor.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Vendedor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef3f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 600px;
        }

        h1 {
            text-align: center;
            color: #004aad;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
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
            margin-top: 20px;
            color: #004aad;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Cadastro de Vendedor</h1>
        <%
            Vendedor vendedor = new Vendedor();
            boolean cadastroSucesso = false;
            String mensagemErro = "";

            try {
                // ID manual
                try {
                    vendedor.setPk_id(Integer.parseInt(request.getParameter("id")));
                } catch (NumberFormatException e) {
                    mensagemErro = "ID inválido!";
                }

                vendedor.setNome(request.getParameter("nome"));
                vendedor.setCpf(request.getParameter("cpf"));

                // Saldo seguro
                try {
                    vendedor.setSaldo(Double.parseDouble(request.getParameter("saldo")));
                } catch (NumberFormatException e) {
                    mensagemErro = "Saldo inválido!";
                }

                vendedor.setEmail(request.getParameter("email"));
                vendedor.setTelefone(request.getParameter("telefone"));
                vendedor.setEndereco(request.getParameter("endereco"));
                vendedor.setCidade(request.getParameter("cidade"));
                vendedor.setEstado(request.getParameter("estado"));
                vendedor.setCep(request.getParameter("cep"));
                vendedor.setCnpj(request.getParameter("cnpj"));

                if (mensagemErro.isEmpty()) {
                    VendedorDao dao = new VendedorDao();
                    cadastroSucesso = dao.cadastrar(vendedor);
                }

            } catch (Exception ex) {
                mensagemErro = "Erro ao processar cadastro: " + ex.getMessage();
            }

            if (cadastroSucesso) {
        %>
                <p class="mensagem sucesso">Vendedor cadastrado com sucesso!</p>
                <table>
                    <tr><th>ID</th><td><%= vendedor.getPk_id() %></td></tr>
                    <tr><th>Nome</th><td><%= vendedor.getNome() %></td></tr>
                    <tr><th>CPF</th><td><%= vendedor.getCpf() %></td></tr>
                    <tr><th>Saldo</th><td>R$ <%= vendedor.getSaldo() %></td></tr>
                    <tr><th>Email</th><td><%= vendedor.getEmail() %></td></tr>
                    <tr><th>Telefone</th><td><%= vendedor.getTelefone() %></td></tr>
                    <tr><th>Endereço</th><td><%= vendedor.getEndereco() %></td></tr>
                    <tr><th>Cidade</th><td><%= vendedor.getCidade() %></td></tr>
                    <tr><th>Estado</th><td><%= vendedor.getEstado() %></td></tr>
                    <tr><th>CEP</th><td><%= vendedor.getCep() %></td></tr>
                    <tr><th>CNPJ</th><td><%= vendedor.getCnpj() %></td></tr>
                </table>
        <%
            } else {
        %>
                <p class="mensagem erro"><%= mensagemErro.isEmpty() ? "Erro ao cadastrar vendedor!" : mensagemErro %></p>
        <%
            }
        %>
        <a href="../Menu/Menu.html">Voltar ao menu</a>
    </div>
</body>
</html>
</body>
</html>
