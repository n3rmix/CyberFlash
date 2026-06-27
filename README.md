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

A small Node.js proxy server is required to forward requests to the Osiris API (the API does not allow direct browser requests due to CORS).

**Prerequisites:** [Node.js](https://nodejs.org) 18+

```bash
git clone https://github.com/n3rmix/cyberflash
cd cyberflash
npm install
npm start
```

Then open **http://localhost:3000** in your browser.

1. Enter your Osiris API key when prompted — stored in `localStorage`, forwarded only to `ai.osiris-code.com`
2. Select a geography and sector
3. Click **Generate Flash Report**

---

## Configuration

| Setting | Value |
|---|---|
| Upstream API | `https://ai.osiris-code.com/v1/chat/completions` |
| Local proxy | `http://localhost:3000/proxy/v1/chat/completions` |
| Model | `glm-5.0-turbo` |
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
