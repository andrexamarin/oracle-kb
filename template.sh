for file in $(find docs/03_ebs -name "*.md"); do
    title=$(basename "$file" .md | tr '_' ' ' | sed 's/\b\(.\)/\u\1/g')

    cat > "$file" <<EOF
# $title

## Objetivo

> Pendiente de documentar.

---

## Introducción

---

## Arquitectura

\`\`\`mermaid
flowchart TD
A[Inicio] --> B[Proceso]
B --> C[Fin]
\`\`\`

---

## Configuración

---

## Ejemplo

---

## Scripts

\`\`\`sql
-- Pendiente
\`\`\`

---

## Troubleshooting

| Error | Solución |
|--------|----------|
| Pendiente | Pendiente |

---

## Referencias

EOF
done
