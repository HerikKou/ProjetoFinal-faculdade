<%-- 
    Document   : TransacaoDelet
    Created on : 12 de nov. de 2025, 14:00:41
    Author     : herik
--%>

<%@page import="TransacaoModel.Transacao"%>
<%@page import="DAO.TransacaoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Excluir Transação</title>
    
    <link href="../style_geral/newcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <h1>Resultado da Exclusão</h1>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            TransacaoDao dao = new TransacaoDao();
            Transacao t = dao.consultarPorId(id);

            if (t != null) {
                String sql = "DELETE FROM transacoes WHERE id = " + id;
                dao.cadastrar(t); // ou método excluir se tiver
                out.println("<p style='color:green;'>Transação excluída com sucesso!</p>");
            } else {
                out.println("<p style='color:red;'>Transação não encontrada!</p>");
            }
        %>
        <a href="trans_exclui_form.jsp">Voltar</a>
    </div>
</body>
</html>
