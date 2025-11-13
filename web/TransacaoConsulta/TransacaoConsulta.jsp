<%-- 
    Document   : TransacaoConsulta
    Created on : 12 de nov. de 2025, 14:11:59
    Author     : herik
--%>

<%@page import="TransacaoModel.Transacao"%>
<%@page import="DAO.TransacaoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado da Consulta</title>
    <link href="../style_geral/newcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <h1>Resultado da Consulta</h1>

        <%
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
        %>
            <p style="color:red; text-align:center;">ID inválido. Informe um ID válido.</p>
            <a href="trans_consulta_form.jsp">Nova consulta</a>
        <%
            } else {
                try {
                    int id = Integer.parseInt(idParam);
                    TransacaoDao dao = new TransacaoDao();
                    Transacao t = dao.consultarPorId(id);

                    if (t != null) {
        %>
                        <table>
                            <tr><th>ID</th><td><%= t.getId() %></td></tr>
                            <tr><th>Cliente ID</th><td><%= (t.getCliente() != null ? t.getCliente().getPk_id() : "-") %></td></tr>
                            <tr><th>Vendedor ID</th><td><%= (t.getVendedor() != null ? t.getVendedor().getPk_id() : "-") %></td></tr>
                            <tr><th>Produto ID</th><td><%= (t.getProduto() != null ? t.getProduto().getId() : "-") %></td></tr>
                            <tr><th>Quantidade</th><td><%= t.getQuantidade() %></td></tr>
                            <tr><th>Valor Total</th><td>R$ <%= t.getValorTotal() %></td></tr>
                            <tr><th>Data</th><td><%= t.getData() %></td></tr>
                        </table>
                        <p style="color:green; text-align:center;">Consulta realizada com sucesso.</p>
        <%
                    } else {
        %>
                        <p style="color:red; text-align:center;">Transação com ID <%= id %> não encontrada.</p>
        <%
                    }
                } catch (NumberFormatException nfe) {
        %>
                    <p style="color:red; text-align:center;">ID inválido. Use um número inteiro.</p>
        <%
                } catch (Exception e) {
                    out.println("<p style='color:red; text-align:center;'>Erro ao consultar: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                }
        %>
            <div style="text-align:center; margin-top:12px;">
                <a href="trans_consulta_form.jsp">Nova consulta</a> |
                <a href="transacaoMenu.html">Menu</a> |
                <a href="trans_list.jsp">Listar todas</a>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>

