<%-- 
    Document   : TransacaoCad
    Created on : 12 de nov. de 2025, 12:46:26
    Author     : herik
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="Produtos.Produtos"%>
<%@page import="Clientes.Cliente"%>
<%@page import="Vendedor.Vendedor"%>
<%@page import="DAO.TransacaoDao"%>
<%@page import="TransacaoModel.Transacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transação Registrada</title>
    <link href="../style_geral/newcss.css" rel="stylesheet" type="text/css"/>
    
</head>
<body>
    <div class="container">
        <h1>Resultado do Cadastro</h1>

        <%
            Transacao t = new Transacao();

            Cliente c = new Cliente();
            c.setPk_id(Integer.parseInt(request.getParameter("clienteId")));
            t.setCliente(c);

            Vendedor v = new Vendedor();
            v.setPk_id(Integer.parseInt(request.getParameter("vendedorId")));
            t.setVendedor(v);

            Produtos p = new Produtos();
            p.setId(Integer.parseInt(request.getParameter("produtoId")));
            t.setProduto(p);

            t.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            t.setValorTotal(Double.parseDouble(request.getParameter("valorTotal")));
            t.setData(LocalDateTime.now());

            TransacaoDao dao = new TransacaoDao();
            boolean ok = dao.cadastrar(t);

            if (ok) {
        %>
            <table>
                <tr><th>Cliente ID</th><td><%= t.getCliente().getPk_id() %></td></tr>
                <tr><th>Vendedor ID</th><td><%= t.getVendedor().getPk_id() %></td></tr>
                <tr><th>Produto ID</th><td><%= t.getProduto().getId() %></td></tr>
                <tr><th>Quantidade</th><td><%= t.getQuantidade() %></td></tr>
                <tr><th>Valor Total</th><td>R$ <%= t.getValorTotal() %></td></tr>
                <tr><th>Data</th><td><%= t.getData() %></td></tr>
            </table>
            <p style="color:green; text-align:center;">Transação registrada com sucesso!</p>
        <%
            } else {
        %>
            <p style="color:red; text-align:center;">Erro ao cadastrar transação!</p>
        <%
            }
        %>

        <a href="trans_cad_form.jsp">Cadastrar outra</a> |
        <a href="trans_list.jsp">Listar Transações</a>
    </div>
</body>
</html>

