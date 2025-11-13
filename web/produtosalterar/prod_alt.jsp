<%-- 
    Document   : Controle de Produtos
    Created on : 8 de set. de 2025, 21:08:37
    Author     : Adilson Lima
--%>


<%@page import="Produtos.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="DAO.ProdutoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../style_geral/geral.css" rel="stylesheet" type="text/css"/>
        <title>Controle de Produtos</title>
    </head>
    <body>
        <h1>Alteração de Produto</h1>
        <%
            // Instância do Objeto
            Produtos prod = new Produtos();
            
            // Atrib. valores ao obj
            prod.setId( Integer.parseInt(request.getParameter("ident")));
            prod.setNome( request.getParameter("nome"));
            prod.setValor( Float.parseFloat(request.getParameter("valor")));            
            prod.setQtd(Integer.parseInt(request.getParameter("qtd")));
            
            //Gravar...
            ProdutoDAO prodDAO = new ProdutoDAO();
            if (prodDAO.alterar(prod)){
                out.println("Produto alterado com sucesso!");
                //Saída
                out.println("<br><br> <b>Identificador: </b>" + prod.getId());
                out.println("<br> <b>Produto......: </b>" + prod.getNome());
                out.println("<br> <b>Valor........: </b>" + prod.getValor());
                out.println("<br> <b>Quantidade...: </b>" + prod.getQtd());
            }else{
                out.println("Produto não alterado!!!");
            }
        %>
        
    </body>
</html>
