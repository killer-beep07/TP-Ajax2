<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="script/script.js" type="text/javascript"></script>
        <script src="script/jsonExemple.js" type="text/javascript"></script>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <%@include file="template/footer.jsp" %>

        <div class="content">
            <form method="GET" action="EtudiantController">
                <%
                    EtudiantService es = new EtudiantService();
                %>
                <fieldset>
                    <c:if test="${user!=null}">
                        <input name="userId" type="hidden" value="${user.id}" />
                    </c:if>
                  
                        <legend>Informations Etudiant</legend>
                               
                        
                    <table border="0">
                        <tr>
                            
                                
                                <td>Nom</td>
                                <td><input id="nom" type="text" name="nom" value=""  required=""/></td>
                               

                        </tr>
                        <tr>
                          
                              
                                <td>Prenom</td>
                                <td><input id="prenom" type="text" name="prenom" value="" required="" /></td>
                           
                        </tr>
                        <tr>
                           
                               
                                <td>Ville</td>
                                <td><select id="ville" name="ville">
                                        <option value="Rabat">Rabat</option>
                                        <option value="Fes">Fes</option>
                                        <option value="Marakech">Marrakech</option>

                                    </select></td>
                                
                        </tr>
                        <tr>
                            
                                
                                <td>Date de Naissance</td>
                                <td><input id="date" type="date" name="dateNaissance" value="" required="" /></td>

                          
                        </tr>

                        <tr>
                            <td>Sexe</td>
                            <td>M<input id="m" type="radio" name="sexe" value="homme" />
                                F<input id="f" type="radio" name="sexe" value="femme" checked="checked" /></td>
                        </tr>
                        <tr>
                            <td>
                           
                            
                                    <input name="op" type="submit" value="Envoyer" />
                               </td>
                          <td>
                                    <input name="op" type="submit" value="Apply" />
                               </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
         
            <fieldset>
                <legend>Liste des étudiants</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nom <br>
                            <th>Prenom</th>
                            <th>Ville</th>
                            <th>Date de naissance</th>
                            <th>Sexe</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            for (Etudiant e : es.findAll()) {
                        %>
                        <tr>
                            <td><%=e.getId()%></td>
                            <td><%=e.getNom()%></td>
                            <td><%=e.getPrenom()%></td>
                            <td><%=e.getVille()%></td>
                            <td><%=e.getDateNaissance()%></td>
                            <td><%=e.getSexe()%></td>
                            <td><a class="bndelete" href="javascript:void(0);" onclick="confirmDel('<%=e.getId()%>', '<%=e.getNom() + " " + e.getPrenom()%>','Etudiant')">Supprimer</a></td>
                            <td><a class="bnupdate" href="EtudiantController?op=update&id=<%=e.getId()%>">Modifier</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </fieldset>
        </div>
    </body>
</html>
