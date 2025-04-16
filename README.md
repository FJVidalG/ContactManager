# Contact Manager 📇 - Agenda Personal en Flutter

[![Estado](https://img.shields.io/badge/Estado-🚧_En_Desarrollo-orange)](https://github.com/tu-usuario/contact_manager)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Licencia](https://img.shields.io/badge/Licencia-MIT-yellow)](https://opensource.org/licenses/MIT)

Aplicación de agenda personal desarrollada en Flutter. Permite almacenar y visualizar información de contactos incluyendo etiquetas, favoritos, cumpleaños y más. **En desarrollo activo**.

---

## 🔧 Tecnologías y Arquitectura

| Componente           | Tecnología/Librería            | Función                                                       |
|----------------------|-------------------------------|---------------------------------------------------------------|
| Lenguaje principal   | **Dart**                      | Lógica de aplicación                                           |
| Framework UI         | **Flutter 3.6.1**             | Interfaz gráfica multiplataforma                              |
| Estado global        | **Provider + ChangeNotifier** | Gestión reactiva de datos                                     |
| Estilo y diseño      | **Material 3**                | Estética moderna y adaptable                                  |
| Utilidades extra     | `intl`, `diacritic`, `font_awesome_flutter` | Fechas localizadas, ordenación sin tildes, iconos personalizados |

---

## 📂 Estructura

```text
lib/
├── models/            # Clases ContactData, AgendaData, etc.
├── pages/             # Pantallas: contactos, detalles, formularios
├── utils/             # Funciones auxiliares
├── widgets/           # Componentes compartidos y personalizables
└── main.dart          # Entrada principal de la aplicación
```

---

## 📌 Características Actuales

| Módulo           | Estado                                                        |
|------------------|---------------------------------------------------------------|
| **Contactos**    | Acceso a la información de contacto                   |
| **Etiquetas**    | Personalizadas por contacto                   |
| **Favoritos**    | Pestaña de favoritos                          |
| **Ordenación**   | Alfabética ascendente / Descendente sin tildes|
| **Visualización**| Cálculo de edad y fechas de modificación      |

---

## 🚧 Roadmap (Próximos Pasos)

1. **Creación y edición completa de contactos**
2. **Persistencia local**
   - Implementar `shared_preferences` o `sqflite`
3. **Integración con Firebase**
   - Autenticación y almacenamiento remoto
4. **Exportación/Importación**
   - Soporte para respaldo y restauración de contactos
5. **Filtros y Búsqueda**
   - Por nombre, etiquetas y favoritos
6. **Responsividad**
   - Adaptación a tablets y pantallas grandes

---

## 🖼️ Capturas de Pantalla

| Lista de contactos | Detalles de contacto |
|--------------------|----------------------|
| ![Lista](url_img)  | ![Detalles](url_img) |

---

## 📱 Compatibilidad y Requisitos

| Característica             | Detalle                                                 |
|----------------------------|----------------------------------------------------------|
| **Flutter SDK**            | 3.6.1                                                   |
| **Plataformas**            | Android, iOS, Web (parcial)                             |
| **Dispositivos**           | Teléfonos y tablets                                     |
| **RAM mínima recomendada** | 2 GB                                                    |

---

## 👤 Autor

**Francisco Jesús Vidal García**  
[![Email](https://img.shields.io/badge/📧_Email-fjvidalgarcia%40gmail.com-%23007EC6?style=flat&logo=gmail&logoColor=white)](mailto:fjvidalgarcia@gmail.com)  
[![LinkedIn](https://img.shields.io/badge/🔗_LinkedIn-Francisco_Vidal-%230A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/francisco-jes%C3%BAs-vidal-garc%C3%ADa-174189336/)