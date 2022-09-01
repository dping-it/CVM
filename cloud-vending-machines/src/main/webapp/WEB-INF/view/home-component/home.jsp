<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/07/2022
  Time: 06:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Hero Start -->
<div class="container-fluid bg-primary py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row justify-content-start">
            <div class="col-lg-8 text-center text-lg-start">
                <h1 class="font-secondary text-primary mb-4">Momento Gustoso</h1>
                <h1 class="display-1 text-uppercase text-white mb-4">CVM WebApp</h1>
                <h1 class="text-uppercase text-white">Acquista con un click</h1>
                <div class="d-flex align-items-center justify-content-center justify-content-lg-start pt-5">
                    <a href="" class="btn btn-primary border-inner py-3 px-5 me-5" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Guida rapida</a>
                    <button type="button" class="btn-play" data-bs-toggle="modal"
                            data-src="https://www.youtube.com/embed/HaRnkMQz2Ig" data-bs-target="#videoModal">
                        <span></span>
                    </button>
                    <h5 class="font-weight-normal text-white m-0 ms-4 d-none d-sm-block">Play Video</h5>
                </div>
                <br>
                <div class="collapse" id="collapseExample">
                    <div class="card card-body text-dark">
                        Apri il simulatore del distributore automatico che trovi nella sezione "MAPPA MACCHINETTE". Verrà aperto in una nuova pagina. Se non lo hai ancora fatto registrati al servizio o effettua il login per entrare nel tuo account.
                        Ricarica il tuo credito. Connetti il tuo account tramite il pulsante "CONNETTI"  inserendo il codice di quattro cifre "ID MACCHINETTA" riportato sul simulatore.
                        Per L'acquisto puoi selezionare un prodotto tramite il touchscreen, o digitare il codice prodotto sulla tastiera. Prova anche i prodotti IN CUP!
                        Disconnetti per terminare l'acquisto.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->


<!-- Video Modal Start -->
<div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 16:9 aspect ratio -->
                <div class="ratio ratio-16x9">
                    <iframe class="embed-responsive-item" src="" id="video" allowfullscreen allowscriptaccess="always"
                            allow="autoplay"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Video Modal End -->


<!-- About Start -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 href="#" class="text-primary font-secondary">Cloud Vending Machines</h2>
            <h1 class="display-4 text-uppercase">Benvenuto sulla nuvola degli snack</h1>
        </div>
        <div class="row gx-5">
            <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100" src="public/img/snack.jpg" style="object-fit: cover;">
                </div>
            </div>
            <div class="col-lg-6 pb-5">
                <h4 class="mb-4">La prima webapp per pagare
                    il tuo Coffee Break o Snack Happy Hour con il cellulare, il tablet o il pc,
                    in modo sicuro e facile </h4>
                <p class="mb-5">Evita di cercare moneta e chiavetta, finalmente puoi pagare con il tuo cellulare. Ricarica l'app semplicemente con moneta o carta di credito. Presto aderirai a scontistiche dedicate al tuo punto di consumo.</p>
                <div class="row g-5">
                    <div class="col-sm-6">
                        <div class="d-flex align-items-center justify-content-center bg-primary border-inner mb-4" style="width: 90px; height: 90px;">
                            <i class="fa fa-heartbeat fa-2x text-white"></i>
                        </div>
                        <h4 class="text-uppercase">100% Qualità</h4>
                        <p class="mb-0">Labore justo vero ipsum sit clita erat lorem magna clita nonumy dolor magna dolor vero</p>
                    </div>
                    <div class="col-sm-6">
                        <div class="d-flex align-items-center justify-content-center bg-primary border-inner mb-4" style="width: 90px; height: 90px;">
                            <i class="fa fa-award fa-2x text-white"></i>
                        </div>
                        <h4 class="text-uppercase">Le Migliori Marche</h4>
                        <p class="mb-0">Labore justo vero ipsum sit clita erat lorem magna clita nonumy dolor magna dolor vero</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->


