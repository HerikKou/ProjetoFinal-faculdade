<%-- 
  ** @author Herik Kato
 * Data: 11/11/25
 * RGM:11241101814
--%>

<%@page import="Produtos.Produtos"%>
<%@page import="java.util.*"%>

<%@page import="DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Consulta de Produtos Geral</h2>
        
        <%
            List<Produtos> lista = new ArrayList();
                    
            // Instância do Objeto           
            //Consultar Geral...
            ProdutoDAO prodDAO = new ProdutoDAO();
            lista = prodDAO.consultar_geral();
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
