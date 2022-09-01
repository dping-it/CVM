<%@ page import="it.dping.cloudvendingmachines.model.User" %>
<%@ page import="it.dping.cloudvendingmachines.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="it.dping.cloudvendingmachines.model.VendingMachine" %>
<%@ page import="it.dping.cloudvendingmachines.service.CustomFormatData" %>
<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/07/2022
  Time: 06:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%CustomFormatData customFormatData = new CustomFormatData();%>
<%VendingMachine vendingMachine = (VendingMachine) session.getAttribute("machine");%>
<%int index = 0;%>

<body onload="init()">
<div class="container-fluid combo pb-lg-5 pt-lg-5">
    <div class="container pb-lg-5 pt-lg-2 bg-primary">
        <div class="card">
            <div class="card-header bg-offer text-primary" style="height: 100px;"><strong>MACCHINETTA ID: <%=vendingMachine != null ? vendingMachine.getId_vending_machine():""%></strong></div>
            <div class="container-fluid">
                <div class="row" id="grid-base">
                    <div class="col-7 bg-warning p-4" id="grid" style="height: 660px; overflow-y: scroll;"></div>
                    <div class="col-5 text-dark p-4" style="height: 500px;">
                        <div class="container" style="height: 105px;">
                            <div class="led-box">
                                <div class="led-green" id="green"></div>
                                <p>Attiva</p>
                            </div>
                            <div class="led-box">
                                <div class="led-yellow-off" id="yellow"></div>
                                <p>Erogazione</p>
                            </div>
                            <div class="led-box">
                                <div class="led-red-off"  id="red"></div>
                                <p>Fuori Servizio</p>
                            </div>
                            <div class="led-box">
                                <div class="led-blue-off" id="blue"></div>
                                <p>Service</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 bg-light p-2" id="state">STATO: <%=vendingMachine.getState().equals("0")?"DISPONIBILE":"OCCUPATO"%></div>
                            <div class="col-6 bg-secondary p-2 " id="credito">CREDITO &euro; <%=customFormatData.customFormat(vendingMachine.getBalance())%></div>
                        </div>
                        <div class="row">
                            <div class="col-12 bg-primary p-2" id="display" style="height: 70px">
                                <a>SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3 bg-info p-2" style="height: 190px"></div>
                            <div class="col-6 bg-info p-2 border border-primary" style="height: 190px">
                                <div class="row">
                                    <div class="col-3 bg-dark p-2"></div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(1)">1</div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(2)">2</div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(3)">3</div>
                                    <div class="col-3 bg-dark p-2"></div>
                                </div>
                                <div class="row">
                                    <div class="col-3 bg-dark p-2"></div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(4)">4</div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(5)">5</div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(6)">6</div>
                                    <div class="col-3 bg-dark p-2"></div>
                                </div>
                                <div class="row">
                                    <div class="col-3 bg-dark p-2"></div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(7)">7</div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(8)">8</div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2" onclick="pressNumber(9)">9</div>
                                    <div class="col-3 bg-dark p-2"></div>
                                </div>
                                <div class="row">
                                    <div class="col-3 bg-dark p-2"></div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2"></div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2"onclick="pressNumber(0)">0</div>
                                    <div class="col-2 bg-dark text-primary text-center border border-primary p-2"></div>
                                    <div class="col-3 bg-dark p-2"></div>
                                </div>
                            </div>
                            <div class="col-3 bg-info p-2" style="height: 190px"></div>
                        </div>
                        <div class="row">
                            <div class="col-6 bg-light p-2">Prodotti in tazza
                                <div class="row">
                                <label class="switch" style="float: right; margin-top: 5px; margin-left: 5px;">
                                    <input type="checkbox" class="form-control" id="in-cup"  name="test" onclick="simpleInCup()">
                                    <span class="slider round"></span>
                                </label>
                                </div>
                            </div>
                            <div class="col-6 bg-secondary p-2" id="sugar">Zucchero
                                <div class="row">
                                    <div class="col-3 bg-dark p-2" ></div>
                                    <div class="col-3 bg-dark text-primary  text-center border border-primary p-2" onclick="sugarSetting('-')">-</div>
                                    <div class="col-3 bg-dark text-primary text-center border border-primary p-2" onclick="sugarSetting('+')">+</div>
                                    <div class="col-3 bg-dark p-2" ></div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="progress">
                                        <div class="progress-bar bg-warning" id="sugarbar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" ></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row ">
                <hr>
                <div class="col-3 text-center">
