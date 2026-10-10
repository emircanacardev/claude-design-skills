---
name: pricing-page
description: Designs and builds clear, honest pricing pages with 2 to 4 tiers, a recommended plan, a monthly and annual toggle with correct savings, a feature comparison table, per-seat or usage-based price display, FAQ and an enterprise contact path. Use when asked to create or redesign a pricing page, add plan cards, show annual savings, or compare plans. Not for the surrounding marketing page (use landing-page).
---

# Pricing Page

Produces a pricing page where visitors can find the right plan, understand exactly what they will pay, and act, without hidden terms or pressure tactics.

## When to use
- "Make a pricing page with Free, Pro, and Team plans."
- "Add a monthly/annual toggle" or "show how much annual billing saves."
- Plans need a comparison table, or the current one is too long to scan.
- Displaying per-seat, usage-based, or hybrid pricing.
- Reviewing a pricing page for clarity, accessibility, or dark patterns.

## Workflow
1. Collect the real pricing model: plan names, prices per currency and period, seat or usage units, limits, trial terms, tax handling, and which plan fits the main audience. Never invent prices; use labelled placeholders when data is missing.
2. Settle on 2–4 public tiers, plus an Enterprise contact option if sales-led deals exist. Write a one-line "best for" statement per tier.
3. Choose the recommended plan based on fit for the primary audience, and decide how it is emphasized.
4. Specify the billing toggle: default period, savings math, and exactly which prices and notes change.
5. Lay out the page: headline and toggle → plan cards → customer proof → full comparison table → FAQ → enterprise block → final CTA.
6. Store pricing in one data object that renders both the cards and the table; build responsive, accessible components.
7. Test the toggle and table with keyboard only and a screen reader, at 320px and desktop widths, then run the Final check.

## Rules
**Tiers and emphasis**
- Each card shows plan name, best-for line, price, billing note, primary CTA, and 4–6 key differentiators. The full list lives in the comparison table.
- Order tiers by price consistently, low to high from left to right (top to bottom on mobile), with Enterprise last.
- Emphasize the recommended plan with at least two cues beyond color: badge text, stronger border or elevation, filled CTA. Say "Most popular" only if data supports it; otherwise "Recommended for teams".
- Anchor honestly: every visible tier is a real plan customers buy. No decoy tiers designed only to make another look cheap.

**Price display**
- Prices use tabular figures with the period attached ("$24 / month") and an explicit currency where it could be ambiguous; state whether tax or VAT is included.
- Per-seat: "$12 per user / month", minimum seats stated, and a seat input or stepper that shows the computed total.
- Usage-based: unit price, included allowance, overage rate, and a worked example ("50,000 requests ≈ $40 / month") or a calculator.

**Billing toggle**
- Build it as a two-option radio group styled as a segmented control, or a switch with both options labelled visibly. Fully keyboard operable.
- Compute savings exactly: (monthly × 12 − annual) ÷ (monthly × 12). Example: $19/month vs $190/year saves 17%, which is also "2 months free". Use the same figure everywhere.
- When annual is shown as a monthly equivalent, show the billed amount next to it ("$15.83 / month, billed $190 yearly").
- After a toggle change, a polite live region announces a short summary ("Showing annual prices") rather than reading every price.

**Comparison table and trust**
- Use a real `table`: plans as columns with `th scope="col"`, features as row headers grouped into 4–8 categories, sticky plan header with CTAs. See data-tables.
- Included and not-included cells carry text ("Included", "Not included"), not only icons; limits are numbers ("5 projects", "Unlimited").
- On narrow screens, replace the multi-column table with a plan selector that compares one or two plans at a time.
- Show trial and renewal terms next to the CTAs: length, whether a card is required, what happens when the trial ends.
- The FAQ covers cancellation, refunds, upgrades and proration, exceeding limits, payment methods, invoices, and data after downgrade.

## Output
- One pricing data object (plans, prices per period and currency, features by category) feeding both cards and table so they cannot drift.
- Page code: semantic HTML with CSS custom properties, or React + Tailwind if already in use. No new dependencies.
- Savings math written out in a code comment so the owner can verify it.
- Copy for CTAs and FAQ answers (see ux-writing), plus a list of placeholders (prices, limits, terms) to confirm with the business.

## Avoid
- "Contact us" in place of a price for plans that are self-serve.
- Pre-selected add-ons, auto-enrolled upsells, or fees first revealed at checkout.
- Countdown timers or "price goes up soon" without a real, dated change.
- Annual-as-monthly prices with no billed total.
- Confirmshaming on downgrade or opt-out links ("No thanks, I prefer losing customers").
- Icon-only check marks, or tooltips as the only place limits are explained.
- Comparison tables with dozens of ungrouped rows and no sticky plan header.

## Final check
- [ ] 2–4 tiers shown, and one recommended plan is emphasized by more than color.
- [ ] Savings figure is mathematically correct and identical in toggle, cards, and FAQ.
- [ ] Toggle works with keyboard, both options are labelled, and the change is announced.
- [ ] Every price shows period, currency, billing note, and tax status.
- [ ] Comparison table uses real table semantics and text for included or not included.
- [ ] Trial, renewal, and cancellation terms are visible near the CTAs.
- [ ] Layout works at 320px without horizontal page scrolling.
