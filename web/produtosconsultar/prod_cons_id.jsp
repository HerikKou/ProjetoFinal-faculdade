<%-- 
   ** @author Herik Kato
 * Data: 11/11/25
 * RGM:11241101814
--%>


<%@page import="Produtos.Produtos"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../style_geral/geral.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Consulta de Produtos Geral</h2>        
        <%                     
            // Instância do Objeto           
            Produtos prod = new Produtos();
            prod.setId(Integer.parseInt(request.getParameter("ident")));            
            
            //Consultar Id...
            ProdutoDAO prodDAO = new ProdutoDAO();            
            prod = prodDAO.consultar_id(prod);
            
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
