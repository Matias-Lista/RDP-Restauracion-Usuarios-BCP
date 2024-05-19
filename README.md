# RDP-Restauracion-Usuarios-BCP

Este proyecto fue desarrollado como un paso de un Plan de Contingencia Empresarial (Business Continuity Plan - BCP) Para Servidores de Escritorio Remoto (Remote Desktop Server - RDP). El objetivo principal del BCP es clonar en el menor tiempo posible la estructura necesaria de un Servidor afectado en otro equipo, con la finalidad de que el trabajo se vea interrumpido el menor tiempo posible. Este paso, consiste en la restauración de los usuarios originales.

## Descripción.
Este script automatiza la creación de usuarios y grupos locales en un entorno limpio a partir de archivos .CSV facilitando la recuperación del servicio en situaciones críticas.

## Configuración y Uso.
1. Los tres archivos deben estar en el mismo directorio antes de ejecutar el script de powershell.
2. Ejecute el script de PowerShell:
```powershell
create_users_and_groups.ps1
```

### Ejecución con permisos de administrador.
Es posible que necesite ejecutar PowerShell con permisos de administrador para que el script pueda crear usuarios y grupos. Puede hacerlo haciendo clic derecho en el icono de PowerShell y seleccionando "Ejecutar como administrador".


## Formato del archivo CSV.

### 'usuarios.csv'
Este archivo deberá contener las siguientes columnas.

 - 'USERNAME': El nombre de usuario con el que el usuario accederá al Servidor.
 - 'NOMBRE': El nombre completo del usuario.
 - 'CONTRASENA': La contraseña con la que el usuario accederá al Servidor.
 - 'GRUPOS': Los nombres de los grupos no asignados por defecto que el usuario debe tener. En caso de ser más de un grupo, se separan con guiones (-).

Ejemplo:
```csv
USERNAME,NOMBRE,CONTRASENA,GRUPOS
JuanPerez,Juan Perez,psw1z$KO275,Ventas-Contadores
MariaGonzalez,Maria Gonzalez,Contraseña721,Contadores
PabloGutierrez,PabloGutierrez,j.1z$K\.O275,Administrators
```

### 'Grupos.csv'
Este archivo deberá contener las siguientes columnas:

 - 'NOMBRE': El nombre del grupo a crear.
 - 'DESCRIPCION': Descripción del grupo.

Ejemplo:
```csv
NOMBRE,DESCRIPCION
Ventas,Equipo de Ventas.
Contadores,Equipo de Contadores.
```
