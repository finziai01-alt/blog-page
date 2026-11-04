# Deploying Finzi AI — free, ~10 minutes

You will put the site online on **Cloudflare Pages** (free, HTTPS, fast in India) and then
connect it to Google and Bing so search engines and AI assistants can find it.

---

## Part 1 — Put the site online (Cloudflare Pages)

1. **Create a free Cloudflare account** — https://dash.cloudflare.com/sign-up (just email + password, no card).
2. In the dashboard, go to **Workers & Pages → Create → Pages → Upload assets**.
3. **Project name:** choose `finzi-ai` (the site will live at `https://finzi-ai.pages.dev`).
   - If the name is taken, Cloudflare shows you the URL it will actually use — pick something like `finziaccounting`.
   - **Important:** note the final URL it shows, you need it in the next step.
4. **Build the deploy folder.** Open PowerShell in the site folder and run (replace both values):

   ```powershell
   .\configure.ps1 -Domain "finzi-ai.pages.dev" -Contact "you@yourmail.com"
   ```

   - `-Domain` is the exact `.pages.dev` URL from step 3 (no `https://` needed).
   - `-Contact` is the email that should receive demo requests (this powers every "Book a demo" button and the site footer).

5. Go back to Cloudflare. Drag **everything inside the `_deploy` folder** into the upload area
   (drag the folder's contents, not the `_deploy` folder itself). Click **Deploy**.
6. Open your `.pages.dev` URL. Check:
   - Homepage loads with the blue hero and the bill demo panel
   - `your-url.pages.dev/llms.txt`, `/pricing.md`, `/robots.txt` all load
   - A wrong URL (e.g. `/xyz`) shows the Finzi 404 page
   - On your phone, the layout stacks properly

Done — the site is live. ✅

> **When you later buy a custom domain** (optional, ~₹800/yr): add it in Cloudflare Pages →
> Custom domains, then re-run `configure.ps1` with the new domain and upload `_deploy` again.

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
