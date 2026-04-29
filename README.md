# paperboy-pulse 📰

Monitoring dashboard for the [paperboy](https://github.com/JBGruber/paperboy) news scraper R package. Runs daily checks against all scrapers and publishes a status dashboard to GitHub Pages.

## How it works

1. A GitHub Actions workflow runs every day at 7am UTC
2. It fetches the latest `status.csv` from the paperboy repo
3. It runs each scraper against a small sample of articles from its RSS feed
4. Results are written to a SQLite database (`data/paperboy_monitor.sqlite`)
5. A Quarto dashboard is rendered and deployed to GitHub Pages

## Dashboard

🔗 **[View the live dashboard](https://sina-chen.github.io/paperboy-pulse)**

## Structure

```
paperboy-pulse/
├── dashboard/
│   ├── index.qmd           # Quarto dashboard
│   ├── _quarto.yml         # Quarto project config
│   ├── helpers.R           # DB + test helper functions
│   └── assets/             # CSS, logos
├── monitors/
│   └── run_checks.R        # Runs scraper tests, writes to DB
├── data/
│   ├── status.csv          # Scraper registry (fetched from paperboy)
│   └── paperboy_monitor.sqlite  # Test results database
├── .github/
│   └── workflows/
│       └── update_dashboard.yml
├── DESCRIPTION             # R package dependencies
└── .gitignore
```

## Running locally

```r
# Install dependencies
remotes::install_deps()

# Run checks
source("monitors/run_checks.R")

# Render dashboard
quarto::quarto_render("dashboard/")
```

## Adding scrapers

Scrapers are defined in paperboy itself, see the [For developers](https://github.com/JBGruber/paperboy#for-developers) section for details. Once a new scraper is merged there,
it will automatically appear in the monitor on the next daily run.
