<%@ page import="it.dping.cloudvendingmachines.model.User" %>
<%@ page import="it.dping.cloudvendingmachines.service.CustomFormatData" %><%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 07/08/2022
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) session.getAttribute("user");
    CustomFormatData customFormatData= new CustomFormatData();%>
<div class="container-fluid bg-primary">
    <div class="modal-dialog combo">
        <div class="modal-content">
            <div class="modal-header bg-offer" >
                <h3 class="title text-primary" style="padding: 20px"><strong>Modifica profilo</strong></h3>
                <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
                    <%--            <span aria-hidden="true">&times;</span>--%>
                </button>
            </div>
            <div class="modal-body">
                <form action="editprofile" method="post" class="edit-profile-form" name="formProfile">
                    <div class="form">
                        <a>Nome e cognome</a>
                        <div class="input-field text-primary" >
                            <input type="text" hidden value="<%=user.getId_user()%>" name="id">
                            <input type="text" value="<%=user.getName()%>" name="name"required>
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Username</a>
                        <div class="input-field text-primary" >
                            <input type="text" value="<%=user.getUsername()%>" name="username" required>
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Cellulare</a>
                        <div class="input-field text-primary" >
                            <input type="text" value="<%=user.getMobile()%>" name="mobile" required>
                            <i class="fa fa-mobile" aria-hidden="true"></i>
                        </div>
                        <br>
                        <span>Credito</span>
                        <div class="input-field text-primary" >
                            <input type="text" readonly value="<%=customFormatData.customFormat(user.getCredit())%>" pattern="[0-9]+([,\.][0-9]+)?" name="credit" onChange={handleChange} required >
                            <i class="fa fa-star" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Email</a>
                        <div class="input-field text-primary" >
                            <input type="text" value="<%=user.getEmail()%>" name="email" onchange="validateEmail()" required>
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </div>
                        <br>
                        <br>
                        <div class="input-field button d-grid gap-2 col-6 mx-auto">
                            <button class=" btn bg-primary text-dark" type="submit" value="Modifica">Modifica</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function validateCredit() {
        let x = document.forms["formReg"]["credit"].value;
        if (x == "") {
            alert("Formato errato!");
            return false;
        }
    }

    function validateEmail(mail)
    {
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(document.forms["formReg"]["email"].value))
        {
            return (true)
        }
        alert("Inserisci la mail correttamente!")
        return (false)
    }

    function chekPassword() {
        const password = document.querySelector('input[name=password]');
        const confirm = document.querySelector('input[name=confirm]');
        if (confirm.value === password.value) {
            confirm.setCustomValidity('');
        } else {
            confirm.setCustomValidity('Le password non coincidono!');
        }
    }
</script>
<style>
    input {
        resize: horizontal;
        width: 60%;
    }

    input:active {
        width: auto;
    }

    input:focus {
        min-width: 90%;
    }
</style>
