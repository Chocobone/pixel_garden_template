---
layout: note
title: my-first-note
permalink: /my-first-note
created: 2026-04-28
updated: 2026-04-28
tags:
  - guide
  - start-here
---

Welcome to your first note in **Pixel Garden** — a retro 8-bit digital garden built with Jekyll.

---

## What is a Note?

Notes live in the `_notes/` directory. Each note is a Markdown file with YAML frontmatter:

```yaml
---
layout: note
title: my-note-title
permalink: /my-note-title
created: 2026-01-01
updated: 2026-01-01
tags:
  - tag-one
  - tag-two
---
```

The `title` field is what shows on the page and in the notes list. The `permalink` sets the URL. Tags appear as filter buttons on the homepage.

---

## Obsidian-style Links

Internal links use the `[[double bracket]]` syntax — the same as Obsidian:

- `[[my-first-note]]` → links to this note by filename or title
- `[[my-first-note|Custom Text]]` → links with a custom display label

If the target note doesn't exist, the link renders as an ==invalid-link== indicator instead.

---

## Image Embeds

Images stored in `assets/images/` can be embedded with:

```
![[filename.png]]
![[filename.png|400]]
![[filename.png|640x480]]
```

The second argument is an optional width (or `widthxheight`). If it is not a number, it becomes the alt text.

---

## Text Highlighting

Wrap text with `==double equals==` for ==highlighted text==.

---

## Code Blocks

Fenced code blocks get 8-bit traffic lights and a one-click copy button automatically:

```python
def hello():
    print("Hello from Pixel Garden!")
```

```javascript
const greet = (name) => `Hello, ${name}!`;
```

---

## Backlinks

At the bottom of this page you will see any notes that link back to this one. Create a second note that contains `[[my-first-note]]` and it will appear there automatically.

---

## Dark Mode

Click **[Dark]** in the top-right corner to toggle themes. The preference is stored in `localStorage` so it persists across visits.

---

Next step: edit `_config.yml` and replace `your-site-name` with your blog title, then write your next note!
