<%-- 
   ** @author Herik Kato
 * Data: 11/11/25
 * RGM:11241101814
--%>


<%@page import="Produtos.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="DAO.ProdutoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../style_geral/relatorio1.css" rel="stylesheet" type="text/css"/>
        <title>Controle de Produtos</title>
    </head>
    <body>
        <h1>Excluir Produtos</h1>
        <%
            // Instância do Objeto
            Produtos prod = new Produtos();
            
            // Atrib. valores ao obj
            prod.setId( Integer.parseInt(request.getParameter("ident")));            
            
            //Excluir...
            ProdutoDAO prodDAO = new ProdutoDAO();
            if (prodDAO.excluir(prod)){
                out.println("Produto excluído com sucesso!");
            }else{
                out.println("Produto não excluído!");
            }
        %>
        
    </body>
</html>
