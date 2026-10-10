---
name: typography-system
description: Defines a complete typography system with a modular type scale chosen by density, font pairing logic, line-height and letter-spacing per size, a 45 to 75 character measure, fluid sizes with clamp, weight rules, tabular figures for data and performant font loading. Use when asked to set up type, choose fonts, build a type scale, fix readability or make headings look right. Not for page spacing and grids; use layout-spacing.
---

# Typography System

Produces a named type scale where every step defines size, line-height, weight and tracking, plus font stacks and a loading strategy, so every piece of text in the product maps to one defined style.

## When to use
- Choosing fonts and sizes for a new product or site
- Text looks off: cramped headings, gappy body text, lines running too long
- The codebase uses 15+ ad-hoc font sizes and needs consolidating
- Headings should scale smoothly between mobile and desktop
- Numbers in tables, prices or timers jitter as they change
- Web fonts cause invisible text or layout shift

## Workflow
1. Gather context: content type (app UI, marketing, long-form reading, data tool), density, brand or licensed fonts, languages to support. Default if unknown: app UI, 16px body, open-source fonts.
2. Pick the ratio by density: 1.125 for dense dashboards, 1.2 for general app UI, 1.25 for marketing and editorial, 1.333 for expressive pages with few levels.
3. Generate the scale from 16px, round to whole pixels, and name steps by role (caption, small, body, lead, h4, h3, h2, h1, display). Keep only the steps the product uses, typically 6–9.
4. Assign line-height, weight and letter-spacing to each step using the Rules.
5. Make the top 2–4 steps fluid with clamp(); keep body text fixed.
6. Select fonts and pairing; define stacks with metric-compatible fallbacks.
7. Set up loading: self-hosted WOFF2, subsetting, limited preloads, font-display.
8. Export as tokens (design-tokens), apply to elements, and map every stray size to a step.

## Rules
**Size and scale**
- Body ≥16px (1rem) on web; secondary text ≥14px; 12px only for captions and labels, never paragraphs.
- Sizes in rem so browser text settings apply; never set the html font-size in px.
- Example at 1.25: 13, 16, 20, 25, 31, 39, 49, 61px. Merge any steps closer than 2px.
- Fluid: clamp(min, rem + vw, max), e.g. clamp(2rem, 1.4rem + 3vw, 3.5rem). Always include a rem term (pure vw ignores zoom) and keep max ≤ 2.5× min so text can still reach 200% when zoomed (WCAG 1.4.4).

**Line-height and measure**
- Unitless line-height: display and h1 1.05–1.15, h2–h3 1.15–1.25, h4 and lead 1.3–1.4, body 1.5–1.6, small and caption 1.4–1.5.
- Measure 45–75 characters; max-width: 65ch is a solid body default.
- Space above a heading is larger than below it, so the heading binds to its content.

**Weight and tracking**
- At most 3 weights per family in use (e.g. 400, 600, 700). Avoid weights below 400 under 24px.
- Display sizes ≥40px: letter-spacing −0.01 to −0.03em. All caps and small labels: +0.04 to +0.1em. Body: 0.
- All caps only for short labels and overlines, never sentences.

**Pairing**
- Max 2 families, plus a mono for code or data. Pair by role contrast (serif display with sans text, or one superfamily) and similar x-height.
- Confirm glyph coverage for every language in scope before committing.

**Numbers**
- Tables, prices, stats and timers: font-variant-numeric: tabular-nums lining-nums; right-align numeric columns.

**Loading**
- WOFF2 only, subset by unicode-range, preload at most 2 critical files (with crossorigin), font-display: swap for text faces.
- Define a fallback @font-face with size-adjust and ascent-override to reduce layout shift.
- Use a variable font when 3+ weights or styles of one family are needed.

## Output
- Scale table: token, size (px/rem or clamp), line-height, weight, letter-spacing, usage.
- CSS: @font-face blocks, custom properties and element or utility styles; Tailwind fontSize entries instead if the project uses Tailwind.
- Pairing rationale in 2–3 lines with full fallback stacks.

```css
:root {
  --font-display: "Fraunces", Georgia, serif;
  --font-text: "Source Sans 3", system-ui, sans-serif;
  --text-body: 1rem;  --leading-body: 1.55;
  --text-h1: clamp(2rem, 1.4rem + 3vw, 3.5rem);  --leading-h1: 1.1;  --tracking-h1: -0.02em;
}
p { max-width: 65ch; }
.num { font-variant-numeric: tabular-nums lining-nums; }
```

## Avoid
- More than about 8 sizes in use, or sizes 1px apart (15/16/17)
- Line-height 1.5 on large headings, or 1.2 on body text
- Lines over 75 characters on desktop
- Thin or light weights for small text, especially gray on gray
- Faux bold or italic caused by missing font files
- Loading whole families or 6+ font files
- Viewport-only font sizes (font-size: 4vw)
- Centered multi-line body text

## Final check
- [ ] Every text style maps to a scale token
- [ ] Body ≥16px, line-height about 1.5, measure ≤75ch
- [ ] Headings at 1.05–1.25 and tightened at display sizes
- [ ] clamp() values include a rem term and max ≤2.5× min
- [ ] Tabular figures on data
- [ ] WOFF2, subset, swap, at most 2 preloads
- [ ] Text contrast ≥4.5:1 (see color-system)
