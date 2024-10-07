var map; // Declare a vari�vel map fora da fun��o

function initializeMap() {

    // Inicializa o mapa
    map = L.map('map').setView([-21.6034, -48.3665], 13); // Coordenadas iniciais

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '� OpenStreetMap'
    }).addTo(map);

    // Verifica se a geolocaliza��o � suportada
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;

            console.log("Latitude: ", lat);
            console.log("Longitude: ", lon);

            // Atualiza o mapa para a localiza��o do usu�rio
            map.setView([lat, lon], 13);
            L.marker([lat, lon]).addTo(map)
                .bindPopup('Voc� est� aqui!')
                .openPopup();
        }, function (error) {
            console.error("Erro ao obter a localiza��o: ", error);
            alert("N�o foi poss�vel obter a localiza��o: " + error.message);
        });
    } else {
        alert("Geolocaliza��o n�o suportada por este navegador.");
    }
}
