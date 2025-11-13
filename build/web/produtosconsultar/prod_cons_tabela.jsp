<%-- 
 *@author Herik Kato
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
        
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th{
                padding: 8px;
                text-align: left;
                border: 1px solid #DDD;
                background-color: #1a73e8;
            }
            td{
                padding: 8px;
                text-align: left;
                border: 1px solid #DDD;
            }
            tr:hover {background-color: #D6EEEE;}
        </style> 
        
        
        <link href="../style_geral/relatorio1.css" rel="stylesheet" type="text/css"/>
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
        %>
                <table class="table table-hover">
                    <tr>                        
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Valor</th>
                        <th>Qtd</th>                                               
                   </tr>                 
        <%
               for(int i=0; i <= lista.size() - 1; i++){ 
        %>
                    <tr>                        
                        <td><%=lista.get(i).getId()%></td>
                        <td><%=lista.get(i).getNome()%></td>
                        <td><%=lista.get(i).getValor()%></td>
                        <td><%=lista.get(i).getQtd()%></td>                                               
                   </tr>                        
        <%
               }
            }
        %>
               </table>
    </body>
</html>
