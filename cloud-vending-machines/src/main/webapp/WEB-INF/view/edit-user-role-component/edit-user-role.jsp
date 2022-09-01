<%@ page import="it.dping.cloudvendingmachines.model.User" %><%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/08/2022
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User selectedUser = (User) request.getAttribute("user-selected");%>
<div class="container-fluid bg-primary">
    <div class="modal-dialog combo">
        <div class="modal-content">
            <div class="modal-header bg-offer" >
                <h3 class="title text-primary" style="padding: 20px"><strong>Modifica regole utente</strong></h3>
                <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
                    <%--            <span aria-hidden="true">&times;</span>--%>
                </button>
            </div>
            <div class="modal-body">
                <form action="editrole" method="post" class="modifyrole-form" name="formModifyRole">
                    <div class="form">
                        <a>Nome e Cognome</a>
                        <div class="input-field text-primary" >
                            <input id="name" type="text" name="name" value="<%=selectedUser.getName()%>" readonly>
                            <input id="iduser" type="text" name="iduser" value="<%=selectedUser.getId_user()%>" hidden readonly>
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a for="cars">Privilieggi d'accesso</a>
                        <div class="input-field text-primary" >
                            <select id="type" class="form-select" name="role" required aria-label="Seleziona regola">
                                <option selected><%=selectedUser.getRole()%></option>
                                <option value="ADMINISTRATOR">ADMINISTRATOR</option>
                                <option value="SERVICE">SERVICE</option>
                                <option value="USER">USER</option>
                            </select>
<%--                            <i class="fa fa-user" aria-hidden="true"></i>--%>
                        </div>
                        <br>
                        <br>
                        <div class="input-field button d-grid gap-2 col-6 mx-auto">
                            <button class=" btn bg-primary text-dark" type="submit" value="Conferma">Conferma</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

