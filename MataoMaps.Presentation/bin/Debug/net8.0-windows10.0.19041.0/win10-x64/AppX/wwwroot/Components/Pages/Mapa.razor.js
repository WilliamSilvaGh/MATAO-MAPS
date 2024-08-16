window.initializeMap = () => {
    var map = L.map('map').setView([-21.6051, -48.3724], 13); // Coordenadas de Matão e zoom inicial

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    const provider = new GeoSearch.OpenStreetMapProvider();
    const searchControl = new GeoSearch.GeoSearchControl({
        provider: provider
    });
    map.addControl(searchControl);

    map.on('click', onMapClick);
};

window.onMapClick = (e) => {
    DotNet.invokeMethodAsync('MataoMaps.Client', 'EnviarCoordenadas', e.latlng.lat, e.latlng.lng);
};

window.exibirCoordenadas = (latitude, longitude) => {
    document.getElementById('coordenadas').textContent = `Coordenadas: ${latitude}, ${longitude}`;
};
