<%@ page import="it.dping.cloudvendingmachines.model.User" %>
<%@ page import="it.dping.cloudvendingmachines.service.CustomFormatData" %><%--
  Created by IntelliJ IDEA.
  User: Davide
  Date: 23/07/2022
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) request.getSession().getAttribute("user");%>
<%CustomFormatData customFormatData =new CustomFormatData();%>
<jsp:useBean id="vendingMachine" class="it.dping.cloudvendingmachines.model.VendingMachine" scope="session" />
<div class="container-fluid bg-primary">
    <div class="modal-dialog combo">
        <div class="modal-content">
            <div class="modal-header bg-offer" >
                <h3 class="title text-primary" style="padding: 20px"><strong>Ricarica Credito</strong></h3>
                <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
                    <%--            <span aria-hidden="true">&times;</span>--%>
                </button>
            </div>
            <div class="modal-body">
                <form action="recharge" method="post" class="connect-form" name="formConnect">
                    <input type='hidden' name='id-user' id='id-user' value="<%=user.getId_user()%>" />
                    <div class="form">
                        <h4 class="text-primary">Il tuo credito attuale: <%=customFormatData.customFormat(user.getCredit())%> &euro;</h4>
                        <br>
                        <br>
                        <h5 class="text-primary">Importo da ricaricare</h5>
                        <br>
                        <div class="input-field text-primary" >
                            <input type="text" placeholder="Inserisci importo" name="amount" required>
                            <i class="fa fa-credit-card" aria-hidden="true"></i>
                        </div>
                        <br>
                        <div class="container-fluid text-primary center" >
                            <img src="public/img/credit.png" style="height: 150px; width: auto; align-content: center">
                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="input-field button d-grid gap-2 col-6 mx-auto">
                            <button class=" btn bg-primary text-dark" type="submit" value="Ricarica">Ricarica</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
