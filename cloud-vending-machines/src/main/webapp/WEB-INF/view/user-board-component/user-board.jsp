<%@ page import="it.dping.cloudvendingmachines.model.User" %>
<%@ page import="it.dping.cloudvendingmachines.service.CustomFormatData" %>
<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/07/2022
  Time: 06:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) session.getAttribute("user");
    CustomFormatData customFormatData = new CustomFormatData();
%>

<div class="container-fluid combo pb-lg-5 pt-lg-5">
    <div class="container pb-lg-5 pt-lg-2 bg-primary">
        <div class="card">
            <div class="card-header bg-offer text-primary" style="height: 100px;"><strong>AREA UTENTE</strong></div>
            <div class="row" style="height: 100%;">
                <div class="col-lg-12 text-center h-50" >
                    <img class="card-img-top" src="public/img/profile.png" style="height: 150px; width: auto; padding-top: 20px" alt="Card image">
                    <div class="card-body "><h1 class="text-primary">Profilo personale</h1></div>
                    <h4 class="card-title"><%=user.getName()%></h4>
                    <p class="card-text">Credito: <%=customFormatData.customFormat(user.getCredit())%> €</p>
                    <br>
                    <h5 class="text-center text-success" id="machine"></h5>
                    <br>
                    <p class="card-text">ID Utente: <%=user.getId_user()%></p>
                    <p class="card-text">Tipo Utente: <%=user.getRole().toString()%></p>
                    <p class="card-text">Username: <%=user.getUsername()%></p>
                    <p class="card-text">Email: <%=user.getEmail()%></p>
                    <p class="card-text">Telefono: <%=user.getMobile()%></p>
                </div>
            </div>
            <div class="row ">
                <hr>
                <div class="col-3 text-center">
                    <a href="#" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#myModalProfile">Modifica</a>
                </div>
                <div class="col-3 text-center">
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalRecharge">Ricarica</a>
                </div>
                <div class="col-3 text-center" id="btn-connect">
                    <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalConnect">Connetti</a>
                </div>
                <div class="col-3 text-center">
                    <a onclick="disconnectFromMachine()" href="logout"  class="btn btn-primary">Logout</a>
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
<div class="modal" id="myModalRecharge">
    <div class="modal-dialog">
        <div class="modal-content" >
            <jsp:include page="/WEB-INF/view/recharge-componet/recharge.jsp" />
        </div>
    </div>
</div>

<script>
    window.onload = function setButton() {

        if (<%=user.getActive()> 0L%>) {
            document.getElementById("btn-connect").innerHTML =
                '<a class="btn btn-primary" onclick="disconnectFromMachine()">Disconneti</a>';
            document.getElementById("machine").innerText="Connesso alla macchinetta ID: <%=user.getActive()%>";

        }
        if (<%=user.getActive()== 0L%>) {
            document.getElementById("btn-connect").innerHTML =
                '<a href="#"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalConnect">Connetti</a>';
            document.getElementById("machine").innerText="";

        }
    }

    function disconnectFromMachine(){
            const Http = new XMLHttpRequest();
            const url = 'disconnect?id-user=<%=user.getId_user()%>';
            const u = url + '&id-machine=' + <%=user.getActive()%>;
            Http.open("POST", u);
            Http.send();
            Http.onload = function () {
                window.location.reload();
                document.getElementById("btn-connect").innerHTML =
                    '<a href="#"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalConnect">Connetti</a>';

         }
    }

</script>
