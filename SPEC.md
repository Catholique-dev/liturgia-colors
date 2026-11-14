# Liturgia Colors — Specification

This document defines the public contract of `liturgia-colors`: what it ships, the modes and tokens consumers can rely on, and how the builds relate. The README is the quick start; this file is the reference.

## 1. Scope

`liturgia-colors` is a CSS-only theme. It provides:

- six liturgical colour modes, each a set of CSS custom properties;
- a set of design tokens (radius, sizes, spacing, font sizes, opacity, rotation, line width) and font tokens;
- a Tailwind CSS v4 build that exposes the same palette as theme variables and provides typography styles.

It does not ship components, JavaScript, or Tailwind utility classes.

## 2. Deliverables

| File (after `pnpm build` / `pnpm build:tailwind`) | Source | Contents |
|---|---|---|
| `dist/liturgia.css` | `src/liturgia-colors.css` | Palettes, mode classes, semantic tokens, design tokens, font tokens. Plain CSS. |
| `dist/liturgia.tailwind.css` | `src/tailwind/main.css` | Everything in `liturgia.css`, plus `--color-<mode>-*` theme variables and `.prose` typography. No utility classes. |

Both files are published in the npm package `liturgia-colors` (the `dist/` and `src/` directories are included).

## 3. Modes

A mode is a CSS class that sets the semantic colour tokens (section 4.2). Modes do not nest and are not combined; apply exactly one.

| Class | Name | Meaning | Typical liturgical use |
|---|---|---|---|
| `.albus-mode` | Albus (White) | Purity, joy | Easter and Christmas seasons, feasts of the Lord, Mary and the saints |
| `.roseus-mode` | Roseus (Rose) | Gentle joy | Gaudete (Advent III) and Laetare (Lent IV) |
| `.ruber-mode` | Ruber (Red) | Blood of martyrs, passion | Passion and Palm Sunday, Pentecost, martyrs |
| `.tenebrae-mode` | Tenebrae (Black) | Mourning, remembrance | Masses for the dead and funerals, where black is used |
| `.violaceus-mode` | Violaceus (Violet) | Penance, preparation | Advent, Lent, penitential rites |
| `.viridis-mode` | Viridis (Green) | Hope, growth | Ordinary Time |

Default: Albus. The `:root` element and `.albus-mode` both carry the Albus values, so the theme applies without a class.

## 4. Tokens

All tokens are CSS custom properties. Names are part of the public contract (section 8).

### 4.1 Palette tokens

Each mode has four base colours, declared on `:root`:

| Token | Meaning |
|---|---|
| `--<mode>-light` | Light background |
| `--<mode>-dark` | Dark background or strong text |
| `--<mode>-main` | Accent colour |
| `--<mode>-gray` | Neutral / borders |

`<mode>` is one of `albus`, `roseus`, `ruber`, `tenebrae`, `violaceus`, `viridis`.

### 4.2 Semantic tokens

Set by the mode class. Use these in your own styles so that switching mode re-themes your UI.

| Token | Albus value | Purpose |
|---|---|---|
| `--color-light` | `--albus-light` | Background |
| `--color-dark` | `--albus-dark` | Strong surface / link hover |
| `--color-main` | `--albus-main` | Accent surface |
| `--color-gray` | `--albus-gray` | Borders, muted elements |
| `--color-text` | `--albus-dark` | Body text on `--color-light` |
| `--color-text-invert` | `--albus-light` | Text on `--color-main` |

For other modes, each semantic token points to the matching palette token of that mode (for example `.ruber-mode` sets `--color-main: var(--ruber-main)`).

### 4.3 Design tokens

Mode-independent. Defined on `:root`.

| Token | Value |
|---|---|
| `--radius-default` | `4px` |
| `--size-sm` / `--size-md` / `--size-lg` | `24px` / `48px` / `72px` |
| `--opacity-low` / `--opacity-medium` / `--opacity-high` | `0.3` / `0.6` / `0.9` |
| `--rotate-default` | `45deg` |
| `--font-size-xs` / `-sm` / `-md` / `-lg` | `0.75rem` / `1rem` / `1.5rem` / `2rem` |
| `--spacing-xs` / `-sm` / `-md` / `-lg` | `0.25rem` / `0.5rem` / `1rem` / `2rem` |
| `--line-width-default` | `2px` |

### 4.4 Font tokens

| Token | Default |
|---|---|
| `--font-family-heading` | `"Cinzel", serif` |
| `--font-family-paragraph` | `"EB Garamond", serif` |

The defaults assume the fonts are loaded by the consumer (for example from Google Fonts). The package does not load fonts.

## 5. Tailwind build

`dist/liturgia.tailwind.css` is built from `src/tailwind/main.css`, which:

1. imports `src/liturgia-colors.css`, so the Tailwind build has the same palette, mode classes and tokens as the standalone build;
2. declares per-mode theme variables in `src/tailwind/_<mode>-theme.css`;
3. imports `src/tailwind/typography.css` and emits the `prose` class.

Rules:

- **Single source of truth.** Base colours are defined only in `src/liturgia-colors.css`. The Tailwind theme files reference them with `var()`; they must not redefine them.
- **Theme variables** follow `--color-<mode>-<name>`: `-light`, `-dark`, `-gray`, `-main`, and the shade scale `-50` to `-950`.
- **No utilities.** Tailwind utility classes are not generated. To use a token in Tailwind 4.1+, write `bg-(--color-main)` or `text-(--color-text)`.
- **Typography.** `.prose` uses the semantic tokens for its colours, so it follows the active mode.

## 6. Palette status

| Item | Status |
|---|---|
| Base palette values (section 4.1) | Confirmed by the maintainer. Values are final for this version. |
| Shade scales `-50` to `-950` for Albus | Unchanged from the previous Tailwind build. Not separately reviewed. |
| Shade scales for the other five modes (Tailwind build only) | Provisional. Not yet reviewed. |
| `--<mode>-gray` for Roseus, Tenebrae, Violaceus, Viridis | `#888`, the current value. |

## 7. Accessibility

- Target: WCAG 2.2 AA contrast (4.5:1 for body text) between `--color-text` and `--color-light`, and between `--color-text-invert` and `--color-main`.
- Status: not yet verified for every mode. Consumers who need guaranteed contrast should check the modes they use.

## 8. Compatibility and versioning

- **Browsers.** Any browser with CSS custom properties. The Tailwind build's shade scales use `oklch()`, so it needs a browser that supports `oklch` (Chrome 111+, Safari 15.4+, Firefox 113+).
- **Versioning.** Semantic versioning.
  - **Major:** renaming or removing a mode, a token, or a class; changing a token's meaning.
  - **Minor:** adding a mode, token, or class.
  - **Patch:** changing a colour value or fixing a build issue. Colour changes are visual changes and are listed in the release notes.

## 9. Build and verification

- `pnpm build` and `pnpm build:tailwind` produce the files in section 2.
- `sh script/check-build.sh` (run by `script/cibuild.sh`) fails if a mode class, a `--color-<mode>-main` token, or `.prose` is missing from either build.
- `pnpm check` runs Prettier over `src/`.