<!-- Facts Start -->
<div class="container-fluid bg-img py-5 mb-5">
    <div class="container py-5">
        <div class="row gx-5 gy-4">
            <div class="col-lg-3 col-md-6">
                <div class="d-flex">
                    <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                        <i class="fa fa-star text-white"></i>
                    </div>
                    <div class="ps-4">
                        <h6 class="text-primary text-uppercase">MACCHINETTE</h6>
                        <h1 class="display-5 text-white mb-0" data-toggle="counter-up">12400</h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex">
                    <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                        <i class="fa fa-users text-white"></i>
                    </div>
                    <div class="ps-4">
                        <h6 class="text-primary text-uppercase">TEAM TECNICO</h6>
                        <h1 class="display-5 text-white mb-0" data-toggle="counter-up">800</h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex">
                    <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                        <i class="fa fa-mug-hot text-white"></i>
                    </div>
                    <div class="ps-4">
                        <h6 class="text-primary text-uppercase">TIPI PRODOTTI</h6>
                        <h1 class="display-5 text-white mb-0" data-toggle="counter-up">600</h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex">
                    <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                        <i class="fa fa-check text-white"></i>
                    </div>
                    <div class="ps-4">
                        <h6 class="text-primary text-uppercase">CLIENTI SODDISFATTI</h6>
                        <h1 class="display-5 text-white mb-0" data-toggle="counter-up">400000</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Offer Start -->
<div class="container-fluid bg-offer my-5 py-5">
    <div class="container py-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-7 text-center">
                <div class="section-title position-relative text-center mx-auto mb-4 pb-3" style="max-width: 600px;">
                    <h2 class="text-primary font-secondary">Offerta Speciale</h2>
                    <h1 class="display-4 text-uppercase text-white">Bonus di benvenuto da 5€</h1>
                </div>
                <p class="text-white mb-4">Eirmod sed tempor lorem ut dolores sit kasd ipsum. Dolor ea et dolore et at sea ea at dolor justo ipsum duo rebum sea. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo lorem. Elitr ut dolores magna sit. Sea dolore sed et.</p>
                <a href="" class="btn btn-primary border-inner py-3 px-5 me-3" data-bs-toggle="modal" data-bs-target="#myModalReg">Registrati</a>
                <a href="" class="btn btn-dark border-inner py-3 px-5" data-bs-toggle="collapse" data-bs-target="#collapseDetails" aria-expanded="false" aria-controls="collapseDetails">Dettagli</a>
            </div>
            <br>
            <div class="collapse" id="collapseDetails">
                <div class="card card-body text-dark">
                    Apri il simulatore del distributore automatico che trovi nella sezione "MAPPA MACCHINETTE". Verrà aperto in una nuova pagina. Se non lo hai ancora fatto registrati al servizio o effettua il login per entrare nel tuo account.
                    Ricarica il tuo credito. Connetti il tuo account tramite il pulsante "CONNETTI"  inserendo il codice di quattro cifre "ID MACCHINETTA" riportato sul simulatore.
                    Per L'acquisto puoi selezionare un prodotto tramite il touchscreen, o digitare il codice prodotto sulla tastiera. Prova anche i prodotti IN CUP!
                    Disconnetti per terminare l'acquisto.
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Offer End -->


