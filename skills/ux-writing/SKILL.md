---
name: ux-writing
description: Writes and edits interface microcopy, including buttons, error messages, empty states, destructive confirmations, tooltips, loading text, and number and date formats, using a consistent voice, plain inclusive language, and localization-safe strings. Use when asked to improve the copy, rewrite error messages, name a button, write empty state text, or review UI wording. Not for defining brand voice from scratch, which is brand-identity.
---

# UX Writing

Produces clear, consistent interface copy plus a before/after table that shows every change and the rule behind it.

## When to use
- "Fix the copy on this screen", "rewrite these error messages", "what should this button say?"
- Reviewing a flow for inconsistent terms, casing, or tone.
- Writing empty states, confirmation dialogs, tooltips, notifications, or onboarding hints.
- Preparing strings for translation.
- Creating a short microcopy style guide for a product.

## Workflow
1. Collect each string with its context: screen, component, trigger, and what happens next. Use the voice guide from brand-identity if one exists; otherwise assume plain, direct, and friendly, and say so.
2. Build a terminology list with one term per concept (for example "workspace", never also "team" or "org"). Note every conflict found.
3. Rewrite by component type using the rules below, keeping the user's goal and the next action explicit.
4. Set tone for the moment: neutral for routine actions, calm and specific for errors, precise and serious for destructive or payment actions, light only when stakes are low.
5. Fit length to the component: buttons 1–3 words, tooltips one sentence, errors 1–2 sentences, empty states a heading plus one line.
6. Check localization: no concatenation, named placeholders, plural rules, and room for expansion.
7. Deliver the before/after table, the terminology list, and open questions (for example, unknown error causes).

## Rules
**Voice and tone**
- Voice is the constant personality; tone shifts with the situation. No jokes in errors, data loss, security, or payment.
- Address the user as "you". Use "we" only when the company is acting ("We sent a code to your email").
- Sentence case for all UI text: buttons, headings, tabs, menu items. Capitalize proper nouns only.

**Actions**
- Buttons are verb + object: "Save changes", "Create invoice", "Delete project". Avoid "OK", "Yes", and "Submit" when a specific verb exists. Links name the destination ("View billing history"), never "Click here".
- The confirm button repeats the dialog title's verb: title "Delete project?", button "Delete project", not "Confirm".

**Errors**
- Structure: what happened, why (only if known and useful), how to fix. "Card declined. Your bank didn't approve the payment. Try another card or contact your bank."
- No blame and no dead ends: "You entered an invalid email" becomes "Enter an email address, like name@example.com". Never show a raw error code alone, "Oops", or ALL CAPS.
- Field errors sit next to the field, say how to fix it, and stay until fixed (see form-design).

**Other components**
- Empty states say what the area is for and how to start, with one primary action. First use, no search results, and cleared-by-user are different messages (see ui-states).
- Destructive confirmations name the object and the consequence: "Delete 'Q3 report'? This can't be undone." For reversible actions, offer Undo instead of a confirmation.
- Tooltips add information not shown elsewhere; never hide essential instructions in a tooltip.
- Loading text names the action ("Uploading 3 files…"); for long waits, show progress or the current step.

**Numbers, dates, inclusion, localization**
- Numerals for counts ("3 files"), locale-aware formatting (`Intl.NumberFormat`, `Intl.DateTimeFormat`), and unambiguous dates ("4 Mar 2026", not "03/04/2026"). Relative time for recent events, with the absolute time on hover.
- Plain language: short common words, active voice, one idea per sentence. Avoid idioms, jargon, "simply" or "just" (they imply the task is easy), gendered defaults, and ableist idioms ("sanity check", "crippled").
- Never concatenate fragments; use full-sentence templates with named placeholders (`{count}`, `{fileName}`) and ICU plural rules.
- Allow about 30% text expansion for translation (short labels often grow more); avoid fixed-width buttons and text baked into images.

## Output
- Before/after table: | Location | Before | After | Rule or reason |
- Terminology list: | Use | Don't use | Notes |
- For new copy, a string list with i18n keys (`project.delete.confirm.title`) ready to paste into locale files.
- Open questions where the real cause, limit, or consequence is unknown.

## Avoid
- Vague labels ("OK", "Submit", "Continue") when the action is known.
- Humor or cuteness in errors and failures.
- Title Case in some places and sentence case in others.
- Body text that repeats the heading.
- Technical messages ("Error 500: null reference") shown without a human explanation.
- Placeholder text used as the only field label.
- Concatenated strings such as `"You have " + n + " new message(s)"`.

## Final check
- [ ] Every button is a specific verb (+ object) in sentence case.
- [ ] Every error says what happened and how to fix it, without blame.
- [ ] Destructive confirmations name the object and consequence.
- [ ] One term per concept across all strings.
- [ ] Numbers, dates, and plurals use locale-aware formatting.
- [ ] No concatenation; placeholders are named; layouts allow about 30% expansion.
- [ ] Each before/after row has a reason.
