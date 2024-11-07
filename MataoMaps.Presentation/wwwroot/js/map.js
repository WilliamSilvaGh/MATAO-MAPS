var map; // Variável global do mapa

function initializeMap() {
    // Inicializa o mapa
    map = L.map('map').setView([-21.6034, -48.3665], 13); // Coordenadas iniciais

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    // Tenta pegar a localização atual do usuário
    updateUserLocation();
}

function updateUserLocation() {
    // Verifica se a geolocalização é suportada
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;

            console.log("Latitude: ", lat);
            console.log("Longitude: ", lon);

            // Atualiza o mapa para a localização do usuário
            map.setView([lat, lon], 13);
            L.marker([lat, lon]).addTo(map)
                .bindPopup('Você está aqui!')
                .openPopup();
        }, function (error) {
            console.error("Erro ao obter a localização: ", error);
            alert("Não foi possível obter a localização: " + error.message);
        });
    } else {
        alert("Geolocalização não suportada por este navegador.");
    }
}

// Função para recarregar o mapa (chamado do Blazor)
function reloadMap() {
    map.remove(); // Remove o mapa atual
    initializeMap(); // Recria o mapa
}
