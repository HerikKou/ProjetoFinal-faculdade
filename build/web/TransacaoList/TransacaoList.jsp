<%-- 
    Document   : TransacaoList
    Created on : 12 de nov. de 2025, 13:57:58
    Author     : herik
--%>
<%@page import="java.util.List"%>
<%@page import="TransacaoModel.Transacao"%>
<%@page import="DAO.TransacaoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Transações</title>

    <link href="../style_geral/newcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <h1>Transações Registradas</h1>
        <%
            TransacaoDao dao = new TransacaoDao();
            List<Transacao> lista = dao.listarTodas();

            if (lista != null && !lista.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>ID</th><th>Cliente</th><th>Vendedor</th>
                    <th>Produto</th><th>Qtd</th><th>Valor</th><th>Data</th>
                </tr>
                <% for (Transacao t : lista) { %>
                <tr>
                    <td><%= t.getId() %></td>
                    <td><%= t.getCliente().getPk_id() %></td>
                    <td><%= t.getVendedor().getPk_id() %></td>
                    <td><%= t.getProduto().getId() %></td>
                    <td><%= t.getQuantidade() %></td>
                    <td>R$ <%= t.getValorTotal() %></td>
                    <td><%= t.getData() %></td>
                </tr>
                <% } %>
            </table>
        <%
            } else {
        %>
            <p style="color:red;">Nenhuma transação encontrada.</p>
        <%
            }
        %>
        <a href="trans_cad_form.jsp">Cadastrar nova</a>
    </div>
</body>
</html>

