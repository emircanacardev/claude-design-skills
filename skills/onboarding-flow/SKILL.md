---
name: onboarding-flow
description: Designs first-run experiences that get new users to their activation moment quickly, using deferred sign-up, the shortest path to value, progressive disclosure, empty-state-driven onboarding, short checklists, contextual tips instead of long tours, permission priming and drop-off measurement. Use when asked to design onboarding, a welcome flow, a first-time user experience or a setup wizard. Not for a single empty or loading state (use ui-states).
---

# Onboarding Flow

Produces a first-run experience that takes a new user from arrival to the first meaningful outcome in as few steps as possible, plus a plan to measure where people drop off.

## When to use
- "Design onboarding for our app."
- "People sign up and never come back."
- Creating a welcome flow, setup wizard, getting-started checklist, or product tour.
- Deciding when to ask for notifications, location, camera, or profile details.
- Reducing friction in sign-up.

## Workflow
1. Define the activation moment: the first action that delivers the product's core value (first project shared, first invoice paid). Prefer the action the team's retention data points to; without data, state it as a hypothesis.
2. Map the current path from first visit to activation and count every screen, field, and decision. Use user-flows to diagram it.
3. Cut, defer, or automate each step activation does not require (profile details, invites, settings, tutorials).
4. Place account creation as late as the product allows, ideally when the user has something worth saving.
5. Design the first-run screens: an optional single welcome screen, setup questions that change the experience, first-use empty states with templates or sample data, and a 3–5 item checklist.
6. Place contextual tips at the moment of need and permission requests at the feature that needs them.
7. Define instrumentation: one event per step, the activation event, time to value, and drop-off between steps.
8. Specify returning visits: what persists, what is dismissed for good, and where users can replay guidance.

## Rules
**Sign-up**
- Ask only what account creation needs: email and password, or passwordless (magic link, passkey) and social sign-in where the project supports them.
- Password fields accept paste and password managers (`autocomplete="new-password"`), include a show toggle, and list requirements up front. See form-design.
- A welcome survey has 1–3 questions, each one changes what the user sees next, and it is always skippable.

**Path to value**
- No splash carousels or feature tours before the first real action; the first screen after sign-up lets the user do something real.
- Progressive disclosure: show the core workflow first; reveal advanced options when the user reaches for them.
- Empty states carry onboarding: one sentence on what goes here, one primary action, and a template or sample data that is clearly labelled and easy to remove.

**Checklists and tips**
- Checklists have 3–5 real tasks ordered toward activation, each linking to where the task is done, with visible progress ("2 of 4"). They are dismissible and resumable from help.
- Items complete automatically when the user does the task anywhere in the product.
- Prefer one contextual tip at a time, triggered when the user first reaches that UI. If a tour is unavoidable, keep it to about 3–5 steps with a step count and Skip; Escape closes it, and focus moves into each tip and returns afterward.

**Permissions**
- Request OS permissions (notifications, location, camera, contacts) in context when a feature needs them, never on first launch. Show an in-app explanation of the benefit first.
- On iOS, once a user denies a permission the system prompt does not appear again; on Android 11+, two denials have the same effect. After that, users must go to Settings, so the pre-prompt matters.
- A denial never breaks the app: the feature explains what is missing and how to enable it later.

**Measurement**
- Track the step funnel, activation rate, median time to activation, and day-1 and day-7 retention by sign-up cohort. Validate changes with experiments or cohort comparison, not anecdotes.

## Output
- Activation definition and the step count from first visit to activation, before and after.
- Flow as a numbered list or Mermaid diagram, including skip, deny, and returning-user branches.
- Screen-by-screen spec: purpose, copy (see ux-writing), primary action, skip path.
- Event tracking plan: event names, properties, and the funnel definition.
- UI code in the project's stack when requested, with no new dependencies.

## Avoid
- Mandatory account creation before any value, when the product does not require it.
- Splash carousels of feature claims.
- Long modal tours pointing at UI the user has not needed yet.
- Asking for every permission on first launch.
- Gating the product behind invites, profile photos, or integrations.
- Checklists of 8 or more items, or vanity steps ("Watch our intro video").
- Onboarding that reappears for returning users or cannot be replayed.

## Final check
- [ ] The activation moment is defined, and every step before it is justified.
- [ ] Sign-up asks for the minimum and supports paste and password managers.
- [ ] Every tip, tour, and survey is skippable and keyboard accessible.
- [ ] Permissions are requested in context with a pre-prompt and a graceful deny path.
- [ ] Empty states and the 3–5 item checklist lead to the activation action.
- [ ] Analytics events cover each step so drop-off can be measured.
