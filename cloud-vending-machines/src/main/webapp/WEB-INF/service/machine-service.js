function procutList() {

    baseUrl: string = environment.apiBaseUrl + "/api/v1/note";

    const Http = new XMLHttpRequest();
    const url = 'http://localhost/cloud_vending_machines_war_exploded/products';
    Http.open("GET", url);
    Http.send();

    Http.onreadystatechange = (e) => {
        console.log(Http.responseText)
    }
}
