<?php
include "./backend/inc/btn_back.php";
require_once "./backend/php/main.php";

$id = (isset($_GET['id_property_view'])) ? $_GET['id_property_view'] : 0;

?>
<div class="container is-fluid mb-6">
    <h1 class="title">Propiedad</h1>
</div>

<div class="container pb-6 pt-6">
    <?php
    $check_propiedad = conexion();
    $check_propiedad = $check_propiedad->query("SELECT * FROM propiedades WHERE id_property='$id'");


    if ($check_propiedad->rowCount() > 0) {
        $datos = $check_propiedad->fetch();
        $images = json_decode($datos['picture'], true) ?: [];
        $num_foto = isset($_GET['num_foto']) ? $_GET['num_foto'] : $images[0];
        $latitud = $datos['latitud'];
        $longitud = $datos['longitud'];
    ?>

    <div class="form-rest mb-6 mt-6"></div>
    <form action="./backend/object/Publication.php" method="POST">
        <div class="columns is-multiline is-mobile">
                <div class="column is-half">
                    <div class="box" >
                        <h2 class="title has-text-centered"><?php echo htmlspecialchars($datos['title']); ?></h2>
                        <p><strong>Ubicación:</strong> <?php echo htmlspecialchars($datos['ubication']); ?></p>
                        <p><strong>Descripción:</strong> <?php echo htmlspecialchars($datos['description']); ?></p>
                        <p><strong>Observaciones:</strong> <?php echo htmlspecialchars($datos['observations']); ?></p>
                        <p><strong>Precio:</strong> USD <?php echo number_format($datos['value'], 2); ?></p>
                        <p><strong>Tipo:</strong> 
                            <?php
                            $tipo = conexion()->query("SELECT type_name FROM tipo_propiedad WHERE id_type = '{$datos['id_type']}'")->fetchColumn();
                            echo htmlspecialchars($tipo);
                            ?>
                        </p>
                        <p><strong>Operación:</strong> 
                            <?php
                            $operacion = conexion()->query("SELECT operation_name FROM operacion_inmobiliaria WHERE id_operation = '{$datos['id_operation']}'")->fetchColumn();
                            echo htmlspecialchars($operacion);
                            ?>
                        </p>
                    </div>
                </div>    


                
                <div class="column is-half">
                    <!-- Mapa de OpenStreetMap -->
                    <div id="map" style="height: 450px; width: 100%;"></div>
                </div>

                <!-- Script para OpenStreetMap -->
                <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
                <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
                <script>
                    // Coordenadas de la propiedad
                    var latitud = <?php echo $latitud ?? 0; ?>;
                    var longitud = <?php echo $longitud ?? 0; ?>;

                    // Inicializar el mapa
                    var map = L.map('map').setView([latitud, longitud], 15);

                    // Añadir capa de OpenStreetMap
                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    }).addTo(map);

                    // Añadir marcador
                    if (latitud != 0 && longitud != 0) {
                        L.marker([latitud, longitud]).addTo(map)
                            .bindPopup('<?php echo htmlspecialchars($datos['title']); ?>')
                            .openPopup();
                    } else {
                        alert('Ubicación no válida.');
                    }
                </script>
            <?php
            
            ?>
       
       
                <!-- Galeria de imagenes -->
        <div class="gallery-container">
            <h2 class="title">Galería de Imágenes</h2>
            
            <!-- Contenedor de Imagen Principal -->
            <div class="main-image-container mb-4">
                <img 
                    src="<?php echo $num_foto ?: $images[0]; ?>" 
                    alt="Imagen Principal" 
                    id="main-gallery-image"
                    class="main-image is-fullwidth"
                    style="max-height: 500px; object-fit: cover;"
                >
            </div>

            <!-- Contenedor de Miniaturas con Scroll Horizontal -->
            <div class="thumbnails-wrapper">
                <div class="image-gallery" id="thumbnails-container">
                    <?php foreach ($images as $indice => $img) { ?>
                        <div 
                            class="gallery-item" 
                            data-index="<?php echo $indice; ?>"
                            data-src="<?php echo $img; ?>"
                        >
                            <img 
                                src="<?php echo $img; ?>" 
                                alt="Imagen <?php echo $indice + 1; ?>" 
                                class="thumbnail"
                            >
                        </div>
                    <?php } ?>
                </div>
                
                <!-- Flechas de Navegación 
                <div class="gallery-nav-buttons">
                    <button id="scroll-left" class="nav-button">&#10094;</button>
                    <button id="scroll-right" class="nav-button">&#10095;</button>
                </div>  -->
            </div>
        </div>

        <style>
        .gallery-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #e8c379c3;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .main-image-container {
            width: 100%;
            max-width: 100%;
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .main-image-container:hover {
            transform: scale(1.01);
        }

        .main-image {
            max-width: 100%; 
            max-height: 80vh; 
            object-fit: contain; 
            cursor: zoom-in; 
            transition: transform 0.3s ease;
        }

        .thumbnails-wrapper {
            width: 100%;
            max-width: 800px;
            overflow: hidden;
            background-color:rgba(220, 130, 33, 0.61);
            border-radius: 10px;
            padding: 10px;
        }

        .image-gallery {
            display: flex;
            gap: 15px;
            overflow-x: auto;
            scroll-behavior: smooth;
            padding: 10px 0;
            scrollbar-width: none;
            -ms-overflow-style: none;
        }

        .gallery-item {
            flex: 0 0 auto;
            cursor: pointer;
            transition: all 0.2s ease;
            border-radius: 8px;
            overflow: hidden;
        }

        .gallery-item:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .thumbnail {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border: 3px solid transparent;
            transition: border-color 0.3s ease;
        }

        .thumbnail.active, .gallery-item:hover .thumbnail {
            border-color: #8c280e;
        }

        .title {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
        }
        </style>

        <script>
        document.addEventListener('DOMContentLoaded', () => {
            const mainImage = document.getElementById('main-gallery-image');
            const thumbnailsContainer = document.getElementById('thumbnails-container');
            const scrollLeftBtn = document.getElementById('scroll-left');
            const scrollRightBtn = document.getElementById('scroll-right');
            const galleryItems = document.querySelectorAll('.gallery-item');

            // Cambiar imagen principal al hacer click
            galleryItems.forEach(item => {
                item.addEventListener('click', (e) => {
                    // Remover clase active de todos
                    galleryItems.forEach(g => g.querySelector('.thumbnail').classList.remove('active'));
                    
                    // Agregar clase active al actual
                    e.currentTarget.querySelector('.thumbnail').classList.add('active');
                    
                    // Cambiar imagen principal
                    const src = e.currentTarget.dataset.src;
                    mainImage.src = src;

                    // Abrir lightbox
                    const lightboxItems = <?php echo json_encode($images); ?>.map(src => ({
                        src: src,
                        width: 1200,
                        height: 800
                    }));

                    const options = {
                        dataSource: lightboxItems,
                        index: parseInt(e.currentTarget.dataset.index),
                        showHideAnimationType: 'zoom'
                    };

                    const lightbox = new PhotoSwipe(options);
                    lightbox.init();
                });
            });

            // Navegación con flechas
            scrollLeftBtn.addEventListener('click', () => {
                thumbnailsContainer.scrollBy({ left: -300, behavior: 'smooth' });
            });

            scrollRightBtn.addEventListener('click', () => {
                thumbnailsContainer.scrollBy({ left: 300, behavior: 'smooth' });
            });

            // Activar primera imagen por defecto
            if (galleryItems.length > 0) {
                galleryItems[0].querySelector('.thumbnail').classList.add('active');
            }
        });
        </script>


    <?php
    } else {
        include "./backend/inc/error_alert.php";
    }
    $check_propiedad = null;
    
    ?>
   
</div>



