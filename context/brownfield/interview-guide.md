# FLT Interview Guide: the Original Developer

**For:** the departing lead developer of Contoso Flight Log Tracking (FLT)
**Built from:**
- the x-ray's questions and contested items (`reachability-brief.md`)
- the rule cards' SME questions and suspected defects (`rules/BUSINESS_RULES.md`)

**Filter:** a question stays only if its answer changes what we **drop**, **keep** (and test as the migration contract) or **fix**.

**Status:** Draft. Not yet asked.

## How to use this guide

- Plan two sessions of about 60 minutes. Ask Part 1 first: its answers decide which code exists at all, and several later questions disappear depending on them.
- Each question names the decision it settles. Record the answer in the **Answer** line, and update the source document it cites:
  - the drop list in `reachability-brief.md`
  - the rule card in `rules/BUSINESS_RULES.md`
- **Blocking** means we can't drop the code or write the rule's test until we have the answer.
- Ask for evidence where it exists: a server name, a config file, a scheduled task or a person. "I think so" goes down as *unconfirmed*.

| Part | Theme | Questions | Blocking |
|---|---|---|---|
| 1 | What still runs | 10 | 10 |
| 2 | Production settings that switch rules on or off | 6 | 6 |
| 3 | Rules to confirm before they become tests | 10 | 10 |
| 4 | Suspected defects: keep the behaviour or fix it | 9 | 5 |
| | **Total** | **35** | **31** |

---

## Part 1 · What still runs (drop decisions)

### Q1. Is FLTRestService still hosted anywhere? (Blocking · Drop)
The client says the WCF REST service is retired. Its `Global.Application_Start` still registers a public route, though, and that route includes a POST that writes flights through `FlightManager.Insert`. Its Web.config points at `dbserver05\sql2k5`.
- *Ask:* Is any IIS site, app pool or binding still serving `/FLT/...`? Has any device or integration posted flights there since FLTWebAPI went live?
- *Decides:* **yes, nothing serves it** → drop the whole project, together with FLTRestClient. **No** → it's a live write path, and its flight mapping must be ported.
- *Sources:* `FLTRestService/Global.asax.cs:20`, `FLTRestService/FLTService.cs:436`; 6 contested items in the brief.
- **Answer:**

### Q2. How is FLTWebApp deployed to production? (Blocking · Drop)
Several pages aren't in the active `FLTWebApp.vbproj` but are still in the folder: the root-level `AircraftReportsMenu.aspx` and `DailyUsageParameters.aspx`, and the Crystal report pages.
- *Ask:* Is production built with a Web Deploy or publish package that follows the project file? Or is the folder copied with xcopy or a file-system copy?
- *Decides:* **publish package** → anything outside the vbproj never reached production, so drop it. **Folder copy** → those pages are live and move back to "contested".
- *Sources:* brief, Contested items 9 and 10.
- **Answer:**

### Q3. Are the Crystal reports still used, and where are the `.rpt` files? (Blocking · Drop/Keep)
The pages `aircraftReports/*`, `statisticalReports/*`, `reportObjects/*` and `DownloadData.aspx` appear only in the *backup* project file, and no `.rpt` file is in the repo. Those pages and the nine tab-delimited exports in `FltReportExportManager` are the only callers of the `rpt*` procedures.
- *Ask:* Who runs these reports today? Was the backup vbproj the one last used to build production? Which Crystal runtime do the reports need?
- *Decides:* **unused** → drop the pages, the exports and the `rpt*` procedures, along with Q30–Q32 below. **Used** → the fuel-burn, outlier and completion rules become part of the contract (RULE-026 to RULE-030, RULE-101).
- **Answer:**

### Q4. Does anyone use `FlightModify_alt2.aspx`? (Blocking · Drop)
No page links to it, but it ships with every deploy and saves flights through the same business objects. It differs from `FlightModify.aspx`: different controls, no `Exit Sub` after the login redirect, and no engine-run grid.
- *Decides:* **unused** → drop it. **Used** (bookmarked) → find out which of its differences users rely on.
- *Sources:* `FLTWebApp/fleet/FlightModify_alt2.aspx.vb:24`.
- **Answer:**

### Q5. Is `GetExportFile.aspx` how browser users download exports? (Blocking · Drop/Keep)
The x-ray graph marks it dormant. But `exportFlt.aspx` builds links to it, and the interactive export (`export.aspx`) may hand off to it for the download step. It serves any file in `~/download` by name.
- *Decides:* **it's the download path** → keep it (and fix the by-name file serving in step 05). **Not used** → drop it together with `exportFlt.aspx`.
- *Sources:* `FLTWebApp/export/exportFlt.aspx.vb:105`, `FLTWebApp/export/GetExportFile.aspx.vb:37`.
- **Answer:**

