# Design — Finzi AI site

Version 1 · documented 2026-11-04 · source of truth: `assets/style.css`

## World

Locked brand blues on white with slate ink; soft rounded panels; geometric-sans stack (Segoe UI first, per the brand document); one authored motion moment (the hero fields check-in). Code-led build; no rasters on the page — the product demo panel is real HTML/CSS so people and AI agents read the same text.

## Color tokens

| Token | Value | Use |
|---|---|---|
| `--blue-900` | `#1E3A8A` | Hover ink on light surfaces, button-on-blue text |
| `--blue-800` | `#1E40AF` | Primary action, wordmark, table heads, panel hero gradients |
| `--blue-700` | `#1D4ED8` | Links, emphasis text |
| `--blue-600` | `#2563EB` | Gradient end on panels |
| `--blue-500` | `#3B82F6` | The “ai” in the wordmark, small accents |
| `--blue-300` | `#93C5FD` | Footer accents, focus ring |
| `--blue-200` | `#BFDBFE` | Ghost-button border, scrollbars |
| `--blue-100` | `#DBEAFE` | Text selection |
| `--blue-50` | `#EFF6FF` | Tinted panels, chips, callouts |
| `--ink` | `#1E293B` | Body ink |
| `--ink-soft` | `#475569` | Secondary text (≥4.5:1 on white and blue-50) |
| `--ink-mute` | `#64748B` | Meta text on white only |
| `--line` / `--line-soft` | `#E2E8F0` / `#EEF2F7` | Borders and row separators |
| footer ground | `#0F1F4B` | Site footer |

No green. No black backgrounds (brand rule). Secondary text on blue surfaces is tinted from the blue hue (`--blue-50`), never gray.

## Type

- Family: `"Segoe UI", -apple-system, BlinkMacSystemFont, "Helvetica Neue", Arial, sans-serif` — brand-pinned, no webfonts (zero render-blocking).
- Hero h1 `2.35rem`, `3.3rem` from 760px up. Page h1 `2.2rem` → `2.6rem`. Headings weight 800, `letter-spacing: normal`, balanced wrapping.
- Body `1.0625rem` / 1.65; measure `68ch`; weights 400/600/700/800 only.

## Space, shape, depth

- Section rhythm: half of `clamp(3.5rem, 8vw, 6.5rem)` above/below; wrap `1120px`.
- Radii: 10 / 14 / 18px (+6px on full-bleed bands). Borders: 1px `--line`.
- Shadows are neutral slate, never colored: soft `8px` blur (bordered components), card `14px` (wordmark buttons, bill card), lift `48px` (borderless panels only: demo, CTA band).

## Components

Buttons (primary / ghost / on-blue), hero demo panel (bill card → read-fields card → saved-to-ledger row), numbered step sequence, feature rows (side icon, never icon-tile-above), split audience cards, security panel (checklist, no icon tile), FAQ accordion (`<details>`, CSS-drawn +/× marker), comparison table (scroll wrapper, padded), CTA band, 404, breadcrumbs, prose blocks.

## Motion

One authored moment: the hero fields check-in — `panel-rise` (620ms), sequential `check-pop` per row (480–1280ms), `ledger-in` (1500ms). All inside `prefers-reduced-motion: no-preference`. Hover transitions 140–180ms exponential ease-out. No bounce or elastic easing. No scroll-jacking.

## Browser surfaces

Text selection blue-100; caret blue-800; scrollbars blue-200 with paper inset; focus ring = 3px paper + 3px blue-300 double ring; prose links underlined 2px blue-300 at 3px offset; compare table hover tinted blue-50.

## Accessibility

Contrast at AA (detector-verified clean); skip link; one h1 per page; `<main>`/`<nav>`/`<figure>` landmarks; `aria-current` on nav; decorative SVGs `aria-hidden`; native `<details>` keyboard behavior; targets ≥44px for primary actions.
