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

// Função para criar ou atualizar o círculo para a ocorrência
function createOcorrenciaCircle(ocorrencia) {
    var lat = ocorrencia.latitude;  // Coordenadas da ocorrência
    var lon = ocorrencia.longitude;
    var descricao = ocorrencia.descricao;
    var status = ocorrencia.status;  // Status da ocorrência
    var resolucao = ocorrencia.resolucao;  // Resolução (resposta do administrador)

    // Log do status para debug
    console.log("Status da ocorrência:", status);  // Adicionado para verificar o valor exato de 'status'

    // Verifica o status da ocorrência e define a cor do círculo
    var circleColor = 'red';
    var popupContent = descricao;

    // Verificando o status, e ajustando a cor e o conteúdo do popup
    if (status === 'concluido' || status === 'Concluido' || status === 1) {
        // Se o status for 'concluido', muda a cor do círculo para verde
        circleColor = 'green';
        // Exibe a resolução (resposta do administrador) no popup
        popupContent = `<strong>Resposta do Administrador:</strong><br>${resolucao || 'Sem resposta disponível'}`;
    }

    // Verifique se o marcador já existe, se não, cria um novo círculo
    if (!ocorrencia.circle) {
        // Criação do círculo (se ainda não existir)
        ocorrencia.circle = L.circle([lat, lon], {
            color: circleColor,
            fillColor: circleColor,
            fillOpacity: 0.4,
            radius: 200
        }).addTo(map);
    } else {
        // Se o círculo já existir, apenas atualize a cor e o conteúdo do popup
        ocorrencia.circle.setLatLng([lat, lon]);  // Atualiza as coordenadas
        ocorrencia.circle.setStyle({ color: circleColor, fillColor: circleColor });  // Atualiza a cor
    }

    // Adiciona o popup com a descrição ou resolução do administrador
    ocorrencia.circle.on('mouseover', function () {
        this.bindPopup(popupContent).openPopup();
    });

    ocorrencia.circle.on('mouseout', function () {
        this.closePopup();
    });
}

// Função para buscar as ocorrências
function fetchOcorrencias() {
    var token = localStorage.getItem('access_token');
    console.log("Token obtido para a requisição da API:", token);

    fetch('https://api-matao-maps.tccnapratica.com.br/ocorrencia/listar', {
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
                    createOcorrenciaCircle(ocorrencia);  // Cria ou atualiza a bolinha para a ocorrência
                } else {
                    console.error("Coordenadas inválidas para a ocorrência:", ocorrencia);
                }
            });
        })
        .catch(error => console.error('Erro ao buscar ocorrências:', error));
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
