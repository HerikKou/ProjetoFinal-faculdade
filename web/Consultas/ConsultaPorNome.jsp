<%-- 
    Document   : ConsultaPorNome
    Created on : 11 de nov. de 2025, 16:15:32
    Author     : herik
--%>
<%@page import="java.util.List"%>
<%@page import="DAO.VendedorDao"%>
<%@page import="Vendedor.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consultar Vendedor por Nome</title>
       <link href="../CSS_Global/vendedor_global.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <h1>Consultar por Nome</h1>



        <%
            String nome = request.getParameter("nome");
            if (nome != null && !nome.trim().isEmpty()) {
                try {
                    VendedorDao dao = new VendedorDao();
                    List<Vendedor> lista = dao.consultarPorNome(nome);

                    if (lista == null || lista.isEmpty()) {
                        out.println("<p>Nenhum vendedor encontrado com esse nome!</p>");
                    } else {
                        out.println("<table>");
                        out.println("<tr>");
                        out.println("<th>ID</th>");
                        out.println("<th>Nome</th>");
                        out.println("<th>CPF</th>");
                        out.println("<th>Saldo</th>");
                        out.println("<th>Email</th>");
                        out.println("<th>Telefone</th>");
                        out.println("</tr>");

                        for (Vendedor v : lista) {
                            out.println("<tr>");
                            out.println("<td>" + v.getPk_id() + "</td>");
                            out.println("<td>" + v.getNome() + "</td>");
                            out.println("<td>" + v.getCpf() + "</td>");
                            out.println("<td>R$ " + v.getSaldo() + "</td>");
                            out.println("<td>" + v.getEmail() + "</td>");
                            out.println("<td>" + v.getTelefone() + "</td>");
                            out.println("</tr>");
                        }

                        out.println("</table>");
                    }
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

