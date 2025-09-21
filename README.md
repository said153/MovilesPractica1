# 📱 Práctica 1 - "Instalación y Funcionamiento de los Entornos Móviles"

## 📌 Descripción
Esta práctica se divide en **dos fases principales**:

### 🔧 Primera fase: Configuracion del entorno
- Instalación de herramientas complementarias: **JDK, Maven, Git, Docker, Node.js y Flutter**.  
- Creación y vinculación de **repositorios en GitHub** para almacenar los proyectos.  

### 🚀 Segunda fase: Implementacion del la aplicacion movil
- Implementación de una **aplicación móvil** que demuestra la gestión de múltiples pantallas usando flutter.  
- Construcción de la app con **navegación entre pantallas (widgets)**, donde cada una representa un componente de la interfaz de usuario.  
👉 Asi observando la **estructura, organizacion y conexion** de los diferentes elementos visuales dentro de una aplicación móvil.

### 🛠️ Primera fase: Configuración del Entorno
- **Java Development Kit (JDK)** → Instalacion de *Amazon Corretto* o algun otro JDK.  
- **Maven** para construcción de proyectos.  
- **Git y GitHub** para control de versiones y repositorios.  
- **Docker** para gestión de bases de datos.  
- **Node.js** como entorno de ejecución de JavaScript.  
- **Flutter** para desarrollo de la aplicación móvil.

### Evidencia
Se observa en la imagen la platilla que te da por defecto al crear un nuevo proyecto con flutter
<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/b53d6207-262b-49f0-8fe8-daf7c608ccc1" />
</p>

### 📲 Segunda fase: Desarrollo de la Aplicación

La aplicación muestra diferentes elementos de **UI**, organizados en pantallas (**widgets**) y por medio de la navegación entre ellas:

- **Pantalla 1:** Campos de texto (**TextField**).  
- **Pantalla 2:** Botones (**Button, Elevated Button, TextButton, OutlineButton, IconButton, FloatingActionButton**).  
- **Pantalla 3:** Elementos de selección (**Checkbox, Radio, Switch**).  
- **Pantalla 4:** Listas (**ListView**).  
- **Pantalla 5:** Elementos de información (**Text, Image, ProgressIndicator**).

### 🧭 Navegación

Se implementó un **menú de navegación** para acceder a cada pantalla (**widget**).

Cada widget incluye:
- 📝 **Un título descriptivo**.  
- 🎨 **Ejemplos visuales funcionando**.  
- 💡 **Una breve explicación de su uso**.  
- ⚡ **Una demostración interactiva**.

### 🖼️ Evidencias 

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/544b57e3-1cbb-48cb-99a2-bb5d61df3fc2" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/3b52e39b-907b-4a38-b983-4f9c6769598f" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/417bc793-07d0-4773-8e9e-b0c7da06cb81" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/bab09efd-709f-4906-974d-ada01107523b" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/430bdffc-dc92-4c67-ae91-7b7cb282e931" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/2ae339da-15df-44b4-956f-c6c521e4a5df" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/099dc234-521f-492b-93f9-2ba22d56e0b7" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/2dddfcb8-7f5d-4063-8392-3f8058951ccc" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/25b764bb-e6f8-4dbd-b091-96046c443b02" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/88ca484c-a155-437a-811a-d6c7554cf395" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/f119c692-b8c8-4a45-82f5-33749e396a5d" />
</p>

<p align="center">
  <img width="360" height="800" alt="image" src="https://github.com/user-attachments/assets/c4388e61-3940-4feb-9c96-9b687f7b5614" />
</p>

### VIDEO DEL FUNCIONAMIENTO 
https://github.com/user-attachments/assets/2d60be96-84dd-4e31-8ee7-058e420f100c

### 🛠️ Instrucciones de uso

1. **Descargar o clonar** el repositorio en Android Studio.  
2. **Abrir el proyecto** en Android Studio y esperar a que termine la sincronización de Gradle.  
3. **Conectar un dispositivo Android** o configurar un emulador.  
4. **Ejecutar la aplicación** haciendo clic en el botón **Run**.  
5. **Explorar la app:** Una vez instalada, se mostrará la **pantalla principal** desde donde puedes acceder a las diferentes pantallas (**widgets**), que incluyen ejemplos de:

   - **Pantalla 1:** Campos de texto (**TextField**), pantalla principañ.  
   - **Pantalla 2:** Botones (**Button, ElevatedButton, TextButton, OutlinedButton, IconButton, FloatingActionButton**).  
   - **Pantalla 3:** Elementos de selección (**Checkbox, Radio, Switch**).  
   - **Pantalla 4:** Listas (**ListView**).  
   - **Pantalla 5:** Elementos de información (**Text, Image, ProgressIndicator**).  

## ⚠️ Dificultades y cómo se resolvieron

Durante el desarrollo de la aplicación se identificaron varios retos:

### 1. Navegación entre pantallas (widgets)
- **Problema:** Al implementar la navegación, algunos botones no dirigían a la pantalla correcta o generaban pantallas duplicadas.  
- **Solución:** Se revisó cuidadosamente la **lógica de rutas** para asegurar que cada botón abriera el widget correspondiente sin duplicaciones.

## 💡 Hallazgos

- Manejar correctamente los **los widgets** es clave para mantener una experiencia de usuario fluida.

