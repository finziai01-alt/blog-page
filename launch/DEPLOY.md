# Deploying Finzi AI — free, ~10 minutes

You will put the site online on **Cloudflare Pages** (free, HTTPS, fast in India) and then
connect it to Google and Bing so search engines and AI assistants can find it.

---

## Part 1 — Put the site online (Cloudflare Pages)

1. **Create a free Cloudflare account** — https://dash.cloudflare.com/sign-up (just email + password, no card).
2. In the dashboard go to **Workers & Pages → Create → Pages → Connect to Git**.
3. **Authorize GitHub** when asked. If GitHub asks which account, pick **`finziai01-alt`** (the owner of the repo). You should see the `blog-page` repo → select it.
4. **Build settings** (there is no build step, so both matter):
   - Framework preset: **None**
   - **Build command:** leave *empty*
   - **Build output directory:** `_deploy`
5. **Project name:** type `finzi-ai` (this sets the final URL `https://finzi-ai.pages.dev`).
   - If that name is taken, Cloudflare suggests an available one — pick the nearest, e.g. `finzi-ai-2`.
   - **Important:** note the final URL, you need it in the next step and for Search Console.
6. Click **Deploy**. Then open your `.pages.dev` URL. Check:
   - Homepage loads with the blue hero and the bill demo panel
   - `your-url.pages.dev/llms.txt`, `/pricing.md`, `/robots.txt` all load
   - A wrong URL (e.g. `/xyz`) shows the Finzi 404 page
   - On your phone, the layout stacks properly

Done — the site is live. ✅

> **When you later buy a custom domain** (optional, ~₹800/yr): add it in Cloudflare Pages →
> Custom domains, then re-run `configure.ps1` with the new domain and **push** the change
> (`git add .` → `git commit -m "switch to custom domain"` → `git push`) — Cloudflare redeploys by itself.

### Future updates (the normal loop)

1. Edit files in `C:\Users\Praveen\Documents\Finzi-Site` (the source pages, NOT `_deploy`).
2. Rebuild the deploy folder: `.\configure.ps1 -Domain "finzi-ai.pages.dev" -Contact "contact@finziai.in"`
3. `git add .` → `git commit -m "what changed"` → `git push`
4. Cloudflare Pages redeploys in ~30 seconds. No dragging, no dashboard.

---

## Part 2 — Google Search Console (feeds Google + helps AI Overviews)

1. Open https://search.google.com/search-console with your Google account.
2. **Add property → URL prefix** → enter your full site URL (`https://finzi-ai.pages.dev`).
3. Verify with the **HTML file** method: download the verification file Google gives you,
   drop it into the `_deploy` folder, and upload `_deploy` again (Cloudflare Pages → your project
   → Create new deployment → drag the folder). Then click **Verify**.
4. In Search Console: **Sitemaps → Add a new sitemap** → enter `sitemap.xml` → Submit.
5. Use **URL inspection** on your homepage → *Request indexing*. Do the same for
   `/for-accountants/`, `/for-businesses/`, and the guide page.

## Part 3 — Bing Webmaster Tools (feeds Bing + ChatGPT search)

1. Open https://www.bing.com/webmasters with your Microsoft account.
2. Choose **Import from Google Search Console** (if you have no Microsoft account, create one — free).
3. Verify you own the site, then submit the same `sitemap.xml`.

> Why Bing matters: ChatGPT's web search and Microsoft Copilot pull from Bing's index.

---

## Part 4 — First-week routine

Open `launch\LAUNCH-CHECKLIST.md` — that is the day-by-day plan for this week
(directories, YouTube, Reddit/Quora, outreach, and measurement).
Before that, record your starting point with `launch\AI-VISIBILITY-BASELINE.md`.
