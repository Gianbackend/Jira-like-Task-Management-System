# Jira-like Task Management System

Sistema de gestión de tareas inspirado en Jira, desarrollado con Spring Boot.  
El proyecto implementa una arquitectura modular y utiliza PostgreSQL como base de datos principal.

## API REST

La documentación de la API está disponible localmente en:

[http://localhost:8080/doc](http://localhost:8080/doc)

---

## Conceptos principales

Este proyecto utiliza **Spring Modulith** para organizar la aplicación en módulos lógicos, manteniendo una estructura clara y escalable.

Referencias útiles:

- [Introduction to Spring Modulith](https://www.baeldung.com/spring-modulith)
- [Introducing Spring Modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)
- [Spring Modulith - Reference documentation](https://docs.spring.io/spring-modulith/docs/current-SNAPSHOT/reference/html/)

---

## Configuración mediante variables de entorno

Las credenciales sensibles no se almacenan directamente en los archivos de configuración.  
La conexión a la base de datos y otros servicios externos se gestionan mediante variables de entorno.

### Configuración de base de datos

Ejemplo de configuración:

```yaml
spring:
  datasource:
    url: ${DB_URL:jdbc:postgresql://localhost:5432/jira}
    username: ${DB_USERNAME:your_db_user}
    password: ${DB_PASSWORD}
Variables requeridas para ejecución local

    $env:DB_URL="jdbc:postgresql://localhost:5432/jira"
    $env:DB_USERNAME="jira"
    $env:DB_PASSWORD="tu_password"
    
Luego, ejecutar la aplicación:
    mvn spring-boot:run

Configuración para tests
Para ejecutar las pruebas automatizadas, se pueden definir variables específicas para el entorno de test:

    $env:TEST_DB_URL="jdbc:postgresql://localhost:5433/jira-test"
    $env:TEST_DB_USERNAME="jira"
    $env:TEST_DB_PASSWORD="tu_password_test"

Ejecutar tests:
    mvn test

Resultado validado:
    Tests run: 142, Failures: 0, Errors: 0, Skipped: 0
    BUILD SUCCESS

Modelo de datos

Existen dos tablas principales que no utilizan claves foráneas físicas:

Reference: tabla de referencia o directorio.

Las relaciones deben realizarse mediante el campo code, ya que no está permitido usar id debido a que puede variar entre entornos.

UserBelong: tabla utilizada para vincular usuarios con un tipo de relación, por ejemplo owner, lead, entre otros, hacia objetos como tareas, proyectos o sprints.

La validación de estas relaciones se realiza manualmente desde la lógica de la aplicación.

Referencias y proyectos similares
Open Source Issue Trackers
Recursos de testing
Testing tutorial
Tareas completadas
Eliminación de la integración con Facebook OAuth.
Externalización de credenciales sensibles mediante variables de entorno.
Actualización de configuración local, test y producción.
Eliminación de credenciales hardcodeadas en archivos de configuración y documentación.
Validación del proyecto mediante ejecución exitosa de tests.
Resultado final de pruebas: 142 tests passed.
