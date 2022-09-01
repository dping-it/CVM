<%@ page import="it.dping.cloudvendingmachines.service.CustomFormatData" %>
<%@ page import="it.dping.cloudvendingmachines.model.VendingMachine" %><%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 08/08/2022
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%CustomFormatData customFormatData =new CustomFormatData();%>
<%VendingMachine vendingMachine = (VendingMachine) request.getSession().getAttribute("machine"); %>
<%int index = 0;%>
<body onload="init()">
    <div class="container-fluid combo pb-lg-5 pt-lg-5">
    <div class="container pb-lg-5 pt-lg-2 bg-primary">
        <div class="card">
            <div class="card-header bg-offer text-primary" style="height: 100px;">
                <ul>
                    <li>
                        <strong>RICARICA PRODOTTI - MACCHINETTA ID: <%=vendingMachine != null ? vendingMachine.getId_vending_machine():""%></strong>
                    </li>
                    <li>
                        <strong>STATO OPERATIVO - MACCHINETTA: <%=vendingMachine.isWorking()?"IN FUNZIONE":"FUORI SERVIZIO"%></strong>
                    </li>
                </ul>
            </div>
            <div class="container-fluid">
                <div class="row" id="grid-base">
                    <div class="col-12 bg-warning p-4" id="grid" style="height: 660px; overflow-y: scroll;"></div>
                </div>
                <div class="row ">
                    <hr>
                    <div class="col-3 text-center" id="btn-connect">
                        <a onclick="activateMachine()" class="btn btn-primary">Abilita</a>
                    </div>
                    <div class="col-3 text-center">
                        <%--                    <a href="#" class="btn btn-primary"></a>--%>
                    </div>
                    <div class="col-3 text-center">
                        <%--                    <a href="#" class="btn btn-primary"></a>--%>
                    </div>
                    <div class="col-3 text-center">
                        <a href="index.jsp" onclick="disconnectFromService()" class="btn btn-primary">Chiudi</a>
                    </div>
                </div>
                <div class="card-footer bg-offer"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    function init(){
        updateProductsList();
    }

    function setButton() {

        if (<%=vendingMachine.isWorking()%>) {
            document.getElementById("btn-connect").innerHTML =
                '<a class="btn btn-primary" onclick="disactivateMachine()">Disabilita</a>'

        }
        else {
            document.getElementById("btn-connect").innerHTML =
                '<a class="btn btn-primary" onclick="activateMachine()">Abilita</a>'

        }
    }

    function activateMachine() {
    const Http = new XMLHttpRequest();
    const url = 'activate?idmachine=<%=vendingMachine.getId_vending_machine()%>';
    Http.open("POST", url);
    Http.send();
    Http.onload = function() {
        window.location.reload();
        setButton();
    }
}

    function disactivateMachine() {
        const Http = new XMLHttpRequest();
        const url = 'disactivate?idmachine=<%=vendingMachine.getId_vending_machine()%>';
        Http.open("POST", url);
        Http.send();
        Http.onload = function() {
            window.location.reload();
            setButton();
        }
    }

    function disconnectFromService() {
        const Http = new XMLHttpRequest();
        const url = 'closemachine?idmachine=<%=vendingMachine.getId_vending_machine()%>';
        Http.open("GET", url);
        Http.send();
        Http.onload = function() {
        }
}

    function updateProductsList() {
    setButton();
        $(".product").remove();
        <%
        int size=0;
        size=(vendingMachine.getProductSlots().size()/4);
        System.out.println(size);
        %>
        <%for(int i = 1; i<size; i++){%>
        $('#grid').append(
            '<div class="row product">'+
            '<div class="col-3 bg-light p-2">'+
            '<div class="card-grid">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button onclick="refilAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>)">Ricarica</button></p>'+
            '</div>'+
            '</div>'+
            '<div class="col-3 bg-secondary p-2">'+
            '<div class="card-grid">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(++index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button onclick="refilAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>)">Ricarica</button></p>'+
            '</div>'+
            '</div>'+
            '<div class="col-3 bg-light p-2">'+
            '<div class="card-grid">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(++index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button onclick="refilAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>)">Ricarica</button></p>'+
            '</div>'+
            '</div>'+
            '<div class="col-3 bg-secondary p-2">'+
            '<div class="card-grid">'+
            '<p class="top-right"><%=vendingMachine.getProductSlots().get(++index).getQty_stock()%></p>'+
            '<img src="<%=vendingMachine.getProductSlots().get(index).getImage()%>" alt="<%=vendingMachine.getProductSlots().get(index).getDescription()%>" style="width:100%">'+
            '<h6><%=vendingMachine.getProductSlots().get(index).getDescription()%></h6>'+
            '<p class="price">&euro; <%=customFormatData.customFormat(vendingMachine.getProductSlots().get(index).getPrice())%></p>'+
            '<p><button onclick="refilAjax(<%=vendingMachine.getId_vending_machine()%>, <%=vendingMachine.getProductSlots().get(index).getId_contains()%>)">Ricarica</button></p>'+
            '</div>'+
            '</div>'+
            '</div>');
        <%index++;%>
        <%}%>
    }

    function refilAjax(idmachine, product) {
        $.ajax({
            type: "POST",
            url: "refilmachine?idmachine="+idmachine+"&product="+product,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data){
                window.location.replace("refil.jsp");
            }
        });

    }
</script>
