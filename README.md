# Liturgia Colors

[![NPM Publish](https://github.com/unicolored/liturgia-colors/actions/workflows/publish.yml/badge.svg)](https://github.com/unicolored/liturgia-colors/actions/workflows/publish.yml)
[![Documentation](https://github.com/unicolored/liturgia-colors/actions/workflows/mkdocs.yml/badge.svg)](https://github.com/unicolored/liturgia-colors/actions/workflows/mkdocs.yml)
[![npm version](https://badge.fury.io/js/liturgia-colors.svg)](https://www.npmjs.com/package/liturgia-colors)

A CSS theme inspired by the liturgical colours of the Roman Church. From the radiant white of Easter joy to the solemn red of martyrs' blood, Liturgia Colors brings sacred tradition to modern web design.

- **Standalone:** `liturgia.css`, plain CSS custom properties, modes and tokens.
- **Tailwind:** `liturgia.tailwind.css`, the same theme as Tailwind v4 theme variables, plus typography (`.prose`).

Documentation: [unicolored.github.io/liturgia-colors](https://unicolored.github.io/liturgia-colors/) · Reference: [SPEC.md](SPEC.md)

## Installation

### npm

```bash
npm install liturgia-colors
```

In your CSS:

```css
/* styles.css */
@import 'liturgia-colors/dist/liturgia.css';
@import './custom.css'; /* your overrides */
```

### CDN

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/liturgia-colors/dist/liturgia.css">
```

The theme uses the fonts Cinzel and EB Garamond by default. Load them yourself:

```html
<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=EB+Garamond&display=swap" rel="stylesheet">
```

### Tailwind CSS v4

```css
/* app.css */
@import 'tailwindcss';
@import 'liturgia-colors/dist/liturgia.tailwind.css';
```

The Tailwind build provides theme variables and `.prose` typography. It does not generate utility classes, so use the variables in arbitrary values, for example `bg-(--color-main)` (Tailwind 4.1+).

## Usage

Apply one mode class to `<body>` or to a container. Albus is the default and needs no class.

| Class | Mode | Meaning |
|---|---|---|
| `.albus-mode` | Albus (White) | Purity, joy |
| `.roseus-mode` | Roseus (Rose) | Gentle joy |
| `.ruber-mode` | Ruber (Red) | Blood of martyrs, passion |
| `.tenebrae-mode` | Tenebrae (Black) | Mourning, remembrance |
| `.violaceus-mode` | Violaceus (Violet) | Penance, preparation |
| `.viridis-mode` | Viridis (Green) | Hope, growth |

```html
<body class="ruber-mode">
  <div class="prose">
    <h1>Love these colours!</h1>
    <p>Thanks be to God!</p>
  </div>
</body>
```

Use the semantic tokens (`--color-light`, `--color-dark`, `--color-main`, `--color-gray`, `--color-text`, `--color-text-invert`) in your own styles, so your UI follows the active mode.

## Customization

Override the design and font tokens on `:root`:

```html
<link href="https://fonts.googleapis.com/css2?family=Roboto&family=Open+Sans&display=swap" rel="stylesheet">
<style>
  :root {
    --font-family-heading: "Roboto", sans-serif;
    --font-family-paragraph: "Open Sans", sans-serif;
  }
</style>
```

The full list of tokens is in [SPEC.md](SPEC.md#4-tokens).

## Development

Requirements: Node.js, pnpm, and [mise](https://mise.jdx.dev). The repository pins the pnpm version in `package.json` (`packageManager`), so Corepack (`corepack enable`) selects it automatically.

```bash
pnpm install
mise run build         # dist/liturgia.css
mise run build:tailwind # dist/liturgia.tailwind.css
mise run check         # Prettier check on src/
mise run cibuild       # build both files and verify them
mise run test          # check + cibuild
mise run docs          # serve the documentation locally (requires mkdocs)
mise tasks             # list all tasks
```

Palette values live in `src/liturgia-colors.css`. Do not redefine them in `src/tailwind/`; the Tailwind theme files reference them.

## License

MIT. See [LICENSE](LICENSE).
