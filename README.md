# CyberFlash ⚡

**Executive-grade cybersecurity flash reports, generated in seconds.**

CyberFlash is a single-page web application that uses AI to produce concise, actionable cybersecurity intelligence reports scoped to a specific geography and sector. Reports are written for C-suite executives and senior business leaders — not security engineers.

---

## What it does

Select a geography, sector, and threat focus. CyberFlash queries the Osiris AI API and returns a structured flash report covering:

| Section | What you get |
|---|---|
| **Executive Summary** | The single most important thing leadership needs to know right now |
| **Threat Overview** | Named threat actors, active campaigns, and attack vectors |
| **Technical Details** | CISO-level specifics — CVEs, TTPs, and tools with business relevance |
| **Impact Assessment** | Financial exposure, operational risk, and regulatory consequences |
| **Detection** | Specific behavioural signals and indicators to look for |
| **Mitigation & Response** | Named, actionable steps only — never generic advice |

Reports are based on the **last 6 months** of threat intelligence and are generated fresh each time.

> If there is insufficient data to give a genuinely useful recommendation, the report says so explicitly rather than padding with vague advice.

---

## Getting started

No installation, no build step. Open `index.html` in any modern browser.

1. **Get an API key** from [osiris-code.com](https://osiris-code.com)
2. Open `index.html`
3. Enter your API key when prompted — it is saved in your browser's `localStorage` and sent only to `osiris-code.com`
4. Select a geography and sector, then click **Generate Flash Report**

---

## Configuration

| Setting | Value |
|---|---|
| API endpoint | `https://osiris-code.com/app/v1/chat/completions` |
| Model | `claude-opus-4.6` |
| API key storage | Browser `localStorage` (never persisted server-side) |

---

## Geographies & sectors

**Geographies** — Global, North America, Europe (EU, UK, DACH, Nordics, Eastern Europe), Asia Pacific, Middle East & Africa, Latin America.

**Sectors** — Financial Services, Healthcare, Energy & Utilities, Telecoms, Transport, Government & Defense, Technology, Cloud & SaaS, Retail, Manufacturing, Media, Education, Legal, Insurance, Real Estate.

---

## Exporting reports

Use the **Print / Export PDF** button to save or share a report. The print stylesheet hides the UI chrome and renders a clean, document-ready layout.

---

## Privacy

Your API key is stored exclusively in your browser's `localStorage`. It is transmitted only to `osiris-code.com` as a Bearer token on each report request. No data is collected or logged by this application.
