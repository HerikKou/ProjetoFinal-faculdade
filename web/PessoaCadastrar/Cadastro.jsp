

<%@page import="Clientes.Cliente"%>
<%@page import="DAO.PessoaDao"%>
<!--

Documeto: Cadastro.jsp
Autor: Herik Kou Homma Kato
RGM: 11241101814
Data: 11 de novembro de 205
Hora:14:21
-->



<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Pessoa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: center;
            width: 420px;
        }

        h2 {
            color: #28a745;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background: #007bff;
            padding: 10px 20px;
            border-radius: 6px;
            transition: background 0.3s;
        }

        a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
<%
    Cliente cliente = new Cliente();
    cliente.setPk_id(Integer.parseInt(request.getParameter("id")));
    cliente.setNome(request.getParameter("nome"));
    cliente.setCpf(request.getParameter("cpf"));
    cliente.setSaldo(Double.parseDouble(request.getParameter("saldo")));
    cliente.setEmail(request.getParameter("email"));

    PessoaDao dao = new PessoaDao();

    if(dao.cadastrar(cliente)){
%>
        <h2>Pessoa cadastrada com sucesso!</h2>
        <table>
            <tr><th>Campo</th><th>Valor</th></tr>
            <tr><td>ID</td><td><%= cliente.getPk_id() %></td></tr>
            <tr><td>Nome</td><td><%= cliente.getNome() %></td></tr>
            <tr><td>CPF</td><td><%= cliente.getCpf() %></td></tr>
            <tr><td>Saldo</td><td><%= cliente.getSaldo() %></td></tr>
            <tr><td>Email</td><td><%= cliente.getEmail() %></td></tr>
        </table>
      <div class="btn-center">
                <a href="../Pessoa/Pessoa.html">Voltar</a>
            </div>
<%
    } else {
%>
        <h2 style="color: red;">Erro ao cadastrar pessoa!</h2>
<%
    }
%>
</div>

</body>
</html>
