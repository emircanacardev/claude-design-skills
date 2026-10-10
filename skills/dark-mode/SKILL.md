---
name: dark-mode
description: Designs proper dark themes with near-black rather than pure black surfaces, elevation through lighter surfaces, desaturated and lightened brand colors, re-verified contrast, semantic token swaps, prefers-color-scheme support with a flash-free manual toggle, and handling for images, illustrations, charts and shadows. Use when asked to add dark mode, a dark theme or a theme switcher, or to fix a dark UI that looks harsh or muddy. Not for building base palettes; use color-system.
---

# Dark Mode

Produces a dark theme that is designed rather than inverted: a surface ladder that expresses elevation, accents tuned for dark backgrounds, verified contrast on every surface, and theme switching that respects the system setting without flashing the wrong theme on load.

## When to use
- "Add dark mode" or "add a light/dark toggle"
- An existing dark UI feels harsh, muddy or low-contrast
- Brand colors vibrate or glow on dark backgrounds
- Dark-mode users see a white flash on page load
- Logos, images or charts look wrong on dark surfaces

## Workflow
1. Gather: current palette and tokens, framework, and whether a manual toggle is needed. Default: follow the system setting, plus a Light / Dark / System control.
2. Confirm colors are semantic tokens (design-tokens). If components use raw hex values, tokenize first; dark mode should be a semantic swap.
3. Build the surface ladder: background, surface, raised, overlay.
4. Map text and border roles, then tune accent and semantic colors for dark.
5. Measure contrast for every text and UI pair on every surface level; adjust steps until all pass.
6. Handle media: logos, photos, illustrations, charts, shadows.
7. Implement switching: media query default, data-theme override, inline head script, persisted choice, color-scheme.
8. Test both themes across hover, focus, disabled, selected, error and empty states, and on a phone at low brightness.

## Rules
**Surfaces**
- Base background in the #0f0f0f–#121212 range, or a hue-tinted equivalent such as oklch(0.18 0.01 H) with H the brand hue. Avoid #000: halation around light text is harsher and OLED screens smear when scrolling.
- Elevation is shown by lightness, not shadow: each level a few percent lighter, e.g. #121212 → #1c1c1c → #242424 → #2c2c2c.
- Separate same-level surfaces with 1px borders at white 8–12% opacity; shadows barely read on dark.

**Text**
- Primary text off-white (about #e8e8e8, ~15:1 on #121212); secondary about white at 60–70% (≥4.5:1 on every surface); disabled about 38%.
- Check contrast against the lightest surface the text sits on, not only the base background.

**Color**
- Move accents from the light-mode 600 step to roughly 300–400 and cut OKLCH chroma 10–30% so they reach 4.5:1 as text without vibrating.
- Text on accent buttons is often dark in dark mode; choose by measured contrast.
- Semantic colors: 300/400 for text and icons, low-chroma 900/950 for subtle backgrounds.
- Keep saturated color to the ~10% accent share; large saturated areas glare on dark.

**Media**
- Logos: ship a dark-surface variant; never CSS-invert a raster logo.
- SVG icons and illustrations use currentColor or CSS variables so they swap with the theme.
- Charts: re-check series colors against the dark background at 3:1.
- picture with media="(prefers-color-scheme: dark)" follows the system only; use data-theme-aware CSS or JS when a manual toggle exists.

**Switching**
- Set color-scheme on :root (light dark by default, a single value under each data-theme) and add meta name="color-scheme" so form controls and scrollbars match. For simple two-mode values, light-dark() is a valid alternative in modern browsers.
- A small blocking script in head sets data-theme before first paint; wrap storage access in try/catch.
- Disable transitions during the switch so every element does not animate at once.

## Output
- Mapping table: semantic token, light value, dark value, contrast on its darkest and lightest surface.
- CSS and the head script in the project stack, plus a Light / Dark / System toggle component.
- Notes on each logo, image and chart that needs a variant.

```html
<script>
  try {
    var t = localStorage.getItem("theme");
    if (t === "light" || t === "dark") document.documentElement.dataset.theme = t;
  } catch (e) {}
</script>
```

```css
:root { color-scheme: light dark; --bg: #ffffff; --text: #1a1a1a; }
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { --bg: #121212; --text: #e8e8e8; }
}
:root[data-theme="dark"] { color-scheme: dark; --bg: #121212; --text: #e8e8e8; }
:root[data-theme="light"] { color-scheme: light; }
```

## Avoid
- filter: invert() or flipping the light ramp to generate dark mode
- Pure #000 backgrounds with pure #fff text
- Reusing the saturated light-mode brand step unchanged
- Shadows as the only elevation cue
- Applying the theme after hydration, which flashes the wrong theme
- Forgetting focus rings, selection, scrollbars, inputs and disabled states
- Dark mode on some pages or components but not others

## Final check
- [ ] No pure black backgrounds; 3–4 surfaces lighten with elevation
- [ ] Text ≥4.5:1 on the lightest surface it appears on; UI elements ≥3:1
- [ ] Accents lightened and desaturated, then verified
- [ ] Hard reload shows no flash for stored light, stored dark and system
- [ ] System setting applies when no override is stored; the choice persists
- [ ] color-scheme set; native controls match the theme
- [ ] Logos, illustrations and charts checked in both themes
