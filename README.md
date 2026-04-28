# Pixel Garden — Jekyll Template

A retro 8-bit digital garden template built with Jekyll and [NES.CSS](https://nostalgic-css.github.io/NES.css/).  
Live demo: **[blog.chocobone.dev](https://blog.chocobone.dev)**

---

## Features

| Feature | Description |
|---|---|
| Retro pixel aesthetic | NES.CSS + pixel-art fonts (DungGeunMo, Press Start 2P) |
| Dark / Light mode | One-click toggle, persisted via `localStorage` |
| Obsidian-style links | `[[Note Title]]` bidirectional linking between notes |
| Image embeds | `![[image.png\|400]]` syntax resolved at build time |
| Tag filtering | Homepage filters notes by tag with no page reload |
| Code blocks | 8-bit traffic lights + one-click Copy button |
| Syntax highlighting | GitHub theme (light) / Dracula theme (dark) via Rouge |
| `==Highlight==` syntax | `==text==` → `<mark>text</mark>` |
| Backlinks | Notes display every other note that links to them |
| Last-modified date | Auto-read from Git history via `jekyll-last-modified-at` |
| External links → new tab | Configurable via `_config.yml` |
| Responsive | Mobile-first, max-width 900 px |
| GitHub Pages ready | Works out of the box with `github-pages` or direct Jekyll |

---

## Quick Start

### Prerequisites

- Ruby 3.2+  
- Bundler (`gem install bundler`)  
- Git (required for last-modified-at timestamps)

### 1. Clone or copy this template

```bash
# Option A — use as a GitHub template (click "Use this template" on GitHub)

# Option B — clone directly
git clone https://github.com/Chocobone/chocobone.github.io.git my-blog
cd my-blog/jekyll_template
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Configure your site

Open `_config.yml` and update:

```yaml
title: your-site-name          # Site title shown in the nav
url: "https://you.github.io"   # Your public URL

social:
  github: yourusername          # GitHub username (leave empty to hide)
  linkedin: yourprofile         # LinkedIn profile slug (leave empty to hide)
```

### 4. Add your fonts (optional)

The template references two local fonts. Drop them into `assets/fonts/`:

| File | Source |
|---|---|
| `DungGeunMo.woff` | [DungGeunMo font](https://noonnu.cc/font_page/706) — Korean pixel font |
| `PressStart2P-Regular.ttf` | [Google Fonts](https://fonts.google.com/specimen/Press+Start+2P) |

If the files are absent the site still builds — those font-faces simply fall back to the CDN versions loaded in `_includes/head.html`.

### 5. Run locally

```bash
bundle exec jekyll serve
# Open http://localhost:4000
```

### 6. Deploy to GitHub Pages

Push the repository to GitHub and enable Pages in **Settings → Pages → Source: Deploy from a branch** (`main` / `root`).

---

## Writing Notes

Create a `.md` file in `_notes/`:

```markdown
---
layout: note
title: my-note-title
permalink: /my-note-title
created: 2026-01-01
updated: 2026-01-01
tags:
  - tag-name
---

Your note content here.
```

**Frontmatter fields**

| Field | Required | Description |
|---|---|---|
| `layout` | Yes | Always `note` |
| `title` | Yes | Display name and link target for `[[...]]` |
| `permalink` | Yes | URL path |
| `created` | No | `YYYY-MM-DD` — used for sorting on homepage |
| `updated` | No | `YYYY-MM-DD` — shown on the note page |
| `tags` | No | Array — appear as filter buttons on homepage |

---

## Obsidian Integration

This template is designed to be used as your **Obsidian vault root**.  
Set your Obsidian vault to point at the repository directory and:

- Internal links (`[[Note]]`) are converted by `_plugins/bidirectional_links_generator.rb`
- Images embedded as `![[file.png]]` are resolved from `assets/images/`
- Notes without frontmatter get empty `---` injected automatically at build time

---

## Directory Structure

```
jekyll_template/
├── _config.yml              # Site configuration
├── _layouts/
│   ├── default.html         # Base HTML shell
│   ├── note.html            # Note page (title + backlinks)
│   └── page.html            # Static page
├── _includes/
│   ├── head.html            # <head> — fonts, NES.CSS, theme script
│   ├── nav.html             # Sticky navigation bar
│   ├── footer.html          # Footer
│   ├── social-buttons.html  # GitHub / LinkedIn icons
│   ├── theme-toggle.html    # Dark/Light toggle button
│   └── script.js            # Copy button + traffic lights
├── _notes/                  # Your notes (Markdown)
│   └── my_first_note.md     # Starter note / feature showcase
├── _pages/
│   ├── index.md             # Homepage with Latest + Topics
│   └── about.md             # About page
├── _plugins/
│   ├── bidirectional_links_generator.rb   # [[links]] + backlinks
│   ├── empty_front_matter_note_injector.rb
│   ├── open_external_links_in_new_tab.rb
│   ├── markdown-highlighter.rb            # ==highlight== syntax
│   └── last_modified_at_generator.rb      # Git-based timestamps
├── _sass/
│   ├── _normalize.scss      # normalize.css v8
│   ├── _style.scss          # Layout, typography, theme variables
│   ├── _code.scss           # Code blocks, traffic lights, Dracula dark theme
│   └── _syntax.scss         # Placeholder (Rouge tokens in _code.scss)
├── assets/
│   └── fonts/               # DungGeunMo.woff, PressStart2P-Regular.ttf
├── styles.scss              # SCSS entry point
├── 404.html
└── Gemfile
```

---

## Customization

### Change colors

Edit the CSS custom properties in `_sass/_style.scss`:

```scss
:root {
    --bg-color: #ffffff;
    --text-color: #212529;
    --link-color: #209cee;
    /* ... */
}

[data-theme="dark"] {
    --bg-color: #212529;
    --text-color: #ffffff;
    /* ... */
}
```

### Change fonts

Replace the `@font-face` declarations in `_sass/_style.scss` and update the font-family stacks in `_includes/head.html`.

### Add nav links

Edit `_includes/nav.html` — add `<a>` tags inside the `.nav-brand` div alongside the existing About link.

---

## Credits

- Design & development: [Chocobone](https://github.com/Chocobone)
- CSS framework: [NES.CSS](https://nostalgic-css.github.io/NES.css/) by Yorickpeterse
- Bidirectional links plugin adapted from [maximevaillancourt/digital-garden-jekyll-template](https://github.com/maximevaillancourt/digital-garden-jekyll-template)
- Pixel fonts: [DungGeunMo](https://noonnu.cc/font_page/706), [Press Start 2P](https://fonts.google.com/specimen/Press+Start+2P)

---

## License

MIT — free to use, modify, and distribute.
