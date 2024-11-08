var map; // Mapa global
var userMarker; // Marcador do usuário
var userCircle; // Círculo de precisão

// Inicializa o mapa
function initializeMap() {
    // Inicializa o mapa com coordenadas padrão
    map = L.map('map').setView([-21.6034, -48.3665], 13); // Coordenadas iniciais
    console.log("Mapa inicializado com coordenadas:", [-21.6034, -48.3665]);

    // Adiciona o layer do OpenStreetMap
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    // Tenta obter a localização do usuário
    updateUserLocation().then(position => {
        console.log("Localização do usuário obtida:", position);
        map.setView([position.Latitude, position.Longitude], 13);  // Centraliza o mapa

        // Verifica se o marcador do usuário já existe. Caso contrário, cria um novo.
        if (!userMarker) {
            userMarker = L.marker([position.Latitude, position.Longitude]).addTo(map);
            userMarker.bindPopup("Você está aqui!").openPopup(); // Popup de localização do usuário
        } else {
            // Atualiza a posição do marcador
            userMarker.setLatLng([position.Latitude, position.Longitude]);
        }

        // Verifica se o círculo de precisão já existe. Caso contrário, cria um novo.
        if (!userCircle) {
            userCircle = L.circle([position.Latitude, position.Longitude], {
                color: 'blue',
                fillColor: 'blue',
                fillOpacity: 0.2,
                radius: 300
            }).addTo(map);
        } else {
            // Atualiza a posição do círculo
            userCircle.setLatLng([position.Latitude, position.Longitude]);
        }
    }).catch(() => {
        alert('Erro ao obter a localização. Você pode tentar habilitar a localização manualmente.');
    });

    // Busca as ocorrências mesmo que a localização tenha falhado (isso é independente)
    fetchOcorrencias();  // Busca as ocorrências
}

// Função para atualizar a localização do usuário
function updateUserLocation() {
    return new Promise((resolve, reject) => {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;
                console.log("Localização do usuário:", lat, lon);  // Log da localização
                resolve({ Latitude: lat, Longitude: lon }); // Retorna as coordenadas
            }, function (error) {
                console.error("Erro ao obter a localização do usuário:", error);
                reject(error); // Em caso de erro, rejeita a promessa
            });
        } else {
            reject(new Error("Geolocalização não suportada")); // Caso geolocalização não seja suportada
        }
    });
}

// Função para buscar as ocorrências
function fetchOcorrencias() {
    var token = localStorage.getItem('access_token');
    console.log("Token obtido para a requisição da API:", token);

    fetch('http://localhost:5033/ocorrencia/listar', {
        method: 'GET',
        headers: { 'Authorization': 'Bearer ' + token }
    })
        .then(response => {
            console.log("Resposta da API recebida com status:", response.status);  // Log do status da resposta
            if (!response.ok) {
                throw new Error('Erro na resposta da API: ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            console.log("Dados recebidos da API:", data);  // Log dos dados recebidos

            data.forEach(ocorrencia => {
                console.log("Ocorrência recebida:", ocorrencia);  // Log de cada ocorrência recebida

                // Verifique se as coordenadas estão presentes no formato esperado
                if (ocorrencia.latitude && ocorrencia.longitude) {
                    console.log("Coordenadas da ocorrência:", ocorrencia.latitude, ocorrencia.longitude); // Log das coordenadas
                    createOcorrenciaCircle(ocorrencia);  // Cria a bolinha vermelha para a ocorrência
                } else {
                    console.error("Coordenadas inválidas para a ocorrência:", ocorrencia);
                }
            });
        })
        .catch(error => console.error('Erro ao buscar ocorrências:', error));
}

// Função para criar o círculo para a ocorrência
function createOcorrenciaCircle(ocorrencia) {
    var lat = ocorrencia.latitude;  // Coordenadas da ocorrência
    var lon = ocorrencia.longitude;
    var descricao = ocorrencia.descricao;

    // Verifica as coordenadas da ocorrência
    console.log("Criando círculo para ocorrência com coordenadas: Latitude =", lat, ", Longitude =", lon);
    console.log("Descrição da ocorrência:", descricao);

    var circle = L.circle([lat, lon], {
        color: 'red',
        fillColor: 'red',
        fillOpacity: 0.4,
        radius: 200
    }).addTo(map);

    // Adiciona o texto da descrição no popup
    circle.on('mouseover', function () {
        this.bindPopup(`<strong>${descricao}</strong>`).openPopup();
    });

    circle.on('mouseout', function () {
        this.closePopup();
    });
}

// Função para recarregar o mapa
function reloadMap() {
    console.log("Recarregando o mapa...");

    // Verifique se o mapa já foi inicializado
    if (map) {
        // Limpa todos os marcadores e círculos
        if (userMarker) {
            userMarker.remove();
            userMarker = null;
        }
        if (userCircle) {
            userCircle.remove();
            userCircle = null;
        }

        // Remove o mapa existente
        map.remove();
        map = null;   // Limpa a referência do mapa
    }

    // Re-inicializar o mapa
    initializeMap(); // Re-inicia o mapa
}
