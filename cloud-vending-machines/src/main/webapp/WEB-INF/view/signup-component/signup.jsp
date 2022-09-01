<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/07/2022
  Time: 06:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid bg-primary">
    <div class="modal-dialog combo">
        <div class="modal-content">
            <div class="modal-header bg-offer" >
                <h3 class="title text-primary" style="padding: 20px"><strong>Signup</strong></h3>
                <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
                    <%--            <span aria-hidden="true">&times;</span>--%>
                </button>
            </div>
            <div class="modal-body">
                <form action="signup" method="post" class="sign-up-form" name="formReg">
                    <div class="form">
                        <a>Nome e cognome</a>
                        <div class="input-field text-primary" >
                            <input type="text" placeholder="Inserisci nome e cognome" name="name"required>
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Username</a>
                        <div class="input-field text-primary" >
                            <input type="text" placeholder="Inserisci il tuo username" name="username" required>
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Cellulare</a>
                        <div class="input-field text-primary" >
                            <input type="text" placeholder="Inserisci il tuo numero" name="mobile" required>
                            <i class="fa fa-mobile" aria-hidden="true"></i>
                        </div>
                        <br>
                        <span>Credito</span>
                        <div class="input-field text-primary" >
                            <input type="text" placeholder="Importo prima ricarica in EUR" pattern="[0-9]+([,\.][0-9]+)?" name="credit" onChange={handleChange} required >
                            <i class="fa fa-star" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Email</a>
                        <div class="input-field text-primary" >
                            <input type="text" placeholder="Inserisci la tua email" name="email" onchange="validateEmail()" required>
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Password</a>
                        <div class="input-field text-primary " >
                            <input type="password" placeholder="Inserisci la tua password" minlength="6" name="password" required>
                            <i class="fa fa-key" aria-hidden="true"></i>
                        </div>
                        <br>
                        <a>Conferma password</a>
                        <div class="input-field text-primary" >
                            <input type="password" placeholder="Conferma la tua password" minlength="6" name="password" onchange="chekPassword()" required>
                            <i class="fa fa-key" aria-hidden="true"></i>
                        </div>
                        <br>
                        <br>
                        <div class="input-field button d-grid gap-2 col-6 mx-auto">
                            <button class=" btn bg-primary text-dark" type="submit" value="Registrati">Registrati</button>
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
