package com.mycompany.project1_bd2;

public class Queries {
    
    // Queries para insertar
    public static final String CLIENTE_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_cliente(?, ?, ?, ?) }";
    public static final String AUTOR_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_autor(?, ?, ?) }";
    public static final String EDITORIAL_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_editorial(?, ?) }";
    public static final String GENERO_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_genero(?) }";
    public static final String LIBRO_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_libro(?, ?, ?, ?, ?, ?, ?) }";
    public static final String PRESTAMO_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_prestamo(?, ?, ?, ?)}";
    public static final String RESENA_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_resena(?, ?, ?, ?) }";
    public static final String EMPLEADO_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_empleado(?, ?) }";
    public static final String USUARIO_INSERTAR_FUNC_CALL = "{ ? = call paquete_modificaciones_p1.insertar_usuario(?, ?, ?) }";
    
    // Queries para hacer update
    public static final String CLIENTE_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_cliente(?, ?, ?, ?, ?) }";
    public static final String AUTOR_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_autor(?, ?, ?, ?) }";
    public static final String EDITORIAL_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_editorial(?, ?, ?) }";
    public static final String GENERO_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_genero(?, ?) }";
    public static final String LIBRO_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_libro(?, ?, ?, ?, ?, ?, ?, ?) }";
    public static final String PRESTAMO_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_prestamo(?, ?, ?, ?, ?)}";
    public static final String RESENA_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_resena(?, ?, ?, ?, ?) }";
    public static final String EMPLEADO_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_empleado(?, ?, ?) }";
    public static final String USUARIO_MODIFICAR_PROC_CALL = "{ call paquete_modificaciones_p1.modificar_usuario(?, ?, ?, ?) }";
    public static final String BITACORA_USUARIO_MODIFICAR_PROC_CALL = "{ call paquete_modificacciones_p1.modificar_usuario_bitacora(?) }";
    
    // Queries para borrar
    public static final String CLIENTE_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_cliente(?) }";
    public static final String AUTOR_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_autor(?) }";
    public static final String EDITORIAL_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_editorial(?) }";
    public static final String GENERO_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_genero(?) }";
    public static final String LIBRO_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_libro(?) }";
    public static final String PRESTAMO_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_prestamo(?)}";
    public static final String RESENA_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_resena(?) }";
    public static final String EMPLEADO_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_empleado(?) }";
    public static final String USUARIO_BORRAR_PROC_CALL = "{ call paquete_modificaciones_p1.borrar_usuario(?) }";
    
    // Queries para mostrar registros
    public static final String MOSTRAR_CLIENTES_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_clientes(?) }";
    public static final String MOSTRAR_CLIENTE_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_cliente_id(?, ?) }";
    public static final String MOSTRAR_AUTORES_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_autores(?) }";
    public static final String MOSTRAR_AUTOR_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_autor_id (?, ?)}";
    public static final String MOSTRAR_EDITORIALES_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_editoriales(?) }";
    public static final String MOSTRAR_EDITORIAL_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_editorial_id (?, ?) }";
    public static final String MOSTRAR_GENEROS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_generos(?) }";
    public static final String MOSTRAR_GENERO_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_genero_id (?, ?) }";
    public static final String MOSTRAR_LIBROS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_libros(?) }";
    public static final String MOSTRAR_LIBRO_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_libro_id (?, ?) }";
    public static final String MOSTRAR_RESENAS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_resena(?) }";
    public static final String MOSTRAR_RESENA_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_resena_id (?, ?) }";
    public static final String MOSTRAR_PRESTAMOS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_prestamos(?) }";
    public static final String MOSTRAR_PRESTAMO_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_prestamos_id (?, ?)}";
    public static final String MOSTRAR_N_BITACORAS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_ultimas_nbitacoras(?, ?) }";
    public static final String MOSTRAR_BITACORAS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_bitacoras(?) }";
    public static final String MOSTRAR_USUARIOS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_usuarios(?) }";
    public static final String MOSTRAR_USUARIO_NOMBRE_PROC_CALL = "{ call paquete_consultas_p1.mostrar_usuario_nombre(?, ?) }";
    public static final String MOSTRAR_EMPLEAADOS_PROC_CALL = "{ call paquete_consultas_p1.mostrar_todos_empleados(?) }";
    public static final String MOSTRAR_EMPLEADOS_ID_PROC_CALL = "{ call paquete_consultas_p1.mostrar_empleados_id (?, ?) }";
    public static final String MOSTRAR_GENERO_POPULAR_PROC_CALL = "{ call paquete_consultas_p1.mostrar_genero_popular(?) }";
    public static final String MOSTRAR_EDITORIAL_ORIGEN_POPULAR_PROC_CALL = "{ call paquete_consultas_p1.mostrar_origen_popular(?) }";
    
    public static final String VALIDAR_USUARIO = "{ call paquete_consultas_p1.mostrar_usuario_contrasena(?, ?, ?) }";
    
    public static final String CONTAR_PRESTAMOS_CLIENTE_ID = "{ ? = call paquete_consultas_p1.contar_libros_prestados(?) }";

    public static final String VALIDAR_CLIENTE_PRESTAMO = "{ ? = call paquete_consultas_p1.verificar_cliente_prestamo(?) }";
    public static final String VALIDAR_CLIENTE_RESENA = "{ ? = call paquete_consultas_p1.verificar_cliente_resena(?) }";
    public static final String VALIDAR_LIBRO_PRESTAMO = "{ ? = call paquete_consultas_p1.verificar_libro_prestamo(?) }";
    public static final String VALIDAR_LIBRO_RESENA = "{ ? = call paquete_consultas_p1.verificar_libro_resena(?) }";


}

    