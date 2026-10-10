---
name: distinctive-ui
description: Turns generic, template-looking interfaces into intentional and memorable ones by committing to one aesthetic direction, a characterful type pairing, a restrained palette with one bold accent and a single signature detail, while removing default AI tropes. Use when a UI looks generic, bland, like every other SaaS site or obviously AI-generated, or when asked to give it personality. Not for logos or brand strategy; use brand-identity.
---

# Distinctive UI

Produces an interface with a clear point of view: one named aesthetic direction carried consistently through type, color, layout, imagery and motion, so the result reads as designed rather than assembled from defaults.

## When to use
- "Make it look less generic", "less like a template" or "less AI-generated"
- A new product or landing page needs a visual voice before a full brand exists
- A working UI is forgettable and needs a redesign pass
- Choosing between 2–3 coherent visual directions
- Reviewing generated UI for default tropes before shipping

## Workflow
1. Gather inputs: product, audience, three adjectives for the desired feel, and fixed constraints (existing logo color, licensed fonts, framework). If adjectives are missing, infer them from the audience and state them.
2. Write 2–3 short direction briefs (name, feel, type pairing, palette, layout move, signature detail). Recommend one with a reason and proceed with it unless the user picks another.
3. Lock typography: a display face with visible character plus a text face, or one superfamily. Build the scale with typography-system.
4. Lock color: tinted neutrals, one secondary, one bold accent. Build ramps and verify contrast with color-system.
5. Choose the layout move that breaks the centered-stack default (see Rules).
6. Choose exactly one signature detail (numbered mono section labels, hairline rules with corner ticks, a custom link underline, an offset hard shadow or a recurring cropped shape) and apply it in at least 3 places.
7. Apply the direction to the requested screens, then run the trope audit against the Avoid list and remove anything that crept back.
8. Encode the decisions as tokens with design-tokens so iteration does not erode the direction.

## Rules
**Direction reference (pick one)**
- Editorial: high-contrast serif display, quiet sans or serif text, column grid, hairline rules, generous whitespace, pull quotes, near-monochrome plus one ink accent.
- Brutalist: grotesk or mono, 2–3px solid borders, hard offset shadows (4px 4px 0, no blur), 0 radius, flat color blocks, exposed structure.
- Soft/organic: rounded humanist sans, warm off-white backgrounds, earthy palette, radii 16–24px, gentle 200–300ms motion.
- Technical/mono: monospace for labels and data, visible grid lines, 1px borders, 0–4px radii, dense layout, tabular figures, one saturated signal color.
- Retro: era-specific type (70s soft serif, 80s geometric, 90s system UI), limited flat palette, subtle grain, chunky borders.
- Luxury: refined serif or light sans at large sizes, small-caps labels tracked +0.1em, wide margins, deep near-monochrome palette, slower 250–400ms transitions.

**Constraints**
- One direction per product; every choice must be defensible against it.
- Max 2 typefaces, plus a mono only if data or code needs it. The display face must differ in character from the body face.
- Inter, Roboto, Arial or system-ui as the only typeface is allowed only when the direction is deliberately neutral; otherwise pair them with a characterful display face.
- Palette follows 60-30-10: tinted neutrals (OKLCH chroma 0.005–0.02 toward the accent hue), a secondary, and one accent on ≤10% of any screen. Semantic colors stay separate.
- One radius system (for example 0, 6 or 16px) applied everywhere; no arbitrary 4/8/12/24 mixing.
- One icon set at one stroke width (for example 1.5px at 24px). No emoji as UI icons.
- One imagery treatment: duotone, grain, line illustration or consistently cropped photography.
- At least one deliberate layout departure: left-aligned hero, asymmetric 7/5 split, oversized numerals, full-bleed band or a visible grid.
- Distinctiveness never overrides usability: body ≥16px, text contrast ≥4.5:1, visible focus, targets ≥24×24px.
- Original work only: describe inspiration by traits, never copy a company's logo, brand assets or proprietary layouts.

## Output
- Direction brief (6–8 lines): name, adjectives, type pairing with fallback stacks, palette in OKLCH with hex, radius/border/shadow rules, signature detail, motion character.
- Tokens as CSS custom properties.
- The applied screen(s) in semantic HTML + CSS custom properties, or React + Tailwind if the project uses it. Fonts self-hosted or from Google Fonts with font-display: swap; no new dependencies unless asked.
- Trope audit: each default removed and what replaced it.

## Avoid
- Purple-to-blue gradient heroes and gradient text as the default move
- Inter or Roboto everywhere at uniform weights
- Centered everything: hero, section headings, cards, footer
- Emoji as icons or bullet decoration
- Glassmorphism, background blur and neon glow by default
- Grids of identical rounded cards with icon, title and two lines of text
- Mixing directions, such as brutalist borders with soft pastel blobs
- More than one signature detail competing for attention

## Final check
- [ ] Direction is named and every token traces back to it
- [ ] At most 2 typefaces (plus optional mono); display face is not the body default
- [ ] One accent at roughly 10% coverage; neutrals tinted
- [ ] Exactly one signature detail, used in 3 or more places
- [ ] No Avoid-list trope remains in hero, cards, icons or backgrounds
- [ ] Body ≥16px, text contrast ≥4.5:1, focus visible
- [ ] No copied brand assets or proprietary layouts
