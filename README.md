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
