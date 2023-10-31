<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="script/jquery-3.3.1.min.js" type="text/javascript"></script>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <div class="content">
            <form method="GET" action="MachineByReferenceController">
                <fieldset>
                    <legend>Machine Reference</legend>
                    <table border="0">
                        <tr>
                            <td>Reference</td>
                            <td>
                                <select id="reference" name="reference">
                                    <option value="0">Choose a reference</option>
                                    <%
                                        MachineService mms = new MachineService();
                                        for (Machine m : mms.findAll()) {
                                    %>
                                    <option value="<%=m.getReference()%>"><%=m.getReference()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
            <script>
                $(document).ready(function () {

                    $("#reference").change(function () {
                        $.ajax({
                            url: 'MachineByReferenceController',
                            data: {ref: $(this).val()},
                            type: 'POST',
                            success: function (data) {
                                var ligne = "";
                                for (var i = 0; i < data.length; i++) {
                                    ligne += '<tr>'
                                            + '<td>' + data[i].id + '</td>'
                                            + '<td>' + data[i].reference + '</td>'
                                            + '<td>' + data[i].prix + '</td>'
                                            + '<td>' + data[i].dateAchat + '</td>'
                                            + '<td>' + data[i].marque.libelle + '</td>'
                                            + '<td><a class="bndelete" href="MachineController?op=delete&id=' + data[i].id + '">Supprimer</a></td>'
                                            + '<td><a class="bnupdate" href="">Modifier</a></td>'
                                            + '</tr>';
                                }
                                $("#body").html(ligne);
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(textStatus);
                            }
                        });
                    });


                });


            </script>
            <fieldset>
                <legend>List of Machines</legend>
                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Reference</th>
                            <th>Prix</th>
                            <th>Marque</th>
                            <th>Date d'achat</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody id='body'>
                    </tbody>
                </table>
            </fieldset>
        </div>
    </body>
</html>
