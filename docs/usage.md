# Usage

Apply one mode class to your `<body>` or to a container. Albus is the default and needs no class.

* `.albus-mode` (default): White, purity, joy
* `.roseus-mode`: Rose, gentle joy
* `.ruber-mode`: Red, martyrdom, passion
* `.tenebrae-mode`: Black, mourning
* `.violaceus-mode`: Violet, penance
* `.viridis-mode`: Green, hope, growth

Example:

```html
<body class="ruber-mode">
  <div class="prose">
    <h1>Love these colours!</h1>
    <p>Thanks be to God!</p>
  </div>
</body>
```

## Semantic tokens

Use these in your own styles so that your UI follows the active mode:

| Token | Purpose |
|---|---|
| `--color-light` | Background |
| `--color-dark` | Strong surface, link hover |
| `--color-main` | Accent surface |
| `--color-gray` | Borders, muted elements |
| `--color-text` | Body text on `--color-light` |
| `--color-text-invert` | Text on `--color-main` |

```css
.notice {
  background: var(--color-main);
  color: var(--color-text-invert);
  border: var(--line-width-default) solid var(--color-gray);
  border-radius: var(--radius-default);
  padding: var(--spacing-md);
}
```

## Customization

Override the font and design tokens on `:root`. The example uses Google Fonts:

```html
<link href="https://fonts.googleapis.com/css2?family=Roboto&family=Open+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/liturgia-colors/dist/liturgia.css">
<style>
  :root {
    --font-family-heading: "Roboto", sans-serif;
    --font-family-paragraph: "Open Sans", sans-serif;
  }
</style>
```

The full list of tokens is in the [specification](https://github.com/unicolored/liturgia-colors/blob/main/SPEC.md#4-tokens).
