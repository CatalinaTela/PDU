<div class="container is-fluid mb-6">
    <h1 class="title">Catálogo</h1>
    <h2 class="subtitle">Lista de propiedades</h2>
</div>

<!-- Buscador-->
<div class="container pb-6 pt-6">
    <?php
        require_once "./backend/php/main.php";

        if(isset($_POST['modulo_buscador'])){
            require_once "./backend/php/buscador.php";
        }

        if(!isset($_SESSION['busqueda_catalogo']) && empty($_SESSION['busqueda_catalogo'])){
    ?>   
    <div class="columns is-mobile is-centered">
        <form class="box"  action="" method="POST" autocomplete="off" >
            
                <div class="column">
				<label>Tipo de Propiedad</label><br>
		    	<div class="select is-rounded">
				  	<select name="id_type" >
				    	<option value="" selected="" >Seleccione una opción</option>
				    	<?php
    						$id_type=conexion();
    						$id_type=$id_type->query("SELECT * FROM tipo_propiedad");
    						if($id_type->rowCount()>0){
    							$id_type=$id_type->fetchAll();
    							foreach($id_type as $row){
    								echo '<option value="'.$row['id_type'].'" >'.$row['type_name'].'</option>';
				    			}
				   			}
				   			$id_type=null;
				    	?>
				  	</select>
				</div>
		  	</div>
            <div class="column">
				<label>Tipo de Operación</label><br>
		    	<div class="select is-rounded">
				  	<select name="id_operation" class="selector">
				    	<option value="" selected="" >Seleccione una opción</option>
				    	<?php
    						$id_operation=conexion();
    						$id_operation=$id_operation->query("SELECT * FROM operacion_inmobiliaria");
    						if($id_operation->rowCount()>0){
    							$id_operation=$id_operation->fetchAll();
    							foreach($id_operation as $row){
    								echo '<option value="'.$row['id_operation'].'" >'.$row['operation_name'].'</option>';
				    			}
				   			}
				   			$id_operation=null;
				    	?>
				  	</select>
				</div>
		  	</div>
            <div class="column-filtro-barra">
            <label>Filtrar por Rango de Precios</label>
            <div class="range-slider">
                <div class="range-bar" id="range-bar"></div>
                <input type="range" id="range-min" min="0" max="300000" step="10000" value="50000">
                <input type="range" id="range-max" min="0" max="300000" step="10000" value="150000">
            </div>
            <div class="range-values">
                <span id="min-value">50000</span>
                <span id="max-value">150000</span>
            </div>

            <script>
                const rangeMin = document.getElementById('range-min');
                const rangeMax = document.getElementById('range-max');
                const minValue = document.getElementById('min-value');
                const maxValue = document.getElementById('max-value');
                const rangeBar = document.getElementById('range-bar');

                function updateRange() {
                const min = parseInt(rangeMin.value);
                const max = parseInt(rangeMax.value);

                // Evitar cruces entre los deslizadores
                if (min >= max) {
                    rangeMin.value = max - rangeMin.step;
                }

                // Actualizar los valores mostrados
                minValue.textContent = rangeMin.value;
                maxValue.textContent = rangeMax.value;

                // Calcular porcentaje para la barra visual
                const minPercent = ((rangeMin.value - rangeMin.min) / (rangeMin.max - rangeMin.min)) * 100;
                const maxPercent = ((rangeMax.value - rangeMax.min) / (rangeMax.max - rangeMax.min)) * 100;

                // Actualizar la barra entre los rangos
                rangeBar.style.background = `linear-gradient(to right, #ccc ${minPercent}%, hsl(105, 44%, 38%) ${minPercent}%, hsl(105, 44%, 38%) ${maxPercent}%, #ccc ${maxPercent}%)`;
                }

                rangeMin.addEventListener('input', updateRange);
                rangeMax.addEventListener('input', updateRange);

                // Inicializar valores al cargar
                updateRange();
            </script>

            </div>
            <div class="column">
                <p class="control">
                    <button class="button is-primary is-rounded " type="submit" >Buscar</button>
                </p> 
            </div> 
        </form>
    </div>
    <?php }else{ ?>
    <div class="columns">
        <div class="column">
            <form class="has-text-centered mt-6 mb-6" action="" method="POST" autocomplete="off" >
                <input type="hidden" name="modulo_buscador" value="catalogo"> 
                <input type="hidden" name="eliminar_buscador" value="catalogo">
                <p>Estas buscando <strong>“<?php echo $_SESSION['busqueda_catalogo']; ?>”</strong></p>
                <br>
                <button type="submit" class="button is-danger is-rounded">Eliminar busqueda</button>
            </form>
        </div>
    </div>
    <?php
            if(!isset($_GET['page'])){
                $pagina=1;
            }else{
                $pagina=(int) $_GET['page'];
                if($pagina<=1){
                    $pagina=1;
                }
            }

            $pagina=limpiar_cadena($pagina);
            $url="index.php?vista=catalogo&page="; /* <== */
            $registros=15;
            $busqueda=$_SESSION['busqueda_catalogo']; /* <== */

            # Paginador producto #
            require_once "./backend/object/Property.php";
        } 
    ?>
</div>

<!--Catalogo-->

<div class="container pb-6 pt-6">
    <?php
        require_once "././backend/php/main.php";

        if(!isset($_GET['page'])){
            $pagina=1;
        }else{
            $pagina=(int) $_GET['page'];
            if($pagina<=1){
                $pagina=1;
            }
        }

        $id_operation = (isset($_GET['id_operation'])) ? $_GET['id_operation'] : 0;
        $id_type = (isset($_GET['id_type'])) ? $_GET['id_type'] : 0;

        $pagina=limpiar_cadena($pagina);
        $url="index.php?vista=catalogo&page="; /* <== */
        $registros=12;
        $busqueda="";

        require_once "././backend/object/Property.php";
    ?>
</div>

