# Installation

## npm

```bash
npm install liturgia-colors
```

In your CSS:

```css
/* styles.css */
@import 'liturgia-colors/dist/liturgia.css';
@import './custom.css'; /* your overrides */
```

## CDN

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/liturgia-colors/dist/liturgia.css">
```

The theme uses Cinzel and EB Garamond by default. Load them yourself:

```html
<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=EB+Garamond&display=swap" rel="stylesheet">
```

## Tailwind CSS v4

```css
/* app.css */
@import 'tailwindcss';
@import 'liturgia-colors/dist/liturgia.tailwind.css';
```

The Tailwind build provides the palette as theme variables (`--color-<mode>-<name>`) and the `.prose` typography class. It does not generate utility classes. Use the variables in arbitrary values, for example `bg-(--color-main)` (Tailwind 4.1+).
