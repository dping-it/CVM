<%@ page import="it.dping.cloudvendingmachines.model.User" %>
<%@ page import="it.dping.cloudvendingmachines.service.CustomFormatData" %><%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/07/2022
  Time: 06:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) request.getSession().getAttribute("user");
    CustomFormatData customFormatData = new CustomFormatData();
%>
<div class="container-fluid combo pb-lg-5 pt-lg-5">
    <div class="container pb-lg-5 pt-lg-2 bg-primary">
        <div class="card">
            <div class="card-header bg-offer text-primary" style="height: 100px;"><strong>AREA AMMINISTRATORE</strong></div>
            <div class="row" style="height: 100%;">
                <div class="col-lg-3 center text-center h-50" >
                    <img class="card-img-top" src="public/img/admin.png" style="height: 190px; width: auto; padding-top: 20px" alt="Card image">
                    <div class="card-body "><h3 class="text-primary">Profilo personale</h3></div>
                    <h5 class="card-title"><%=user.getName()%></h5>
                    <p class="card-text">Credito: <%=customFormatData.customFormat(user.getCredit())%> €</p>
                    <br>

                    <br>
                    <p class="card-text">ID Utente: <%=user.getId_user()%></p>
                    <p class="card-text">Tipo Utente: <%=user.getRole().toString()%></p>
                    <p class="card-text">Username: <%=user.getUsername()%></p>
                    <p class="card-text">Email: <%=user.getEmail()%></p>
                    <p class="card-text">Telefono: <%=user.getMobile()%></p>
                </div>
                <div class="col-lg-9 bg-dark" style="height: auto;" >
                    <div id="multiboard" style="height: auto; ">

                    </div>
                </div>
            </div>
            <div class="row ">
                <hr>
                <div class="col-2 text-center">
                    <a href="#" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#myModalProfile">Modifica</a>
                </div>
                <div class="col-2 text-center">
                    <a href="#" class="btn btn-primary" id="btn-add" data-bs-toggle="modal" data-bs-target="#myModalAdd">Aggiungi</a>
                </div>
                <div class="col-2 text-center" id="btn-machines">
                    <a class="btn btn-primary" onclick="machineList()">Macchinette</a>
                </div>
                <div class="col-2 text-center" id="btn-users">
                    <a class="btn btn-primary" onclick="userList()" >Utenti</a>
                </div>
                <div class="col-2 text-center" id="btn-products">
                    <a class="btn btn-primary" onclick="productList()">Prodotti</a>
                </div>
                <div class="col-2 text-center">
                    <a href="logout" class="btn btn-primary">Logout</a>
                </div>
            </div>
            <div class="card-footer bg-offer"></div>
        </div>
    </div>
</div>


<%--Modal Edit Profile--%>
<!-- The Modal -->
<div class="modal" id="myModalProfile">
    <div class="modal-dialog">
        <div class="modal-content" >
            <jsp:include page="/WEB-INF/view/edit-profile-component/edit-profile.jsp" />
        </div>
    </div>
</div>

<%--Modal Connect to Machine--%>
<!-- The Modal -->
<div class="modal" id="myModalConnect">
    <div class="modal-dialog">
        <div class="modal-content" >
            <jsp:include page="/WEB-INF/view/connect-component/connect.jsp" />
        </div>
    </div>
</div>

<%--Modal Recharge Credit--%>
<!-- The Modal -->
<div class="modal" id="myModalAdd">
    <div class="modal-dialog">
        <div class="modal-content" >
            <jsp:include page="/WEB-INF/view/add-machine-component/add-machine.jsp" />
        </div>
    </div>
</div>

<%--Modal Modify User--%>
<!-- The Modal -->
<div class="modal" id="myModalUserMod">
    <div class="modal-dialog">
        <div class="modal-content" id="userModRole" >

        </div>
    </div>
</div>


