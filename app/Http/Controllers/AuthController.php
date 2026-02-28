<?php
  
namespace App\Http\Controllers;
  
use App\Http\Controllers\Controller;
use App\Models\Usuarios;
use Validator;
  
  
class AuthController extends Controller
{
 
    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register() {
        $validator = Validator::make(request()->all(), [
            'nombres'  => 'required|string|max:100',
            'apellidos'  => 'required|string|max:100',
            'tipo_documento'  => 'required|string|max:20',
            'num_documento'  => 'required|string|max:20',
            'telefono'  => 'required|string|max:20',
            'direccion'  => 'required|string|max:255',
            'id_rol'  => 'required|integer',
            'correo' => 'required|email|unique:usuarios',
            'contrasena' => 'required|min:6',
        ]);
  
       if ($validator->fails()) {
            return response()->json([
            'errors' => $validator->errors()
            ], 200);
        }
  
        $user = new Usuarios();
        $user->nombres = request()->nombres;
        $user->apellidos = request()->apellidos;
        $user->tipo_documento = request()->tipo_documento;
        $user->num_documento = request()->num_documento;
        $user->telefono = request()->telefono;
        $user->correo = request()->correo;
        $user->id_rol = request()->id_rol;
        $user->direccion = request()->direccion;
        $user->contrasena = bcrypt(request()->contrasena);
        $user->save();
  
        return response()->json($user, 201);
    }
  
  
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {
        // $credentials = request(['correo', 'contrasena']);

        $credentials = [
            'correo'   => request('correo'),
            'password' => request('contrasena'),
        ];
  
        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'No autorizado'], 401);
        }
  
        return $this->respondWithToken($token);
    }
  
    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }
  
    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();
  
        return response()->json(['message' => 'Sesión cerrada correctamente.']);
    }
  
    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }
  
    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}