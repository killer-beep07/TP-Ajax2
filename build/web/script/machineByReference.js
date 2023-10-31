$(document).ready(function () {
    $("#reference").change(function () {
        var reference = $(this).val();

            $.ajax({
                url: 'MachineByReferenceController', 
                data: { reference: reference },
                type: 'POST',
                success: function (data) {
                    var machineTable = $("#body");
                    machineTable.empty(); 

                    for (var i = 0; i < data.length; i++) {
                        var machine = data[i];
                        var row = '<tr>' +
                            '<td>' + machine.id + '</td>' +
                            '<td>' + machine.reference + '</td>' +
                            '<td>' + machine.prix + '</td>' +
                            '<td>' + machine.marque.libelle + '</td>' +
                            '<td>' + machine.dateAchat + '</td>' +
                            '<td><a class="bndelete" href="MachineController?op=delete&id=' + machine.id + '">Supprimer</a></td>' +
                            '<td><a class="bnupdate" href="#">Modifier</a></td>' +
                            '</tr>';
                        machineTable.append(row);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        
    });
});
