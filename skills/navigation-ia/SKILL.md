---
name: navigation-ia
description: Structures information architecture and navigation, from content inventory, card sorting and tree testing to grouping, labeling, URL structure and nav patterns such as top bars, sidebars, bottom tab bars, breadcrumbs, tabs, search and command palettes. Use when asked to organize a site or app, design a menu or sidebar, fix users not finding things, or restructure URLs. Not for step-by-step task flows (use user-flows).
---

# Navigation and Information Architecture

Produces a content structure users can predict and a navigation system that keeps every important destination findable on every screen size.

## When to use
- "Design the sidebar / main menu for our app."
- "Users can't find X" or "our navigation is a mess."
- Planning a sitemap for a new product or restructuring an existing one.
- Choosing between top bar, sidebar, bottom tab bar, tabs, breadcrumbs, or a command palette.
- Renaming sections, merging pages, or redesigning URLs.

## Workflow
1. Inventory content and features: every page or screen, its purpose, owner, and usage data where available (analytics, site search logs, support tickets).
2. Identify the 5–10 most important user tasks and the destinations they need; these get the shortest, most visible paths.
3. Group content. Run an open card sort to learn users' mental models (about 15 participants is a common recommendation) or a closed sort to check proposed categories. Without research, label the grouping as a hypothesis.
4. Name each group in user vocabulary and draft the sitemap as a tree with depth, parents, and URLs.
5. Validate the tree with a tree test: text-only hierarchy, realistic find-it tasks, success rate and directness per task. Revise branches that fail.
6. Choose navigation patterns per platform and breakpoint; specify order, labels, icons, and active, hover, and focus states.
7. Define search scope, URL rules, and redirects for anything that moves.
8. Deliver the sitemap, navigation specs, and code.

## Rules
**Structure and labels**
- Prefer broad and shallow: primary destinations in global navigation, hierarchy kept to about 3 levels.
- Organize by user task or object, not by org chart or internal team names. Each item has one primary home; cross-link instead of duplicating sections.
- Labels are 1–3 words, start with the distinguishing word, use terms found in search logs and support tickets, and do not overlap. Avoid catch-alls like "Resources" or "More" when a specific label fits. Use ux-writing for wording.

**Patterns**
- Top bar: marketing sites and simple apps with up to about 5–7 top-level sections.
- Sidebar: apps with many sections or frequent switching; group items under headings; if collapsible to icons, keep tooltips and accessible names.
- Bottom tab bar on mobile: 3–5 top-level destinations, each with icon and text label; never used for actions.
- Tabs switch between sibling views of the same object or page, never between unrelated destinations.
- Breadcrumbs for hierarchies 3 or more levels deep: show location, not history; the current page is last and not a link.
- Command palette (Cmd/Ctrl+K) is an accelerator, never the only route to a feature.

**States and accessibility**
- Mark the current page with `aria-current="page"` and a visible indicator beyond color (bar, weight, or background) at ≥3:1 contrast against adjacent states.
- Menus that open on hover also open on click and Enter, close on Escape, and expose `aria-expanded` on their disclosure button. Site navigation is a list of links, not `role="menu"`.
- Use `nav` landmarks with distinct `aria-label`s when there are several, add a skip link, and set `scroll-padding-top` so sticky headers do not cover focused elements (WCAG 2.2 Focus Not Obscured, 2.4.11).

**Search, URLs, mobile**
- Content-heavy products get a visible search field; results show where each item lives, and no-results pages suggest alternatives.
- URLs are lowercase, hyphenated, readable, and mirror the hierarchy (`/settings/billing`); tabs and filters are reflected in the URL so views can be shared; moved pages get 301 redirects.
- On mobile web, the menu button is labelled "Menu", exposes `aria-expanded`, moves focus into the opened panel, and returns it on close. See mobile-app-ui for native apps.

## Output
- Content inventory as a table, and the sitemap as an indented tree with URLs.
- Card sort and tree test plan (tasks, participants, success criteria) when research is in scope.
- Navigation spec per breakpoint: pattern, items, order, labels, icons, states.
- Navigation code in semantic HTML with CSS custom properties, or React + Tailwind if the project uses it.

## Avoid
- Hamburger menus hiding primary destinations on desktop.
- Clever, branded, or internal labels ("Hub", "Spaces", "Studio") with no explanation.
- Mega menus that open on hover with no delay or close when the pointer crosses a gap.
- Navigation items that change order or disappear between pages.
- Treating "7±2" as a menu limit; it describes working memory, not scanning visible options.
- Nesting 4 or more levels deep.
- Icon-only navigation without visible text labels or accessible names.

## Final check
- [ ] Each top task has a short, obvious path from global navigation.
- [ ] Labels use user vocabulary and do not overlap.
- [ ] `aria-current="page"` marks the current page; the active state is not color-only.
- [ ] All menus work with keyboard (Tab, Enter, Escape) and expose `aria-expanded`.
- [ ] Mobile tab bar has 3–5 labelled destinations.
- [ ] URLs mirror the sitemap, and redirects are listed for moved pages.
- [ ] Navigation tested at 320px, tablet, and desktop widths.
