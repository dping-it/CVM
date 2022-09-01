<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 13/08/2022
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid bg-primary">
  <div class="modal-dialog combo">
    <div class="modal-content">
      <div class="modal-header bg-offer" >
        <h3 class="title text-primary" style="padding: 20px"><strong>Contattaci</strong></h3>
        <button type="button" class="btn-close bg-primary text-dark" style="margin-right: 20px" data-bs-dismiss="modal">
          <%--            <span aria-hidden="true">&times;</span>--%>
        </button>
      </div>
      <div class="modal-body">
        <form class="pagelayer-contact-form" id="contact-form" name="Contact Form" onsubmit="return sendMail(this, event)" method="POST">
          <br>
          <div class="row row-cols-2">
            <div class="col-6 input-group mb-3">
              <span class="input-group-text" id="basic-addon1">∆</span>
          <input type="text" placeholder="Nome" name="Fieldname" style="padding-right: 10px">
            </div>
              <div class="col-6 input-group mb-3">
              <span class="input-group-text" id="basic-addon2">@</span>
            <input type="email" placeholder="Email" name="Fieldname">
              </div>
          </div>
          <br>
          <div class="row">
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon3">»</span>
          <input type="text" placeholder="Oggetto" name="subject">
            </div>
          </div>
          <br>
          <div class="row">
          <textarea name="subject" rows="6" placeholder="Messaggio"></textarea>
          </div>
          <br>
          <br>
          <div class="pagelayer-contact-submit-holder">
            <button type="submit" form="contact-form" class="btn bg-primary text-dark">
              <span class="pagelayer-btn-text">Invia messaggio</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