<script>
    let euroITLocale = Intl.NumberFormat('it-IT');
    window.onload = function setButton() {
        userList();

    }


    function machineList() {
        const Http = new XMLHttpRequest();
        const url = 'machines';
        Http.open("GET", url);
        Http.send();
        Http.onload = function () {
            const json = this.responseText;
            const obj = JSON.parse(json);
            document.getElementById("multiboard").innerHTML = '<div class="container mt-3" style="height: 500px; overflow: scroll">' +
                '<table class="table table-striped">' +
                '<thead>' +
                '<tr>' +
                '<th class="text-center" >ID</th>' +
                '<th class="text-center">Stato</th>' +
                '<th class="text-center">Posizione</th>' +
                '<th class="text-center">Credito</th>' +
                '<th class="text-center">Attiva</th>' +
                '</tr>' +
                '</thead>'+
                '<tbody id="table-row">'+
                '</tbody>'+
                '</table>'+
                '</div>';

            for (var i = 0; i < obj.length; i++) {
                var stateMachine= "";
                if (obj[i].state==="0"){
                    stateMachine="Disponibile";
                } else if(obj[i].state==="SERVICE"){
                    stateMachine="Manutenzione"
                }else{
                    stateMachine="In uso"
                }
                var workingMachine= "";
                if (obj[i].working){
                    workingMachine="In funzione";
                }else{
                    workingMachine="Fuori Servizio"
                }
                $('#table-row')
                    .append(
                        '<tr>'+
                        '<td class="text-center">'+obj[i].id_vending_machine+'</td>'+
                        '<td class="text-center">'+stateMachine+'</td>'+
                        '<td class="text-center has-details">'+obj[i].position+''+
                        // '<span class="details"><button class="btn bg-primary text-dark" href="#"  data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop"">Trova sulla mappa</button></span>'+
                        '<span class="details"><img src="public/img/map.png"></span>'+
                        '</td>'+
                        '<td class="text-center">'+obj[i].balance.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+' &euro;</td>'+
                        '<td class="text-center">'+workingMachine+'</td>'+
                        '</tr>'
                    );
            }
        }
    }

    function productList() {
        const Http = new XMLHttpRequest();
        const url = 'products';
        Http.open("GET", url);
        Http.send();
        Http.onload = function () {
            const json = this.responseText;
            const obj = JSON.parse(json);
            document.getElementById("multiboard").innerHTML = '<div class="container mt-3"  style="height: 500px; overflow: scroll">' +
                                                                '<table class="table table-striped">' +
                                                                    '<thead>' +
                                                                        '<tr>' +
                                                                        '<th class="text-center">ID</th>' +
                                                                        '<th class="text-center">Descrizione</th>' +
                                                                        '<th class="text-center">Prezzo</th>' +
                                                                        '<th class="text-center">Tipo</th>' +
                                                                        '<th class="text-center">Immagine</th>' +
                                                                        '</tr>'+
                                                                    '</thead>'+
                                                                    '<tbody id="table-row">'+
                                                                    '</tbody>'+
                                                                 '</table>'+
                                                                '</div>';

            for (var i = 0; i < obj.length; i++) {
                var inCup= "";
                if (obj[i].cup){
                    inCup="In tazza";
                }else{
                    inCup="Retail"
                }
                $('#table-row')
                    .append(
                        '<tr>'+
                        '<td>'+obj[i].id_product+'</td>'+
                        '<td>'+obj[i].description+'</td>'+
                        '<td>'+obj[i].price.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+' &euro;</td>'+
                        '<td>'+inCup+'</td>'+
                        '<td>'+obj[i].image+'</td>'+
                        '</tr>'
                    );
            }
        };
    }

    function userList(){
        const Http = new XMLHttpRequest();
        const url = 'users';
        Http.open("GET", url);
        Http.send();
        Http.onload = function () {
            const json = this.responseText;
            const obj = JSON.parse(json);
            document.getElementById("multiboard").innerHTML='<div class="container mt-3" style="height: 500px; overflow: scroll">'+
                                                                '<table class="table table-striped">'+
                                                                    '<thead>'+
                                                                    '<tr>'+
                                                                        '<th class="text-center">ID</th>' +
                                                                        '<th class="text-center">Nome</th>'+
                                                                        '<th class="text-center">Username</th>'+
                                                                        '<th class="text-center">Email</th>'+
                                                                        '<th class="text-center">Credito</th>'+
                                                                        '<th class="text-center">Telefono</th>'+
                                                                        '<th class="text-center">Ruolo</th>'+
                                                                    '</tr>'+
                                                                    '</thead>'+
                                                                    '<tbody id="table-row">'+
                                                                    '</tbody>'+
                                                                '</table>'+
                                                            '</div>';

            for (var i = 0; i < obj.length; i++) {
                $('#table-row')
                    .append(
                        '<tr title="Modifica tipo utente" onclick="openUser('+obj[i].id_user+')" data-bs-toggle="modal" data-bs-target="#myModalUserMod">'+
                            '<td>'+obj[i].id_user+'</td>'+
                            '<td>'+obj[i].name+'</td>'+
                            '<td>'+obj[i].username+'</td>'+
                            '<td>'+obj[i].email+'</td>'+
                            '<td>'+obj[i].credit.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+'</td>'+
                            '<td>'+obj[i].mobile+'</td>'+
                            '<td>'+obj[i].role+'</td>'+
                        '</tr>'
                    );
            }
        };
    }
    userList();

    function openUser(id) {
        const Http = new XMLHttpRequest();
        const url = 'editrole';
        u = url + "?id_user=" + id;
        Http.open("GET", u);
        Http.send();
        Http.onload = function () {
            document.getElementById("userModRole").innerHTML=this.response;
        }
    }
</script>
<style>
    .has-details {
        position: relative;
    }

    .details {
        position: absolute;
        top: 0;
        transform: translateY(70%) scale(0);
        transition: transform 0.1s ease-in;
        transform-origin: left;
        display: inline;
        background: #272824;
        z-index: 10;
        min-width: 50%;
        padding: 1rem;
        border: 1px solid black;
    }

    .has-details:hover span {
        transform: translateY(10%) scale(1);
    }

    td {
        padding: 1rem;
        background: whitesmoke;
        border: 1px solid black;
    }

    table {
        border-collapse: collapse;
    }
    tr:hover {
        background: #ecb62c !important;
    }
</style>
