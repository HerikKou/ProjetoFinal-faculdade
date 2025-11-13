<%-- 
   ** @author Herik Kato
 * Data: 11/11/25
 * RGM:11241101814
--%>

<%@page import="Produtos.Produtos"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

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
        <h2>Consulta de Produtos - Contém no nome</h2>        
        <%                     
            List<Produtos> lista = new ArrayList();            
            
            //Consultar Id...
            ProdutoDAO prodDAO = new ProdutoDAO();                                
            
            lista = prodDAO.consultar_nome(request.getParameter("nome"));
            if (prodDAO.consultar_geral() == null){
                out.println("Produto não encontrado!");
            }else{
               //Saída
               out.println("<br> <b>Código | Nome | Valor | Qtd </b> <br>");
               for(int i=0; i <= lista.size() - 1; i++){ 
                    out.println( lista.get(i).getId() + " | " + lista.get(i).getNome()+ " | "+ lista.get(i).getValor()+ " | " + lista.get(i).getQtd() + "<br>");               
               }
            }


        %>
    </body>
</html>
