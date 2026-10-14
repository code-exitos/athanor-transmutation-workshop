# Flight Log Workshop

Take a 75k-line legacy system nobody fully understands and turn it into a verified cleanup list, a rulebook and an interview guide, using the [codebase-xray](https://github.com/code-exitos/codebase-xray) plugin in Claude Code.

The system is **Contoso Flight Log Tracking (FLT)**. It's VB.NET and C# on .NET Framework: 9 projects, 62 tables and about 380 stored procedures. All companies, people, aircraft and data in this repository are fictional.

## The scenario

**Contoso Aerospace** builds the CA-200, a small twin turboprop. Before the CA-200 can be certified, its flight-test center has to fly a set of test aircraft for a required number of hours. This is a *function and reliability* (F&R) campaign: fly the aircraft the way customers will, log everything, and fix what breaks.

FLT is the system the flight-test center runs that campaign on. Every flight is logged in it: Hobbs and engine hours, takeoff weight, where the aircraft flew, fuel and fluids added, and pilot observations. Engineers watch each aircraft's progress toward its required hours, and mechanics close out squawks against work orders.

FLT was written over many years by a small team. The developer who knows it best is leaving. Your job, as the team that will modernize it:

1. **Map** what is there and what still runs.
2. **Prune** what can be dropped safely.
3. **Untangle** what the code actually decides: the business rules.
4. **Capture** what only the departing developer can answer, before they go.
5. **Secure** what is dangerous right now.
6. **Prove** the migration with tests written from the rules.

### Who uses FLT

| Role | What they do in FLT |
|---|---|
| Program manager | Owns a test campaign (a *program*): its aircraft, bases, lookup lists and approvals |
| Flight-test engineer | Tracks each aircraft's configuration, test assignments and progress to required hours |
| Pilot | Flies the test profiles; their observations become flight comments |
| Data entry | Types flight logs into FLT after each flight |
| Mechanic | Services aircraft, adds fluids, works squawks and work orders |
| Viewer | Read-only access to reports |

Two programs are loaded: **CA-200 Function & Reliability** (12 aircraft, three bases) and **CA-200F Cargo Variant** (8 aircraft, two bases).

## Domain glossary

You'll meet these terms in the code, the database and the rules.

| Term | Meaning | In the code |
|---|---|---|
| Program | One test campaign, with its own aircraft, bases and lookup lists | `Program`, `ProgId` |
| Aircraft | A test aircraft | `Aircraft` (the collection class is `Fleet`) |
| Ship number | Flight-test nickname for an aircraft, such as "Ship 3" | `ShipNbr` |
| MSN | Manufacturer serial number | `MSN` |
| Registration | Tail number painted on the aircraft | `RegistrationNbr` |
| Flight | One logged flight: departure, return, readings, weights | `Flight` |
| Hobbs | The cockpit hour meter, read at engine start and shutdown | `HobbsStart`, `HobbsEnd`, `HobbsReading` |
| Airframe hours | Total time on the aircraft: the Hobbs reading plus an offset (the offset changes when a Hobbs meter is replaced) | `AirframeHours*`, `*MeterOffset`, `AirframeHoursOffset` |
| Meter unit | How hours are recorded: decimal hours or hours:minutes | `MeterUnit` |
| Engine hours | Engine run time, tracked separately from Hobbs | `EngineHours*` |
| Region time | Hours flown in each test-range airspace block. They must add up to the flight's hours | `FlightRegionTime`, `Region` |
| Base | The airfield a test aircraft operates from | `Location` |
| Test profile | A planned flight pattern from a base | `Route` (`SchedRouteId`, `FlownRouteId`) |
| Takeoff weight | Airframe + cargo bay loads + water ballast | `TakeoffWeight`, `AirframeWeightID`, `Cargo1/2WeightId`, `BallastWeightID`, `WeightDef` |
| Loading config | The center-of-gravity setup for the flight | `LoadingConfig` |
| Liquid fill | Jet-A, oil, hydraulic fluid or de-ice fluid added to an aircraft | `LiquidFill` |
| Engine run | A maintenance ground run of the engines, with start and end times | `FlightEngineRun` |
| FTI | Flight-test instrumentation: data recorders checked before and after each flight | `PreFlightFtiOK`, `PostFlightFtiOK` |
| Required hours | Hours an aircraft must fly before its test ends | `TotalRequiredUsage`, `RequiredUsage`, `AccumUsage` |
| Maturity | Build state of a part: prototype, conforming or production | `MaturityDef` |
| APU | Auxiliary power unit | `APUType`, `APUSerialNbr` |
| Squawk | A reported defect that becomes a work order | `SquawkNbr`, `WorkOrder` |

## The system

| Project | What it is |
|---|---|
| `FLTWebApp` | The main ASP.NET Web Forms site (VB.NET): flights, aircraft, programs, reports, security |
| `FLTBizObjects` | Business objects, managers and data access (VB.NET). Most of the rules live here |
| `FltFleet` | A smaller Web Forms site for aircraft status |
| `FLTWebAPI` | ASP.NET Web API (C#) used by data-entry clients |
| `FLTRestService` | Older WCF REST service (C#), with a sample client in `FLTRestClient` |
| `FLTExportClient` | WinForms tool that calls the site's export pages over HTTP |
| `FLTExportConsoleApp` | Scheduled export job |
| `FLTDownloadTool` | Very old WinForms utility |
| `database/` | Schema, sample data and a ready-to-restore backup. See [database/README.md](database/README.md) |
| `tsql/` and root `.sql` files | One-off change scripts that were never folded into the schema |

The projects target .NET Framework, so they won't build on a Mac or Linux machine. The workshop doesn't need a build: every step reads the code. The database is optional and is there so you can check what you find against real rows.

## Quick start

1. Open <https://github.com/code-exitos/flight-log-workshop> and sign in with a **personal** GitHub account (not an employer-managed one).
2. Click **Use this template** → **Create a new repository**.
3. Set **Owner** to your account, keep the name `flight-log-workshop`, choose **Private**, and **tick "Include all branches."** Click **Create repository**.
4. In your new repo, click **Code → Codespaces**, then **…** → **New with options**. Pick branch `snapshot/00-start` and click **Create codespace**. Setup takes a few minutes the first time.
5. In the terminal run `bash scripts/workshop-check.sh` and fix any ✘ it shows.
6. Type `claude` and log in with your Claude account. When Claude Code asks whether to trust this folder, say yes: that turns on the codebase-xray plugin.
7. Give Claude the first prompt: `x-ray this codebase`.
8. When the session ends, delete your codespace at <https://github.com/codespaces> and delete your copy of the repository (Settings → Danger Zone). The [license](LICENSE) asks for this.

### Running locally (fallback)

Needs Git, Python 3.8+, Node 22+ (Node only renders diagrams to SVG) and Claude Code. Replace `YOUR-USER` with your GitHub user name. Do this after you create your own copy (steps 1 to 3).

```bash
git clone https://github.com/YOUR-USER/flight-log-workshop.git
cd flight-log-workshop
git switch snapshot/00-start
bash scripts/workshop-check.sh
claude
```

If the plugin doesn't load, run `/plugin marketplace add code-exitos/codebase-xray` and `/plugin install codebase-xray@codebase-xray` inside Claude Code, then `/reload-plugins`.

The database is optional; the workshop doesn't need a build. To run it in Docker, see [database/README.md](database/README.md).

### Workshop infrastructure

`.devcontainer/`, `.claude/settings.json` and `scripts/` set up the Codespace, the plugin and the setup check. They are not part of the FLT system.

## How the workshop runs

Each step is a *story*: a question, a prompt you give Claude, and a result you review. Every step ends on a branch, and each branch builds on the one before it. If you fall behind, or your run is still going, `git switch snapshot/0N-<step>` and carry on (commit or stash your own changes first). LLM output differs from run to run, so your numbers won't match the reference exactly.

| Story | Question it answers | Skill | Snapshot |
|---|---|---|---|
| 01 Map | What is there, and what still runs? | `codebase-xray` (Phases 0–1) | `snapshot/01-map` |
| 02 Prune | What can we safely drop? | `codebase-xray` (Phases 2–5) | `snapshot/02-prune` |
| 03 Untangle | What does the code actually decide? | `extract-rules` | `snapshot/03-untangle` |
| 04 Capture | What must we ask the authors before they leave? | in-session | `snapshot/04-capture` |
| 05 Secure | What is dangerous right now? | `security-sweep` | live demo |
| 06 Prove | How do we migrate with proof? | code-modernization plugin | facilitator demo |

Every output lands in `context/brownfield/`. Reference transcripts for each step (prompts, replies, tool calls and the questions Claude asked) are in `workshop/transcripts/` on each snapshot branch.

### 01 · Map

**Prompt:** `x-ray this codebase`

Claude proposes a set of modules and waits for your yes, so this is where you narrow scope. It then builds a dependency graph walked from the real entry points (pages, services, scheduled jobs) and stops with counts of active, dormant, unknown and orphaned code. **Question the result before any agents run.** Legacy .NET hides callers in places a static graph misses: pages called over HTTP by a desktop client, VB modules whose members are called without the module name, and stored procedures named in strings.

### 02 · Prune

**Prompt:** answer Claude's Phase 1 question, and the workflow runs.

Each drop candidate is handed to agents that try to prove it is still used. Only what survives that is marked safe to drop. You also get three stakeholder pages: class structure, system I/O map and information lifecycle.

### 03 · Untangle

**Prompt:** `extract the business rules`

Rules are mined only from live code, one shard per module. Each rule card cites its source lines and is written as Given/When/Then. Good discussion points: which modules to skip (thin wrappers, CRUD-only tables) and whether to add the SQL change scripts. Look at the calculation rules about Hobbs, offsets and region time. That's where the system's real decisions are.

### 04 · Capture

**Prompt:** `build an interview guide for the original developer from the x-ray questions, contested items, rule SME questions and suspected defects; keep only questions whose answer changes what we drop, keep or fix`

### 05 · Secure (live demo)

From `snapshot/04-capture`: `find what's dangerous in this codebase and fix it first`. Every module is swept against an OWASP-based checklist. Two agents try to refute each Critical and High finding, and Claude fixes only the ones you pick.

### 06 · Prove (facilitator demo)

Characterization tests are written from the top-priority rule cards, then a port has to pass them.

## License

This repository is **not open source**. It is licensed under the [Athanor Workshop License 1.0](LICENSE), which lets you use it only from your invitation to an Athanor workshop run by CODE Éxitos until that session ends:

- **You may** copy it into one private repository of your own, open it in a Codespace or clone it, read it, run it, change it and analyze it with AI coding assistants to prepare for and take part in the session.
- **You may not** publish or share it or any changed version, keep a public fork, use it commercially or to teach other courses, or use it to train AI models.
- **When the session ends**, delete your copies, including your repository copy and your Codespace. Your own notes are fine.

The jQuery, jQuery UI, Bootstrap, Modernizr and Respond.js files are third-party and keep their own licenses. NuGet packages and the Crystal Reports viewer files are not included; the workshop doesn't need a build.
