<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 24/07/2022
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <div class="offcanvas-header">
        <h5 id="offcanvasTopLabel">Mappa Macchinette</h5>
        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">Chiudi</button>
    </div>
    <div class="offcanvas-body"  >
        <div class="row-cols-1 h-50" >
            <div class="container-fluid mapouter">
                <div class="gmap_canvas">
                    <iframe width="1024" height="720" id="gmap_canvas" src="https://maps.google.com/maps?q=palermo%20&t=&z=19&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                    <a href="https://www.embedgooglemap.net/blog/divi-discount-code-elegant-themes-coupon/"></a>
                    <br>
                    <style>
                        .mapouter{position:relative;text-align:right;height:390px;width:932px;}
                    </style>
                    <a href="https://www.embedgooglemap.net"></a>
                    <style>
                        .gmap_canvas {overflow:hidden;background:none!important;height:390px;width:932px;}
                    </style>
                </div>
            </div>
        </div>
        <div class="row-cols-1 h-50" style="overflow-y: scroll" >
            <div class="container-fluid" >
                <ul class="list-group" >

                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    function openMachineJQuery() {
        const Http = new XMLHttpRequest();
        const url = 'connect?name=1000';
        Http.open("POST", url);
        Http.send();
        Http.onload = function() {
        }

    }
    function updateMachineListJQuery() {
        const Http = new XMLHttpRequest();
        const url = 'machines';
        Http.open("GET", url);
        Http.send();
        Http.onload = function () {
            const json = this.responseText;
            const obj = JSON.parse(json);
            for (var i = 0; i < obj.length; i++) {

                $('.list-group')
                    .append(
                        '<li class="list-group-item" style="color: #0c4128;"  data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop"  >' +
                        '<a href="open?idmachine='+obj[i].id_vending_machine+'&cup=false" target="_blank">Macchinetta ID: '+obj[i].id_vending_machine+' alle coordinate: '+obj[i].position+' </a>' +
                        '</li>');
            }
        };
    }
    updateMachineListJQuery();
</script>
