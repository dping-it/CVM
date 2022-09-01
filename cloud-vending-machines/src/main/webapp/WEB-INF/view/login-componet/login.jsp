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
                    <h3 class="title text-primary" style="padding: 20px"><strong>Login</strong></h3>
                    <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
            <%--            <span aria-hidden="true">&times;</span>--%>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="forms">
                        <div class="form login">
                            <form action="login" method="post" class="sign-in-form" name="form" novalidate>
                                <br>
                                <a>Username</a>
                                <div class="input-field text-primary">
                                    <input type="text" style="height: auto;"  placeholder="Inserisci username" name="username"  required >
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </div>
                                <div class="alert alert-warning" hidden="true" role="alert" >
                                    Username richiesto!
                                </div>
                                <br>
                                <a>Password</a>
                                <div class="input-field text-primary">
                                    <input type="password" class="password" placeholder="Inserisci password" name="password" required minlength="6">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                </div>
                                <div class="alert alert-warning" hidden="true" role="alert" >
                                    <div >Password is required</div>
                                    <div >
                                        La Password deve contenere almeno sei caratteri.
                                    </div>
                                </div>
                                <br>
                                <div class="checkbox-text">
                                    <div class="checkbox-content">
                                        <input type="checkbox" id="logCheck" style="resize: none; width: 10px;">
                                        <label for="logCheck" class="text">Ricordami</label>
                                    </div>
                                    <br>
                                    <a href="#" class="text">Password dimenticata?</a>
                                </div>
                                <br>
                                <div class="input-field button d-grid gap-2 col-6 mx-auto">
                                    <button class=" btn bg-primary text-dark" type="submit" value="Entra">Entra</button>
                                </div>
                                <div class="alert alert-warning" hidden="true" role="alert" >
                                    <div>
                                        Credenziali errate! Riprova
                                    </div>
                                </div>
                            </form>
                            <br>
                            <div class="login-signup">
                                <span class="text">Non sei registrato?
                                    <a href="#" class="text signup-link" data-bs-toggle="modal" data-bs-target="#myModalReg">Registrati</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<style>
    input {
        resize: horizontal;
        width: 200px;
    }

    input:active {
        width: auto;
    }

    input:focus {
        min-width: 200px;
    }
</style>
