const express = require('express');
const fetch = require('node-fetch');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;
const OSIRIS_BASE = 'https://ai.osiris-code.com/v1';

app.use(express.json());
app.use(express.static(path.join(__dirname)));

// Proxy API calls to Osiris — avoids browser CORS restrictions
app.post('/proxy/v1/:endpoint(*)', async (req, res) => {
  const authHeader = req.headers['authorization'];
  if (!authHeader) return res.status(401).json({ error: { message: 'Missing Authorization header' } });

  try {
    const upstream = await fetch(`${OSIRIS_BASE}/${req.params.endpoint}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': authHeader,
      },
      body: JSON.stringify(req.body),
    });

    const data = await upstream.json();
    res.status(upstream.status).json(data);
  } catch (err) {
    res.status(502).json({ error: { message: `Proxy error: ${err.message}` } });
  }
});

app.listen(PORT, () => {
  console.log(`CyberFlash running at http://localhost:${PORT}`);
});
