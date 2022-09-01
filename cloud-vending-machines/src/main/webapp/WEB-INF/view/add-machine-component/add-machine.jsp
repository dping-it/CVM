<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 12/08/2022
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="newUser" class="it.dping.cloudvendingmachines.model.User" scope="session" />
<div class="container-fluid bg-primary">
    <div class="modal-dialog combo">
        <div class="modal-content">
            <div class="modal-header bg-offer" >
                <h3 class="title text-primary" style="padding: 20px"><strong>Aggiungi nuova macchinetta </strong></h3>
                <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
                    <%--            <span aria-hidden="true">&times;</span>--%>
                </button>
            </div>
            <div class="modal-body">
                <form action="add" method="post" class="connect-form" name="formConnect">
                    <div class="form">
                        <div class="row">
                            <div class="col-6">
                                <br>
                                <div class="input-field text-primary" >
                                    <h5 class="text-primary">Inserisci le coordinate</h5>
                                    <br>
                                    <input type="text" placeholder="Ubicazione" name="place" required>
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                </div>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                            <div class="col-6" >
                                <br>
                                <div class="container-fluid text-primary " style="margin-right: 10px" >
                                    <img src="public/img/machine.png" style="height: 350px; width: auto; align-content: center; ">
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="input-field button d-grid gap-2 col-6 mx-auto">
                            <button class=" btn bg-primary text-dark" type="submit" value="Aggiungi">Aggiungi</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