<%--                    <a href="#" class="btn btn-primary"></a>--%>
                </div>
                <div class="col-3 text-center">
<%--                    <a href="#" class="btn btn-primary"></a>--%>
                </div>
                <div class="col-3 text-center">
<%--                    <a href="#" class="btn btn-primary"></a>--%>
                </div>
                <div class="col-3 text-center">
                    <a href="logout" class="btn btn-primary">Chiudi</a>
                </div>
            </div>
            <div class="card-footer bg-offer"></div>
        </div>
    </div>
</div>
</body>
<script>
    var select;
    function pressNumber(number) {
            if (select!=null){

                //arriva la seconda cifra
                idProduct = select + "" + number;
                select = null;
                document.getElementById("display").innerText = "SELEZIONE:  " + idProduct;
                delay(2500).then(() => {
                    if (true) {
                        this.buyAjax(<%=vendingMachine.getId_vending_machine()%>, Number(idProduct), 10);

                    } else {
                        document.getElementById("display").innerText = "CODICE PRODOTTO ERRATO!";
                        delay(3500).then(() =>
                            document.getElementById("display").innerText = "SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA");
                    }
                });

        }else {
            select=number;
            document.getElementById("display").innerText="SELEZIONE:  "+select;
        }

    }
    setInterval(function () {console.log("Aggiorna stato Macchinetta"),updateMachineStatusAjax()}, 3000);
    let euroITLocale = Intl.NumberFormat('it-IT');
    var test;
    var count=0;
    var value;

    function updateProducts() {
        $("#product").remove();
        <%
        int size=0;
        size=(vendingMachine.getProductSlots().size()/4);
        System.out.println(size);
        %>
        <%for(int i = 1; i<=size; i++){%>
        $('#grid').append(
            '<div class="row"  id="product">'+
            '<div class="col-3 bg-light p-2">'+
            '<div class="card-grid <%=vendingMachine.getProductSlots().get(index).isCup()?"incup":"retail"%>">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button class="buy" onclick="buyAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>,<%=vendingMachine.getProductSlots().get(index).getQty_stock()%>)">Acquista COD_<%=vendingMachine.getProductSlots().get(index).getSlot()%></button></p>'+
            '</div>'+
            '</div>'+
            '<div class="col-3 bg-secondary p-2">'+
            '<div class="card-grid <%=vendingMachine.getProductSlots().get(++index).isCup()?"incup":"retail"%>">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button  class="buy" onclick="buyAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>,<%=vendingMachine.getProductSlots().get(index).getQty_stock()%>)">Acquista COD_<%=vendingMachine.getProductSlots().get(index).getSlot()%></button></p>'+
            '</div>'+
            '</div>'+
            '<div class="col-3 bg-light p-2">'+
            '<div class="card-grid <%=vendingMachine.getProductSlots().get(++index).isCup()?"incup":"retail"%>">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button  class="buy" onclick="buyAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>,<%=vendingMachine.getProductSlots().get(index).getQty_stock()%>)">Acquista COD_<%=vendingMachine.getProductSlots().get(index).getSlot()%></button></p>'+
            '</div>'+
            '</div>'+
            '<div class="col-3 bg-secondary p-2">'+
            '<div class="card-grid <%=vendingMachine.getProductSlots().get(++index).isCup()?"incup":"retail"%>">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button  class="buy" onclick="buyAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>,<%=vendingMachine.getProductSlots().get(index).getQty_stock()%>)">Acquista COD_<%=vendingMachine.getProductSlots().get(index).getSlot()%></button></p>'+
            '</div>'+
            '</div>'+
            '</div>');
        <%index++;%>
        <%}%>

        formatInit();
    }

    function simpleInCup() {

        var checkedValue = $('#in-cup:checked').val();
        const btn = document.getElementById('in-cup');

        if(!checkedValue) {

            btn.addEventListener('click', () => {
                const incup = document.getElementsByClassName('incup');
                const retail = document.getElementsByClassName('retail');
                const sugar = document.getElementById("sugar");
                for (const box of incup) {
                    box.style.display = 'block';
                }
                for (const box of retail) {
                    box.style.display = 'none';
                }
                sugar.style.display='block';
            });
        }
        if(checkedValue) {

            btn.addEventListener('click', () => {
                const incup = document.getElementsByClassName('incup');
                const retail = document.getElementsByClassName('retail');
                for (const box of incup) {
                    box.style.display = 'none';
                }
                for (const box of retail) {
                    box.style.display = 'block';
                }
                sugar.style.display='none';
            });

        }
    }

    function formatInit(){

        const incup = document.getElementsByClassName('incup');
        const sugar = document.getElementById("sugar");

        for (const box of incup) {
            box.style.display = 'none';
        }

        sugar.style.display='none';

    }

    function init(){
        updateProducts();
        simpleInCup();
    }

    function checkCredit(idmachine) {
        $.ajax({
            type: "GET",
            url: "machine?id_vendingMachine="+idmachine+"",
            // data: JSON.parse(response),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data){
                    <%vendingMachine = (VendingMachine) session.getAttribute("machine");%>
                value=data.balance;
                document.getElementById("credito").innerHTML="<a>CREDITO &euro; "+(data.balance).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+"</a>";
        }
        });
    }

    function noProductDisponible() {
        document.getElementById("display").innerText="PRODOTTO ESAURITO! ";
        delay(3500).then(() =>
            document.getElementById("display").innerText="SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA");
    }

    function buyAjax(idmachine, product, qty) {
        $.ajax({
            type: "GET",
            url: "machine?id_vendingMachine="+idmachine+"",
            // data: JSON.parse(response),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data) {
                if (data.balance > 0) {
                    <%--        <% if(vendingMachine.getBalance()>1/*vendingMachine.getProductSlots().get(index).getId_contains()*/){%>--%>
                    if (qty > 0) {
                        $.ajax({
                            type: "POST",
                            url: "buy?idmachine=" + idmachine + "&product=" + product,
                            // data: JSON.parse(response),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                <%vendingMachine = (VendingMachine) request.getSession().getAttribute("machine");%>
                            }
                        });
                        simulationBuying();
                    } else {
                        <%--                    <%} else {%>--%>
                        noProductDisponible();

                        <%--                    <%}%>--%>
                    }
                } else {
                    noCredit();
                }
            }
        });
    }

    function inCup(idmachine) {

        if ($('#in-cup').is(":checked"))
        {
            test=true;
        }
        $.ajax({
            type: "GET",
            url: test?"open?idmachine=1000&cup=true":"open?idmachine=1000&cup=false",
            // data: JSON.parse(response),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data){
                <%vendingMachine = (VendingMachine) request.getSession().getAttribute("machine");%>
                updateProducts();

            }
        });
        window.location.reload();
    }

    function simulationBuying(){
        document.getElementById("yellow").classList.remove('led-yellow-off');
        document.getElementById("yellow").classList.add('led-yellow');
        var buyButtons = document.getElementsByClassName("buy");

        for (var i = 0; i < buyButtons.length; i ++) {
            buyButtons[i].style.display = 'none';
        }

        document.getElementById("display").innerText="EROGAZIONE PRODOTTO ATTENDERE. ";
        delay(2500).then(() =>
            document.getElementById("display").innerText="EROGAZIONE PRODOTTO ATTENDERE. . ");
        delay(4500).then(() =>
            document.getElementById("display").innerText="EROGAZIONE PRODOTTO ATTENDERE. . . ");
        delay(6500).then(() =>
            document.getElementById("display").innerText="RITIRARE IL PRODOTTO");
        delay(8500).then(() =>
            document.getElementById("display").innerText="SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA",
        );

        delay(8500).then(()=>{
            document.getElementById("yellow").classList.remove('led-yellow');
            document.getElementById("yellow").classList.add('led-yellow-off');
            $('#in-cup:checked').prop('checked', false);
            window.location.reload();
        })
    }

    function delay(time) {
        return new Promise(resolve => setTimeout(resolve, time));
    }

    function noCredit(){
        document.getElementById("display").innerText="CREDITO INSUFFICIENTE! ";
        delay(3500).then(() =>
            document.getElementById("display").innerText="SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA");
    }

    function updateMachineStatusAjax() {
        checkCredit(<%=vendingMachine.getId_vending_machine()%>);
        count++;
        if(count>100){

            const Http = new XMLHttpRequest();
            const url = 'disconnect?machine=<%=vendingMachine.getId_vending_machine()%>';
            Http.open("GET", url);
            Http.send();
            Http.onload = function() {
                window.location.reload();

            }
        }

        $.ajax({
            type: "GET",
            url: "machine?id_vendingMachine=<%=vendingMachine.getId_vending_machine()%>",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data){

                <%vendingMachine = (VendingMachine) request.getSession().getAttribute("machine");%>
                //CHECK USER CONNECTION
                if (data.state>0){
                    document.getElementById("state").innerText="STATO: OCCUPATO";
                    document.getElementById("credito").innerHTML="<a>CREDITO &euro; "+(data.balance).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+"</a>";
                } else {
                    document.getElementById("state").innerText = "STATO: DISPONIBILE";
                    document.getElementById("credito").innerHTML = "<a>CREDITO &euro; 0.00</a>";
                }

                //CHECK WORKING
                inWorking(data.working);

                //CHECK SERVICE
                inService(data.state);

                // window.location.reload();
            }
        });
    }

    function updateMachineStatusJquery() {
        const Http = new XMLHttpRequest();
        const url = 'machine?id_vendingMachine=<%=vendingMachine.getId_vending_machine()%>';
        Http.open("GET", url);
        Http.send();
        Http.onload = function() {
            const json = this.responseText;
            const obj = JSON.parse(json);
            if (obj.state==="DISPONIBILE" && obj.working) {
                document.getElementById("state").innerText = "STATO: DISPONIBILE";
                document.getElementById("credito").innerHTML = "<a>CREDITO &euro; 0.00</a>";
                document.getElementById("display").innerText="SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA";
            }
            if (obj.state==="OCCUPATO" && obj.working){
                document.getElementById("state").innerText="STATO: OCCUPATO";
                document.getElementById("credito").innerHTML="<a>CREDITO &euro; "+(obj.balance).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+"</a>";
                document.getElementById("display").innerText="SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA";
            }
        }
    }

    function inService(condition) {
        if(condition=="SERVICE") {
            document.getElementById("blue").classList.remove('led-blue-off');
            document.getElementById("blue").classList.add('led-blue');
            document.getElementById("red").classList.add('led-red-off');
            document.getElementById("red").classList.remove('led-red');
            document.getElementById("green").classList.remove('led-green-off');
            document.getElementById("green").classList.add('led-green');
            document.getElementById("display").innerText="ACCESSO SERVICE IN CORSO... ATTENDERE";

        }else{
            document.getElementById("blue").classList.add('led-blue-off');
            document.getElementById("blue").classList.remove('led-blue');
            if( document.getElementById("display").textContent ==="ACCESSO SERVICE IN CORSO... ATTENDERE") {
                document.getElementById("display").innerText = "SELEZIONA UN PRODOTTO O CLICCA SU ACQUISTA";
            }

        }

    }

    function inWorking(condition) {
        if(!condition) {
            //NOT WORK
            document.getElementById("green").classList.add('led-green-off');
            document.getElementById("red").classList.remove('led-red-off');
            document.getElementById("green").classList.remove('led-green');
            document.getElementById("red").classList.add('led-red');
            document.getElementById("display").innerText="ERRORE DI SISTEMA! \nCONTATTARE ASSISTENZA";
        }else{
            //WORK
            document.getElementById("red").classList.add('led-red-off');
            document.getElementById("green").classList.add('led-green');
            document.getElementById("red").classList.remove('led-red');
            document.getElementById("green").classList.remove('led-green-off');

        }

    }

    function sugarSetting(condition) {
        var oldValue=$('#sugarbar').attr('aria-valuenow');
        var count=oldValue/25;
        var newprogress=0;

        if(count=>0 && count<=4){
            if(condition=== "+") {
                if (count < 4) {
                    switch(oldValue) {
                        case "0":
                            newprogress = 25;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        case "25":
                            newprogress = 50;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        case "50":
                            newprogress = 75;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        case "75":
                            newprogress = 100;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        default: console.log("Zucchero di traverso! +");
                    }
                }
            }else {
                if(count > 0 ){
                    switch(oldValue) {
                        case "100":
                            newprogress = 75;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        case "75":
                            newprogress = 50;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        case "50":
                            newprogress = 25;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        case "25":
                            newprogress = 0;
                            $('#sugarbar').attr('aria-valuenow', newprogress).css('width', newprogress+'%');
                            break;
                        default: console.log("Zucchero di traverso! -");
                    }
             }
            }

        }
    }

</script>
