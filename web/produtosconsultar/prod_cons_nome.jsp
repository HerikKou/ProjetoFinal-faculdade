<%-- 
   
    Author: Herik Kato
    RGM: 11241101814
--%>

<%@page import="DAO.ProdutoDAO"%>
<%@page import="Produtos.Produtos"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../style_geral/geral.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Consulta de Produtos Geral</h2>        
        <%                     
            // Instância do Objeto           
            Produtos prod = new Produtos();
            prod.setNome(request.getParameter("nome"));            
            
            //Consultar Id...
            ProdutoDAO prodDAO = new ProdutoDAO();            
            prod = prodDAO.consultar_nome(prod);
            
            if (prod == null){
                out.println("Produto não encontrado!");
            }else{
               //Saída
               out.println("<br> <b>Código....: </b>" + prod.getId());
               out.println("<br> <b>Produto...: </b>" + prod.getNome());
               out.println("<br> <b>Valor.....: </b>" + prod.getValor());
               out.println("<br> <b>Quantidade: </b>" + prod.getQtd());                
            }
        %>
    </body>
</html>