<!-- Testimonial Start -->
<div class="container-fluid py-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Testimonial</h2>
            <h1 class="display-4 text-uppercase">Cosa dicono di noi!!!</h1>
        </div>
        <div class="owl-carousel testimonial-carousel">
            <div class="testimonial-item bg-dark text-white border-inner p-4">
                <div class="d-flex align-items-center mb-3">
                    <img class="img-fluid flex-shrink-0" src="public/img/testimonial-1.jpg" style="width: 60px; height: 60px;">
                    <div class="ps-3">
                        <h4 class="text-primary text-uppercase mb-1">Giulia Verdi</h4>
                        <span>Profession</span>
                    </div>
                </div>
                <p class="mb-0">Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam
                </p>
            </div>
            <div class="testimonial-item bg-dark text-white border-inner p-4">
                <div class="d-flex align-items-center mb-3">
                    <img class="img-fluid flex-shrink-0" src="public/img/testimonial-2.jpg" style="width: 60px; height: 60px;">
                    <div class="ps-3">
                        <h4 class="text-primary text-uppercase mb-1">Mario Rossi</h4>
                        <span>Profession</span>
                    </div>
                </div>
                <p class="mb-0">Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam
                </p>
            </div>
            <div class="testimonial-item bg-dark text-white border-inner p-4">
                <div class="d-flex align-items-center mb-3">
                    <img class="img-fluid flex-shrink-0" src="public/img/testimonial-3.jpg" style="width: 60px; height: 60px;">
                    <div class="ps-3">
                        <h4 class="text-primary text-uppercase mb-1">Francesco Bianchi</h4>
                        <span>Profession</span>
                    </div>
                </div>
                <p class="mb-0">Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam
                </p>
            </div>
            <div class="testimonial-item bg-dark text-white border-inner p-4">
                <div class="d-flex align-items-center mb-3">
                    <img class="img-fluid flex-shrink-0" src="public/img/testimonial-4.jpg" style="width: 60px; height: 60px;">
                    <div class="ps-3">
                        <h4 class="text-primary text-uppercase mb-1">Maria Rosa</h4>
                        <span>Profession</span>
                    </div>
                </div>
                <p class="mb-0">Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam
                </p>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial End -->


<!-- Footer Start -->
<div class="container-fluid bg-img text-secondary" style="margin-top: 90px">
    <div class="container">
        <div class="row gx-5">
            <div class="col-lg-4 col-md-6 mb-lg-n5">
                <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary border-inner p-4">
                    <a href="index.html" class="navbar-brand">
                        <h1 class="m-0 text-uppercase text-white"><i class="fa fa-cloud fs-1 text-dark me-3"></i>CVM</h1>
                    </a>
                    <p class="mt-3">Lorem diam sit erat dolor elitr et, diam lorem justo labore amet clita labore stet eos magna sit. Elitr dolor eirmod duo tempor lorem, elitr clita ipsum sea. Nonumy rebum et takimata ea takimata amet gubergren, erat rebum magna lorem stet eos. Diam amet et kasd eos duo dolore no.</p>
                </div>
            </div>
            <div class="col-lg-8 col-md-6">
                <div class="row gx-5">
                    <div class="col-lg-4 col-md-12 pt-5 mb-5">
                        <h4 class="text-primary text-uppercase mb-4">In un click</h4>
                        <div class="d-flex mb-2">
                            <i class="bi bi-geo-alt text-primary me-2"></i>
                            <p class="mb-0">Via libertà 1, Palermo, Italia</p>
                        </div>
                        <div class="d-flex mb-2">
                            <i class="bi bi-envelope-open text-primary me-2"></i>
                            <p class="mb-0">info@dping.it</p>
                        </div>
                        <div class="d-flex mb-2">
                            <i class="bi bi-telephone text-primary me-2"></i>
                            <p class="mb-0">+393337215555</p>
                        </div>
                        <div class="d-flex mt-4">
                            <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="https://it.linkedin.com/in/davide-proietto-a4952a107" target="_blank"><i class="fab fa-linkedin-in fw-normal"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                        <h4 class="text-primary text-uppercase mb-4">Links</h4>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                            <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                            <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                            <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
                            <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                            <a class="text-secondary" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                        <h4 class="text-primary text-uppercase mb-4">Newsletter</h4>
                        <p>Resta aggiornato sulle novità e su tutte le nostre pomozioni</p>
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control border-white p-3" placeholder="La tua Email">
                                <button class="btn btn-primary">Sign Up</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid text-secondary py-4" style="background: #111111;">
    <div class="container text-center">
        <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">CLOUD VENDING MACHINES</a>
         Designed by <a class="text-white border-bottom" href="https://www.dping.it">DPING</a></p>
        <br>Distributed By: <a class="border-bottom" href="https://www.dping.it" target="_blank">DPING</a>
    </div>
</div>
<!-- Footer End -->

<!-- Back to Top -->
<a href="#" class="btn btn-primary border-inner py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>