### Q6. Who consumes the `Download_*.xml` export files? (Blocking · Keep)
Every export flow ends when a file lands on disk: the console job's `DownloadPath`, the web app's `~/download`, or an operator's My Documents. Nothing in the repo reads those files.
- *Ask:* Which system or person reads them, and what does it do with them? Is the console job's `DownloadPath` the same folder the web app serves from? The console's App.config has no `appPrefix`, so its file names start with an empty prefix.
- *Decides:* whether the XML layout and file names are an external contract to keep byte-for-byte, or whether the export can be redesigned or dropped.
- *Sources:* `FLTExportConsoleApp/FLTExportConsoleApp/App.config:6-15`, RULE-212.
- **Answer:**

### Q7. How is the export console job triggered, and with what settings? (Blocking · Keep)
The repo contains no scheduler. The job needs the `FLT.Export.Auth` Credential Manager entry for its run-as account. An invalid `NbrOfDaysHistory` silently gives a 0-day window, and the run still exits 0.
- *Ask:* Which server, Task Scheduler task, schedule and account run it? What is `NbrOfDaysHistory` in production? Does anyone notice when a run produces nothing?
- *Decides:* what the replacement scheduler must reproduce (RULE-005, RULE-143), and whether "exit 0 on failure" is relied on or is a bug to fix.
- **Answer:**

### Q8. Is `setMeters` run by hand when a Hobbs meter is replaced? (Blocking · Drop/Keep)
No code calls it, but it changes aircraft meter offsets, which feed the core calculation airframe hours = Hobbs + offset (RULE-002, RULE-006).
- *Ask:* Who runs it, when, and with what inputs? Is the in-app configuration chaining (RULE-001) the normal path, or is this procedure?
- *Decides:* **run by hand** → it's an undocumented business process that the rewrite must turn into a screen. **Not run** → drop it.
- **Answer:**

### Q9. Is `database/FLT_Schema.sql` what production runs? (Blocking · Keep)
Rules were mined from the schema script and from three change scripts that were never folded in. Two of those scripts disagree with the schema:
- `DuplicateFlightKeyModification.sql` rewrites `addFlight` and adds the aircraft-hours roll-up (RULE-008).
- `alter_procedure_listAircraftInfos.sql` changes how aircraft usage is summed (RULE-024).
- *Ask:* Which version of `addFlight`, `updateFlight` and `listAircraftInfos` is in production? Are there triggers or computed columns that aren't in the script?
- *Decides:* which SQL rule cards describe live behaviour. Until then, every SQL-sourced P0 card stays unconfirmed.
- **Answer:**

