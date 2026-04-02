<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
        }

        .factura-container {
            width: 100%;
            margin: 0 auto;
        }

        .card-factura {
            width: 100%;
        }

        .card-header {
            text-align: center;
            margin-bottom: 15px;
        }

        .products-title {
            margin: 10px 0;
            font-size: 18px;
            font-weight: bold;
        }

        .products-container {
            width: 100%;
        }

        .cart-product-container {
            background-color: #f9f1f4;
            padding: 10px;
            margin-bottom: 10px;
            overflow: hidden;
        }

        /* reemplazo de flex */
        .image-container {
            float: left;
            width: 20%;
        }

        .image-container img {
            width: 100%;
        }

        .info-container {
            float: right;
            width: 75%;
            text-align: right;
        }

        .card-footer {
            text-align: right;
            margin-top: 10px;
            padding: 10px;
            color: palevioletred;
            font-size: 24px;
            font-weight: bold;
        }

        .clear {
            clear: both;
        }
    </style>
</head>
<body>

<div class="factura-container">
    <div class="card-factura">

        <div class="card-header">
            <h1>✅ Pago aprobado</h1>
            <h2>Factura #{{ $factura->id_factura_pedido }}</h2>
            <p>Fecha: {{ substr($factura->created_at, 0, 10) }}</p>
        </div>

        <div class="products-title">Productos:</div>

        <div class="products-container">
            @foreach($factura->carrito->elementos as $el)
                <div class="cart-product-container">

                    @if($el->producto && isset($el->producto->imagenes[0]))
                        <img src="{{ public_path('storage/imagenes_productos/'.$el->producto->imagenes[0]->filename) }}">
                    @endif

                    <div class="info-container">
                        <p><strong>{{ $el->producto->nombre }}</strong></p>
                        <p>
                            color: {{ $el->producto->referencia_producto->color ?? '' }}
                            | tamaño: {{ $el->producto->referencia_producto->tamano ?? '' }}
                        </p>
                        <p>
                            <strong>{{ $el->producto->categoria->nombre ?? '' }}</strong> |
                            {{ $el->producto->marca->nombre ?? '' }}
                        </p>
                    </div>

                    <div class="clear"></div>
                </div>
            @endforeach
        </div>

        <div class="card-footer">
            Total: ${{ $factura->neto - $factura->descuento }}
        </div>

    </div>
</div>

</body>
</html>