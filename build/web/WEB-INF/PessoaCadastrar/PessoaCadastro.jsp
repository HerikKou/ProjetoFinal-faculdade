<%-- 
   -  Document   : PessoaCadastro
   -  Data e Hora : 11 de nov. de 2025, 11:23:48
   -  Autor     : Herik Kou Homma Kato
   -  RGM        : 11241101814
--%>


<%@page import="DAO.PessoaDao"%>
<%@page import="Model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<a href="../../src/java/DAO/PessoaDao.java"></a>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce</title>
    </head>
    <body>
        <h1>Cadastro de Pessoa</h1>

<!-- Formulário com campo ID -->
<form method="post">
    ID: <input type="number" name="id" required><br>
    Nome: <input type="text" name="nome" required><br>
    CPF: <input type="text" name="cpf" required><br>
    Saldo: <input type="number" step="0.01" name="saldo" required><br>
    Email: <input type="email" name="email" required><br>
    <input type="submit" value="Cadastrar">
</form>

<%
    // Processa somente se o form foi enviado
     if(request.getParameter("id") != null) {
        Pessoa pessoa = new Pessoa();
        pessoa.setPk_id(Integer.parseInt(request.getParameter("id")));
        pessoa.setNome(request.getParameter("nome"));
        pessoa.setCpf(request.getParameter("cpf"));
        pessoa.setSaldo(Double.parseDouble(request.getParameter("saldo")));
        pessoa.setEmail(request.getParameter("email"));

        PessoaDao dao = new PessoaDao();
        if(dao.cadastrar(pessoa)) {
            out.println("<p>Pessoa cadastrada com sucesso!</p>");
            out.println("<b>ID:</b> " + pessoa.getPk_id() + "<br>");
            out.println("<b>Nome:</b> " + pessoa.getNome() + "<br>");
            out.println("<b>CPF:</b> " + pessoa.getCpf() + "<br>");
            out.println("<b>Saldo:</b> " + pessoa.getSaldo() + "<br>");
            out.println("<b>Email:</b> " + pessoa.getEmail() + "<br>");
        } else {
            out.println("<p>Erro ao cadastrar pessoa!</p>");
        }
    }

%>
        
    </body>
</html>