### Q10. Where is the source for ContosoUtilities? (Blocking · Keep)
Every project references the Logger in `ContosoUtilities`, which is outside this repo. Two copies are referenced from two different paths (`..\..\Common\` and `..\..\..\VS2017_Common\`).
- *Decides:* whether the logging behaviour can be read and kept, or must be treated as a black box. Without it, nothing builds, and that blocks step 06's characterization tests.
- **Answer:**

---

## Part 2 · Production settings that switch rules on or off (keep decisions)

### Q11. Which business-rule switches are set to `N` in production? (Blocking · Keep)
Every flight and work-order validation rule can be turned off by an appSettings key named after its rule ID. The switch is `AppConfiguration.BusinessRuleEnabled` (`FLTBizObjects/DataAccess/AppConfig.vb:22`): a rule is **on** unless its key is present and set to `N`. No config in the repo sets any of them, so in the repo every rule is on.
- *Ask:* Show us the production `appSettings` for FLTWebApp, FLTWebAPI and FLTExportConsoleApp. Which overridable warnings do users override routinely?
- *Decides:* which validation rules the rewrite keeps as hard rules, which it keeps as warnings, and which it drops. The most important switch is `02-00-01B`: region time must add up to Hobbs time (RULE-004).
- *Note:* the RULE-004 card says the switch's definition "wasn't found". It's at `AppConfig.vb:22`; correct the card.
- **Answer:**

### Q12. What are the production login-lockout settings? (Blocking · Keep)
The code falls back to 3 failures and 5 minutes when a setting is missing (`AppConfig.vb:32-58`). The repo's FLTWebApp Web.config sets 5 failures and 10 minutes (`FLTWebApp/Web.config:79-80`). FltFleet and FLTWebAPI set neither, so they use the fallback. The failure count is also never reset by time, despite the field name `FailedPasswordAttemptWindowStart`.
- *Decides:* the values for RULE-175 and RULE-178. Also whether one lockout policy should cover all three sites, or whether the difference is intended.
- **Answer:**

### Q13. Which login path checks the password in production? (Blocking · Keep)
- `fltPassword` hashes passwords with a per-user salt and SHA-512 (RULE-003).
- The `fltValidateLogin` procedure compares the password as plain text, ignoring case (RULE-045, `FLT_Schema.sql:6743-6753`).

Both can't describe the same stored column.
- *Ask:* Are stored passwords hashed? Which code path does a login actually take?
- *Decides:* whether the rewrite must verify existing hashes (keep the exact scheme) or can force a reset of every password. It also tells us whether passwords are stored in plain text today, which goes to step 05.
- **Answer:**

### Q14. What do FltFleet's edit-window settings hold? (Blocking · Keep)
Who may change an aircraft's UP / DOWN / OFF TEST status depends on `ChangeTimeStart/Stop Hour/Minute For<RoleId>` settings, compared against a "Pacific time" the code derives from the server's own time zone (RULE-043, RULE-023).
- *Ask:* What are the production values? Which role IDs do they map to? Is the window meant to be Pacific time wherever the aircraft is based?
- *Decides:* the parameters for the P0 rule RULE-043. The answer also settles Q33.
- **Answer:**

### Q15. Who calls FLTWebAPI, and what are the fallback credentials? (Blocking · Keep/Fix)
A request with no Authorization header runs as the `userName`/`password` account in Web.config (RULE-181).
- *Ask:* Which devices or systems call the API? Do any of them rely on not sending credentials? What can the fallback account do?
- *Decides:* **nobody relies on it** → remove the fallback in step 05. **Relied on** → the rewrite needs a planned migration for those callers.
- **Answer:**

### Q16. Which databases are production, and what is `FLTReport`? (Blocking · Keep)
Connection strings name `dbserver05\sql2k5`, `dbserver02`, the `FLT` connection and a separate `FLTReport` connection, plus a Crystal logon.
- *Decides:* whether report rules read the same data as the screens. If `FLTReport` is a lagging copy, report figures will legitimately differ from screen figures, and the tests must allow for it.
- **Answer:**

---

## Part 3 · Rules to confirm before they become tests (keep decisions)

These are P0 or contract-shaping rules that the mining panel marked below High confidence, or that conflict with another rule. Each answer becomes a characterization test in step 06.

### Q17. Airframe hours: does the offset get added or subtracted? (Blocking)
- When a flight is saved, airframe hours = Hobbs + offset (RULE-002, RULE-006).
- The Web API's fleet endpoint reports `AirframeHoursCurrent` *minus* the offset (RULE-019, `FleetController.cs:96-97`).
- *Ask:* Is `Aircraft.AirframeHoursCurrent` stored as true airframe hours or as the meter reading? Do the API's clients use it to pre-fill Hobbs start?
- *Also confirm:* the code rounds each input to 0.1 *before* adding, so 1234.45 + 0.05 = 1234.6. Is 0.1 hour the official precision (RULE-016)?
- **Answer:**

### Q18. Should aircraft hours roll up from approved flights only? (Blocking)
The roll-up in `DuplicateFlightKeyModification.sql:180-195` runs when an *approved* flight is added, but its aggregate counts *all* active flights. So an unapproved flight with a higher reading can raise an aircraft's official hours (RULE-008). Aircraft usage in `listAircraftInfos` doesn't filter on approval either (RULE-024).
- *Decides:* the rule for the most-watched figure in the campaign: progress toward required hours.
- **Answer:**

### Q19. What does "approved" mean, and who approves? (Blocking)
- A validated save auto-approves the flight as the saving user (RULE-114).
- The Web API inserts flights unapproved (RULE-117).
- The `updateFlight` procedure re-stamps the approver on edits (RULE-119).
- Unapproved flights are hidden from the aircraft view (RULE-136).
- *Ask:* Who approves API-uploaded flights, and on which screen? Can approval be reversed? Must the original approver and date survive later edits?
- **Answer:**

### Q20. Are duplicate flights blocked today, or only reported? (Blocking)
`addFlight` raises "Duplicate Flight Entry" for the same aircraft, location, date and shift. But nothing stops the procedure afterwards, so the INSERT runs unless the caller rolls back (RULE-044, `FLT_Schema.sql:3847-3855`). The one-off backfill `zFix_Set_Flight_DuplicateCount` can't run as written: line 72 fetches from the wrong cursor.
- *Ask:* Does production contain duplicate flights? Was the `DuplicateCount` column ever added and backfilled? Should soft-deleted flights count as duplicates?
- *Decides:* whether the rewrite hard-blocks duplicates, and whether existing data needs cleaning before migration. If the backfill was never run, drop `zFix_*`.
- **Answer:**

### Q21. Overnight and late flights: are the cut-offs intended? (Blocking)
- A return is moved to the next day only when its *hour* is earlier than the departure hour (RULE-010).
- Comments and engine runs move to the next day only when the departure is at or after 16:00 (RULE-011).
- *Ask:* Is 16:00 a deliberate "night flight" rule? Do flights ever cross midnight with a departure before 16:00?
- *Decides:* the date-time rules every flight passes through. See also Q27.
- **Answer:**

### Q22. Is `ConcurrencyId` a SQL `rowversion`? (Blocking)
Optimistic concurrency (RULE-036) works only if the column changes automatically on every write. The DAL also packs it into an Int64 that overflows at high values (RULE-018).
- *Decides:* whether the rewrite can use the database's native concurrency token, or must copy the existing encoding.
- **Answer:**

### Q23. What are the work-order statuses and allowed transitions? (Blocking)
Neither the business object nor the stored procedures enforce any transition (RULE-133, RULE-137, RULE-166). Saving an open work order without an end meter overwrites a recorded end meter with 0.
- *Ask:* Must a work order have a finish date, end meter or mechanic before it can be closed? Is that enforced by people, by the UI, or not at all?
- *Decides:* whether the rewrite adds a lifecycle (new behaviour) or keeps "any status, any time".
- **Answer:**

### Q24. What are the aircraft statuses, and must an aircraft reach its required hours before it finishes testing? (Blocking)
`TotalRequiredUsage`, `AccumUsage` and the end-of-test dates are stored, but no transition is enforced (RULE-134, RULE-164).
- **Answer:**

### Q25. Must a work order and its children save all-or-nothing? (Blocking)
RULE-116 says the work order and its child records save in one transaction, but some writes run outside it:
- document metadata updates (`WorkOrderDB.vb:600`);
- performed-work adds from the grid (RULE-152);
- the business-layer insert path, which has no shared transaction (RULE-128).
- *Decides:* whether the test asserts full rollback, which is what the code's structure intends, or the partial saves that happen today.
- **Answer:**

### Q26. Are the liquid-fill limits right? (Blocking)
The limits are:
- Jet-A: 150 gal / 600 L / 600 qt
- Coolant: 5 gal / 20 L / 20 qt
- Hydraulic: 7 gal / 30 L / 30 qt

600 qt equals 150 gal, but the coolant and hydraulic quart limits are about 4× their gallon limits (RULE-057).
- *Decides:* whether the quart limits are a typo to fix or a deliberate rule to keep, and whether limits should be set per aircraft model.
- **Answer:**

---

## Part 4 · Suspected defects: keep the behaviour or fix it

Each of these defects has been producing data, or feeding a downstream consumer, for years. Fixing it changes numbers people may already rely on, so the developer has to say whether anyone depends on today's behaviour.

### Q27. Same-hour overnight returns (Blocking · Fix)
A flight that leaves at 23:50 and returns at 23:10 the next day is stored as returning *before* it left (`FlightManager.vb:471`). Separately, editing a flight doesn't recompute its engine-run times, although creating one does (RULE-114).
- *Ask:* Have such flights happened? Has anyone corrected them by hand?
- *Decides:* fix it in the rewrite, and decide whether migration corrects historical rows.
- **Answer:**

### Q28. Region-time false mismatches (Blocking · Fix)
Region hours are summed from values rounded to 0.1, then compared exactly with an unrounded Hobbs difference (RULE-004, `Flight.vb:1374-1382`). That can raise a hard error on a correct flight.
- *Ask:* Is this why `02-00-01B` might be switched off in production (Q11)?
- **Answer:**

### Q29. Export creates `AircraftLocation` rows (Blocking · Keep/Fix)
Running an export inserts missing aircraft-location rows stamped `export` (RULE-122, RULE-123).
- *Decides:* if it's intended data repair, the rewrite must keep it somewhere explicit. If it's a workaround for a flight-entry bug, fix the bug and drop the side effect. Do any reports depend on those rows?
- **Answer:**

### Q30. Program completion % ignores earlier assignments (Blocking · Fix, if Q3 keeps the reports)
Program-level percent complete counts only hours at currently qualifying locations, so hours from ended assignments are left out (RULE-026). Usage at a location also merges two separate stays at the same base (RULE-025).
- *Ask:* Do program managers report this number upward? Have they noticed it running low?
- **Answer:**

### Q31. "Fuel Burn" is hours per unit of fuel, not fuel per hour (Fix, if Q3 keeps the reports)
The report's `Usage` column is the inverse of what the name suggests (RULE-028). `LiquidAmt DECIMAL(6,3)` also overflows at 1,000 or more.
- *Decides:* fix the label and the formula, or keep them because analysts already convert the figures.
- **Answer:**

### Q32. Outlier and daily-usage reports include rows they shouldn't (Fix, if Q3 keeps the reports)
- Outlier statistics include deleted and inactive flights (RULE-030).
- The daily-usage report's `<> NULL` comparisons never match, so end-of-test dates always come back empty (RULE-101).
- **Answer:**

### Q33. The fleet board's time-zone code (Blocking · Fix)
- `AircraftStatusManager.vb:93` checks "central" twice, so Central-zone servers get no correction. The second check was almost certainly meant to be "pacific".
- `AircraftStatus.vb:110` uses UTC−9 for Pacific Daylight Time. PDT is UTC−7.
- *Ask:* Which time zone are the FltFleet servers in?
- *Decides:* whether the edit windows (Q14) and last-update times have been off by hours in production, and so whether users adapted their habits to the wrong times.
- **Answer:**

### Q34. The time-zone admin page saves the standard offset as the DST offset (Fix)
`TimeZones.aspx.vb:134` pre-fills the DST offset box with `TimeZoneOffset`. Unless the admin corrects the box, that value is saved, and every UTC conversion for that zone in daylight-saving time then uses the wrong offset (RULE-079, RULE-219).
- *Ask:* Who maintains the DST begin and end dates each year? Can we compare the stored offsets with real zones?
- *Decides:* whether migration must repair `UTCTimeZone` rows, and the UTC times of the flights derived from them.
- **Answer:**

### Q35. The OFF TEST page shows the whole fleet (Fix)
The page and its button suggest an OFF TEST-only view, but its query also returns every UP and DOWN aircraft (RULE-226).
- *Decides:* filter it, or rename it "All aircraft" because that's how people use it.
- **Answer:**

---

## Left out of this guide, and why

These came from the same four sources but failed the filter, because no answer would change what we drop, keep or fix:

- **Security defects we fix regardless.** Examples: plaintext passwords sent by email, password reset without verification, missing `CanEdit` checks, VB `Or` instead of `OrElse` in the login guards, permissive defaults on users and roles, and credentials in URLs. These go to step 05 (Secure); the developer's opinion doesn't decide them.
  - RULE-038, 041, 182, 185, 186, 191, 192, 193, 194, 197, 200, 201, 223, 230
  - x-ray questions on `BatchLoginMode` and password email
- **Plain bugs with no data impact.** Examples:
  - the Web API read-back assigns fields to themselves (RULE-083);
  - `Case "else"` (RULE-093);
  - the 'Only Deleted' filter value (RULE-096);
  - `SendFile` writes full buffers (RULE-092);
  - duplicate dropdown entries (RULE-063);
  - shared rule IDs (RULE-052, 055, 073, 074);
  - `application\octet` (RULE-245).

  Fix them in the rewrite without asking.
- **Questions the code already answers.** Examples: where DST is applied (`FlightManager.vb:521-536`), and whether lookup reads need permission (they don't; RULE-197 is a step-05 item).
- **Questions about code we're dropping.** FLTDownloadTool's external endpoint, and FLTExportClient's fixed 01-Jan-2000 date. The client confirmed FLTDownloadTool is retired; FLTExportClient's operators can be asked directly.
- **Taste questions.** Comment rating scales, display sort order, error-page wording and the meaning of free-text checklist values. Let the product owner decide them in the rewrite.
- **Folded into a question above.** Most of the 112 SME questions on rule cards were duplicates of a broader question here: approval → Q19, statuses → Q23 and Q24, soft delete → Q9, and program forecasting fields → Q3 and Q16.

If an answer in Parts 1–2 changes the scope, for example the Crystal reports turn out to be live, re-run this filter over the rule cards for the newly live code.
