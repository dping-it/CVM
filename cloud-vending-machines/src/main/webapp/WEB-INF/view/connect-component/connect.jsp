<%@ page import="it.dping.cloudvendingmachines.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Davide
  Date: 23/07/2022
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) request.getSession().getAttribute("user");%>
<jsp:useBean id="vendingMachine" class="it.dping.cloudvendingmachines.model.VendingMachine" scope="session" />
<div class="container-fluid bg-primary">
    <div class="modal-dialog combo">
        <div class="modal-content">
            <div class="modal-header bg-offer" >
                <h3 class="title text-primary" style="padding: 20px"><strong>Connetti</strong></h3>
                <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
                    <%--            <span aria-hidden="true">&times;</span>--%>
                </button>
            </div>
            <div class="modal-body">
                <form action="connect" method="post" class="connect-form" name="formConnect">
                    <input type='hidden' name='id-user' id='id-user' value="<%=user.getId_user()%>" />
                    <div class="form">
                        <br>
                        <h4 class="text-primary">ID Macchinetta</h4>
                        <div class="input-field text-primary" >
                            <input type="number" placeholder="Inserisci id macchinetta" name="name" minlength="4" required>
                            <i class="fa fa-key" aria-hidden="true"></i>
                        </div>
                        <br>
                        <br>
                        <div class="input-field text-primary" >
                            <h4 class="text-primary">Scansiona codice QR</h4>
                            <img class="btn bg-primary" onclick="" src="public/img/qr-code.png" style="height: 150px; width: auto;">
                            <i class="fa fa-camera" aria-hidden="true"></i>
                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="input-field button d-grid gap-2 col-6 mx-auto">
                            <button class=" btn bg-primary text-dark" type="submit" value="Connetti">Connetti</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
