# Oracle Knowledge Base

<div class="grid cards" markdown>

-   :material-database:{ .lg .middle } **Oracle Database**

    ---

    Administración, SQL, performance y troubleshooting.

    [:octicons-arrow-right-24: Ir a sección](02_oracle_database/index.md)


-   :material-server:{ .lg .middle } **Oracle EBS**

    ---

    Oracle E-Business Suite R12.

    Concurrent Programs, APIs, Forms y configuración.

    [:octicons-arrow-right-24: Ir a sección](03_ebs/index.md)


-   :material-file-code:{ .lg .middle } **PL/SQL**

    ---

    Packages, procedimientos, funciones y triggers.

    [:octicons-arrow-right-24: Ir a sección](08_plsql/index.md)


-   :material-linux:{ .lg .middle } **Linux**

    ---

    Administración de servidores Oracle.

    [:octicons-arrow-right-24: Ir a sección](09_linux/index.md)

</div>


---

# Bienvenido

Base de conocimiento técnica para:

- Oracle EBS 12.2
- Oracle Database
- Oracle Forms
- BI Publisher
- SQL
- PL/SQL
- Linux
- SAP


---

# Arquitectura

```mermaid
flowchart LR

USER[Usuario]

WEB[Navegador]

NGINX[Nginx]

MKDOCS[MkDocs]

DOCS[Documentación]

USER --> WEB
WEB --> NGINX
NGINX --> MKDOCS
MKDOCS --> DOCS

```


---

# Estado del proyecto

| Módulo | Estado |
|---|---|
| Plataforma | 🟢 Activa |
| Oracle EBS | 🟢 Activa |
| Forms | 🟡 En construcción |
| BI Publisher | 🟡 En construcción |
| Linux | 🟢 Disponible |