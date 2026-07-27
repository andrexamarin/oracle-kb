# Oracle E-Business Suite APIs

> Catálogo de las principales APIs disponibles en Oracle E-Business Suite R12.2 para desarrollo, personalización e integración.

---

## Objetivo

Esta guía reúne las APIs más utilizadas en Oracle EBS y proporciona ejemplos básicos de uso.

---

## ¿Qué es una API en Oracle EBS?

Una API (Application Programming Interface) es un procedimiento o paquete PL/SQL proporcionado por Oracle que permite realizar operaciones de forma soportada, respetando las reglas de negocio de la aplicación.

!!! warning "Evita insertar directamente en tablas base"

    Siempre que Oracle proporcione una API pública, es recomendable utilizarla en lugar de realizar INSERT, UPDATE o DELETE directamente sobre las tablas.

---

# Clasificación

| Módulo | Descripción |
|---------|-------------|
| FND | Foundation |
| XDO | XML Publisher |
| MO | Multi Org |
| FND_GLOBAL | Contexto de sesión |
| FND_FILE | Escritura en Log y Output |
| FND_REQUEST | Envío de Concurrent Requests |
| FND_PROGRAM | Administración de Concurrent Programs |
| FND_PROFILE | Lectura de perfiles |
| FND_MESSAGE | Manejo de mensajes |
| FND_USER_PKG | Administración de usuarios |
| HR | Recursos Humanos |
| INV | Inventarios |
| PO | Compras |
| OE | Order Management |
| AR | Accounts Receivable |
| AP | Accounts Payable |

---

# FND_GLOBAL

Inicializa el contexto de Oracle EBS.

## Uso

```plsql
BEGIN

    FND_GLOBAL.APPS_INITIALIZE
    (
        user_id      => 1010,
        resp_id      => 20417,
        resp_appl_id => 201
    );

END;
/
```

---

# FND_PROFILE

Obtiene el valor de un Profile Option.

```plsql
DECLARE

    l_org_id NUMBER;

BEGIN

    l_org_id :=
        FND_PROFILE.VALUE('ORG_ID');

END;
/
```

---

# FND_FILE

Escribe información en el Log y Output del Concurrent Program.

```plsql
FND_FILE.PUT_LINE
(
    FND_FILE.LOG,
    'Proceso iniciado'
);
```

Salida al Output:

```plsql
FND_FILE.PUT_LINE
(
    FND_FILE.OUTPUT,
    'Reporte generado correctamente'
);
```

---

# FND_REQUEST

Permite ejecutar programas concurrentes desde PL/SQL.

```plsql
DECLARE

    l_request_id NUMBER;

BEGIN

    l_request_id :=
        FND_REQUEST.SUBMIT_REQUEST
        (
            application => 'XXCUS',
            program     => 'XX_REPORT',
            description => NULL,
            start_time  => NULL,
            sub_request => FALSE
        );

    COMMIT;

END;
/
```

---

# FND_PROGRAM

Administra Concurrent Programs.

## Registrar

```plsql
FND_PROGRAM.REGISTER(...)
```

## Eliminar

```plsql
FND_PROGRAM.DELETE_PROGRAM(...)
```

## Eliminar Executable

```plsql
FND_PROGRAM.DELETE_EXECUTABLE(...)
```

---

# FND_MESSAGE

Obtiene mensajes definidos en Oracle EBS.

```plsql
FND_MESSAGE.SET_NAME
(
    'FND',
    'FORM_RECORD_DELETED'
);

FND_MESSAGE.ERROR;
```

---

# XDO APIs

Utilizadas por XML Publisher.

## Data Definitions

- XDO_DS_DEFINITIONS_B
- XDO_TEMPLATES_B
- XDO_LOBS

---

# DBMS_XMLGEN

Generación de XML desde SQL.

```plsql
ctx := DBMS_XMLGEN.NEWCONTEXT
(
'SELECT * FROM HZ_PARTIES'
);

xml := DBMS_XMLGEN.GETXML(ctx);

DBMS_XMLGEN.CLOSECONTEXT(ctx);
```

---

# MO_GLOBAL

Inicializa el contexto Multi-Org.

```plsql
MO_GLOBAL.INIT('AR');
```

---

# FND_DOCUMENTS_PKG

Administración de documentos.

---

# FND_WEBFILE

Manejo de archivos.

---

# APIs útiles para XML Publisher

| API | Uso |
|------|-----|
| DBMS_XMLGEN | Generar XML |
| FND_FILE | Log |
| XDO APIs | Templates |
| FND_REQUEST | Ejecutar reportes |

---

# APIs utilizadas en esta documentación

| API | Laboratorio |
|------|-------------|
| FND_PROGRAM | Registro Concurrent Program |
| DBMS_XMLGEN | XML Publisher |
| FND_FILE | Logging |
| FND_PROFILE | Obtener ORG_ID |
| FND_GLOBAL | Inicializar sesión |
| FND_REQUEST | Ejecutar Request |

---

# Buenas prácticas

!!! tip

    - Inicializar siempre el contexto con `FND_GLOBAL.APPS_INITIALIZE` cuando ejecutes APIs fuera de Oracle Forms o de un Concurrent Program.
    - Utilizar `FND_FILE` para registrar mensajes de diagnóstico.
    - Realizar `COMMIT` únicamente cuando la API lo requiera.
    - Revisar la documentación oficial para verificar si una API es pública y soportada.
    - Capturar excepciones y registrar el error con suficiente contexto.

---

# Referencias

- Oracle E-Business Suite Developer's Guide
- Oracle EBS API Reference
- Oracle XML Publisher Developer's Guide