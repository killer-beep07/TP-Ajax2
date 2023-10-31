<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="script/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="script/machineByMarque.js" type="text/javascript"></script>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <div class="content">
            <form method="GET" action="MachineController">
                <fieldset>
                    <legend> Marque</legend>
                    <table border="0">

                        <tr>
                            <td>Marque</td>
                            <td>
                                <select id="marque" name="marque">
                                    <option value="0">Choisir une marque</option>
                                    <%
                                        MarqueService ms = new MarqueService();
                                        for (Marque m : ms.findAll()) {
                                    %>
                                    <option value="<%=m.getId()%>"><%=m.getLibelle()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>


                    </table>
                </fieldset>
            </form>
            <%
                MachineService mms = new MachineService();
            %>
            <fieldset>
                <legend>Liste des Machines</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Reference <br>

                            <th>Prix</th>
                            <th>Marque</th>
                            <th>Date d'achat</th>

                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody  id='body'>


                    </tbody>
                </table>

            </fieldset>
        </form>            
</body>
</html>
