<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="script/script.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <div class="content">
            <form method="GET" action="MarqueController">
                <%
                    MarqueService ms = new MarqueService();
                %>
                <fieldset>
                    <c:if test="${marque!=null}">
                        <input name="marqueId" type="hidden" value="${marque.id}" />
                    </c:if>
                    <legend>Informations Marque</legend>
                    <table border="0">
                        <tr>
                            <td>Code</td>
                            <td><input id="code" type="text" name="code" value=""  required=""/></td>
                        </tr>
                        <tr>
                            <td>Libelle</td>
                            <td><input id="libelle" type="text" name="libelle" value="" required="" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <c:if test="${marque == null}">
                                    <input name="op" type="submit" value="Envoyer" />
                                </c:if>
                                <c:if test="${marque != null}">
                                    <input name="op" type="submit" value="Apply" />
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>

            <fieldset>
                <legend>Liste des marque</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Code <br>
                            <th>Libelle</th>

                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Marque m : ms.findAll()) {
                        %>
                        <tr>
                            <td><%=m.getId()%></td>
                            <td><%=m.getCode()%></td>
                            <td><%=m.getLibelle()%></td>
                             <td><a class="bndelete" href="javascript:void(0);" onclick="confirmDel('<%=m.getId()%>','<%=m.getLibelle()%>','Marque')">Supprimer</a></td>
                            <td><a class="bnupdate" href="MarqueController?op=update&id=<%=m.getId()%>">Modifier</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </fieldset>
        </form>            
</body>
</html>
