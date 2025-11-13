<%-- 
    Document   : ConsultaGeral
    Created on : 11 de nov. de 2025, 16:09:54
    Author     : herik
--%>

<%@page import="Vendedor.Vendedor"%>
<%@page import="DAO.VendedorDao"%>
<%@page import="java.util.List"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consulta Geral de Vendedores</title>
    <link href="../CSS_global/css_global.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <h1>Consulta Geral de Vendedores</h1>

        <%
            try {
                VendedorDao dao = new VendedorDao();
                List<Vendedor> lista = dao.consultarGeral();

                if (lista == null || lista.isEmpty()) {
                    out.println("<p>Nenhum vendedor cadastrado!</p>");
                } else {
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<th>ID</th>");
                    out.println("<th>Nome</th>");
                    out.println("<th>CPF</th>");
                    out.println("<th>Saldo</th>");
                    out.println("<th>Email</th>");
                    out.println("<th>Telefone</th>");
                    out.println("<th>Cidade</th>");
                    out.println("</tr>");

                    for (Vendedor v : lista) {
                        out.println("<tr>");
                        out.println("<td>" + v.getPk_id() + "</td>");
                        out.println("<td>" + v.getNome() + "</td>");
                        out.println("<td>" + v.getCpf() + "</td>");
                        out.println("<td>R$ " + v.getSaldo() + "</td>");
                        out.println("<td>" + v.getEmail() + "</td>");
                        out.println("<td>" + v.getTelefone() + "</td>");
                        out.println("<td>" + v.getCidade() + "</td>");
                        out.println("</tr>");
                    }

                    out.println("</table>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red'>Erro: " + e.getMessage() + "</p>");
            }
        %>

        <div style="text-align:center;margin-top:20px;">
           <a href="../Menu/Menu.html">Voltar</a>
        </div>
    </div>
</body>
</html>

