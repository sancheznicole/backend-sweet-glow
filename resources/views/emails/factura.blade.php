<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>

<body style="margin:0; padding:0; font-family: Arial, sans-serif; background-color:#f6f1f4;">

    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">

                <!-- CONTENEDOR -->
                <table width="600" cellpadding="20" cellspacing="0" style="background:#ffffff; border-radius:10px;">

                    <!-- HEADER -->
                    <tr>
                        <td align="center" style="border-bottom:1px solid #eee;">
                            <h1 style="margin:0; color:#b48a94;">SWEET GLOW</h1>
                            <p style="margin:5px 0; color:#888;">Gracias por tu compra 💖</p>
                        </td>
                    </tr>

                    <!-- INFO CLIENTE -->
                    <tr>
                        <td>
                            <p><strong>Cliente:</strong> {{ $nombre }}</p>
                            <p><strong>Email:</strong> {{ $email }}</p>
                            <p><strong>Fecha:</strong> {{ $fecha }}</p>
                        </td>
                    </tr>

                    <!-- TABLA PRODUCTOS -->
                    <tr>
                        <td>
                            <table width="100%" cellpadding="10" cellspacing="0" style="border-collapse: collapse;">
                                <tr style="background:#f3e8eb; color:#333;">
                                    <th align="center">Imagen</th>
                                    <th align="left">Producto</th>
                                    <th align="left">Referencia</th>
                                    <th align="center">Cantidad</th>
                                    <th align="right">Precio</th>
                                </tr>

                                @foreach($productos as $producto)
                                <tr style="border-bottom:1px solid #eee;">
                                    <!-- IMAGEN 1:1 -->
                                    <td align="center">
                                        <div style="
                                            width:60px;
                                            height:60px;
                                            overflow:hidden;
                                            border-radius:8px;
                                            background:#f6f1f4;
                                        ">
                                            <img 
                                                src="{{ $producto['imagen'] }}" 
                                                width="60" 
                                                height="60"
                                                style="
                                                    display:block;
                                                    width:100%;
                                                    height:100%;
                                                    object-fit:cover;
                                                "
                                            >
                                        </div>
                                    </td>

                                    <td style="vertical-align: middle;">
                                        {{ $producto['nombre'] }}
                                    </td>

                                    <td style="vertical-align: middle;">
                                        {{ $producto['referencia'] }}
                                    </td>


                                    <td align="center" style="vertical-align: middle;">
                                        {{ $producto['cantidad'] }}
                                    </td>

                                    <td align="right" style="vertical-align: middle;">
                                        ${{ $producto['precio'] }}
                                    </td>
                                </tr>
                                @endforeach
                            </table>
                        </td>
                    </tr>

                    <!-- TOTAL -->
                    <tr>
                        <td align="right">
                            <h2 style="color:#b48a94;">Total: ${{ $total }}</h2>
                        </td>
                    </tr>

                    <!-- FOOTER -->
                    <tr>
                        <td align="center" style="border-top:1px solid #eee;">
                            <p style="color:#999; font-size:12px;">
                                Sweet Glow - Belleza y cuidado personal ✨<br>
                                Este es un correo automático, no responder.
                            </p>
                        </td>
                    </tr>

                </table>

            </td>
        </tr>
    </table>

</body>
</html>