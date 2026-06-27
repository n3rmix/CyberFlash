# CyberFlash ⚡

**Executive-grade cybersecurity situation reports, generated in seconds.**

CyberFlash is a single-page web application that uses AI to produce structured, decision-ready cybersecurity intelligence reports scoped to a specific geography and sector. Reports are written for C-suite executives and senior business leaders — not security engineers.

---

## What it does

Select a geography, sector, and threat focus. CyberFlash queries the Osiris AI API and returns a full SITREP covering:

| Section | What you get |
|---|---|
| **Executive Summary** | 6-paragraph structured summary: central development, key facts, adversarial context, defender posture, analytical assessment, and call to action |
| **Executive Judgments** | Key findings, medium- and long-term impact bullets, and priority actions — decision-ready, no generic advice |
| **Key Cybersecurity Events** | Named incidents with date, actors, summary, concrete impact list, and attribution confidence rating |
| **Strategic Context** | Nation-state actor breakdowns with escalation risk ratings, plus geopolitical and regulatory framing |
| **Critical Infrastructure Risk Outlook** | Sector-by-sector threat level table (CRITICAL → LOW) with analytical synthesis |

Reports are based on the **last 6 months** of threat intelligence. Sections are omitted rather than padded when source data is insufficient.

---

## Getting started

**Prerequisites:** [Node.js](https://nodejs.org) 18+

```bash
git clone https://github.com/n3rmix/cyberflash
cd cyberflash
./start.sh
```

Then open **http://localhost:3000** in your browser.

1. Enter your Osiris API key when prompted — stored in your browser's `localStorage` only
2. Select a geography, sector, and threat focus
3. Click **Generate Flash Report**

---

## Start & stop

```bash
./start.sh            # install deps if needed, start on port 3000
PORT=8080 ./start.sh  # use a custom port
./stop.sh             # stop the server
```

Both scripts are idempotent. `start.sh` will not launch a second instance if one is already running. `stop.sh` handles missing or stale state gracefully.

---

## Configuration

| Setting | Value |
|---|---|
| Upstream API | `https://ai.osiris-code.com/v1/chat/completions` |
| Local proxy | `http://localhost:3000/proxy/v1/chat/completions` |
| Model | `glm-5.0-turbo` |
| API key storage | Browser `localStorage` — never persisted server-side |

A local proxy server is required because the Osiris API does not send CORS headers, which blocks direct browser requests. The proxy forwards calls server-side where CORS does not apply.

---

## Geographies & sectors

**Geographies** — Global, North America, Europe (EU, UK, DACH, Nordics, Eastern Europe), Asia Pacific, Middle East & Africa, Latin America.

**Sectors** — Financial Services, Healthcare, Energy & Utilities, Telecoms, Transport, Government & Defense, Technology, Cloud & SaaS, Retail, Manufacturing, Media, Education, Legal, Insurance, Real Estate.

---

## Exporting reports

Use the **Print / Export PDF** button to save or share a report. The print stylesheet hides the UI chrome and renders a clean, document-ready layout.

---

## Privacy

Your API key is stored exclusively in your browser's `localStorage`. It is transmitted only to `ai.osiris-code.com` as a Bearer token on each report request. No data is collected or logged by this application.
