<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/07/2022
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- Products Start -->
<div class="container-fluid about py-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Descrizione & Prezzi</h2>
            <h1 class="display-4 text-uppercase">Esplora i nostri prodotti</h1>
        </div>
        <div class="tab-class text-center">
            <ul class="nav nav-pills d-inline-flex justify-content-center bg-dark text-uppercase border-inner p-4 mb-5">
                <li class="nav-item">
                    <a class="nav-link text-white active" data-bs-toggle="pill" href="#tab-1">Prodotti Retail</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" data-bs-toggle="pill" href="#tab-2">Prodotti In Cup</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-3" id="listproductretail">

                    </div>
                </div>
                <div id="tab-2" class="tab-pane fade show p-0">
                    <div class="row g-3" id="listproductincup">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Products End -->


<!-- Service Start -->
<div class="container-fluid service position-relative px-5 mt-5" style="margin-bottom: 135px;">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-6 col-md-6">
                <div class="bg-primary border-inner text-center text-white p-5">
                    <h4 class="text-uppercase mb-3">Prodotti Retail</h4>
                    <p>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo amet tempor amet kasd lorem dolor ipsum</p>
                    <a class="text-uppercase text-dark" href="">Read More <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="bg-primary border-inner text-center text-white p-5">
                    <h4 class="text-uppercase mb-3">Prodotti In Cup</h4>
                    <p>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo amet tempor amet kasd lorem dolor ipsum</p>
                    <a class="text-uppercase text-dark" href="">Read More <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-12 col-md-6 text-center">
                <h1 class="text-uppercase text-danger mb-4">30% di sconto per questa estate</h1>
                <a href="" class="btn btn-primary border-inner py-3 px-5">Consulta la mappa</a>
            </div>
        </div>
    </div>
</div>
<!-- Service Start -->


<!-- Team Start -->
<div class="container-fluid py-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Team Members</h2>
            <h1 class="display-4 text-uppercase">I nostri collaboratori</h1>
        </div>
        <div class="row g-5">
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="public/img/team-1.jpg" alt="">
                        <div class="team-overlay w-100 h-100 position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                            <div class="d-flex align-items-center justify-content-start">
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="bg-dark border-inner text-center p-4">
                        <h4 class="text-uppercase text-primary">Full Name</h4>
                        <p class="text-white m-0">Designation</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="public/img/team-2.jpg" alt="">
                        <div class="team-overlay w-100 h-100 position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                            <div class="d-flex align-items-center justify-content-start">
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="bg-dark border-inner text-center p-4">
                        <h4 class="text-uppercase text-primary">Full Name</h4>
                        <p class="text-white m-0">Designation</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="public/img/team-3.jpg" alt="">
                        <div class="team-overlay w-100 h-100 position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                            <div class="d-flex align-items-center justify-content-start">
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="bg-dark border-inner text-center p-4">
                        <h4 class="text-uppercase text-primary">Full Name</h4>
                        <p class="text-white m-0">Designation</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Team End -->


<script>
    let euroITLocale = Intl.NumberFormat('it-IT');
    window.onload=function productList() {
        const Http = new XMLHttpRequest();
        const url = 'products';
        Http.open("GET", url);
        Http.send();
        Http.onload = function () {
            const json = this.responseText;
            const obj = JSON.parse(json);
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].cup){
                    $('#listproductincup')
                        .append('<div class="col-lg-6">'+
                            '<div class="d-flex h-100">'+
                            '<div class="flex-shrink-0">'+
                            '<img class="img-fluid" src="'+obj[i].image+'" alt="" style="width: 150px; height: 150px;">'+
                            '<h4 class="bg-dark text-primary p-2 m-0">'+obj[i].price.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+' &euro;</h4>'+
                            '</div>'+
                            '<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">'+
                            '<h5 class="text-uppercase">'+obj[i].description+'</h5>'+
                            '<span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>'+
                            '</div>'+
                            '</div>'+
                            '</div>'
                        );
                }else{
                    $('#listproductretail')
                        .append('<div class="col-lg-6">'+
                            '<div class="d-flex h-100">'+
                            '<div class="flex-shrink-0">'+
                            '<img class="img-fluid" src="'+obj[i].image+'" alt="" style="width: 150px; height: 150px;">'+
                            '<h4 class="bg-dark text-primary p-2 m-0">'+obj[i].price.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+' &euro;</h4>'+
                            '</div>'+
                            '<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">'+
                            '<h5 class="text-uppercase">'+obj[i].description+'</h5>'+
                            '<span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>'+
                            '</div>'+
                            '</div>'+
                            '</div>'
                        );
                }

            }
        };
    }
</script>
