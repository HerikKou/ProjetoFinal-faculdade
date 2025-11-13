<%-- 
    Document   : ConsultarPorID
    Created on : 11 de nov. de 2025, 16:19:13
    Author     : herik
--%>
<%@page import="DAO.VendedorDao"%>
<%@page import="Vendedor.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consultar Vendedor por ID</title>
        <link href="../CSS_Global/vendedor_global.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <h1>Consultar por ID</h1>

        

        <%
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.trim().isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);
                    VendedorDao dao = new VendedorDao();
                    Vendedor v = dao.consultarPorId(id);

                    if (v == null) {
                        out.println("<p>Nenhum vendedor encontrado com esse ID!</p>");
                    } else {
                        out.println("<table>");
                        out.println("<tr><th>ID</th><th>Nome</th><th>CPF</th><th>Saldo</th><th>Email</th><th>Telefone</th></tr>");
                        out.println("<tr>");
                        out.println("<td>" + v.getPk_id() + "</td>");
                        out.println("<td>" + v.getNome() + "</td>");
                        out.println("<td>" + v.getCpf() + "</td>");
                        out.println("<td>R$ " + v.getSaldo() + "</td>");
                        out.println("<td>" + v.getEmail() + "</td>");
                        out.println("<td>" + v.getTelefone() + "</td>");
                        out.println("</tr>");
                        out.println("</table>");
                    }
                } catch (NumberFormatException nfe) {
                    out.println("<p style='color:red'>ID inválido.</p>");
                } catch (Exception e) {
                    out.println("<p style='color:red'>Erro: " + e.getMessage() + "</p>");
                }
            }
        %>

        <div style="text-align:center;margin-top:20px;">
           <a href="../Menu/Menu.html">Voltar</a>
        </div>
    </div>
</body>
</html>
