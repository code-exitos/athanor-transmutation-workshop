# Business Rules — FLT

At extraction: 251 confirmed rules (41 P0); later steps may add or correct rules below. Each citation was checked by a second agent that read the cited lines; 4 candidate rules were refuted and left out.

| ID | Name | Category | Priority | Source | Confidence |
|---|---|---|---|---|---|
| RULE-001 | Aircraft configuration meter chaining | Calculation | P0 | `FLTBizObjects/BusinessLogic/AircraftManager.vb:101-139` | High |
| RULE-002 | Flight starting airframe hours = Hobbs start + meter offset | Calculation | P0 | `FLTBizObjects/BusinessLogic/FlightManager.vb:58` | Medium |
| RULE-003 | Password hashing with per-user salt | Calculation | P0 | `FLTBizObjects/BusinessLogic/fltPassword.vb:8-33` | High |
| RULE-004 | Flight meter readings must run forward, and region time must add up to Hobbs us… | Calculation | P0 | `FLTBizObjects/BusinessObject/Flight.vb:1360-1383` | High |
| RULE-005 | Export change window: look back a configured number of days | Calculation | P0 | `FLTExportConsoleApp/FLTExportConsoleApp/Program.vb:57-73` | Medium |
| RULE-006 | Flight airframe hours = Hobbs meter reading + meter offset | Calculation | P0 | `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:159-160` | Medium |
| RULE-007 | Flight total hours and ending airframe hours from Hobbs meter | Calculation | P0 | `FLTWebApp/fleet/FlightModify.aspx.vb:249-256` | High |
| RULE-008 | Recalculate aircraft airframe and engine hours when an approved flight is added | Calculation | P0 | `tsql/DuplicateFlightKeyModification.sql:180-195` | High |
| RULE-009 | Latest configuration and latest location selection | Calculation | P1 | `FLTBizObjects/BusinessLogic/AircraftManager.vb:642-660` | High |
| RULE-010 | Flight departure/return times converted to UTC with overnight rollover | Calculation | P1 | `FLTBizObjects/BusinessLogic/FlightManager.vb:466-475` | High |
| RULE-011 | Late-departure comments and engine runs roll to next day | Calculation | P1 | `FLTBizObjects/BusinessLogic/FlightManager.vb:477-505` | High |
| RULE-012 | Local-to-UTC conversion with location daylight-saving window | Calculation | P1 | `FLTBizObjects/BusinessLogic/FlightManager.vb:521-536` | High |
| RULE-013 | Random password generation | Calculation | P1 | `FLTBizObjects/BusinessLogic/fltPassword.vb:35-83` | High |
| RULE-014 | Fault and work meter readings and fault date normalization | Calculation | P1 | `FLTBizObjects/BusinessObject/WorkOrder.vb:196-228` | Medium |
| RULE-015 | Takeoff weight defaults to sum of component weights | Calculation | P1 | `FLTBizObjects/DataAccess/FlightDB.vb:565-570` | Medium |
| RULE-016 | Meter, hour and liquid readings are rounded to fixed precision | Calculation | P1 | `FLTBizObjects/DataAccess/FlightDB.vb:579-601` | Medium |
| RULE-017 | Weight definitions stored as whole numbers | Calculation | P1 | `FLTBizObjects/DataAccess/WeightDefDB.vb:123-131` | High |
| RULE-018 | Record version stamp encoded as a decimal string | Calculation | P1 | `FLTBizObjects/DataAccess/dalUtility.vb:9-34` | High |
| RULE-019 | Aircraft current airframe hours shown net of the offset | Calculation | P1 | `FLTWebAPI/FltWebApi/Controllers/FleetController.cs:96-97` | Medium |
| RULE-020 | Interactive export cutoff: default yesterday or full history | Calculation | P1 | `FLTWebApp/export/export.aspx.vb:41-56` | High |
| RULE-021 | New flight starting meter values default from aircraft's current readings | Calculation | P1 | `FLTWebApp/fleet/FlightModify.aspx.vb:399-411` | High |
| RULE-022 | Liquid fill airframe-hours reading derived from Hobbs reading | Calculation | P1 | `FLTWebApp/fleet/FlightModify.aspx.vb:543-602` | Medium |
| RULE-023 | Current Pacific Time derivation for edit window | Calculation | P1 | `FltFleet/AircraftStatusManager.vb:85-97` | High |
| RULE-024 | Aircraft accumulated flight usage (Hobbs total) | Calculation | P1 | `database/FLT_Schema.sql:12905-12937` | Medium |
| RULE-025 | Usage accumulated at a test location | Calculation | P1 | `database/FLT_Schema.sql:13142-13182` | High |
| RULE-026 | Location and program test-completion percentage | Calculation | P1 | `database/FLT_Schema.sql:14434-14471` | High |
| RULE-027 | Fuel burn running totals and average per aircraft | Calculation | P1 | `database/FLT_Schema.sql:14831-14864` | High |
| RULE-028 | Fuel/liquid usage per refill interval | Calculation | P1 | `database/FLT_Schema.sql:14855-14942` | High |
| RULE-029 | Flight usage hours per flight | Calculation | P1 | `database/FLT_Schema.sql:15049-15051` | Medium |
| RULE-030 | Flight outlier detection by standard deviation | Calculation | P1 | `database/FLT_Schema.sql:15144-15233` | High |
| RULE-031 | Export meter and check-value conversions | Calculation | P2 | `FLTBizObjects/BusinessLogic/FltExportManager.vb:351-376` | High |
| RULE-032 | Export UTC offset notation | Calculation | P2 | `FLTBizObjects/BusinessLogic/FltExportManager.vb:484-504` | High |
| RULE-033 | Meter readings stored as decimals and shown to one decimal place | Calculation | P2 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:404-411` | High |
| RULE-034 | Flight time split across operating regions | Calculation | P2 | `FLTWebAPI/FltWebApi/Models/RegionTime.cs:11-16` | Low |
| RULE-035 | Last-update timestamp displayed in Pacific Time | Calculation | P2 | `FltFleet/AircraftStatus.vb:105-120` | High |
| RULE-036 | Optimistic concurrency: reject a save when someone else edited the record first | Validation | P0 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:215-230` | Medium |
| RULE-037 | Unattended export must run as an authenticated, authorized FLT service user | Validation | P0 | `FLTExportConsoleApp/FLTExportConsoleApp/Program.vb:37-47` | Medium |
| RULE-038 | Only logged-in users may view application pages | Validation | P0 | `FLTWebApp/FLT.Master.vb:17-30` | High |
| RULE-039 | Uploads are limited to file extensions registered as Document Types | Validation | P0 | `FLTWebApp/documents/DocumentAdd.aspx.vb:63-76` | High |
| RULE-040 | One flight per aircraft, location, date and work shift | Validation | P0 | `FLTWebApp/fleet/FlightModify.aspx.vb:141-180` | High |
| RULE-041 | Program report pages require a logged-in session | Validation | P0 | `FLTWebApp/reports/rptFleet.aspx.vb:17-22` | High |
| RULE-042 | Self-service password change requires old password and matching confirmation | Validation | P0 | `FLTWebApp/userProfile/ChangePassword.aspx.vb:28-45` | High |
| RULE-043 | Aircraft status editing requires Fleet CanEdit plus a role time window | Validation | P0 | `FltFleet/AircraftStatusManager.vb:26-59` | Medium |
| RULE-044 | Duplicate flight entry check (aircraft + location + date + shift) | Validation | P0 | `database/FLT_Schema.sql:3847-3855` | Medium |
| RULE-045 | Login credential and account-status check | Validation | P0 | `database/FLT_Schema.sql:6743-6753` | High |
| RULE-046 | Overridable warnings versus hard errors | Validation | P1 | `FLTBizObjects/BusinessLogic/BrokenRuleManager.vb:8-37` | High |
| RULE-047 | Flight key selection must be complete and consistent | Validation | P1 | `FLTBizObjects/BusinessLogic/FlightKeyInfoManager.vb:13-61` | High |
| RULE-048 | Time-of-day entry format | Validation | P1 | `FLTBizObjects/BusinessLogic/FlightManager.vb:507-519` | High |
| RULE-049 | Child record validation rejects the change and shows errors on the parent | Validation | P1 | `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:118-134` | High |
| RULE-050 | Login account eligibility check | Validation | P1 | `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:23-36` | High |
| RULE-051 | Aircraft master data required fields and lengths | Validation | P1 | `FLTBizObjects/BusinessObject/Aircraft.vb:746-843` | High |
| RULE-052 | Aircraft configuration period and component requirements | Validation | P1 | `FLTBizObjects/BusinessObject/AircraftConfiguration.vb:617-762` | High |
| RULE-053 | Document Type definition: extension and MIME type | Validation | P1 | `FLTBizObjects/BusinessObject/DocumentType.vb:74-87` | Medium |
| RULE-054 | Flight record required data and configurable pre/post-flight checks | Validation | P1 | `FLTBizObjects/BusinessObject/Flight.vb:1173-1310` | High |
| RULE-055 | Flight start meters must continue from the aircraft's current meters | Validation | P1 | `FLTBizObjects/BusinessObject/Flight.vb:1368-1390` | Medium |
| RULE-056 | Flight duration and engine run sanity limits | Validation | P1 | `FLTBizObjects/BusinessObject/Flight.vb:1392-1398` | Medium |
| RULE-057 | Liquid fill quantity limits by fluid and unit | Validation | P1 | `FLTBizObjects/BusinessObject/Flight.vb:1400-1437` | Medium |
| RULE-058 | Comment rating scale and length limits | Validation | P1 | `FLTBizObjects/BusinessObject/FlightComment.vb:307-358` | High |
| RULE-059 | Engine run must have valid start and end times in order and a non-zero speed | Validation | P1 | `FLTBizObjects/BusinessObject/FlightEngineRun.vb:258-282` | High |
| RULE-060 | Liquid fill record completeness and amount range | Validation | P1 | `FLTBizObjects/BusinessObject/LiquidFill.vb:346-411` | High |
| RULE-061 | Location requirements | Validation | P1 | `FLTBizObjects/BusinessObject/Location.vb:267-299` | Medium |
| RULE-062 | Region code and name requirements | Validation | P1 | `FLTBizObjects/BusinessObject/Region.vb:123-161` | Medium |
| RULE-063 | A route must belong to an active location and have a time zone | Validation | P1 | `FLTBizObjects/BusinessObject/Route.vb:211-249` | Medium |
| RULE-064 | Engineer and mechanic comment content rules | Validation | P1 | `FLTBizObjects/BusinessObject/WOEngineerComment.vb:266-304` | High |
| RULE-065 | Child lines must reference a parent work order | Validation | P1 | `FLTBizObjects/BusinessObject/WOReason.vb:188-194` | Medium |
| RULE-066 | Free-text work order lines (reason, instruction, performed work) | Validation | P1 | `FLTBizObjects/BusinessObject/WOReason.vb:195-211` | High |
| RULE-067 | Weight definition required fields and description charset | Validation | P1 | `FLTBizObjects/BusinessObject/WeightDef.vb:253-270` | Medium |
| RULE-068 | Work order date validity (request, due, finish) | Validation | P1 | `FLTBizObjects/BusinessObject/WorkOrder.vb:248-302` | High |
| RULE-069 | Work order mandatory header fields | Validation | P1 | `FLTBizObjects/BusinessObject/WorkOrder.vb:837-925` | Medium |
| RULE-070 | Work order reference-number and disposition length limits | Validation | P1 | `FLTBizObjects/BusinessObject/WorkOrder.vb:872-928` | High |
| RULE-071 | Due date and due time must be given together; time-of-day format | Validation | P1 | `FLTBizObjects/BusinessObject/WorkOrder.vb:890-915` | High |
| RULE-072 | Work order aggregate validation rolls up all child lines | Validation | P1 | `FLTBizObjects/BusinessObject/WorkOrder.vb:930-976` | Medium |
| RULE-073 | Work order part identification and field lengths | Validation | P1 | `FLTBizObjects/BusinessObject/WorkOrderPart.vb:280-335` | High |
| RULE-074 | Part quantities must be whole numbers 0-999 | Validation | P1 | `FLTBizObjects/BusinessObject/WorkOrderPart.vb:312-353` | High |
| RULE-075 | Configuration lookup values per program and lookup type | Validation | P1 | `FLTBizObjects/BusinessObject/fltLookupBase.vb:111-145` | Medium |
| RULE-076 | Only aircraft comments can be added from the aircraft record | Validation | P1 | `FLTBizObjects/DataAccess/AircraftDB.vb:535-581` | High |
| RULE-077 | Aircraft test assignments are added only once | Validation | P1 | `FLTBizObjects/DataAccess/AircraftDB.vb:591-611` | High |
| RULE-078 | Duplicate flight entries are rejected | Validation | P1 | `FLTBizObjects/DataAccess/FlightDB.vb:445-456` | Medium |
| RULE-079 | Daylight-saving begin/end dates are only stored when they are valid dates | Validation | P1 | `FLTBizObjects/DataAccess/UTCTimeZoneDB.vb:121-140` | High |
| RULE-080 | Exactly one listed file must be selected before fetching | Validation | P1 | `FLTExportClient/FltExportClient.vb:66-81` | High |
| RULE-081 | File list response validation and record mapping | Validation | P1 | `FLTExportClient/FltExportManager.vb:105-127` | High |
| RULE-082 | Flight upload is all-or-nothing with its child records | Validation | P1 | `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:100-122` | High |
| RULE-083 | Flight read-back drops hydraulic level, work shift and meter offset | Validation | P1 | `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:313-343` | High |
| RULE-084 | Records are only returned within their program/location/aircraft scope | Validation | P1 | `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:34-41` | High |
| RULE-085 | Weights are free-text with a separate unit (not validated as numbers) | Validation | P1 | `FLTWebAPI/FltWebApi/Models/Airframe.cs:13-16` | Medium |
| RULE-086 | Pre-flight and post-flight checklist results recorded per flight | Validation | P1 | `FLTWebAPI/FltWebApi/Models/Flight.cs:29-49` | Low |
| RULE-087 | Login authentication with a single generic failure message | Validation | P1 | `FLTWebApp/Login.aspx.vb:17-34` | High |
| RULE-088 | Program numeric parameters must be well-formed numbers | Validation | P1 | `FLTWebApp/appConfiguration/programs.aspx.vb:135-175` | High |
| RULE-089 | Uploaded document must be present and no larger than 10 MB | Validation | P1 | `FLTWebApp/documents/DocumentAdd.aspx.vb:29-37` | High |
| RULE-090 | Overridable warnings on document edits (unwired) | Validation | P1 | `FLTWebApp/documents/documentsList.aspx.vb:173-208` | Medium |
| RULE-091 | Automated export creation requires a valid changes-since date | Validation | P1 | `FLTWebApp/export/autoCreateFile.aspx.vb:27-52` | High |
| RULE-092 | Fetch an export file only when the name matches exactly one file | Validation | P1 | `FLTWebApp/export/autoFetchFile.aspx.vb:28-69` | High |
| RULE-093 | Batch login credential source is set by BatchLoginMode | Validation | P1 | `FLTWebApp/export/autoUtilityProcs.vb:14-63` | High |
| RULE-094 | Document upload requirements for work orders | Validation | P1 | `FLTWebApp/fleet/WorkOrderModify.aspx.vb:895-946` | High |
| RULE-095 | Program profile maintenance, including the usage planning figures | Validation | P1 | `FLTWebApp/program/ProgramProfile.aspx.vb:62-103` | Medium |
| RULE-096 | The 'Only Deleted' filter on Routes and Weight Tracking returns non-deleted rec… | Validation | P1 | `FLTWebApp/program/Routes.aspx:33-37` | High |
| RULE-097 | Empty report results block the download | Validation | P1 | `FLTWebApp/reports/rptRoutes.aspx.vb:39-43` | High |
| RULE-098 | Self-service profile update limited to contact and organizational fields | Validation | P1 | `FLTWebApp/userProfile/UserProfile.aspx.vb:75-112` | Medium |
| RULE-099 | Fleet visibility requires Fleet CanView permission | Validation | P1 | `FltFleet/AircraftStatusManager.vb:13-24` | High |
| RULE-100 | Login required for all fleet pages; session lifetime | Validation | P1 | `FltFleet/Default.aspx.vb:12-16` | High |
| RULE-101 | Daily usage report: aircraft assigned to a location on a date | Validation | P1 | `database/FLT_Schema.sql:14306-14365` | Medium |
| RULE-102 | Flight data report: liquids per flight and record eligibility | Validation | P1 | `database/FLT_Schema.sql:15074-15095` | Medium |
| RULE-103 | Comment type validation and aircraft comment ordering | Validation | P2 | `FLTBizObjects/BusinessLogic/AircraftManager.vb:285-329` | Medium |
| RULE-104 | Aircraft location stay dates | Validation | P2 | `FLTBizObjects/BusinessObject/AircraftLocation.vb:344-378` | High |
| RULE-105 | Document upload acceptance | Validation | P2 | `FLTBizObjects/BusinessObject/DocumentInfo.vb:229-268` | High |
| RULE-106 | Reference data (program, location, region, route) required fields | Validation | P2 | `FLTBizObjects/BusinessObject/Route.vb:211-247` | High |
| RULE-107 | Time zone daylight-saving definition | Validation | P2 | `FLTBizObjects/BusinessObject/UTCTimeZone.vb:177-211` | High |
| RULE-108 | Weight tracking type description rule | Validation | P2 | `FLTBizObjects/BusinessObject/WeightDefType.vb:101-106` | High |
| RULE-109 | Optional test-end and arrival dates are stored only when they are valid dates | Validation | P2 | `FLTBizObjects/DataAccess/AircraftDB.vb:216-227` | Medium |
| RULE-110 | User account dates before 1800 are treated as not set | Validation | P2 | `FLTBizObjects/DataAccess/FltUserDB.vb:130-160` | Medium |
| RULE-111 | Parent save disabled while any child row is being edited | Validation | P2 | `FLTWebApp/fleet/FlightModify.aspx.vb:604-621` | High |
| RULE-112 | Comment rating scale 1 to 10 | Validation | P2 | `FLTWebApp/fleet/FlightModify.aspx:448-473` | Medium |
| RULE-113 | Child rows are only added when at least one field is filled | Validation | P2 | `FLTWebApp/fleet/WorkOrderModify.aspx.vb:715-746` | High |
| RULE-114 | Flight is auto-approved on a validated save | Lifecycle | P0 | `FLTBizObjects/BusinessLogic/FlightManager.vb:91-139` | High |
| RULE-115 | Flight log saved as one atomic unit with its child records | Lifecycle | P0 | `FLTBizObjects/DataAccess/FlightDB.vb:105-163` | High |
| RULE-116 | Work order and all its child records are saved as one all-or-nothing unit | Lifecycle | P0 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:113-180` | Medium |
| RULE-117 | Newly logged flights start active, unapproved and not deleted | Lifecycle | P0 | `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:138-140` | Medium |
| RULE-118 | Aircraft status code mapping (UP / DOWN / OFF TEST) | Lifecycle | P0 | `FltFleet/AircraftStatus.vb:65-71` | High |
| RULE-119 | Flight approval stamping (who approved and when) | Lifecycle | P0 | `database/FLT_Schema.sql:17284-17301` | High |
| RULE-120 | Saved aircraft configurations are immutable | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/AircraftManager.vb:141-201` | High |
| RULE-121 | Single current location per aircraft | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/AircraftManager.vb:203-283` | Medium |
| RULE-122 | Export auto-creates missing aircraft-location assignments | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/FltExportManager.vb:152-200` | High |
| RULE-123 | Export file is built under a temporary name, then published with a UTC-timestam… | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/FltExportManager.vb:44-75` | Medium |
| RULE-124 | Program cloning copies setup data | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/ProgramManager.vb:100-160` | High |
| RULE-125 | Work order record lifecycle (new, edit, soft delete, concurrency) | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:118-122` | Medium |
| RULE-126 | Work order child staging with temporary ids and deferred deletes | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:118-151` | High |
| RULE-127 | Insert vs update decision from concurrency token | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:33-58` | High |
| RULE-128 | Work order insert cascades child records | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:61-91` | High |
| RULE-129 | Lockout expiry and failure-counter reset | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:37-47` | High |
| RULE-130 | Switching the current program reloads permissions | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:83-95` | Medium |
| RULE-131 | A save inserts a new record or updates an existing one based on its concurrency… | Lifecycle | P1 | `FLTBizObjects/BusinessLogic/fltLookupBaseManager.vb:37-43` | Medium |
| RULE-132 | New aircraft must have exactly one configuration and one location | Lifecycle | P1 | `FLTBizObjects/BusinessObject/Aircraft.vb:883-898` | Medium |
| RULE-133 | Work order status has no enforced transitions in the business object | Lifecycle | P1 | `FLTBizObjects/BusinessObject/WorkOrder.vb:865-915` | Low |
| RULE-134 | Aircraft save is atomic with its configurations and locations | Lifecycle | P1 | `FLTBizObjects/DataAccess/AircraftDB.vb:108-166` | High |
| RULE-135 | Linking documents to work orders | Lifecycle | P1 | `FLTBizObjects/DataAccess/DocumentWorkOrderXrefDB.vb:231-356` | Low |
| RULE-136 | Flight approval state is recorded with approver and timestamp | Lifecycle | P1 | `FLTBizObjects/DataAccess/FlightDB.vb:250-255` | Medium |
| RULE-137 | Work order header fields and status are recorded as supplied; no transition rul… | Lifecycle | P1 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:182-214` | Medium |
| RULE-138 | Soft delete with audit stamp for work orders, their lines and master data | Lifecycle | P1 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:358-380` | Medium |
| RULE-139 | Child record insert-vs-update decided by presence of a version stamp; deletes o… | Lifecycle | P1 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:428-454` | High |
| RULE-140 | Linking documents to a work order without duplicates | Lifecycle | P1 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:596-618` | High |
| RULE-141 | Three-step export workflow: create, list, fetch | Lifecycle | P1 | `FLTExportClient/FltExportClient.vb:19-99` | Medium |
| RULE-142 | Downloaded export is saved to My Documents only when content is non-empty | Lifecycle | P1 | `FLTExportClient/FltExportClient.vb:82-91` | High |
| RULE-143 | Export run lifecycle: Begin, Export, then End even on failure | Lifecycle | P1 | `FLTExportConsoleApp/FLTExportConsoleApp/Program.vb:10-35` | High |
| RULE-144 | Logout ends the session completely | Lifecycle | P1 | `FLTWebApp/Logout.aspx.vb:8-17` | High |
| RULE-145 | New program can be cloned from an active, non-deleted program | Lifecycle | P1 | `FLTWebApp/appConfiguration/programs.aspx.vb:95-110` | High |
| RULE-146 | Document upload stores metadata first, then file content, under the user's curr… | Lifecycle | P1 | `FLTWebApp/documents/DocumentAdd.aspx.vb:39-52` | High |
| RULE-147 | Document metadata edit, soft-delete flag and delete action | Lifecycle | P1 | `FLTWebApp/documents/documentsList.aspx.vb:108-138` | Medium |
| RULE-148 | Export files are kept for 24 hours, purged when the file list is viewed | Lifecycle | P1 | `FLTWebApp/export/autoGetFileList.aspx.vb:87-96` | High |
| RULE-149 | Test assignment moves a test between assigned and unassigned lists | Lifecycle | P1 | `FLTWebApp/fleet/AircraftModify.aspx.vb:375-436` | High |
| RULE-150 | Aircraft configuration versioning and meter-start rules | Lifecycle | P1 | `FLTWebApp/fleet/AircraftModify.aspx.vb:484-610` | Medium |
| RULE-151 | Deleting aircraft, flights and work orders | Lifecycle | P1 | `FLTWebApp/fleet/FleetList.aspx.vb:107-118` | Medium |
| RULE-152 | Pending child-row entries are saved before the parent record; failure aborts th… | Lifecycle | P1 | `FLTWebApp/fleet/WorkOrderModify.aspx.vb:1014-1061` | High |
| RULE-153 | Work order aircraft and location fixed after creation | Lifecycle | P1 | `FLTWebApp/fleet/WorkOrderModify.aspx.vb:43-55` | High |
| RULE-154 | Program status cannot be changed from the Program Profile screen | Lifecycle | P1 | `FLTWebApp/program/ProgramProfile.aspx.vb:31` | Low |
| RULE-155 | Active and deleted status of reference records, and the default list filters | Lifecycle | P1 | `FLTWebApp/program/WeightDefs.aspx.vb:72-92` | High |
| RULE-156 | Delete marks reference records as deleted after the user confirms | Lifecycle | P1 | `FLTWebApp/program/locations.aspx.vb:83-96` | Medium |
| RULE-157 | Roles are scoped to a program and carry a program-manager flag; soft delete and… | Lifecycle | P1 | `FLTWebApp/security/roles.aspx.vb:77-110` | Medium |
| RULE-158 | Create or edit a user account; new users get a generated password by email | Lifecycle | P1 | `FLTWebApp/security/users.aspx.vb:107-135` | Medium |
| RULE-159 | Admin password reset generates and emails a new password | Lifecycle | P1 | `FLTWebApp/security/users.aspx.vb:144-157` | High |
| RULE-160 | Unlock a locked-out user account | Lifecycle | P1 | `FLTWebApp/security/users.aspx.vb:159-172` | High |
| RULE-161 | Assign or remove users and roles | Lifecycle | P1 | `FLTWebApp/security/users.aspx.vb:193-219` | High |
| RULE-162 | Aircraft status update and its comments | Lifecycle | P1 | `FltFleet/EditAircraftStatus.aspx.vb:11-49` | Medium |
| RULE-163 | Aircraft status record is created on first update and overwritten afterwards | Lifecycle | P1 | `FltFleet/sql_changes_for_aircraft_status.sql:116-140` | Medium |
| RULE-164 | Aircraft test-program record (status, hours, required usage, end of testing) | Lifecycle | P1 | `database/FLT_Schema.sql:17627-17650` | Medium |
| RULE-165 | Aircraft current location follows latest 'last location' stay | Lifecycle | P1 | `database/FLT_Schema.sql:17878-17924` | High |
| RULE-166 | Work order status and completion data | Lifecycle | P1 | `database/FLT_Schema.sql:18338-18373` | Medium |
| RULE-167 | Flight record status flags and visibility | Lifecycle | P1 | `database/FLT_Schema.sql:3944-3948` | Medium |
| RULE-168 | Successful login records last-login time | Lifecycle | P1 | `database/FLT_Schema.sql:6753-6771` | High |
| RULE-169 | New flight records start active, stamped and uniquely identified | Lifecycle | P1 | `tsql/DuplicateFlightKeyModification.sql:157-178` | Medium |
| RULE-170 | New versus existing record on save; pending child edits | Lifecycle | P2 | `FLTBizObjects/BusinessLogic/FlightManager.vb:164-201` | High |
| RULE-171 | Module registry maintenance (identity fixed, active/deleted lifecycle) | Lifecycle | P2 | `FLTWebApp/security/modules.aspx.vb:63-94` | Medium |
| RULE-172 | Overridable warnings must be acknowledged before save | Policy | P0 | `FLTBizObjects/BusinessLogic/BrokenRuleManager.vb:8-37` | Medium |
| RULE-173 | Module-based authorization for every business operation | Policy | P0 | `FLTBizObjects/BusinessLogic/FlightManager.vb:423-439` | High |
| RULE-174 | Editing program reference data needs the matching module permission | Policy | P0 | `FLTBizObjects/BusinessLogic/LocationManager.vb:45-110` | Medium |
| RULE-175 | Account lockout after repeated failed logins | Policy | P0 | `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:37-62` | Medium |
| RULE-176 | Failed-login lockout threshold | Policy | P0 | `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:49-63` | High |
| RULE-177 | Role-based action authorization hierarchy | Policy | P0 | `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:97-123` | High |
| RULE-178 | Login lockout thresholds | Policy | P0 | `FLTBizObjects/DataAccess/AppConfig.vb:32-58` | Medium |
| RULE-179 | User login returns identity, super-user flag, default program and accessible pr… | Policy | P0 | `FLTBizObjects/DataAccess/fltIdentityDB.vb:14-58` | Medium |
| RULE-180 | Per-program manager role and per-module view/edit permissions | Policy | P0 | `FLTBizObjects/DataAccess/fltIdentityDB.vb:60-105` | Medium |
| RULE-181 | API callers must authenticate with Basic credentials or configured default acco… | Policy | P0 | `FLTWebAPI/FltWebApi/App_Code/IdentityManager.cs:14-49` | High |
| RULE-182 | Authenticated session required for configuration and document pages | Policy | P0 | `FLTWebApp/documents/DocumentShow.aspx.vb:15-22` | Medium |
| RULE-183 | Export access requires the Export/CanView permission (session reuse or batch re… | Policy | P0 | `FLTWebApp/export/autoCreateFile.aspx.vb:17-26` | Medium |
| RULE-184 | Approved flights lock meter readings; key fields editable only by super users o… | Policy | P0 | `FLTWebApp/fleet/FlightModify.aspx.vb:422-452` | High |
| RULE-185 | Program reference data needs a logged-in user and is scoped to that user's curr… | Policy | P0 | `FLTWebApp/program/locations.aspx.vb:18-30` | Medium |
| RULE-186 | Login required for security administration and profile pages | Policy | P0 | `FLTWebApp/security/users.aspx.vb:18-29` | Medium |
| RULE-187 | Role-based module permissions (view/edit) | Policy | P0 | `database/FLT_Schema.sql:15815-15880` | Medium |
| RULE-188 | Program access by super-user flag or role membership | Policy | P0 | `database/FLT_Schema.sql:6773-6818` | High |
| RULE-189 | Default list filters show only active, non-deleted, approved records | Policy | P1 | `FLTBizObjects/BusinessLogic/FlightInfoManager.vb:13-36` | Medium |
| RULE-190 | Incremental flight export since a change date | Policy | P1 | `FLTBizObjects/BusinessLogic/FltExportManager.vb:20-75` | High |
| RULE-191 | User password lifecycle | Policy | P1 | `FLTBizObjects/BusinessLogic/FltUserManager.vb:61-127` | High |
| RULE-192 | Operations that bypass authorization | Policy | P1 | `FLTBizObjects/BusinessLogic/RptFleetManager.vb:221-228` | Medium |
| RULE-193 | Report exports allow any user | Policy | P1 | `FLTBizObjects/BusinessLogic/RptRoutesManager.vb:197-204` | High |
| RULE-194 | Work order delete via info list bypasses authorization | Policy | P1 | `FLTBizObjects/BusinessLogic/WorkOrderInfoManager.vb:38-45` | High |
| RULE-195 | Work order document attachment rules | Policy | P1 | `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:466-530` | High |
| RULE-196 | Business-object to security-module mapping | Policy | P1 | `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:552-568` | High |
| RULE-197 | Lookup tables readable without authorization | Policy | P1 | `FLTBizObjects/BusinessLogic/fltLookupBaseManager.vb:14-35` | Medium |
| RULE-198 | Fixed catalog of administrator-maintainable lookup (configuration value) types | Policy | P1 | `FLTBizObjects/BusinessObject/Collections/fltLookupNameList.vb:12-39` | Medium |
| RULE-199 | Flight validation can be bypassed by caller | Policy | P1 | `FLTBizObjects/BusinessObject/Flight.vb:1156-1163` | High |
| RULE-200 | Role module permissions default to full access | Policy | P1 | `FLTBizObjects/BusinessObject/FltRoleModulePermissions.vb:151-193` | Medium |
| RULE-201 | User account data rules and new-user defaults | Policy | P1 | `FLTBizObjects/BusinessObject/FltUser.vb:438-604` | Medium |
| RULE-202 | Configurable business-rule switches | Policy | P1 | `FLTBizObjects/BusinessObject/WOInstruction.vb:203-212` | High |
| RULE-203 | User session authorization context defaults to no access | Policy | P1 | `FLTBizObjects/BusinessObject/fltIdentity.vb:175-197` | Medium |
| RULE-204 | Optimistic concurrency on record updates | Policy | P1 | `FLTBizObjects/DataAccess/FlightDB.vb:263-282` | High |
| RULE-205 | Soft-delete and active filtering when loading flight and aircraft details | Policy | P1 | `FLTBizObjects/DataAccess/FlightDB.vb:32-35` | Medium |
| RULE-206 | Opening a work order loads its lines with the default deleted-record filter | Policy | P1 | `FLTBizObjects/DataAccess/WorkOrderDB.vb:35-41` | Medium |
| RULE-207 | Work order search filters | Policy | P1 | `FLTBizObjects/DataAccess/WorkOrderInfoDB.vb:64-84` | Medium |
| RULE-208 | Program-scoped lookup lists with active flag and sort order | Policy | P1 | `FLTBizObjects/DataAccess/fltLookupBaseDb.vb:109-185` | Medium |
| RULE-209 | Export file request always asks for changes since 1 January 2000 | Policy | P1 | `FLTExportClient/FltExportClient.vb:44-64` | Medium |
| RULE-210 | Export service request policy: configured method, 60-second timeout, HTTP 200 o… | Policy | P1 | `FLTExportClient/FltExportManager.vb:180-211` | High |
| RULE-211 | Every export service call is authenticated with configured credentials sent in… | Policy | P1 | `FLTExportClient/FltExportManager.vb:95-104` | Medium |
| RULE-212 | Export file destination and naming come from configuration | Policy | P1 | `FLTExportConsoleApp/FLTExportConsoleApp/App.config:6-15` | Medium |
| RULE-213 | Weight definitions are classified as Airframe, Cargo or Ballast (dollies) | Policy | P1 | `FLTWebAPI/FltWebApi/Controllers/AirframesController.cs:77-95` | High |
| RULE-214 | Lookup and program lists are not filtered by caller identity | Policy | P1 | `FLTWebAPI/FltWebApi/Controllers/LookUpValuesController.cs:215-231` | Medium |
| RULE-215 | Flight load configuration: one airframe, up to two cargo items, one ballast | Policy | P1 | `FLTWebAPI/FltWebApi/Models/Flight.cs:24-27` | Medium |
| RULE-216 | Liquid fills recorded with Hobbs reading and approver | Policy | P1 | `FLTWebAPI/FltWebApi/Models/LiquidFill.cs:11-21` | Low |
| RULE-217 | Navigation menu shown by module permission and role | Policy | P1 | `FLTWebApp/FLT.Master.vb:48-160` | High |
| RULE-218 | Session and sign-in timeout of 30 minutes | Policy | P1 | `FLTWebApp/Web.config:41-44` | High |
| RULE-219 | Time zone definition with UTC offset and daylight-saving window | Policy | P1 | `FLTWebApp/appConfiguration/TimeZones.aspx.vb:126-159` | Low |
| RULE-220 | Document list is scoped to the current program, filtered by type and deleted st… | Policy | P1 | `FLTWebApp/documents/documentsList.aspx.vb:26-70` | High |
| RULE-221 | Flown route recorded as the scheduled route | Policy | P1 | `FLTWebApp/fleet/FlightModify.aspx.vb:467-468` | Medium |
| RULE-222 | Fleet pages require a logged-in session scoped to the current program | Policy | P1 | `FLTWebApp/fleet/WorkOrderModify.aspx.vb:27-34` | High |
| RULE-223 | Self-service password reset emails a new random password | Policy | P1 | `FLTWebApp/password_recovery.aspx.vb:13-23` | High |
| RULE-224 | Config Values report exports active entries of one selected lookup type | Policy | P1 | `FLTWebApp/reports/rptConfigValues.aspx.vb:38-78` | High |
| RULE-225 | Reports are scoped to the user's currently selected program | Policy | P1 | `FLTWebApp/reports/rptWeightTracking.aspx.vb:33-38` | Medium |
| RULE-226 | Main fleet board hides OFF TEST aircraft; OFF TEST view shows the whole fleet | Policy | P1 | `FltFleet/AircraftStatusDB.vb:83-90` | Medium |
| RULE-227 | Role edit time windows are configuration-driven | Policy | P1 | `FltFleet/AircraftStatusManager.vb:61-83` | High |
| RULE-228 | Unhandled-error page says the administrator was notified, but nothing sends a n… | Policy | P1 | `FltFleet/ErrorPages/Oops.aspx:14-15` | Low |
| RULE-229 | Client and authorization errors are shown as a generic 'Page Not Found' page | Policy | P1 | `FltFleet/Web.config:71-82` | Medium |
| RULE-230 | Login failure and password recovery do not reveal which accounts exist | Policy | P1 | `FltFleet/password_recovery.aspx.vb:13-23` | Medium |
| RULE-231 | User account maintenance overwrites security state | Policy | P1 | `database/FLT_Schema.sql:15932-15964` | High |
| RULE-232 | Program-level forecasting parameters | Policy | P1 | `database/FLT_Schema.sql:16889-16915` | Low |
| RULE-233 | Audit stamp of modifying user and UTC time | Policy | P1 | `database/FLT_Schema.sql:17627-17653` | High |
| RULE-234 | Spreadsheet reports of active reference data | Policy | P2 | `FLTBizObjects/BusinessLogic/RptFleetManager.vb:13-36` | High |
| RULE-235 | Report exports cover active, non-deleted records of the program | Policy | P2 | `FLTBizObjects/BusinessLogic/RptRoutesManager.vb:12-35` | High |
| RULE-236 | Documents are stored in fixed-size chunks | Policy | P2 | `FLTBizObjects/DataAccess/DocumentDB.vb:61-97` | Medium |
| RULE-237 | Empty result lists are reported as not found | Policy | P2 | `FLTWebAPI/FltWebApi/Controllers/FleetController.cs:40-43` | High |
| RULE-238 | Flight records both scheduled and actually flown route | Policy | P2 | `FLTWebAPI/FltWebApi/Models/Flight.cs:15-22` | Medium |
| RULE-239 | Evaluator comments carry component, issue code and rating | Policy | P2 | `FLTWebAPI/FltWebApi/Models/FlightComment.cs:11-19` | Low |
| RULE-240 | Locations belong to a test program | Policy | P2 | `FLTWebAPI/FltWebApi/Models/Location.cs:11-16` | Medium |
| RULE-241 | HTTP client errors routed to a 'Page Not Found' page | Policy | P2 | `FLTWebApp/Web.config:50-61` | High |
| RULE-242 | Upload and request size limits | Policy | P2 | `FLTWebApp/Web.config:67-68` | Medium |
| RULE-243 | Weight definition types carry a description and display sort order | Policy | P2 | `FLTWebApp/appConfiguration/WeightDefTypes.aspx.vb:123-136` | Medium |
| RULE-244 | Reference-data lists default to active, non-deleted records and ask for confirm… | Policy | P2 | `FLTWebApp/appConfiguration/programs.aspx:26-38` | High |
| RULE-245 | Document download is streamed as an attachment in fixed-size chunks | Policy | P2 | `FLTWebApp/documents/DocumentShow.aspx.vb:24-63` | Medium |
| RULE-246 | Pilot list includes non-active pilots; pilots can be added inline | Policy | P2 | `FLTWebApp/fleet/FlightModify.aspx.vb:351-373` | Low |
| RULE-247 | List page default filters: active, not deleted, approved | Policy | P2 | `FLTWebApp/fleet/FlightsList.aspx.vb:37-79` | High |
| RULE-248 | Report export file naming convention | Policy | P2 | `FLTWebApp/reports/rptConfigValues.aspx.vb:50-55` | High |
| RULE-249 | Aircraft status board lists only non-deleted aircraft, sortable by location, MS… | Policy | P2 | `FltFleet/sql_changes_for_aircraft_status.sql:58-104` | Medium |
| RULE-250 | Flight log search filters and defaults | Policy | P2 | `database/FLT_Schema.sql:12326-12383` | High |
| RULE-251 | Aircraft search, filtering and paging | Policy | P2 | `database/FLT_Schema.sql:12869-12904` | High |

## Calculation

### RULE-001: Aircraft configuration meter chaining
**Category:** Calculation
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/AircraftManager.vb:101-139`
**Plain English:** For a new aircraft the first configuration sets the aircraft's starting and current airframe hours and offset; for an existing aircraft a new configuration starts at the aircraft's current airframe hours, closes the previous latest configuration at that reading, and becomes the source of the aircraft's meter offset and unit.
**Specification:**
  Given Existing aircraft (Id 42) with AirframeHoursCurrent = 512.3 and latest configuration started at 300.0; new configuration offset 2.5, unit 'hours'
  When  InsertAircraftConfiguration is called
  Then  New config MeterStart = 512.3; previous config MeterEnd = 512.3; aircraft AirframeHoursOffset = 2.5 and MeterUnitId = new unit. For a brand-new aircraft (Id 0) with config MeterStart 0 and offset 2.5: AirframeHoursStart = 0, AirframeHoursCurrent = 0, Offset = 2.5
**Parameters:** New in-memory children receive negative temporary ids (NewAircraftConfigurationId decremented)
**Edge cases handled:** Aircraft fields are changed before the configuration is validated; a failed validation leaves the aircraft's offset/unit already modified; Latest configuration is the one with the highest MeterStart (see separate rule)
**Suspected defect:** Aircraft offset/unit/hours are mutated before AircraftConfiguration.Validate(); an invalid configuration still alters the aircraft in memory.
**Confidence:** High

### RULE-002: Flight starting airframe hours = Hobbs start + meter offset
**Category:** Calculation
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:58`
**Plain English:** A flight's starting airframe hours are computed as the Hobbs meter start reading plus the meter offset in use, rounded to one decimal place.
**Specification:**
  Given A flight with HobbsStart = 1234.56 and UsedMeterOffset = 10.0
  When  The flight is inserted or updated
  Then  AirframeHoursStart = '1,244.6' (HobbsStart + UsedMeterOffset, formatted '#,##0.0' i.e. rounded to 1 decimal with thousands separator)
**Parameters:** Format mask '#,##0.0' (1 decimal); same formula at FlightManager.vb:104
**Edge cases handled:** Value is stored as a formatted string with thousands separator, so later CDec parsing depends on culture; Non-numeric HobbsStart/UsedMeterOffset raises a conversion error; Rounding uses .NET Format (away-from-zero midpoint)
**Confidence:** Medium — P0 panel doubts spec fidelity: P0 is justified. Airframe hours are the main figure a flight log tracker produces. They feed aircraft time and maintenance tracking, which is a safety and data-integrity concern. Every flight Insert and Update sets the value (FlightManager.vb:58 and :104). The card is not faithful on rounding. It says the sum is "HobbsStart + UsedMeterOffset, rounded to 1 decimal".…

### RULE-003: Password hashing with per-user salt
**Category:** Calculation
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/fltPassword.vb:8-33`
**Plain English:** Passwords are stored as Base64(SHA-512(salt + password)). The salt is 96 random bytes in Base64 (128 characters), and the hash is computed over a fixed 256-byte buffer padded with zeros.
**Specification:**
  Given A user salt of 128 Base64 characters and the password 'Pilot2026'
  When  The user logs in
  Then  Salt + 'Pilot2026' (137 characters) is copied one byte per character into a 256-byte zero-filled buffer, SHA-512 hashes the whole buffer, and the Base64 result must exactly match the stored password.
**Parameters:** Salt size: 96 bytes from RNGCryptoServiceProvider. Hash buffer: 256 bytes. Algorithm: SHA-512 with a single iteration.
**Edge cases handled:** A password longer than 128 characters (with a 128-character salt) overflows the 256-byte buffer and causes an error; Characters with a code above 255 (non-Latin-1) cannot fit in a byte and cause an overflow error, so such passwords cannot be used; A rewrite must hash the same zero-padded 256-byte buffer, or existing password hashes will stop matching
**Suspected defect:** A single unstretched SHA-512 is weak for password storage, and the fixed buffer limits password length and character set.
**Confidence:** High

### RULE-004: Flight meter readings must run forward, and region time must add up to Hobbs usage
**Category:** Calculation
**Priority:** P0
**Source:** `FLTBizObjects/BusinessObject/Flight.vb:1360-1383`
**Plain English:** A flight's ending Hobbs and ending engine hours cannot be lower than the starting values. When enabled, the hours split across regions must equal the flight's Hobbs usage (HobbsEnd - HobbsStart).
**Specification:**
  Given A flight with HobbsStart 1,200.0, HobbsEnd 1,203.5 and region times 2.0 + 1.0
  When  The flight is validated with rule 02-00-01B enabled
  Then  Hard error 'Total Region Usage of 3.0 doesn't match Flight Usage of 3.5' (02-00-01B). HobbsStart > HobbsEnd gives hard error 02-00-019. EngineHoursStart > EngineHoursEnd gives hard error 02-00-01A.
**Parameters:** Toggle: AppConfiguration.BusinessRuleEnabled("02-00-01B") (definition not found in the repo). Meter mask '#,##0.0;-#,##0.0'.
**Edge cases handled:** FlightRegionTime.Hours is a string formatted to 1 decimal place (FlightRegionTime.vb:79-92), so region hours are rounded to 0.1 before they are summed; The sum uses exact equality with no tolerance; Non-numeric region hours become 0
**Suspected defect:** The region sum adds strings formatted as '#,##0.0', so values rounded to 0.1 (or thousand separators that depend on culture) can cause false mismatches against unrounded Hobbs values.
**Confidence:** High

### RULE-005: Export change window: look back a configured number of days
**Category:** Calculation
**Priority:** P0
**Source:** `FLTExportConsoleApp/FLTExportConsoleApp/Program.vb:57-73`
**Plain English:** The scheduled export only includes records changed since 'now minus N days', where N comes from the NbrOfDaysHistory setting (currently 3).
**Specification:**
  Given NbrOfDaysHistory = 3 in App.config and the job starts at 2026-10-15 02:00 local time
  When  the export console app computes the ChangesSince date
  Then  ChangesSince = 2026-10-12 02:00 local time (Now − 3 days, keeping the time of day), and that value is passed to FltExportManager.CreateDownloadFile, which writes it as the ChangesSince attribute of the export file
**Parameters:** NbrOfDaysHistory = 3 (App.config:7). The calculation uses local server time from DateTime.Now, not UTC, and keeps the time of day (it is not truncated to midnight).
**Edge cases handled:** If the value is not a whole number (e.g. '3.5' or 'abc'), the result of TryParse is ignored and N defaults to 0, so ChangesSince = now and the export is effectively empty, with no warning; If the NbrOfDaysHistory key is missing, .ToString() on Nothing throws, and the run aborts through the general error handler; A negative N gives a future date, so nothing is exported; The function is declared As String, so the date is turned into a string and implicitly parsed back into a Date by CreateDownloadFile. This round trip depends on the culture and drops sub-second preci…; The web export page (FLTWebApp/export) uses its own ChangesSinceDate. Its 'all records' overload defaults to 01-Jan-2000
**Suspected defect:** An invalid NbrOfDaysHistory silently becomes 0 days because the empty If block after TryParse does nothing. The export then contains no changes and still looks successful. Also, the local-time ChangesSince is formatted by FltExportManager with a 'Z' (UTC) suffix, which may shift the window by the UTC offset.
**Confidence:** Medium — P0 panel doubts spec fidelity: The basic arithmetic is right: Program.vb:67-69 uses DateTime.Now.AddDays(-nbr), so for N=3 a run at 2026-10-15 02:00 gives 2026-10-12 02:00 local time, with the time of day kept. NbrOfDaysHistory=3 is confirmed at App.config:7. But the card misses or misstates several behaviors that matter if this becomes the equivalence contract. (1) Silent fallback: the result of…

### RULE-006: Flight airframe hours = Hobbs meter reading + meter offset
**Category:** Calculation
**Priority:** P0
**Source:** `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:159-160`
**Also cited:** FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:158-160
**Plain English:** A flight's airframe hours at departure and return are the Hobbs meter readings plus the meter offset recorded for that flight.
**Specification:**
  Given A flight with HobbsStart 1,234.5, HobbsEnd 1,236.0 and UsedMeterOffset 50.0
  When  The flight is read back through the API
  Then  AirframeHoursStart is 1,284.5 and AirframeHoursEnd is 1,286.0 (Hobbs + UsedMeterOffset); flight duration on the airframe is 1.5 hours
**Parameters:** Inputs: Flight.HobbsStart, HobbsEnd, UsedMeterOffset, MeterUnitId (Flight.cs:41-44). Outputs: FlightInfo.AirframeHoursStart/End (FlightInfo.cs:16-17). The formula is in FlightsController.cs:159-160; HobbsEnd is shown with format ##0.0 (FlightsController.cs:129).
**Edge cases handled:** The offset is stored per flight (UsedMeterOffset), so a meter replacement after a flight does not change that flight's past airframe hours; HobbsEnd is shown to one decimal place; nothing checks that HobbsEnd >= HobbsStart; MeterUnitId is stored but plays no part in the sum, so mixed units are not converted
**Confidence:** Medium — Citation was corrected by referee (Flight.cs:38-44 only declares properties (EngineHoursStart/End, HobbsStart/End, MeterUnitId, UsedMeterOffset) and has no calculation logic. The formula is in FlightsController.cs:159-160, inside LoadNewBizObjectFlightBaseProperties: AirframeHoursEnd = HobbsEnd + UsedMeterOffset and AirframeHoursStart = HobbsStart + UsedMeterOffset, set on the FLTBizObjects BO Fl…

### RULE-007: Flight total hours and ending airframe hours from Hobbs meter
**Category:** Calculation
**Priority:** P0
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:249-256`
**Plain English:** A flight's total hours are the Hobbs end reading minus the Hobbs start reading, and the aircraft's ending airframe hours are the Hobbs end reading plus the meter offset in effect for that flight.
**Specification:**
  Given A flight with Hobbs start 1,234.5, Hobbs end 1,236.0 and a used meter offset of 500.0
  When  The user changes either the Hobbs start or Hobbs end field
  Then  Total hours shows 1.5 (1,236.0 - 1,234.5) and airframe hours end shows 1,736.0 (1,236.0 + 500.0), both formatted to one decimal place; both Hobbs fields are reformatted to one decimal
  And   In edit mode the stored flight shows total hours as AirframeHoursEnd - AirframeHoursStart (line 417)
**Parameters:** Meter display mask '#,##0.0;-#,##0.0' (one decimal, negatives allowed) at FlightModify.aspx.vb:20
**Edge cases handled:** Recalculation only happens when both Hobbs values are numeric; otherwise the previous totals stay displayed; No check that Hobbs end >= Hobbs start in the page; a negative total is displayed with the negative mask; Calculated airframe hours end is read back from a label and saved to the flight in LoadDataToObject (line 495)
**Suspected defect:** The page does not reject Hobbs end lower than Hobbs start; any such check must live in FlightManager.Save business rules (not verified here).
**Confidence:** High

### RULE-008: Recalculate aircraft airframe and engine hours when an approved flight is added
**Category:** Calculation
**Priority:** P0
**Source:** `tsql/DuplicateFlightKeyModification.sql:180-195`
**Also cited:** database/FLT_Schema.sql:17365-17377
**Plain English:** When a flight is saved as approved, the aircraft's current airframe hours and engine hours are reset to the highest end-of-flight readings among all of its active, non-deleted flights.
**Specification:**
  Given Aircraft 12 has active, non-deleted flights with AirframeHoursEnd 1520.4 and 1533.9, and EngineHoursEnd 880.2 and 893.7
  When  addFlight is called with IsApproved = 1 for aircraft 12
  Then  Aircraft.AirframeHoursCurrent = 1533.9 and AircraftEngineHoursCurrent = 893.7. UTCDateModified and StampUserName on the aircraft are updated.
**Parameters:** Formula: MAX(Flight.AirframeHoursEnd) and MAX(Flight.EngineHoursEnd) WHERE AircraftId = @AircraftId AND IsActive = 1 AND IsDeleted = 0
**Edge cases handled:** The MAX covers all active flights, approved or not, even though only approval triggers the update; No update happens when IsApproved = 0; If there are no qualifying flights, MAX returns NULL and overwrites the current hours with NULL; A wrongly keyed high reading on any active flight becomes the aircraft's current hours
**Suspected defect:** The aggregate does not filter on IsApproved, so unapproved flights with higher readings can raise the aircraft's official hours once any approved flight is saved. | Inconsistent trigger: an unapproved new flight does not update the aircraft totals, but any later edit does, and the aggregate counts unapproved flights either way. A flight reassigned to another aircraft leaves the original aircraft's totals stale.
**Confidence:** High

### RULE-009: Latest configuration and latest location selection
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/AircraftManager.vb:642-660`
**Plain English:** The aircraft's latest configuration is the one with the highest meter start reading; the latest location is intended to be the one with the most recent arrival date.
**Specification:**
  Given Configurations with MeterStart 0, 300.0, 512.3
  When  Latest configuration is requested
  Then  The configuration starting at 512.3 is returned; if all start at 0, an empty configuration is returned
**Parameters:** Comparison is strictly greater-than against an initial 0 value
**Edge cases handled:** A sole configuration starting at meter 0 is never selected as latest; Ties keep the first found
**Suspected defect:** RetrieveLatestAircraftLocation initialises the candidate to Nothing and then reads aircraftLocation.ArrivalDate, which throws a NullReferenceException for any aircraft that has locations.
**Confidence:** High

### RULE-010: Flight departure/return times converted to UTC with overnight rollover
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:466-475`
**Plain English:** Departure and return local date-times are built from the flight date plus the entered times; if the return hour is earlier than the departure hour the return is moved to the next day, and both are converted to UTC using the location's time zone.
**Specification:**
  Given Flight date 2026-07-01 at a location with offset -5, departure 22:00, return 01:30
  When  The flight is saved
  Then  Departure local = 2026-07-01 22:00; Return local = 2026-07-02 01:30; UTC values are the local values minus the effective offset (see DST rule), with the return UTC also shifted +1 day
**Parameters:** Rollover test compares the hour component only
**Edge cases handled:** Departure 10:45, return 10:15 (same hour, earlier minutes) is NOT rolled to next day, giving a negative-duration flight; Flights longer than 24h cannot be represented; Invalid time text yields DateTime.MinValue silently (see time format rule)
**Suspected defect:** Hour-only comparison misses same-hour overnight returns (e.g. depart 23:50, return 23:10 next day).
**Confidence:** High

### RULE-011: Late-departure comments and engine runs roll to next day
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:477-505`
**Plain English:** Comment and engine-run times are placed on the departure date, but when the flight departs at 16:00 or later and the entry's hour is more than one hour before the departure hour, the entry is moved to the next day.
**Specification:**
  Given Departure local 2026-07-01 20:00; a pilot comment at 02:15 and an engine run 01:00-01:20
  When  The flight is saved
  Then  Comment local = 2026-07-02 02:15; engine run 2026-07-02 01:00-01:20; UTC values shifted +1 day as well
**Parameters:** Late-departure threshold 16 (hour); tolerance 1 hour before departure
**Edge cases handled:** Comment with blank time defaults to the departure time; Departure at 15:00 with comment at 01:00 next morning is NOT rolled (stays on departure date); Departure 20:00, comment 19:30 (within 1h before) stays same day; Engine run end is rolled only together with the start; an end time past midnight with start before midnight is not rolled
**Confidence:** High

### RULE-012: Local-to-UTC conversion with location daylight-saving window
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:521-536`
**Plain English:** A local time is converted to UTC by subtracting the location's time-zone offset, plus the daylight-saving offset when the location observes DST and the local time falls within its configured DST start/end dates (inclusive).
**Specification:**
  Given Location TimeZoneOffset = -5, DaylightSavingTime = True, DaylightSavingOffset = 1, DST window 2026-03-08 to 2026-11-01; local time 2026-07-01 08:30
  When  Any flight, comment or engine-run time is converted
  Then  Effective offset = -4; UTC = 08:30 - (-4h) = 12:30 on 2026-07-01
**Parameters:** Per-location TimeZoneOffset, DaylightSavingOffset, DaylightSavingBegin, DaylightSavingEnd (inclusive bounds)
**Edge cases handled:** DST window is compared as full date-times; if DaylightSavingEnd is a date at 00:00, times later on the end date are treated as non-DST; DST window values are stored per location and must be maintained yearly; Fractional offsets (e.g. 5.5) supported via Double
**Confidence:** High

### RULE-013: Random password generation
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/fltPassword.vb:35-83`
**Plain English:** System-generated passwords are 10 characters long. Each character is drawn from digits, upper case letters, lower case letters and 25 punctuation symbols, using a secure random byte taken modulo 87.
**Specification:**
  Given A random byte of 200
  When  A password character is generated
  Then  200 mod 87 = 26, which falls in 10..35, so the character is 'A' + 16 = 'Q'
**Parameters:** Length 10. Values 0-9 give digits, 10-35 give A-Z, 36-61 give a-z, 62-86 give the punctuation set '!@@$%^^*()_-+=[{]};:>|./?'. Required minimum of non-alphanumeric characters: 0.
**Edge cases handled:** Because 256 mod 87 is not 0, values 0-81 come up more often than 82-86 (slight bias); '@' and '^' each appear twice in the punctuation set, so they are twice as likely; With a minimum of 0, the top-up loop never runs, so a password may contain no symbols
**Confidence:** High

### RULE-014: Fault and work meter readings and fault date normalization
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrder.vb:196-228`
**Plain English:** Meter readings (fault-occurred, start-of-work, end-of-work) are stored as decimals and shown with thousands separators to one decimal place. A fault date before 1950 is treated as no date.
**Specification:**
  Given FaultOccurredMeter is set to '12345.67' and FaultOccurredDate to '12-31-1949'
  When  The values are read back
  Then  FaultOccurredMeter displays '12,345.7' and FaultOccurredDate displays '' (blank)
**Parameters:** Display mask '#,##0.0'; fault-date floor 1-Jan-1950; date display 'MM-dd-yyyy'
**Edge cases handled:** Non-numeric FaultOccurredMeter input resets the reading to 0 (lines 222-226).; Non-numeric or blank MeterStartWork/MeterEndWork input is silently ignored and the previous value is kept (lines 370-394).; No rule checks MeterEndWork >= MeterStartWork, and no meter is required.; Display rounds to 1 decimal place but the full decimal value is stored.
**Suspected defect:** Bad meter input is handled inconsistently: the fault meter becomes 0, while the start and end meters keep their old values without any warning.
**Confidence:** Medium — Should end-of-work meter be required to be greater than or equal to start-of-work meter (and fault meter), and should invalid meter input be rejected instead of silently ignored or zeroed?

### RULE-015: Takeoff weight defaults to sum of component weights
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/FlightDB.vb:565-570`
**Plain English:** If a flight has no stored takeoff weight, or its stored takeoff weight is zero, the system uses airframe + cargo 1 + cargo 2 + ballast weight.
**Specification:**
  Given A flight whose stored TakeoffWeight is NULL or 0, with AirframeWeight 9,000, Cargo1Weight 500, Cargo2Weight 250 and BallastWeight 100
  When  The flight record is loaded
  Then  TakeoffWeight = 9,000 + 500 + 250 + 100 = 9,850. A non-zero stored TakeoffWeight is used as stored.
**Parameters:** Inputs are AirframeWeight, Cargo1Weight, Cargo2Weight and BallastWeight. Each is an integer that comes from a weight lookup row (AirframeWeightId and so on, lines 501-563). A NULL component counts as 0.
**Edge cases handled:** A missing weight component is treated as 0 in the sum; An explicit takeoff weight of 0 cannot be stored: it is always replaced by the computed sum; Weight units (AirframeWeightUnit and the others) are not checked or converted before summing
**Suspected defect:** The sum adds weights without checking that they share a unit, even though each component has its own unit field. If a flight mixes units, its takeoff weight is wrong.
**Confidence:** Medium — P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (The card matches the code. In FLTBizObjects/DataAccess/FlightDB.vb:565-570, a non-NULL stored TakeoffWeight is assigned first. If the result is still 0 (NULL, or a stored 0), it is replaced with AirframeWeight + Cargo1Weight + Cargo2Weight + BallastWeight. A NULL component counts as 0 in two places:…

### RULE-016: Meter, hour and liquid readings are rounded to fixed precision
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/FlightDB.vb:579-601`
**Plain English:** Hobbs, airframe-hours, engine-hours and meter offset readings are handled at one decimal place. Liquid amounts use three decimals. Because the formatted value is what gets saved back, a load-and-save cycle stores values at that precision.
**Specification:**
  Given A flight whose HobbsEnd is stored as 1234.56
  When  The flight is loaded and saved again
  Then  HobbsEnd is shown as '1,234.6' and saved back as 1234.6
**Parameters:** Hours, Hobbs, meter offset, region hours and required/accumulated usage use format #,##0.0. LiquidAmt uses #,##0.000 (LiquidFillDB.vb:415). Values are converted back to numbers with CDec on save.
**Edge cases handled:** Any extra precision held in the database is lost on the first edit; Thousands separators and locale settings affect the CDec conversion back
**Suspected defect:** Formatting for display is used as the in-memory value, so a load-and-save cycle silently rounds stored readings.
**Confidence:** Medium — Is one decimal place (0.1 hour) the official precision for Hobbs, airframe and engine hours, and three decimals for liquid fills?

### RULE-017: Weight definitions stored as whole numbers
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/WeightDefDB.vb:123-131`
**Plain English:** A weight definition (e.g. a standard passenger or cargo weight) belongs to a weight type and a weight unit and is saved as a whole number; fractions are rounded.
**Specification:**
  Given A weight definition entered as "185.5" lb
  When  It is saved
  Then  CInt rounds it to 186 (VB banker's rounding: 184.5 would become 184), and it is displayed as "186" using format #,##0
**Parameters:** Conversion CInt (lines 126, 170); display format "#,##0" (line 229); fields WeightDefTypeId, WeightDefDescr, WeightUnitId, SortOrder, IsActive, IsDeleted
**Edge cases handled:** Halves round to even (banker's rounding), not half-up; Insert does not send IsActive/IsDeleted; database defaults apply; List can be filtered by program, weight type id/description, active and deleted flags (lines 57-77)
**Confidence:** High

### RULE-018: Record version stamp encoded as a decimal string
**Category:** Calculation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/dalUtility.vb:9-34`
**Plain English:** The 8-byte database version stamp is turned into a number string by treating each byte as a base-1000 digit, and turned back the same way for the concurrency check on save.
**Specification:**
  Given A row version of bytes [0,0,0,0,0,0,7,209]
  When  It is read and later sent back on update
  Then  It becomes "7209" (7 x 1000 + 209) and is decoded back to [0,0,0,0,0,0,7,209]
**Parameters:** Base 1000 per byte, 8 bytes; decode loop covers bytes 1-7 only
**Edge cases handled:** Byte 0 is never decoded and is always sent as 0; Values with byte 1 of 10 or more, or any non-zero byte 0, overflow Int64 when encoded
**Suspected defect:** Encoding overflows Int64 once the database row version passes about 9.2e18 in base-1000 terms (byte 0 non-zero or byte 1 >= 10), and decoding drops byte 0. On a high-volume database this would break every update with false conflicts or errors.
**Confidence:** High

### RULE-019: Aircraft current airframe hours shown net of the offset
**Category:** Calculation
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Controllers/FleetController.cs:96-97`
**Also cited:** 121-122 (called from GetList:37 and GetItem:72); FLTWebAPI/FltWebApi/Controllers/FleetController.cs:96-97,121-122
**Plain English:** The API reports an aircraft's current airframe hours as the stored current hours minus the aircraft's airframe-hours offset, and also returns the offset itself.
**Specification:**
  Given An aircraft stored with AirframeHoursCurrent 1,300.0 and AirframeHoursOffset 50.0
  When  The fleet or a single aircraft is requested
  Then  AirframeHoursCurrent is returned as 1,250.0 and AirframeHoursOffset as 50.0
**Parameters:** The subtraction is done in FleetController.cs:96 and :121. MeterUnitId (Aircraft.cs:19) gives the meter unit.
**Edge cases handled:** The flight endpoint adds the offset (meter to airframe) but the fleet endpoint subtracts it, so the aircraft value seems to be converted back to the meter reading
**Suspected defect:** The offset is applied in opposite directions (subtracted for Aircraft, added for Flight). The field named AirframeHoursCurrent may actually return the meter reading, which could mislead clients that use it to pre-fill HobbsStart or to check maintenance hours.
**Confidence:** Medium — Is Aircraft.AirframeHoursCurrent meant to be the raw Hobbs meter reading (stored hours minus offset) or true airframe hours? The fleet endpoint subtracts the offset while the flight endpoint adds it. / Citation was corrected by referee (The rule is real, but the citation points at the wrong lines. Lines 114-115 only copy AircraftGUID and CurrentLocationId into the response object. They do no hour…

### RULE-020: Interactive export cutoff: default yesterday or full history
**Category:** Calculation
**Priority:** P1
**Source:** `FLTWebApp/export/export.aspx.vb:41-56`
**Plain English:** On the Export page the user picks either 'only flight data recorded on or after a date' (defaults to yesterday) or 'include all flight data'. The second option uses 1 January 1900 as the cutoff.
**Specification:**
  Given Today is 10/15/2026 and the page is first loaded
  When  The user clicks Create Export File
  Then  With the first option the cutoff is the entered date (pre-filled with 10/14/2026, i.e. today minus 1 day, MM/dd/yyyy). With 'Include All Flight Data' the cutoff is 01/01/1900. The export includes only flights whose UTC modified date is on or after the cutoff (FltExportManager.vb:297).
  And   If the first option is selected and the text is not a valid date, the error 'Flights Since Date is a required date value.' is shown and no file is created
**Parameters:** Default lookback = 1 day (Date.Now.AddDays(-1)); full-history sentinel = 01/01/1900; the business-layer overload without a date uses 01-Jan-2000 (FltExportManager.vb:22)
**Edge cases handled:** Switching to 'Include All' disables the date box and shows 'Not Applicable' (export.aspx.vb:30-39); The cutoff applies only to flights (Usages). Programs, aircraft, configurations and locations are always exported in full; The cutoff is a local-time date but is compared to the flight's UtcDateModified
**Suspected defect:** There are two different 'all data' sentinels (1900-01-01 on the page, 2000-01-01 in the business-layer overload), so the overload silently leaves out pre-2000 changes. The local-date cutoff is compared with UTC modification timestamps.
**Confidence:** High

### RULE-021: New flight starting meter values default from aircraft's current readings
**Category:** Calculation
**Priority:** P1
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:399-411`
**Plain English:** When a new flight is added, its Hobbs start defaults to the aircraft's current airframe hours minus the current meter offset, its engine hours start defaults to the aircraft's current engine hours, and the current meter offset is recorded on the flight.
**Specification:**
  Given An aircraft with current airframe hours 1,736.0, meter offset 500.0 and current engine hours 820.3
  When  A user starts adding a new flight for that aircraft
  Then  Airframe hours start shows 1,736.0, used meter offset 500.0, Hobbs start 1,236.0 (1,736.0 - 500.0) and engine hours start 820.3
  And   On save, the flight's UsedMeterOffset is taken from the flight key info for new flights, but from the displayed label for existing flights (lines 477-481)
**Parameters:** Meter mask '#,##0.0;-#,##0.0'
**Edge cases handled:** Engine hours start is only defaulted when an aircraft has been chosen (AircraftId <> 0); In edit mode the stored values are shown instead of recomputed defaults (lines 411-421)
**Confidence:** High

### RULE-022: Liquid fill airframe-hours reading derived from Hobbs reading
**Category:** Calculation
**Priority:** P1
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:543-602`
**Plain English:** Each fuel/oil/liquid fill records the Hobbs reading at the time of fill and an airframe-hours reading equal to that Hobbs reading plus the aircraft's meter offset; if no Hobbs reading is entered, it defaults to the aircraft's current airframe hours minus the offset.
**Specification:**
  Given A flight on an aircraft with meter offset 500.0 and current airframe hours 1,736.0
  When  A liquid fill row is added with Hobbs reading 1,235.2
  Then  The fill is stored with Hobbs reading 1,235.2 and airframe hours reading 1,735.2
  And   If the Hobbs reading is left blank, the Hobbs reading stored is 1,236.0 (1,736.0 - 500.0)
**Parameters:** Offset = FlightKeyInfo.AirframeHoursOffset; mask '#,##0.0;-#,##0.0'
**Edge cases handled:** Blank Hobbs on add: airframeHoursReading variable stays 0 and is stored as 0.0 even though the Hobbs reading is defaulted (lines 544-547, 569); A fill row is only created if at least one of group, type, unit, amount, Hobbs, location or approver is entered (lines 551-552); On row update, the airframe hours reading is recomputed as Hobbs + offset (line 599)
**Suspected defect:** On add with blank Hobbs, AirframeHoursReading is saved as 0.0 instead of defaulted Hobbs + offset. On update (lines 595-599), the default-Hobbs branch tests whether the liquid AMOUNT is numeric, uses current hours without subtracting the offset, and is then immediately overwritten by the textbox value, so a blank Hobbs causes CDec('') to fail.
**Confidence:** Medium — When the Hobbs reading on a liquid fill is left blank, should the airframe-hours reading be the aircraft's current airframe hours (consistent with the defaulted Hobbs) rather than 0.0?

### RULE-023: Current Pacific Time derivation for edit window
**Category:** Calculation
**Priority:** P1
**Source:** `FltFleet/AircraftStatusManager.vb:85-97`
**Plain English:** The system estimates the current Pacific time by taking the server's local time and subtracting hours based on the server's time-zone name.
**Specification:**
  Given A server whose standard time-zone name contains "Eastern", at 17:00 local time
  When  The edit-window check runs
  Then  Pacific time is computed as 14:00 (17:00 - 3h)
**Parameters:** Eastern = -3h, Mountain = -1h, Central = -2h but then overwritten to 0 (line 93). Any other zone = 0h.
**Edge cases handled:** A server in Central time gets 0 hours subtracted, so the edit window is judged 2 hours late; A server in Pacific or UTC gets 0 hours subtracted. A UTC server would be 7-8 hours off; Matching uses a substring of the lowercase StandardName
**Suspected defect:** Line 93 checks "central" a second time and sets the offset to 0. The developer almost certainly meant "pacific". As a result, Central-zone servers apply no correction.
**Confidence:** High

### RULE-024: Aircraft accumulated flight usage (Hobbs total)
**Category:** Calculation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:12905-12937`
**Also cited:** tsql/alter_procedure_listAircraftInfos.sql:61-103
**Plain English:** An aircraft's current usage is the sum of (Hobbs end minus Hobbs start) over all of its active, non-deleted flights. An aircraft with no flights shows 0.
**Specification:**
  Given Aircraft 10 has active flights with Hobbs 100.0-102.5 and 102.5-104.0, plus one deleted flight of 3.0 hours
  When  listAircraftInfos is run
  Then  CurrentUsage = 2.5 + 1.5 = 4.0 hours. The deleted flight is excluded. The value is shown next to TotalRequiredUsage.
**Parameters:** Original source database/FLT_Schema.sql:12905-12937. Result type DECIMAL(8,1), maximum 9,999,999.9. Flight filter: IsActive=1 AND IsDeleted=0. Default 0 through ISNULL.
**Edge cases handled:** A flight where HobbsEnd < HobbsStart adds a negative amount; nothing prevents it; A NULL HobbsEnd or HobbsStart makes that flight's usage NULL, and SUM ignores it; Usage counts every flight in the aircraft's whole history, regardless of location or test period; AirframeHoursStart, AirframeHoursOffset and AirframeHoursCurrent are returned but not combined with the Hobbs usage
**Confidence:** Medium — Should usage count only approved flights, and should UsedMeterOffset or MeterUnitId adjust the Hobbs difference?

### RULE-025: Usage accumulated at a test location
**Category:** Calculation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:13142-13182`
**Plain English:** For each aircraft stay at a location, the accumulated usage is the sum of Hobbs hours of the aircraft's active flights from that location, departing between the arrival date and the actual end-of-test date.
**Specification:**
  Given Aircraft 10 arrived at location 5 on 2026-03-01 with ActEndOfTest 2026-06-30. It has flights from location 5 of 2.0 h (2026-04-02) and 1.5 h (2026-07-05).
  When  listAircraftLocations is run
  Then  AccumUsage = 2.0 hours (the July flight is after the end of test) and is shown next to RequiredUsage
**Parameters:** Original source database/FLT_Schema.sql:13113-13114 and 13142-13182. A NULL ArrivalDate defaults to 1900-01-01. A NULL ActEndOfTest defaults to 2099-12-12. Working sum DECIMAL(12,1), displayed as DECIMAL(9,1). The window uses DepartureDateTime_Local and includes both ends. Default filters: IsActiveFilter=1, IsDeletedFilter=0. Sorted by ArrivalDate descending.
**Edge cases handled:** The stored AircraftLocation.AccumUsage column is ignored. The displayed value is always recalculated from flights.; The upper limit is inclusive and the date literal is 2099-12-12 rather than 2099-12-31; Paging rows are removed before usage is calculated, so only the shown stays are calculated
**Suspected defect:** Usage is grouped by AircraftId and LocationId, not by AircraftLocationId. If an aircraft visits the same location twice, the flights of both stays are added together and the total is shown on both rows.
**Confidence:** High

### RULE-026: Location and program test-completion percentage
**Category:** Calculation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:14434-14471`
**Plain English:** Location progress is the aircraft's cumulative flight hours at that location up to the report date as a percentage of the location's required usage. Program progress is the aircraft's cumulative hours across its qualifying locations as a percentage of its total required usage. A missing or zero goal gives 0%.
**Specification:**
  Given Aircraft 12 at location 3 has RequiredUsage 200.0 h and active flights there up to 2024-05-14 totalling 50.0 airframe hours, and Aircraft.TotalRequiredUsage 400.0 h with 120.0 h total across qualifying locations
  When  rptDailyUsage runs for 2024-05-14
  Then  LocationPercentComplete = 25.0 (100 × 50.0 / 200.0) and ProgramPercentComplete = 30.0 (100 × 120.0 / 400.0)
**Parameters:** Formula: 100 × SUM(AirframeHoursEnd − AirframeHoursStart) / goal, returned as FLOAT with no rounding. Goal 0 or NULL gives 0. Flights counted: FlightDate <= report date, IsDeleted = 0, IsActive = 1. Also LastMeterReading = MAX(AirframeHoursEnd), falling back to Aircraft.AirframeHoursStart; HoursOnDate = airframe end − start for the flight on the report date (0 if none); DateLastRun = MAX(FlightDateSort). Original location: database/FLT_Schema.sql:14383-14471.
**Edge cases handled:** Program-level usage only counts flights at locations in the qualifying-assignment set, not all of the aircraft's flights.; If an aircraft has two qualifying assignment rows for the same location, the join doubles its flight hours.; An aircraft linked to several tests, or with several flights on the report date at one location, produces duplicate rows.; Aircraft linked to an inactive test are excluded entirely; aircraft with no test show 'None Assigned'.; Percentages can exceed 100.; ProgramEndTestDate is just Aircraft.EstEndOfTesting.
**Suspected defect:** Program percent complete is limited to hours at currently qualifying locations, so hours flown at earlier, ended assignments are left out. That understates program progress.
**Confidence:** High

### RULE-027: Fuel burn running totals and average per aircraft
**Category:** Calculation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:14831-14864`
**Plain English:** Per aircraft, the report keeps running totals of flight airtime, refill-interval airtime and liquid added, and computes an average of total refill airtime divided by total liquid. All totals restart when the aircraft changes.
**Specification:**
  Given Aircraft 12 has refills covering 4.0 h with 40 units and 6.0 h with 50 units, and the report date range starts after the first refill
  When  rptFuelBurnByRefill runs
  Then  the second fill row shows TotalRefillAirtime 10.0, TotalLiquidAmt 90.000 and AvgUsage 0.111 (10.0 / 90). Running totals include history before DateFrom because the date filter is applied only to the final output.
**Parameters:** Reset on aircraft change: RefillMeterLast = the new aircraft's first FlightMeterStart, and all totals = 0. AvgUsage = TotalRefillAirtime / TotalLiquidAmt, 0 if total = 0, stored as DECIMAL(6,3). Output filtered to FlightDate between @DateFrom and @DateThru (excerpt 891-892; original database/FLT_Schema.sql:15011-15012). @AircraftId -1 = all aircraft in the program.
**Edge cases handled:** The date filter is applied after accumulation, so totals and averages are lifetime-to-date rather than period-only.; Rows are inserted ordered by HobbsStart, but the cursor processes them ordered by FlightDate, FlightMeterStart and AirframeHoursReading, which can differ.; The flight-level filters ignore Program.IsActive and only check IsDeleted.
**Confidence:** High

### RULE-028: Fuel/liquid usage per refill interval
**Category:** Calculation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:14855-14942`
**Plain English:** For each refill of the selected liquid, the hours flown since the previous refill are divided by the amount added to give hours per unit of liquid. The refill meter reading is the airframe-hours reading, or the Hobbs reading when no airframe reading was recorded.
**Specification:**
  Given The previous refill of aircraft 12 was at meter 1500.0 and a new fuel fill of 40.000 units is logged with AirframeHoursReading 1504.0
  When  rptFuelBurnByRefill processes that fill
  Then  RefillAirtime = 4.0 and Usage = 4.0 / 40.000 = 0.100 hours per unit, and the refill baseline moves to 1504.0
**Parameters:** Refill meter = AirframeHoursReading if non-zero, else HobbsReading. Usage = (RefillMeterCurrent − RefillMeterLast) / LiquidAmt, 0 if LiquidAmt = 0. Only fills with LiquidGroupId = @LiquidGroupId, IsDeleted = 0 and IsActive = 1. The baseline for an aircraft's first refill is the FlightMeterStart (AirframeHoursStart) of its first flight. Original location: database/FLT_Schema.sql:14855-14943.
**Edge cases handled:** If a flight has several fills, the flight start/end/airtime columns are NULL on the second and later fill rows, so the flight is not double counted.; Flights with no fill still produce a row with flight airtime and no refill data.; If both refill readings are 0, the current meter is 0 and the refill interval goes negative.; LiquidAmt is held as DECIMAL(6,3) in #flights and the cursor variable, so amounts of 1000 or more overflow.
**Suspected defect:** 'Usage' is hours per unit of liquid (inverse burn rate), not liquid consumed per hour as the report name 'Fuel Burn' suggests. LiquidAmt DECIMAL(6,3) overflows for fills of 1,000 or more.
**Confidence:** High

### RULE-029: Flight usage hours per flight
**Category:** Calculation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:15049-15051`
**Plain English:** A flight's usage (daily hours) is the airframe hours end reading minus the start reading, except in the flight list and the outlier report, which use the Hobbs meter difference.
**Specification:**
  Given A flight with AirframeHoursStart 1500.2, AirframeHoursEnd 1503.7, HobbsStart 900.0 and HobbsEnd 903.4
  When  rptFlightData or rptDailyUsage computes hours
  Then  DailyHours = 3.5. listFlightInfos FlightUsage and the rptFlightOutliers airtime = 3.4 (Hobbs).
**Parameters:** Airframe basis: rptFlightData (original database/FLT_Schema.sql:15051) and rptDailyUsage (excerpt 395, 423, 446). Hobbs basis: listFlightInfos (excerpt 240; original 12355) and rptFlightOutliers (excerpt 1048, 1084).
**Edge cases handled:** There is no guard that the end reading is at least the start reading, so negative usage is possible.; UsedMeterOffset is stored but never used in any usage calculation.
**Suspected defect:** Two different meters (airframe hours and Hobbs) are both labelled 'usage' or 'airtime', so screens and reports can disagree for the same flight.
**Confidence:** Medium — Which meter is the authoritative measure of flight usage, airframe hours or Hobbs, and what is UsedMeterOffset meant to adjust?

### RULE-030: Flight outlier detection by standard deviation
**Category:** Calculation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:15144-15233`
**Plain English:** A flight is flagged as an outlier when its duration in minutes, or its Hobbs airtime, is greater than the average for its location, flown route and meter unit plus N standard deviations, where N is supplied by the user.
**Specification:**
  Given Location 3, route 7, meter unit 1 has average flight time 120 min with standard deviation 15, and average airtime 2.0 with standard deviation 0.3; N = 2
  When  a flight in the date range lasted 155 minutes with Hobbs airtime 2.4
  Then  FlightTimeOutlier = 1 (155 > 150), FlightAirtimeOutlier = 0 (2.4 <= 2.6), and the flight is listed
**Parameters:** Threshold = AVG + @NbrOfStDevs × STDEV, with STDEV NULL treated as 0. Minute statistics are stored as INT, so they truncate. Group = route's LocationId, FlownRouteId, MeterUnitId. Date range is FlightDateSort between @DateBegin and @DateEnd as string comparison. Original location: database/FLT_Schema.sql:15144-15233.
**Edge cases handled:** Only unusually long or high values are flagged; unusually short flights are never outliers (one-sided test, ABS of a positive duration).; A group with a single flight has STDEV 0, so the threshold equals that flight's own value and it is not flagged.; Statistics are grouped by the route's location, but flights are matched by the flight's own LocationId.; Statistics filter on the program via Aircraft.ProgId, but the output filters via Location.ProgId.
**Suspected defect:** Neither the statistics nor the output filter on Flight.IsDeleted or IsActive, so deleted or inactive flights skew the averages and can be reported as outliers. Truncating average and stdev minutes to INT shifts the threshold.
**Confidence:** High

### RULE-031: Export meter and check-value conversions
**Category:** Calculation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessLogic/FltExportManager.vb:351-376`
**Plain English:** In the export, a liquid fill's meter reading is reported as the Hobbs reading plus the flight's meter offset, oil/hydraulic levels are expressed in quarters, and checklist answers are mapped 1 = Yes, -1 = No, anything else = Not Answered.
**Specification:**
  Given Liquid fill Hobbs 101.2, flight UsedMeterOffset 10.0; PreFlightFtiOK = 1, PostFlightFtiOK = 0; oil level 3
  When  The flight is exported
  Then  LiquidFillMeter = '111.2'; PreFlightFtiOK = 'Yes'; PostFlightFtiOK = 'Not Answered'; OilLevelIndicatorStart = '3/4'
**Parameters:** Format '#,##9.9'; check codes 1/-1/other (CheckYesNo at lines 506-517)
**Edge cases handled:** Liquid fill object is mutated in memory during export
**Suspected defect:** Line 355 exports PreFlightTelemetryCheckComplete using the PostFlightTelemetryCheckComplete value; String.Format is called with a numeric first argument and '#,##9.9' as an argument, so the composite format is likely not applied as intended.
**Confidence:** High

### RULE-032: Export UTC offset notation
**Category:** Calculation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessLogic/FltExportManager.vb:484-504`
**Plain English:** Exported local date-times carry a UTC offset suffix computed from the difference between local and UTC values.
**Specification:**
  Given Local 2026-07-01 08:30, UTC 12:30
  When  Formatted for export
  Then  '2026-07-01T08:30-04:00'
**Parameters:** Sign '+' only when the hour difference is > 0
**Edge cases handled:** Zero offset produces '-00:00'; Positive half-hour offsets under 1 hour (e.g. +00:30) are rendered with '-'; Location TimeZone element is 'UTC' & Format(offset,'00'), so +5 renders 'UTC05' and -5 'UTC-05' (line 269)
**Suspected defect:** Sign logic uses hours only, mis-signing zero and sub-hour positive offsets.
**Confidence:** High

### RULE-033: Meter readings stored as decimals and shown to one decimal place
**Category:** Calculation
**Priority:** P2
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:404-411`
**Plain English:** Fault-occurred, start-of-work and end-of-work meter readings (e.g. flight hours) are saved as decimals and shown with thousands separators and one decimal place.
**Specification:**
  Given A MeterStartWork stored as 1234.56
  When  The work order is loaded
  Then  It is shown as "1,234.6"; on save, the displayed string is converted back with CDec, so 1,234.6 is stored (the second decimal is lost after a load/save round trip)
**Parameters:** Display format "#,##0.0"; save conversion CDec (lines 201, 206, 209, 324, 329, 332)
**Edge cases handled:** Saving an untouched work order can change a stored 2-decimal meter value to 1 decimal
**Suspected defect:** Round-tripping through the 1-decimal display string silently changes stored meter precision.
**Confidence:** High

### RULE-034: Flight time split across operating regions
**Category:** Calculation
**Priority:** P2
**Source:** `FLTWebAPI/FltWebApi/Models/RegionTime.cs:11-16`
**Plain English:** A flight's time is broken down into hours spent in each operating region.
**Specification:**
  Given A 1.5-hour flight with 1.0 hours in region 'N' and 0.5 hours in region 'S'
  When  The RegionTimes are recorded
  Then  Two RegionTime rows are stored (1.0 and 0.5 hours); the model does not check that they add up to the flight duration
**Parameters:** Region catalog: Region.cs:11-16 (Id, Code, Name). Flight.RegionTimes collection: Flight.cs:53.
**Edge cases handled:** Hours are decimals with no stated precision; Region hours may not match HobbsEnd - HobbsStart
**Confidence:** Low — Must the sum of RegionTime hours equal the flight's Hobbs duration (HobbsEnd - HobbsStart), and to what precision?

### RULE-035: Last-update timestamp displayed in Pacific Time
**Category:** Calculation
**Priority:** P2
**Source:** `FltFleet/AircraftStatus.vb:105-120`
**Plain English:** Each aircraft's last-modified UTC time is shown as Pacific Time by subtracting 8 hours, or 9 hours when the server is currently on daylight saving time.
**Specification:**
  Given UTCDateModified = 2026-07-01 20:00 UTC and the server is on DST today
  When  The fleet board shows the "Last Update (PT)" column
  Then  It displays 2026-07-01 11:00 (20:00 - 9h). The real PDT time is 13:00.
**Parameters:** Standard offset -8h. DST offset -9h. DST is judged from the server's local zone on today's date (Date.Now), not on the record's date.
**Edge cases handled:** UTCDateModified of MinValue or NULL displays blank; Any exception displays blank
**Suspected defect:** Pacific Daylight Time is UTC-7, not UTC-9, so DST timestamps are 2 hours early. DST is also taken from the current date on the server, not from the record's date.
**Confidence:** High

## Validation

### RULE-036: Optimistic concurrency: reject a save when someone else edited the record first
**Category:** Validation
**Priority:** P0
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:215-230`
**Also cited:** database/FLT_Schema.sql:15769-15791
**Plain English:** Every update sends the record's version stamp as last read; if the database reports the row was changed by another user since then, the save is refused and the user is told 'Row has been edited by another user'.
**Specification:**
  Given Two planners open work order #1001 with version stamp 7209; planner A saves first, moving the stamp to 7210
  When  Planner B saves the copy still carrying stamp 7209
  Then  The update procedure raises 'Row has been edited by another user', the DAL surfaces that exact message to the user (not the generic data-error text), and for a work order the whole transaction is rolled back
**Parameters:** Exact match string: "Row has been edited by another user" (raised by stored procedures, matched by message text). Applied identically in ProgramDB.vb:153-159, RouteDB.vb:141-147, RegionDB.vb:134-140, UTCTimeZoneDB.vb:151-157, WeightDefDB.vb:141-147, WeightDefTypeDB.vb:132, fltLookupBaseDb.vb:133-139, WorkOrderPartDB.vb:225-231, WOEngineerCommentDB.vb:224-230, WOMechanicCommentDB.vb:225, WOReasonDB.vb:217, WOInstructionDB.vb:217, WOPerformedWorkDB.vb:217.
**Edge cases handled:** Inserts do not carry a version stamp and cannot conflict; The conflict check itself lives in the stored procedures; the code relies on an exact English error message; In the standalone child-record Update wrappers (e.g. WorkOrderPartDB.vb:166-168, WOEngineerCommentDB.vb:165-167) the concurrency message is swallowed and replaced with the generic data-error text, so…
**Confidence:** Medium — Should child-record edits saved on their own (outside the work-order save) also show the 'edited by another user' message? Today those wrappers hide it. / Is ConcurrencyId a SQL Server rowversion/timestamp column (changes automatically), or does a trigger or the application increment it? If neither, the second save would succeed and the check would not work.

### RULE-037: Unattended export must run as an authenticated, authorized FLT service user
**Category:** Validation
**Priority:** P0
**Source:** `FLTExportConsoleApp/FLTExportConsoleApp/Program.vb:37-47`
**Also cited:** (credential target + AuthenticateUserLogin call); FLTBizObjects/BusinessLogic/fltIdentityManager.vb:18-39 (authentication rejections); FLTBizObjects/BusinessLogic/FltExportManager.vb:28-38 (Export CanView authorization); supporting: FLTExportConsoleApp/FLTExportConsoleApp/CredentialHelper.vb:37-60…
**Plain English:** Before the export runs, the app reads a username and password from the Windows Credential Manager entry 'FLT.Export.Auth' and logs in to FLT with them. If no credential is stored, login fails, or the user lacks Export view permission, no file is produced.
**Specification:**
  Given Windows Credential Manager holds a generic credential with target 'FLT.Export.Auth' for an active, not-deleted, not-locked-out FLT user who has CanView on 'Export'
  When  the export console app starts
  Then  FltIdentityManager.AuthenticateUserLogin returns an identity, FltExportManager.CanView passes, and the download file is built. If the credential is missing, the run stops with 'Credential not found'. If the account is unknown, deleted or inactive, it stops with 'Failed Login Attempt'. If the account is locked out, it stops with 'User account is locked out'. If the user is not authorized, it stops with 'Can't Export - user is not authorized'
**Parameters:** Credential target name = 'FLT.Export.Auth' (Program.vb:39). Credential type = CRED_TYPE_GENERIC (1). The password is decoded as a UTF-16 blob of CredentialBlobSize/2 characters. No credential values are stored in source. Authentication is called at Program.vb:43, and the authorization check is in FLTBizObjects/BusinessLogic/FltExportManager.vb:28-38.
**Edge cases handled:** If the stored credential has an empty password blob, an empty password is sent to login (and will probably fail); Lockout policy (Lockout_Duration, MaximumLoginFailuresAllowed) comes from AppConfiguration in FLTBizObjects. Failed logins by the batch job can lock the service account; The identity is resolved while the arguments are evaluated, so the download path and since-date are read first. A config error there aborts the run before authentication
**Confidence:** Medium — Citation was corrected by referee (The behavior is real, but the cited lines cover only the first step. CredentialHelper.vb:37-60 reads the stored credential. It calls CredRead with CRED_TYPE_GENERIC (1) and throws 'Credential not found' if that fails (lines 41-42). It decodes the password as UTF-16 with CredentialBlobSize \ 2 characters (line 51). It returns UserName and Password. These lines do…

### RULE-038: Only logged-in users may view application pages
**Category:** Validation
**Priority:** P0
**Source:** `FLTWebApp/FLT.Master.vb:17-30`
**Plain English:** Any page that uses the main layout, plus the home page, sends the visitor to the Login page unless the session holds a user identity marked as logged in.
**Specification:**
  Given A visitor whose session identity is the anonymous identity created when the session started (IsLoggedIn = False)
  When  They request /Default.aspx or any page built on FLT.Master (including the NotFound and Oops error pages)
  Then  They are redirected to ~/Login.aspx. Otherwise the page shows the user's display name and last login date in the footer and builds the program list and menu on first load.
**Parameters:** Session key 'fltIdentity'; redirect target ~/Login.aspx. The same check is repeated in FLTWebApp/Default.aspx.vb:11-18.
**Edge cases handled:** Session_Start (Global.asax.vb:23-26) always places a new, not-logged-in FltIdentity in session, so the identity is normally present but anonymous; The error pages ErrorPages/NotFound.aspx and ErrorPages/Oops.aspx use FLT.Master, so an anonymous user who hits an error is sent to Login and never sees the error page; The identity is written back to session on PreRender (FLT.Master.vb:32-34)
**Suspected defect:** The guard uses VB 'Or' instead of 'OrElse' (FLT.Master.vb:19, Default.aspx.vb:14). If the session identity is ever Nothing, evaluating fltIdentity.IsLoggedIn throws a NullReferenceException instead of redirecting.
**Confidence:** High

### RULE-039: Uploads are limited to file extensions registered as Document Types
**Category:** Validation
**Priority:** P0
**Source:** `FLTWebApp/documents/DocumentAdd.aspx.vb:63-76`
**Plain English:** An uploaded file's type is found by matching its extension against the configured Document Types. If the extension is not registered, the upload is refused, so the Document Types table acts as the allow-list of accepted file types.
**Specification:**
  Given The Document Types table contains '.pdf' (id 3) and '.docx' (id 5)
  When  A user uploads 'Report.PDF', and later 'payload.exe'
  Then  'Report.PDF' gets DocumentTypeId 3, because the match ignores case. 'payload.exe' gets DocumentTypeId 0, and DocumentInfo.Validate rejects it with 'DocTypeId is required'.
**Parameters:** The extension is the text from the last '.' to the end of the file name, including the dot (DocumentAdd.aspx.vb:42). The fallback id is 0. Rejection happens because VB treats 0 = Nothing as true in DocumentInfo.vb:236.
**Edge cases handled:** A file name with no '.' makes LastIndexOf return -1, and Substring(-1) then throws an exception, so the upload fails with a technical error message.; For 'archive.tar.gz' only '.gz' is used.; The first matching Document Type wins.
**Suspected defect:** The allow-list works only because VB treats 0 as equal to Nothing. The rejection message 'DocTypeId is required' does not tell the user the file type is not allowed.
**Confidence:** High

### RULE-040: One flight per aircraft, location, date and work shift
**Category:** Validation
**Priority:** P0
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:141-180`
**Plain English:** A flight is uniquely identified by aircraft, location, flight date and work shift; if a flight already exists for that combination the user cannot create a duplicate and is offered to edit the existing flight, retry with different keys, or cancel.
**Specification:**
  Given A flight already exists for aircraft MSN 001 at location 'Site A' on 03/15/2026, work shift 'Day'
  When  A user adding a new flight enters the same aircraft, location, date and shift and clicks Next
  Then  The page shows 'This flight already exists!' with options Edit, Retry, Cancel and does not open the new-flight form
  And   If the key lookup returns validation errors, the message 'Unable to retrieve information. Please correct errors and try again.' is shown and the form does not advance
**Parameters:** Key = (AircraftId, LocationId, FlightDateSort, WorkShiftId) resolved by FlightKeyInfoManager.GetItem
**Edge cases handled:** Edit loads the existing flight by FlightKeyInfo.FlightId and switches page to edit mode (lines 182-200); Retry re-shows Next and hides Edit/Retry (lines 202-208); Uniqueness determination (ValidFlight) is computed in the business layer, not in this page
**Confidence:** High

### RULE-041: Program report pages require a logged-in session
**Category:** Validation
**Priority:** P0
**Source:** `FLTWebApp/reports/rptFleet.aspx.vb:17-22`
**Plain English:** A user must be logged in before they can open any program report page (Config Values, Fleet, Locations, Regions, Routes, Weight Tracking). If not, they are sent to the login page.
**Specification:**
  Given A browser session whose fltIdentity has IsLoggedIn = False
  When  The user opens /reports/rptFleet.aspx (or any of the other five report pages)
  Then  The user is redirected to ~/Login.aspx and no report controls are served
**Parameters:** Redirect target ~/Login.aspx; session key 'fltIdentity'. Identical guard in rptConfigValues.aspx.vb:20-23, rptLocations.aspx.vb:19-22, rptRegions.aspx.vb:19-22, rptRoutes.aspx.vb:19-22, rptWeightTracking.aspx.vb:19-22.
**Edge cases handled:** No fltIdentity in session at all: the check uses VB 'Or' (not 'OrElse'), so IsLoggedIn is evaluated on Nothing and throws instead of redirecting; Report-level authorization delegates to Rpt*Manager.CanView, which currently returns True for every user (e.g. FLTBizObjects/BusinessLogic/RptFleetManager.vb:221-228), so any logged-in user can downl…
**Suspected defect:** Non-short-circuit 'Or' means a missing session object raises a NullReferenceException (unhandled error page) rather than redirecting to Login. Separately, CanView is a stub that always returns True, so there is no role-based restriction on report downloads.
**Confidence:** High

### RULE-042: Self-service password change requires old password and matching confirmation
**Category:** Validation
**Priority:** P0
**Source:** `FLTWebApp/userProfile/ChangePassword.aspx.vb:28-45`
**Plain English:** A logged-in user can change their own password only after entering the correct current password and the same new password twice. Success stores a new salt and hash.
**Specification:**
  Given User 'jdoe' whose stored hash equals hash('Old#1', salt)
  When  jdoe submits old 'Old#1', new 'New#2', confirm 'New#2'
  Then  A new salt is generated, the password is stored as hash('New#2', newSalt), the user record (including the Email typed on the form) is updated, and the success view is shown. A wrong old password fails with 'Old Password not valid!'. A confirmation mismatch fails with 'Confirm New Password does not match New Password value!'.
**Parameters:** The check order is old-password hash first, then confirmation match (FLTBizObjects/BusinessLogic/FltUserManager.vb:93-110). The audit stamp is 'Password Change' when the identity username is empty (FltUserManager.vb:50).
**Edge cases handled:** The Email field on this page is saved together with the password change, so a user can change their email here; The page shows no password strength or length rule; any strength rules would come from FltUser.Validate broken rules; The user object, including the password hash and salt, is kept in Session('_fltUser') between postbacks (line 25)
**Suspected defect:** No password complexity rule is visible. The email address can be changed on the password screen without separate verification.
**Confidence:** High

### RULE-043: Aircraft status editing requires Fleet CanEdit plus a role time window
**Category:** Validation
**Priority:** P0
**Source:** `FltFleet/AircraftStatusManager.vb:26-59`
**Plain English:** A user can change an aircraft's status only with Fleet Edit rights and only during an edit time window set for one of their roles. Super users can edit at any time.
**Specification:**
  Given A non-super user who holds Fleet CanEdit and is in role 3 (window 08:00-14:30 PT)
  When  They open an aircraft at 14:31 PT
  Then  Editing is refused: the page shows "You cannot edit the aircraft status at this time." and disables Save, Status and both comment fields. At 14:30 PT, editing is allowed.
**Parameters:** Time is coded as HHMM (hour*100+minute), and both window ends are inclusive. Role 3: 08:00-14:30. Role 7: 08:00-16:00 (Web.config:10-17). Super users bypass the window. Fleet CanEdit is checked first.
**Edge cases handled:** A user with several roles is allowed if any one role's window matches; A role with no window configured (any of the 4 keys missing) never allows editing, unless the user is a super user; Windows cannot cross midnight because the comparison is simple; Day of week and holidays are ignored
**Suspected defect:** SaveButton_Click (EditAircraftStatus.aspx.vb:46-49) saves without checking CanEdit again on the server. Only the page controls are disabled, so a crafted postback, or a page loaded before the window closed, can still save after hours or without rights.
**Confidence:** Medium — P0 panel doubts spec fidelity: P0 is justified. This is the authorization gate on who can change an aircraft's UP/DOWN/OFF TEST status and when. That is security and data-integrity control over operational fleet state, not a minor validation. Fidelity is only partial. Several parts match the code. AircraftStatusManager.vb:28-29 checks Fleet CanEdit first. Lines 37-39 let super users bypass the wi…

### RULE-044: Duplicate flight entry check (aircraft + location + date + shift)
**Category:** Validation
**Priority:** P0
**Source:** `database/FLT_Schema.sql:3847-3855`
**Also cited:** tsql/DuplicateFlightKeyModification.sql:68-75
**Plain English:** Only one flight log may exist per aircraft, per location, per flight date, per work shift; a second one is reported as a 'Duplicate Flight Entry'.
**Specification:**
  Given Aircraft 12 already has a non-deleted flight at location 3 on FlightDateSort '2024-05-14' for work shift 1
  When  addFlight is called with AircraftId 12, LocationId 3, FlightDateSort '2024-05-14', WorkShiftIndicatorId 1
  Then  the error 'Duplicate Flight Entry' (severity 16) is raised. Because there is no RETURN after it, the INSERT still runs unless the caller rolls back.
**Parameters:** Uniqueness key = AircraftId, LocationId, FlightDateSort, WorkShiftIndicatorId among rows with IsDeleted = 0. Error severity 16. Original location: database/FLT_Schema.sql:3847-3855 (addFlight).
**Edge cases handled:** Soft-deleted flights (IsDeleted = 1) do not count, so a deleted flight can be re-entered.; Inactive but not deleted flights (IsActive = 0) still count as duplicates.; updateFlight (excerpt lines 1128-1272) does not repeat this check, so an edit can move a flight onto an existing aircraft/location/date/shift slot.
**Suspected defect:** RAISERROR at severity 16 does not stop the procedure and there is no RETURN, so execution goes on to the INSERT. Whether the duplicate is actually blocked depends on how the caller handles the error (transaction rollback or not). | RAISERROR with severity 16 does not stop the batch, and there is no RETURN or ROLLBACK, so the INSERT at lines 77-169 still runs. The caller gets an error, but the duplicate flight is saved anyway (and an approved one also updates the aircraft hours).
**Confidence:** Medium — Does the calling application wrap addFlight in a transaction and roll back when 'Duplicate Flight Entry' is raised, or do duplicate flight rows actually get saved today? Also, should updateFlight enforce the same uniqueness rule? / Should a duplicate flight be hard-blocked with no insert? Should soft-deleted or inactive flights count toward the duplicate check?

### RULE-045: Login credential and account-status check
**Category:** Validation
**Priority:** P0
**Source:** `database/FLT_Schema.sql:6743-6753`
**Plain English:** A user can log in only when the user name and password match one account (ignoring upper/lower case), and that account is approved, active, not deleted and not locked out.
**Specification:**
  Given FltUser 'JSMITH' has a stored password, IsApproved=1, IsActive=1, IsDeleted=0, IsLockedOut=0
  When  fltValidateLogin is called with UserName 'jsmith' and the same password typed in a different letter case
  Then  Exactly 1 row matches, so login succeeds and the profile and program result sets are returned. If any flag fails (for example IsLockedOut=1), or the count is not exactly 1, no result set is returned and the caller treats the login as failed.
**Parameters:** Original source database/FLT_Schema.sql:6743-6753. Required flags: IsApproved=1, IsActive=1, IsDeleted=0, IsLockedOut=0. Match count must equal 1. UserName NVARCHAR(20), Password NVARCHAR(128). No credential values in code.
**Edge cases handled:** Both user name and password are compared with LOWER(), so 'Secret' and 'SECRET' are treated as the same password; If two accounts match (duplicate user names that differ only in case), the count is 2 and login fails silently; When login fails, nothing is written: FailedPasswordAttemptCount is not incremented and no lockout is set in this procedure; PasswordSalt exists on FltUser but is not used in the comparison
**Suspected defect:** The password is compared as plain text and the comparison ignores letter case (LOWER on both sides). That means passwords are stored unhashed, or the salt is ignored, and password strength is reduced. Failed attempts are never counted here, so the lockout flag cannot be triggered by this path.
**Confidence:** High

### RULE-046: Overridable warnings versus hard errors
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/BrokenRuleManager.vb:8-37`
**Also cited:** FLTWebApp/fleet/AircraftModify.aspx.vb:612-624
**Plain English:** Broken rules that are overridable become warnings the user can acknowledge; a warning only stops blocking once the user has explicitly overridden the same warning previously shown; non-overridable rules are always blocking errors.
**Specification:**
  Given A flight with an overridable warning 'Hobbs jump > threshold' that was shown on the previous submit and the user ticked override
  When  Rules are considered on re-submit
  Then  The warning is marked OverRideRule = True, listed in WarningsList, and does not count as an error; a first-time warning or non-overridden one counts as 1 error
**Parameters:** Match on previous warning by PropertyName + RuleIdentifier + Message (existence), then by RuleIdentifier (override lookup)
**Edge cases handled:** If the message text changes between submits the warning is treated as new and blocks again; Multiple previous warnings with the same RuleIdentifier add the rule to WarningsList multiple times and may count multiple errors
**Confidence:** High

### RULE-047: Flight key selection must be complete and consistent
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FlightKeyInfoManager.vb:13-61`
**Plain English:** Before a flight log is opened, the user must pick a location, aircraft, valid flight date and work shift, and the aircraft must exist, the location must exist, the aircraft must be assigned to that location, and the work shift must exist.
**Specification:**
  Given Aircraft 42, location 7, date '2026-07-01', work shift 2, where aircraft 42 is not assigned to location 7
  When  Flight key info is requested
  Then  ErrorsList contains 'Aircraft is not assigned to selected Location'
**Parameters:** Zero id means 'not chosen'; date normalised to yyyy-MM-dd
**Edge cases handled:** Any missing field short-circuits the database checks; Blank date -> 'Please provide a flight date.'; non-date -> 'Please provide a valid flight date.'
**Confidence:** High

### RULE-048: Time-of-day entry format
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:507-519`
**Plain English:** Flight, comment and engine-run times are only accepted as 12-hour h:mm AM/PM or 24-hour H:mm (colon or period separator); otherwise no date-time is produced.
**Specification:**
  Given Flight date 2026-07-01 and time text '7.45 pm' or '19:45'
  When  Local date-time is constructed
  Then  Result is 2026-07-01 19:45; for '25:00' or '7pm' the result is an empty DateTime (0001-01-01) with no error raised
**Parameters:** Regex ^((([0]?[1-9]|1[0-2])(:|\.)[0-5][0-9]?(\s)?(AM|PM any case))|(([0]?[0-9]|1[0-9]|2[0-3])(:|\.)[0-5][0-9]))$
**Edge cases handled:** Single minute digit after a 12h hour is accepted ('7:4 PM'); A period separator passes the regex but CDate of '19.45' may fail depending on culture; Failure is silent: default DateTime flows into UTC math and persistence
**Suspected defect:** Invalid time text produces DateTime.MinValue silently rather than a validation error.
**Confidence:** High

### RULE-049: Child record validation rejects the change and shows errors on the parent
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:118-134`
**Plain English:** A child item (reason, instruction, performed work, part, comment or document) can only be added or changed if it passes its own validation. If it fails, the parent work order's broken-rules list is replaced with the child's errors and the change is rejected.
**Specification:**
  Given A WOReason that fails Validate() with one broken rule
  When  InsertWOReason is called
  Then  WorkOrder.BrokenRules is cleared and filled with the reason's broken rule. The error 'Can't insert - record is invalid. Please correct errors and try again.' is raised, and the reason is not added.
**Parameters:** The specific field rules live in each child's Validate() (BusinessObject layer, not in these files)
**Edge cases handled:** Any broken rules already on the parent are cleared and lost when a child fails
**Confidence:** High

### RULE-050: Login account eligibility check
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:23-36`
**Plain English:** A user can only attempt to log in if the login name exists, the account is not deleted and the account is active; every one of these failures shows the same generic message.
**Specification:**
  Given A login name 'jdoe' whose user record has IsActive = False
  When  jdoe submits the correct password
  Then  Login is refused with 'Failed Login Attempt - either Username or Password is incorrect'. The real reason is only written to the log.
**Parameters:** Check order: user exists, then not IsDeleted, then IsActive
**Edge cases handled:** Unknown, deleted and inactive accounts all get the same message, so the user cannot tell whether an account exists; These checks run before the lockout and password checks, so attempts on inactive or deleted accounts never count toward lockout
**Confidence:** High

### RULE-051: Aircraft master data required fields and lengths
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Aircraft.vb:746-843`
**Plain English:** An aircraft needs a program, current location, MSN, ship number, serial number, model, engineer, mechanic, status, manufacturer and meter unit, and identifier fields have length limits.
**Specification:**
  Given An aircraft with SerialNbr '1234567'
  When  It is validated
  Then  Hard error 01-00-008 'SerialNbr cannot be longer than 6'.
**Parameters:** MSN max 20 and must be a valid common string. ShipNbr max 15. SerialNbr max 6. Description max 255. RegistrationNbr max 10. LiveryColor max 10. AircraftStatusId is required (01-00-00F).
**Edge cases handled:** The MSN character-set error has no RuleIdentifier, so it is never overridable
**Confidence:** High

### RULE-052: Aircraft configuration period and component requirements
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/AircraftConfiguration.vb:617-762`
**Plain English:** A configuration period needs an aircraft, a valid start date and a meter unit. The end date cannot be before the start date, and the ending meter cannot be below the starting meter. Model, engine, APU and propeller attributes are required when enabled in configuration.
**Specification:**
  Given A configuration with start 2024-05-01, end 2024-04-01, MeterStart 100 and MeterEnd 90
  When  It is validated
  Then  Hard errors for the end date being before the start date (01-02-001 and again as 01-02-011) and 01-02-012 (MeterEnd cannot be less than MeterStart).
**Parameters:** Toggles: 01-02-002 (Model), 01-02-003 (EngineType), 01-02-004 (EngineEmission), 01-02-005 (EngineMaturity), 01-02-007 (APUType), 01-02-008 (APUEmission), 01-02-009 (APUMaturity), 01-02-00A (APUSerialNbr), 01-02-00E (PropellerType). Lengths: Description 255, EngineSerialNbr 20, APUSerialNbr 30, NoseGear 30, MainGear 30, PropellerModelNbr 20, PropellerSerialNo 20.
**Edge cases handled:** An empty end date means the configuration is still open; The meter check runs only when both start and end meters are greater than 0; The date-order check is duplicated, so one bad pair produces two errors
**Suspected defect:** Many different checks share rule ID 01-02-001, and the date-order check is duplicated (lines 639-645 and 753-757).
**Confidence:** High

### RULE-053: Document Type definition: extension and MIME type
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/DocumentType.vb:74-87`
**Also cited:** (validation); FLTWebApp/appConfiguration/DocumentTypes.aspx.vb:130 (the -1 placeholder only)
**Plain English:** A Document Type pairs a file extension with a MIME type. Both are required, the extension must be a valid file-type string, and new entries get a placeholder id so they pass the 'id required' check.
**Specification:**
  Given An administrator adds a Document Type with extension '.pdf' and MIME 'application/pdf'
  When  Save is clicked
  Then  DocumentTypeId is set to -1 as a placeholder, and the record is validated and saved. A blank MIME type or an invalid extension produces the broken-rule messages 'MimeType is required' or 'FileExtension...'.
**Parameters:** Placeholder DocumentTypeId = -1. The BL rejects 0 (DocumentType.vb:74-76). Extension format is checked by ObjectPropertyValidator.ValidateFileTypeString. Grid editing changes only FileExtension and MimeType (lines 61-76).
**Edge cases handled:** Changing or deleting a Document Type changes which uploads are accepted (see the upload allow-list rule).
**Confidence:** Medium — Citation was corrected by referee (Lines 125-138 of FLTWebApp/appConfiguration/DocumentTypes.aspx.vb (LoadDataToObject) only do part of what the rule describes. Line 130 sets DocumentTypeId = -1 as a placeholder. Lines 131-132 copy the HTML-decoded FileExtension and MimeType from the text boxes. SaveButton_Click (lines 92-102) calls this method before DocumentTypeManager.Save. There is no validat…

### RULE-054: Flight record required data and configurable pre/post-flight checks
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Flight.vb:1173-1310`
**Plain English:** A flight log needs an aircraft, location, scheduled and flown routes, a date, a work shift, a meter unit, a pilot, valid departure and return times, and non-zero ending Hobbs and airframe hours. Pre-flight and post-flight checklist items are required when switched on in configuration.
**Specification:**
  Given A flight with DepartureTime '25:10' and PreFlightFti=0, with rule 02-00-00B enabled
  When  The flight is validated
  Then  Hard error 02-00-00F (DepartureTime format is invalid) and hard error 02-00-00B (PreFlightFti is required).
**Parameters:** Time regex: 12-hour h:mm AM/PM or 24-hour H:mm, with ':' or '.' as separator. FlightDate max length 10. Time max length 8. Toggled rules: 02-00-00B (PreFlightFti), 02-00-00C (PreFlightTelemetryOK), 02-00-00D (PreFlightTelemetryCheckComplete), 02-00-016 (PostFlightTelemetryCheckComplete), 02-00-017 (NacelleCheckBuildUp), 02-00-018 (NacelleCheckDiscoloration).
**Edge cases handled:** HobbsStart = 0 is only an overridable warning (02-00-011); HobbsEnd = 0 and AirframeHoursEnd = 0 are hard errors (02-00-015, 02-00-0A0); The FlightDate setter normalizes valid dates to MM-dd-yyyy; Child liquid fills, comments, engine runs and region times are validated and their errors rolled up into the flight
**Confidence:** High

### RULE-055: Flight start meters must continue from the aircraft's current meters
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Flight.vb:1368-1390`
**Plain English:** A new flight's starting Hobbs (plus any meter offset) should equal the aircraft's current airframe hours, and its starting engine hours should equal the aircraft's current engine hours. Any difference raises an overridable warning.
**Specification:**
  Given Aircraft airframe hours 1,500.0 and engine hours 800.0; a flight with HobbsStart 1,499.0, UsedMeterOffset 0 and EngineHoursStart 801.0
  When  The flight is validated
  Then  Warning 02-00-1C 'Hobbs Start is less than aircraft's current meter' and warning 02-00-01X 'Start Engine Hours ... is greater than aircraft's current engine hours'. Both can be overridden.
**Parameters:** Comparison is HobbsStart + UsedMeterOffset vs AirframeHoursStart. Rule IDs: 02-00-01B (Hobbs greater), 02-00-1C (Hobbs less), 02-00-01X (engine greater), 02-00-01Y (engine less).
**Edge cases handled:** The engine 'greater than' check is skipped when the aircraft's current engine hours = 0, but the 'less than' check still runs; The Hobbs 'greater' warning reuses ID 02-00-01B, which is also the region-sum hard error
**Suspected defect:** Rule ID 02-00-01B is used both for the region-usage hard error and for this overridable warning, so an override can be matched to the wrong rule.
**Confidence:** Medium — P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (The code at FLTBizObjects/BusinessObject/Flight.vb:1368-1390 matches the rule card. Engine hours: if EngineHoursStart is greater than the aircraft's current engine hours, the code raises 02-00-01X (line 1368). If it is less, it raises 02-00-01Y (line 1371). Hobbs: if HobbsStart + UsedMeterOffset is…

### RULE-056: Flight duration and engine run sanity limits
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Flight.vb:1392-1398`
**Plain English:** Flag a flight as suspicious when its Hobbs usage is over 2000 or its engine hours run is over 24 hours.
**Specification:**
  Given A flight with EngineHoursStart 100.0 and EngineHoursEnd 125.0
  When  The flight is validated
  Then  Overridable warning 02-00-1F (total engine hours exceeds 24). A Hobbs difference above 2000 gives overridable warning 02-00-1E.
**Parameters:** Airtime threshold 2000 (meter units). Engine hours threshold 24.
**Edge cases handled:** Strictly greater than: exactly 24 or exactly 2000 passes
**Confidence:** Medium — The airtime threshold is 2000 meter units, while the engine threshold is 24 hours. Is 2000 the intended per-flight limit, or should it be expressed in hours like the engine limit?

### RULE-057: Liquid fill quantity limits by fluid and unit
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Flight.vb:1400-1437`
**Plain English:** Each fluid fill on a flight must be recorded within the flight's Hobbs range, and fills above a per-fluid, per-unit limit raise an overridable warning.
**Specification:**
  Given A flight with Hobbs 1,200.0 to 1,203.0 and a Jet-A fill of 160 gallons recorded at Hobbs 1,201.0
  When  The flight is validated
  Then  Overridable warning 02-00-20 'The Jet-A fill amount of 160 gallons is greater than 150 gallons'. A fill whose Hobbs reading is outside 1,200.0 to 1,203.0 gives hard error 02-00-1D.
**Parameters:** Jet-A ('jeta'): 150 gallon / 600 liter / 600 quart. Coolant: 5 gallon / 20 liter / 20 quart. Hydraulic: 7 gallon / 30 liter / 30 quart. IDs: 02-00-20 (gallon), 02-00-21 (liter), 02-00-22 (quart).
**Edge cases handled:** Matching on group and unit names is case-insensitive but exact ('jeta', 'gallon', 'liter', 'quart'), so other spellings are never checked; Other fluid groups have no limit; The Jet-A quart limit (600) equals the liter limit, which is about 150 gallons; Fills exactly at HobbsStart or HobbsEnd are allowed
**Suspected defect:** The Jet-A limit of 600 quarts equals 150 gallons, but the coolant and hydraulic quart limits (20 and 30) are about 4x their gallon limits, so the quart limits look inconsistent.
**Confidence:** Medium — Are the limits 150 gal / 600 L / 600 qt for Jet-A, 5 gal / 20 L / 20 qt for coolant and 7 gal / 30 L / 30 qt for hydraulic correct, and should they be configurable per aircraft model?

### RULE-058: Comment rating scale and length limits
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/FlightComment.vb:307-358`
**Plain English:** Flight, aircraft and generic comments need a rating from 1 to 10 and comment text. The maximum text length is 255 or 2048 characters, depending on which configuration toggle is on.
**Specification:**
  Given A pilot comment with rating 0 and 300 characters of text, with toggle 02-02-006 on
  When  It is validated
  Then  Hard error 02-02-007 (rating must be between 1 and 10) and hard error 02-02-006 (cannot be longer than 255).
**Parameters:** Rating 1 to 10 inclusive. Length toggles: 255 (02-02-006, 01-01-008, 01-04-008) and 2048 (02-02-00A, 01-01-009, 01-04-009). CommentTime is required under toggle 02-02-009, max 8 characters, and must match the time regex. The same pattern is in AircraftComment.vb:294-339 and GenericComment.vb:382-427.
**Edge cases handled:** If both length toggles are on, the 255 limit is the one that applies; A missing comment raises different IDs in AircraftComment and GenericComment (006 when null, 007 when empty)
**Confidence:** High

### RULE-059: Engine run must have valid start and end times in order and a non-zero speed
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/FlightEngineRun.vb:258-282`
**Plain English:** Each engine run on a flight needs a start time and an end time in a valid time format, the end time cannot be earlier than the start time, and an engine speed is required.
**Specification:**
  Given An engine run with start '14:30', end '13:00' and engine speed 0
  When  It is validated
  Then  Hard error 02-03-006 (end earlier than begin) and hard error 02-03-007 (EngineSpeed is required).
**Parameters:** Same time regex as Flight. IDs 02-03-001 to 02-03-007.
**Edge cases handled:** The order check runs even when a time failed the format check, so CDate on an invalid time string can throw; The '.' separator passes the regex but may fail CDate; Runs that cross midnight (23:00 to 01:00) are rejected
**Confidence:** High

### RULE-060: Liquid fill record completeness and amount range
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/LiquidFill.vb:346-411`
**Plain English:** A fluid fill needs a flight, a fluid group, a fluid type, a unit, an amount between 0 and 999,999.999, a meter reading, a fill location (max 255 characters) and an approver (max 30 characters).
**Specification:**
  Given A liquid fill with amount -5 and no approver
  When  It is validated
  Then  Hard error 02-01-006 (cannot be less than zero) and hard error 02-01-00B (LiquidFillApprover is required).
**Parameters:** Amount range 0 to 999999.999. LiquidFillLocation max 255. Approver max 30.
**Edge cases handled:** Non-numeric amounts are silently set to 0; An amount of 0 counts as missing (VB Nothing equals 0), so it raises 02-01-005
**Suspected defect:** The HobbsReading setter (LiquidFill.vb:158) checks IsNumeric on the current property value instead of the incoming value, so a non-numeric input reaches CDec and throws instead of defaulting to 0.
**Confidence:** High

### RULE-061: Location requirements
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Location.vb:267-299`
**Plain English:** A location must belong to a program, must have a name of at most 50 characters with only allowed characters, and must have a time zone.
**Specification:**
  Given A new location with name 'North Ramp' and no time zone chosen ('< Select Time Zone >')
  When  the user clicks Save
  Then  the save is rejected and the reasons are listed (TimeZoneId is required). With time zone 'UTC-05' chosen it saves, and the creating user's name is stamped on the record.
**Parameters:** LocationName max 50 characters; must pass ObjectPropertyValidator.ValidateCommonString. ProgId and TimeZoneId are required (Location.Validate).
**Edge cases handled:** The time zone drop-down placeholder has an empty-string value. Converting it to TimeZoneId may throw before validation runs, and the error is caught in LoadDataToObject.; Inline grid edits can change name, time zone and active flag but not the program; LoadDataToForm sets the time zone drop-down to TimeZoneCode, but the item values are TimeZoneID (locations.aspx.vb:151); An HTML-encoded name is decoded before it is stored
**Suspected defect:** locations.aspx.vb:151 selects the time zone drop-down by TimeZoneCode while the items are keyed by TimeZoneID. This is harmless for new locations but wrong if the form is reused for an existing one.
**Confidence:** Medium — Citation was corrected by referee (FLTWebApp/program/locations.aspx.vb:147-163 contains no validation. It holds only LoadDataToForm and LoadDataToObject, which copy ProgId, LocationName and TimeZoneId between the form and the object (lines 157-159). The rule itself is real and lives in Location.Validate() at FLTBizObjects/BusinessObject/Location.vb:267-299. That method requires ProgId (269-275),…

### RULE-062: Region code and name requirements
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Region.vb:123-161`
**Plain English:** A region needs a code of at most 2 characters and a name of at most 255 characters, and it belongs to the current program.
**Specification:**
  Given A new region with Code 'NE' and Name 'Northeast'
  When  the user clicks Save
  Then  the region is created for the current program. A code such as 'NEA' (3 characters) is rejected with 'Code cannot be longer than 2'.
**Parameters:** Code: required, max 2 characters. Name: required, max 255 characters. Both must pass ValidateCommonString (Region.Validate).
**Edge cases handled:** Inline edits can change code, name and the active flag; There is no Is Deleted filter on the Regions list
**Confidence:** Medium — Citation was corrected by referee (The cited lines (FLTWebApp/program/Regions.aspx.vb:113-145) don't do any validation. SaveButton_Click calls LoadDataToObject, which copies ProgId from ProgIdHiddenField (the "belongs to the current program" part) and the HTML-decoded Code/Name text into _Region. It then calls RegionManager.Save and shows any broken rules through ProcessException. The real checks…

### RULE-063: A route must belong to an active location and have a time zone
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Route.vb:211-249`
**Also cited:** (Route.Validate); picker filter at FLTWebApp/program/Routes.aspx.vb:151-167
**Plain English:** A new route can only be attached to an active, non-deleted location of the current program. It needs a name of up to 50 characters, an optional description of up to 255 characters, and a time zone.
**Specification:**
  Given Locations 'Base A' (active) and 'Base B' (inactive)
  When  the user opens Add Route
  Then  only 'Base A' can be chosen. Saving with '< Select Location>' (value 0) or '< Select Time Zone >' (value 0) is rejected as 'LocationId is required' or 'TimeZoneId is required'.
**Parameters:** Location picker uses LocationManager.GetList(prog, tz=0, IsActive=1, IsDeleted=0). Name max 50; Description max 255; LocationId > 0; TimeZoneId > 0 (Route.Validate).
**Edge cases handled:** Inline grid edits cannot change a route's location, only name, description, time zone and active flag; The list-screen location filter defaults to the first location returned and has no 'All' option, so routes are always viewed one location at a time; The location filter list is rebuilt after Save or Cancel without being cleared, so locations may appear twice (Routes.aspx.vb:37-43)
**Suspected defect:** LocationFilterDropDownList_DataBind (Routes.aspx.vb:37-43) does not clear its items, so every Save or Cancel adds duplicate location entries.
**Confidence:** Medium — Citation was corrected by referee (The behavior is real, but the cited lines cover only part of it. FLTWebApp/program/Routes.aspx.vb:151-167 (PopulateModifyDropDownLists) does fill the Location picker with a '< Select Location> ' placeholder (value 0) followed by LocationManager.GetList(ProgId, 0, 1, 0, -1, -1, ...). The signature at FLTBizObjects/BusinessLogic/LocationManager.vb:20 confirms that…

### RULE-064: Engineer and mechanic comment content rules
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WOEngineerComment.vb:266-304`
**Plain English:** Each engineer or mechanic comment must name the component, carry a comment date, have a rating from 1 to 10, and contain comment text of at most 255 characters by default.
**Specification:**
  Given An engineer comment with ComponentId=88, CommentDate='03-18-2024', CommentRating=11, Comments='Hydraulic leak at actuator'
  When  Validate() runs
  Then  Error 03-01-004 'CommentRating must be between 1 and 10 inclusive' is raised. With rating 7 it passes
**Parameters:** Rating range 1-10 inclusive; Comments max 255 (03-01-006 / 03-06-006, configurable) and max 2048 (03-01-007 / 03-06-007, configurable). Mechanic comments use the same logic at WOMechanicComment.vb:266-304 with rule IDs 03-06-001..007
**Edge cases handled:** The rating defaults to 0, so a new comment fails until a rating is set.; Invalid date text becomes Nothing and fails 'CommentDate is required'. The IsDate check on a Date field is always true.; Both length limits are on by default, so 255 is the effective limit. The 2048 limit applies only if the 255 rule is turned off with app setting '03-01-006'='N'.; IssueCodeId is optional.
**Confidence:** High

### RULE-065: Child lines must reference a parent work order
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WOReason.vb:188-194`
**Plain English:** Every reason, instruction, performed-work line, part, engineer comment and mechanic comment must carry the ID of the work order it belongs to.
**Specification:**
  Given A new WOReason with WorkOrderId=0
  When  It is validated, either alone or through WorkOrder.Validate()
  Then  Error 03-04-001 'WorkOrderId is required' is raised
**Parameters:** Rule IDs: 03-01-001 engineer comment, 03-02-001 instruction, 03-03-001 performed work, 03-04-001 reason, 03-05-001 part, 03-06-001 mechanic comment
**Edge cases handled:** A brand-new WorkOrder has WorkOrderId=-1 (WorkOrder.vb:753), which is not 0. Child lines created before the parent is saved still default to WorkOrderId=0.
**Confidence:** Medium — When a new work order and its first child lines are saved together, does the UI or DAL stamp the children with a WorkOrderId (e.g. -1) before validation? If not, a new work order with lines can never pass validation.

### RULE-066: Free-text work order lines (reason, instruction, performed work)
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WOReason.vb:195-211`
**Plain English:** Each reason, instruction and performed-work line must have non-blank text, at most 255 characters by default (or 2048 if the 255 rule is turned off).
**Specification:**
  Given A performed-work line with 300 characters of text
  When  It is validated with default configuration
  Then  Error 'PerformedWorkLine cannot be longer than 255' (03-03-003) is raised and the work order cannot be saved
**Parameters:** Reason 03-04-002/003/004; Instruction 03-02-002/003/004 (WOInstruction.vb:196-212); Performed work 03-03-002/003/004 (WOPerformedWork.vb:195-211). Limits 255 and 2048, each can be turned off in configuration
**Edge cases handled:** Text of only spaces is accepted, because nothing trims it.; If both length rules are turned off, there is no limit in the business layer.
**Confidence:** High

### RULE-067: Weight definition required fields and description charset
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WeightDef.vb:253-270`
**Also cited:** FLTBizObjects/BusinessObject/WeightDef.vb:245-277
**Plain English:** A weight definition must belong to a program and have a weight tracking type, a description using only allowed characters, a non-zero weight and a weight unit.
**Specification:**
  Given A weight definition with ProgId=12, WeightDefTypeId=3, WeightDefDescr='Max Takeoff (MTOW)', Weight='79,000', WeightUnitId=1
  When  Validate() runs
  Then  It passes and Weight displays as '79,000'. With Weight='abc' the weight becomes 0 and 'Weight value is required' is raised
**Parameters:** Common-string regex default '^([A-Za-z0-9 .#\/()_-])*$' (ObjectPropertyValidator.vb:101-113, can be changed with appSetting CommonRegEx); weight stored as Integer via CInt; display '#,##0'; IsActive defaults True
**Edge cases handled:** A decimal weight is rounded by CInt using banker's rounding ('2.5' becomes 2, '3.5' becomes 4).; Negative weights pass because only 0 is rejected.; The default error text says only letters, numbers, spaces, periods, dashes, underscores and slashes are allowed, but the regex also allows '#' and parentheses.; None of these rule messages has a rule ID.
**Suspected defect:** Negative weights are accepted, and decimal weights are silently rounded to an integer.
**Confidence:** Medium — Should negative or zero weights be valid for any weight tracking type, and are there per-type limits on weight values?

### RULE-068: Work order date validity (request, due, finish)
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrder.vb:248-302`
**Plain English:** Request, due and finish dates are stored as MM-dd-yyyy text, and any due or finish date that is entered must be a real calendar date.
**Specification:**
  Given A user enters DueDate='02/30/2024' and FinishDate='2024-04-01'
  When  The values are assigned and Validate() runs (lines 878-906)
  Then  FinishDate is stored as '04-01-2024' and passes. DueDate is not a date, so it is kept as the trimmed raw text and error 03-00-00A 'DueDate must be a valid date' is raised
**Parameters:** Storage format 'MM-dd-yyyy'; rule IDs 03-00-009 (RequestDate invalid), 03-00-00A (DueDate invalid), 03-00-00E (FinishDate invalid)
**Edge cases handled:** The RequestDate setter calls CDate with no IsDate guard (line 256), so invalid text throws an exception at assignment. Rule 03-00-009 is effectively unreachable.; Nothing and empty string count as 'not entered' for due and finish dates.; Nothing checks the dates against each other, for example finish before request or due before request.
**Suspected defect:** An invalid RequestDate throws a runtime exception in the setter instead of producing validation message 03-00-009.
**Confidence:** High

### RULE-069: Work order mandatory header fields
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrder.vb:837-925`
**Plain English:** A work order cannot be saved unless it names a program, an aircraft, a location, a work order type, a status, a request date, an assigned engineer and an engineering action.
**Specification:**
  Given A work order with ProgId=12, AircraftId=340, LocationId=5, WorkOrderTypeId=2, WorkOrderStatusId=1, RequestDate='03-15-2024', EngineeringActionId=4 but EngineerId=0
  When  Validate() is called before saving
  Then  A hard error 'EngineerId is required' (03-00-011) is recorded and Validate returns False; with EngineerId=7 and nothing else wrong it returns True
**Parameters:** Rule IDs: 03-00-001 ProgId, 03-00-002 AircraftId, 03-00-003 LocationId, 03-00-004 WorkOrderTypeId, 03-00-005 WorkOrderStatusId, 03-00-008 RequestDate, 03-00-011 EngineerId, 03-00-012 EngineeringActionId. 'Missing' means the value is 0. All are non-overridable errors (BrokenRule flags False, False).
**Edge cases handled:** The extra Len(x)=0 checks on integer IDs can never fire, because Len of an Integer is always 4. Only the 0 check matters.; A new WorkOrder starts with every ID at 0, so a blank work order fails all eight checks.; MechanicId is not required. A work order can be valid without a mechanic.; RequestDate is required but DueDate, FinishDate, FaultOccurredDate and the meters are optional.
**Confidence:** Medium — P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: WorkOrder.vb:837-925 adds a non-overridable BrokenRule (flags False, False) for each of the cited fields: ProgId 03-00-001, AircraftId -002, LocationId -003, WorkOrderTypeId -004, WorkOrderStatusId -005, RequestDate -008, EngineerId -011 and EngineeringActionId -012. Every ID field except…

### RULE-070: Work order reference-number and disposition length limits
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrder.vb:872-928`
**Plain English:** The FIS complaint number can be at most 8 characters, the squawk number at most 20, and the aircraft disposition text at most 50.
**Specification:**
  Given A work order with FISComplaintNbr='FIS123456' (9 characters)
  When  Validate() runs
  Then  Error 03-00-006 'FISComplaintNbr cannot be longer than 8' is recorded and the save is blocked
**Parameters:** FISComplaintNbr max 8 (03-00-006); SquawkNbr max 20 (03-00-007); AircraftDispostion max 50 (03-00-013)
**Edge cases handled:** FISComplaintNbr and SquawkNbr setters do not turn Nothing into an empty string. If either is set to Nothing, .Length throws a NullReferenceException instead of producing a validation message.; Exactly 8, 20 or 50 characters passes.
**Suspected defect:** Setting FISComplaintNbr or SquawkNbr to Nothing (allowed by their setters at lines 230-246) makes Validate crash at lines 872/875 rather than treat the value as blank.
**Confidence:** High

### RULE-071: Due date and due time must be given together; time-of-day format
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrder.vb:890-915`
**Plain English:** If a due date is entered a due time must be too, and the reverse. Any due or finish time must be a valid 12-hour (with AM/PM) or 24-hour clock time.
**Specification:**
  Given A work order with DueDate='03-20-2024' and DueTime blank
  When  Validate() runs
  Then  Error 03-00-00D 'Please provide both Due Date and Due Time' is raised. With DueTime='14:30' or '2:30 PM' it passes; DueTime='25:00' raises 03-00-00C 'DueTime time format is invalid'
**Parameters:** TimeRegex (line 16): 12-hour h(:|.)mm with optional space and AM/PM in any case, or 24-hour H(:|.)mm with hours 0-23. Rule IDs 03-00-00B/03-00-00F (time required, unreachable), 03-00-00C DueTime format, 03-00-00D due pair, 03-00-010 FinishTime format
**Edge cases handled:** The pairing rule applies only to due date and due time. FinishDate and FinishTime can each be entered without the other.; In the 12-hour pattern the second minute digit is optional ('[0-5][0-9]?'), so '9:5 PM' is accepted.; A period works as the separator ('14.30').; The 'time is required' branches (03-00-00B, 03-00-00F) cannot fire, because VB treats Nothing and '' as equal and the outer check already skips blank values.
**Suspected defect:** The 12-hour pattern accepts single-digit minutes (e.g. '9:5 PM'). Finish date and time have no pairing rule even though due date and time do.
**Confidence:** High

### RULE-072: Work order aggregate validation rolls up all child lines
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrder.vb:930-976`
**Plain English:** A work order is valid only if its header and every attached reason, instruction, performed-work line, part, engineer comment and mechanic comment are valid. Every child error is added to the work order's error list.
**Specification:**
  Given A work order with a valid header and one mechanic comment with CommentRating=0
  When  WorkOrder.Validate() runs
  Then  The mechanic comment's error 03-06-004 is added to the work order's BrokenRules and Validate returns False, which blocks the save
**Parameters:** All rules are created non-overridable, so BrokenRuleManager.ConsiderRules counts each one as a hard error and nothing is downgraded to an overridable warning
**Edge cases handled:** Child lines are validated even when flagged IsDeleted. Lines moved to the *DeleteList collections are not validated.; Document infos (WODocumentInfosList) are not validated.; Children get the work order's current _warningsList as their previous warnings. This has no effect today because no rule is overridable.
**Confidence:** Medium — P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (The rule matches the code. In WorkOrder.vb:930-971, Validate loops over the reasons, instructions, performed-work lines, parts, engineer comments and mechanic comments. It calls each child's Validate and adds every child BrokenRule to Me.BrokenRules, which is the same list as _brokenRulesList (prope…

### RULE-073: Work order part identification and field lengths
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrderPart.vb:280-335`
**Plain English:** Each part on a work order needs a part name of at most 20 characters. By default it also needs both the FIS ID of the removed unit and the FIS ID of the added unit (each at most 20 characters). The description can be up to 255 characters and the module up to 20.
**Specification:**
  Given A part line with PartName='Fuel pump', FisIDRemoved='FIS-0042', FisIDAdded=''
  When  Validate() runs with default configuration
  Then  Error 03-05-007 'FisIDAdded is required' is raised
**Parameters:** PartName required (03-05-002), max 20 (03-05-003); PartDescription max 255 (also tagged 03-05-003); FisIDRemoved required when 03-05-004 is on, max 20 (03-05-005); FisIDAdded required when 03-05-007 is on, max 20 (03-05-008); PartModule max 20 (03-05-009)
**Edge cases handled:** The FIS-ID requirements can be switched off, but the 20-character limits always apply.; The PartDescription length error reuses rule ID 03-05-003, the same ID as the PartName length rule.
**Suspected defect:** The PartDescription length rule reuses ID 03-05-003, so the two rules cannot be told apart when reporting or overriding.
**Confidence:** High

### RULE-074: Part quantities must be whole numbers 0-999
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrderPart.vb:312-353`
**Plain English:** The number of parts failed, removed and added must each be a whole number of 1 to 3 digits (0-999). Each defaults to 0.
**Specification:**
  Given A part line with PartNbrRemoved='2', PartNbrAdded='1000', PartNbrFailed='1.5'
  When  Validate() runs with default configuration
  Then  PartNbrRemoved passes. PartNbrAdded fails with 03-05-00E 'must be a number'. PartNbrFailed fails with 03-05-00C
**Parameters:** WholeNumberRegExMask '^\d{1,3}$' (line 15); defaults '0' (lines 103-166). Switch keys 03-05-00C (failed), 03-05-00D (removed), 03-05-00E (added); 'required' messages carry IDs 03-05-006, 03-05-00A, 03-05-00B
**Edge cases handled:** The 'required' branches cannot fire: the setters turn Nothing into '0', and VB string '=' Nothing also matches ''.; Negative numbers and leading '+' are rejected; '007' is accepted.; Nothing checks that removed equals added or that failed is at most removed.
**Suspected defect:** Each 'required' message carries a different rule ID (03-05-006/00A/00B) from the switch that controls it (03-05-00C/00D/00E). Turning off 03-05-006 has no effect.
**Confidence:** High

### RULE-075: Configuration lookup values per program and lookup type
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/fltLookupBase.vb:111-145`
**Also cited:** FLTBizObjects/BusinessObject/fltLookupBase.vb:111-141
**Plain English:** Administrators maintain each program's code lists (for example pilots, engine types, weight units, work order statuses). Each value needs text of up to 255 characters and a numeric sort order, and can be switched active or inactive.
**Specification:**
  Given Lookup type 'WorkOrderStatus' is selected for program 7
  When  the user adds String Value 'Closed', Sort Order 'x' and saves
  Then  it is rejected with 'SortOrder must be numeric.'. With Sort Order 5 it is stored as a WorkOrderStatus value for program 7.
**Parameters:** 26 lookup types from fltLookupNameList: APUType, Pilot, Emission, Engineer, EngineeringAction, EngineType, IssueCode, LengthUnit, LiquidGroup, LiquidType, LiquidUnit, Manufacturer, MaturityDef, MechAction, Model, Mechanic, Test, LoadingConfig, Propeller, PropellerType, AircraftComponent, AircraftStatusDef, WeightUnit, WorkOrderStatus, WorkOrderType, WorkShift. StringValue: required, max 255, must pass ValidateCommonString. SortOrder must be numeric. Some types may add rules through AddExtraBusinessRules.
**Edge cases handled:** A new value takes the lookup type selected in the filter and the current program; The list is filtered by type and active status (default Active Only); If a delete fails, ProcessException reads _lookupBase, which is Nothing on that path, so the real error is replaced by a NullReferenceException (ConfigValues.aspx.vb:75-85, 151-160)
**Suspected defect:** ConfigValues RowDeleting never sets _lookupBase, so a failed delete crashes in ProcessException (line 154) instead of showing the reason. | Four different checks share rule ID 01-05-001. A Nothing StringValue makes the charset check throw an exception instead of returning a validation message.
**Confidence:** Medium — Citation was corrected by referee (ConfigValues.aspx.vb:113-149 contains only UI plumbing. AddButton_Click (113-119) creates an fltLookupBase and sets LookupName from the selected type and ProgId from the hidden field. LoadDataToForm and LoadDataToObject (130-142) copy StringValue, SortOrder and IsActive between the form and the object. PopulateDropDownlists (144-149) fills the type list from flt…

### RULE-076: Only aircraft comments can be added from the aircraft record
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/AircraftDB.vb:535-581`
**Plain English:** The aircraft screen shows one combined comment list (aircraft, flight, work-order engineer and mechanic comments). Only aircraft comments can be created there. Existing comments of the other types can be edited, and unknown comment types are rejected.
**Specification:**
  Given An aircraft save with changed comments: a new aircraft comment, an edited flight comment and a new work-order engineer comment
  When  The aircraft is saved
  Then  The aircraft comment is inserted and the flight comment is updated. The new engineer comment fails with 'Adding a comment that is not an Aircraft Comment is not allowed', and the whole aircraft save rolls back.
**Parameters:** Source types: AircraftComment, FlightComment, WOEngineerComment, WOMechanicComment. A comment counts as new when its ConcurrencyId is Nothing or "0". Only comments with IsDirty=True are processed (loaded comments start with IsDirty=False, GenericCommentDB.vb:142).
**Edge cases handled:** Any other SourceTable value fails with 'Unknown Comment Type'; Flight comments edited from here are forced to IsActive=True (line 668); On aircraft comments, the comment AuthorID becomes EngineerId (line 639); On delete, only AircraftComment rows with SourceID > 0 are deleted. Other comment types on the delete list are ignored silently (lines 583-589).
**Suspected defect:** Aircraft comment deletes (line 586) and aircraft location deletes (line 530) use the overloads that open their own connection, not the aircraft save transaction. They are committed even if the aircraft save later rolls back. _sortGenericCommentList (lines 613-633, newest first by CommentDate) is defined but never called.
**Confidence:** High

### RULE-077: Aircraft test assignments are added only once
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/AircraftDB.vb:591-611`
**Plain English:** When an aircraft is saved, each test on its test list is linked to the aircraft only if that link does not already exist. Tests on the remove list are unlinked.
**Specification:**
  Given Aircraft 7 is already linked to test 3, and its test list contains tests 3 and 5
  When  The aircraft is saved
  Then  Only the link to test 5 is created. Test 3 is left unchanged.
**Parameters:** Existence check: existsAircraftTestXref returns @Exists (AircraftTestXrefDB.vb:385-417). The list of tests available to an aircraft is scoped by program (ProgId, AircraftTestXrefDB.vb:64-75).
**Edge cases handled:** Deletes are run for every test on the remove list, with no existence check
**Suspected defect:** The Exists, Insert (3-argument) and Delete (3-argument) calls each open their own connection or transaction rather than using the aircraft save transaction (Conn/Trans are passed in but not used). Test link changes therefore survive a rollback of the aircraft save.
**Confidence:** High

### RULE-078: Duplicate flight entries are rejected
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/FlightDB.vb:445-456`
**Plain English:** A new flight that the database flags as a duplicate is rejected with the message that this flight already exists.
**Specification:**
  Given A flight entry that duplicates an existing one, by whatever key the addFlight procedure enforces
  When  The user saves it as a new flight
  Then  The save fails with 'Can't insert - this flight already exists in the database.' and the whole transaction, including children, is rolled back
**Parameters:** Database error text matched: "Duplicate Flight Entry". Message shown to the user: "Can't insert - this flight already exists in the database."
**Edge cases handled:** The duplicate check itself lives in the addFlight stored procedure, not in this code; Any other insert error becomes the generic 'Application encountered a data error.'
**Confidence:** Medium — Which fields define a duplicate flight in the addFlight stored procedure (for example aircraft + flight date + departure time, or the FlightGuid)?

### RULE-079: Daylight-saving begin/end dates are only stored when they are valid dates
**Category:** Validation
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/UTCTimeZoneDB.vb:121-140`
**Plain English:** A time zone has a code, UTC offset, description, a daylight-saving on/off flag and a daylight-saving offset; its daylight-saving start and end are saved only if they parse as dates, otherwise they are left empty.
**Specification:**
  Given Time zone 'EST' with offset -5, DaylightSavingTime true, DaylightSavingOffset 1, DaylightSavingBegin "03-08-2026 02:00:00 AM" and DaylightSavingEnd "TBD"
  When  The time zone is saved
  Then  Begin is stored as 8 Mar 2026 02:00; End is sent with no value because "TBD" is not a date
**Parameters:** Offsets stored as float (SQL Float); dates read back formatted "MM-dd-yyyy hh:mm:ss tt" (lines 246-251); same check on insert (lines 183-194)
**Edge cases handled:** Null DST dates in the database leave the fields blank on load; No check that Begin is before End or that DST offset is set only when DaylightSavingTime is true
**Suspected defect:** Invalid dates set the parameter Value to Nothing rather than DBNull.Value; ADO.NET then omits the parameter, which raises a 'procedure expects parameter' error unless the stored procedure declares a default.
**Confidence:** High

### RULE-080: Exactly one listed file must be selected before fetching
**Category:** Validation
**Priority:** P1
**Source:** `FLTExportClient/FltExportClient.vb:66-81`
**Plain English:** Only one file can be downloaded at a time, and the user must first select it from the retrieved list. Double-clicking a row does the same as Fetch.
**Specification:**
  Given The file list shows several export files and none is selected
  When  The user clicks 'Fetch File'
  Then  The log shows 'No file selected for download' and no request is sent. With one row selected, that row's file name is requested from the fetch endpoint.
**Parameters:** FileListView.MultiSelect = False (FltExportClient.Designer.vb:66); double-click starts the fetch (FltExportClient.vb:95-99); fetchFileURI = https://flt.contoso.example/export/autoFetchFile.aspx (app.config:25)
**Edge cases handled:** Only the first selected item is used; The file name is sent unencoded in the filename form field
**Confidence:** High

### RULE-081: File list response validation and record mapping
**Category:** Validation
**Priority:** P1
**Source:** `FLTExportClient/FltExportManager.vb:105-127`
**Plain English:** The server's file-list XML is rejected if it contains an <error> element or has no <files> element. Otherwise each <file> becomes a downloadable entry with a name, a size in bytes and a UTC creation time.
**Specification:**
  Given The server returns XML such as <files><file><name>flt_20261015.xml</name><size>20480</size><utcDateTimeCreated>2026-10-15T08:00:00</utcDateTimeCreated></file></files>
  When  The user clicks 'Get File List'
  Then  One entry is listed as flt_20261015.xml, 20,480, 10/15/2026T08:00:00. If the XML has <error>Invalid login</error>, the log shows 'An error occurred:Invalid login'. If there is no <files> element, the log shows 'An error occurred:No files return'.
**Parameters:** XML tags: error, files, file, name, size, utcDateTimeCreated; size is parsed as a 32-bit integer (CInt)
**Edge cases handled:** Child nodes not named 'file' are skipped; A missing name, size or date tag throws an exception and the whole list fails; A file larger than about 2 GB overflows CInt; An empty <files/> element gives an empty list with no error; The list is cleared only after a successful fetch, so on failure the previous list stays on screen; The date display format uses hh (12-hour clock) with no AM/PM marker, so afternoon times are ambiguous (FltExportClient.vb:27)
**Suspected defect:** The display format 'MM/dd/yyyyThh:mm:ss' uses a 12-hour clock without AM/PM, so 14:00 and 02:00 both show as 02:00.
**Confidence:** High

### RULE-082: Flight upload is all-or-nothing with its child records
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:100-122`
**Plain English:** A flight is saved only if the flight header and every liquid fill, comment, engine run and region-time entry pass the business object's rules; any failure rejects the whole upload.
**Specification:**
  Given A flight upload containing 2 liquid fills where one violates a business rule
  When  The flight is being built before insert
  Then  The broken rules are logged as 'Object|Property|Message', the flight is not inserted, and the client gets HTTP 500 with the InternalErrorFlightAddNewItem message
**Parameters:** Child formats: liquid amount '##0.000', Hobbs reading '##0.0', engine speed '#,##0', region hours '#,##0.0'
**Edge cases handled:** A null flight body (schema mismatch) returns 500 rather than 400; Broken-rule details are only logged, never returned to the client; Liquid fills are linked using newBoFlight.FlightId (-1) while engine runs and region times use the client-supplied modelFlight.FlightId (FlightsController.cs:184 vs 229/249); Insert failure after building also returns 500 and logs broken rules (lines 72-80)
**Suspected defect:** Child records get their FlightId from different sources (-1 placeholder for liquid fills, client payload value for engine runs and region times); if the BL does not reassign IDs on insert, engine runs/region times could attach to the wrong flight. Validation failures are reported as 500 with no detail.
**Confidence:** High

### RULE-083: Flight read-back drops hydraulic level, work shift and meter offset
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:313-343`
**Plain English:** When a stored flight is returned, most logged fields are echoed back, but hydraulic level at start, work shift and the meter offset used are not populated from the stored record.
**Specification:**
  Given A stored flight with HydraulicLevelIndicatorStart 'Full', WorkShiftIndicatorId 2 and UsedMeterOffset 1500
  When  GET .../flights/{Tid} is called
  Then  The response carries default/empty values for those three fields
**Parameters:** Self-assignments at FlightsController.cs:340 and 342; UsedMeterOffset and airframe hours not mapped
**Edge cases handled:** Hobbs/engine hours are returned as decimals parsed from stored strings
**Suspected defect:** Lines 340 and 342 assign newModelFlight fields to themselves instead of reading from boFlight, so the stored hydraulic level and work shift are never returned.
**Confidence:** High

### RULE-084: Records are only returned within their program/location/aircraft scope
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:34-41`
**Plain English:** A record fetched by ID is only returned if it belongs to the parent program, location or aircraft named in the URL; otherwise it is treated as not found.
**Specification:**
  Given Flight 900 belongs to aircraft 12 at location 3
  When  A client requests /programs/1/locations/3/fleet/15/flights/900
  Then  HTTP 404 NotFoundFlightGetItem is returned because the aircraft does not match
**Parameters:** Flight: AircraftId == Aid and LocationId == LocId (ProgId not checked). Aircraft: ProgId == ProgId and CurrentLocationId == LocId (FleetController.cs:68-71). Location: ProgId == ProgId (LocationsController.cs:68-71)
**Edge cases handled:** Flight item does not verify the program; An aircraft moved to another location becomes 404 under its old location URL; Flight info list (FlightInfosController.cs:33) filters by aircraft and location only, ignoring ProgId; Missing record and out-of-scope record give the same 404
**Confidence:** High

### RULE-085: Weights are free-text with a separate unit (not validated as numbers)
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Models/Airframe.cs:13-16`
**Plain English:** Airframe, cargo and ballast weights are stored as text along with a separate weight-unit text, so the API does not enforce numeric weights or a standard unit.
**Specification:**
  Given A cargo item with Weight '12O' (letter O) and WeightUnit 'lbs'
  When  It is returned by the reference-data API
  Then  The value is passed through unchanged; no numeric or unit check is applied
**Parameters:** Same layout in Cargo.cs:13-16 and Ballast.cs:13-16.
**Edge cases handled:** Mixed units (lb/kg) across items cannot be summed without conversion; Any total-weight or weight-and-balance calculation would have to parse text
**Suspected defect:** Storing weights as strings with no validation can let malformed weights into any load calculation.
**Confidence:** Medium — Are weights used in any weight-and-balance or total-load calculation downstream? If so, what units are allowed and how are they converted?

### RULE-086: Pre-flight and post-flight checklist results recorded per flight
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Models/Flight.cs:29-49`
**Plain English:** Each flight records the pre-flight checks (FTI OK, telemetry OK, telemetry check complete, starting oil and hydraulic levels) and post-flight checks (FTI OK, telemetry check complete, nacelle build-up, nacelle discoloration) as small-integer flags.
**Specification:**
  Given A flight whose PreFlightTelemetryOK is 0 (not OK)
  When  The flight is saved through the API
  Then  The flight is stored anyway; the model has no rule that blocks departure or flags the flight because a check failed
**Parameters:** Pre-flight: PreFlightFtiOK, PreFlightTelemetryOK, PreFlightTelemetryCheckComplete, OilLevelIndicatorStart, HydraulicLevelIndicatorStart. Post-flight: PostFlightFtiOK, PostFlightTelemetryCheckComplete, NacelleCheckBuildUp, NacelleCheckDiscoloration. All are type short.
**Edge cases handled:** Oil and hydraulic level indicators are shorts, which may be level codes rather than booleans; Nacelle checks may encode severity, not just pass/fail
**Confidence:** Low — What values are valid for each checklist field (0/1 boolean, or a graded scale for oil/hydraulic level and nacelle condition)? Must a failed pre-flight check block or flag the flight?

### RULE-087: Login authentication with a single generic failure message
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/Login.aspx.vb:17-34`
**Plain English:** A user logs in with username and password. On success their identity is stored in the session and they go to the home page. Any failure shows the same message so the user cannot tell which part was wrong.
**Specification:**
  Given User 'jdoe' enters a wrong password, or is unknown, deleted, inactive or locked out
  When  They submit the Login form
  Then  The page shows 'Failed Login Attempt - either Username or Password is incorrect'. With valid credentials the session identity is replaced with the authenticated identity, which carries program permissions, and the user is redirected to ~/default.aspx.
**Parameters:** The business checks in FltIdentityManager.AuthenticateUserLogin (FLTBizObjects/BusinessLogic/fltIdentityManager.vb:18-76) run in this order: user exists, not deleted, active, not locked out, password hash matches. 'Remember me' is turned off (Login.aspx:20). Password field autocomplete is off (Login.aspx.vb:14).
**Edge cases handled:** The specific lockout messages thrown by the business layer ('User account is locked out - try again later', 'Login failures exceeded maximum allowed attempts...') are caught and replaced with the gen…; On success, Response.Redirect inside the Try raises ThreadAbortException. The Catch block logs it as an error and sets FailureText, but the redirect still happens; A successful login resets the user's failed-attempt count to 0 and clears the lockout
**Suspected defect:** Every successful login probably writes a spurious exception to the log, because Response.Redirect(url) inside Try/Catch Exception catches the ThreadAbortException. Locked-out users also get a misleading message.
**Confidence:** High

### RULE-088: Program numeric parameters must be well-formed numbers
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/appConfiguration/programs.aspx.vb:135-175`
**Plain English:** When a program is saved, Actual Value must be a decimal number and Near End Usage, Avg Daily Usage and Weekly Flight Days must be whole numbers. Otherwise the save is refused.
**Specification:**
  Given A program form with Actual Value '1250.50', Near End Usage '30', Avg Daily Usage 'ten' and Weekly Flight Days '5'
  When  The user clicks Save
  Then  The save fails with 'Value for 'Avg Daily Usage' must be a whole number' and nothing is stored.
**Parameters:** ActualValue is a Decimal. NearEndUsage, AvgDailyUsage and WeeklyFlightDays are Int32. The other fields (name, description, version, logos, DateOpened, DateClosed, project, activity and department codes, company name) are passed as text to BL validation.
**Edge cases handled:** Blank numeric fields fail, because TryParse of an empty string returns False.; No range checks are made here, so negative values or Weekly Flight Days above 7 are accepted at this layer.; The error message calls WeeklyFlightDays 'Weekly Test Days'.; The checks stop at the first failure, so only one message is shown at a time.
**Confidence:** High

### RULE-089: Uploaded document must be present and no larger than 10 MB
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/documents/DocumentAdd.aspx.vb:29-37`
**Plain English:** An upload is rejected if no file is chosen or if the file is larger than the configured maximum, which is currently 10,000,000 bytes.
**Specification:**
  Given The configured MaxFileUploadSize is 10,000,000 bytes
  When  The user clicks Upload with no file, or with a file of 12,500,000 bytes
  Then  The upload fails with 'Please select a document to upload', or with 'Document size exceeds maximum limit of 10MB'. Nothing is saved.
**Parameters:** MaxFileUploadSize = 10000000 bytes (Web.config:68). The message shows the size as maxDocSize / 1,000,000 with the format #,##0, followed by MB. The IIS maxRequestLength is 10000 KB (10,240,000 bytes, Web.config:14), so a request above that is rejected by the platform before this check runs.
**Edge cases handled:** A file of exactly 10,000,000 bytes is accepted, because the check is strictly greater-than.; Files between 10,000,001 and about 10,240,000 bytes get the friendly message. Larger requests get an IIS error page instead.
**Confidence:** High

### RULE-090: Overridable warnings on document edits (unwired)
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/documents/documentsList.aspx.vb:173-208`
**Plain English:** A document save can raise warnings separately from errors. The user is told to fix the errors or tick the warnings that can be ignored, and ticked warnings are meant to be marked as overridden.
**Specification:**
  Given A document update that returns one error and one warning with RuleIdentifier 'W1'
  When  The save fails
  Then  The errors are listed. The warnings appear in a checklist with the text 'Either correct the errors listed below or place a checkmark next to those errors that can be ignored.' Warnings whose OverRideRule is already True are pre-ticked.
**Parameters:** Matching uses BrokenRule.RuleIdentifier. The override flag is BrokenRule.OverRideRule.
**Edge cases handled:** ProcessWarnings, which copies the ticked boxes into OverRideRule, is never called anywhere on this page, so ticking a warning has no effect on the next save.; ProcessException(ex) reads _documentInfo.ErrorsList. If _documentInfo is Nothing (for example a failure while binding the grid), the error handler itself throws.
**Suspected defect:** ProcessWarnings (lines 196-208) is dead code, so the user cannot actually override warnings, which makes the override workflow non-functional.
**Confidence:** Medium — Should users be able to acknowledge and override document warnings? If so, which warnings can be overridden, and should the override be audited?

### RULE-091: Automated export creation requires a valid changes-since date
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/export/autoCreateFile.aspx.vb:27-52`
**Plain English:** A batch request to build an export file must supply a 'date' parameter that parses as a date. Only then is an export of data changed since that date built.
**Specification:**
  Given An authorized batch caller and BatchLoginMode = both
  When  autoCreateFile is called with date=2026-10-01
  Then  FltExportManager.CreateDownloadFile builds an export containing flights modified on or after 2026-10-01 00:00
  And   If the date is missing or empty, the reply is <error>Date is missing/invalid</error>. If it is not a parseable date (e.g. 'yesterday'), the reply is <error>Date is Invalid</error>. No file is created in either case.
**Parameters:** Request field "date"; script timeout 300 seconds; the source (query string vs form) follows BatchLoginMode, falling back to the form in 'both' mode when the query-string value is empty
**Edge cases handled:** The date is parsed with the server culture (IsDate/implicit DateTime conversion), so 01/02/2026 may mean Jan 2 or Feb 1; There is no lower or upper bound: a future date gives an export with no flights, and a very old date gives a full export
**Confidence:** High

### RULE-092: Fetch an export file only when the name matches exactly one file
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/export/autoFetchFile.aspx.vb:28-69`
**Plain English:** An automated client downloads an export by naming it. The file is sent as XML only if the name matches exactly one file in the download folder.
**Specification:**
  Given An authorized caller and a download folder containing Download_FLT_20261015T090000+0.xml
  When  autoFetchFile is called with filename=Download_FLT_20261015T090000+0.xml
  Then  The file is streamed as text/xml with its Content-Length
  And   A missing or empty filename gives <error>No file requested</error>. Zero matches or more than one match gives <error>File not found</error>.
**Parameters:** Request field "filename"; search scope = ~/download top directory only; FileBufferSize = 4096 bytes (Web.config)
**Edge cases handled:** The filename is used as a DirectoryInfo.GetFiles search pattern, so wildcards work: 'D*.xml' downloads a file whenever only one file matches; An in-progress Temp_Download_* file can be fetched if named; Files older than 24 hours can still be fetched if no listing has purged them yet
**Suspected defect:** SendFile writes a full bufferSize (4096 bytes) on every loop instead of the number of bytes read, so the last chunk adds stale or zero bytes after the real data. The output is then longer than the declared Content-Length and the XML may be corrupted. Using the caller's filename as a search pattern allows wildcard matching.
**Confidence:** High

### RULE-093: Batch login credential source is set by BatchLoginMode
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/export/autoUtilityProcs.vb:14-63`
**Plain English:** Automated export clients must send a username and password. The BatchLoginMode setting decides whether they are read from the URL query string, the posted form, or both (query string first).
**Specification:**
  Given BatchLoginMode = "Both" (current Web.config value) and a request with ?username=svc_export&password=****
  When  An automated export page needs to authenticate the caller
  Then  The credentials come from the query string (the form is used only if the query-string username is empty). Missing username or password returns <error>Invalid Login</error> and logs 'Missing username/password'. A rejected login or an exception also returns Invalid Login. A successful login stores the identity in Session("fltIdentity").
**Parameters:** BatchLoginMode values: get | post | both (Web.config value "Both", lower-cased); field names username, password; credential values: <credential — supplied at runtime, never hardcoded>
**Edge cases handled:** Mode 'get' reads only the query string, 'post' only the form; The fallback branch is 'Case "else"' (a literal string), not 'Case Else'. An unrecognised mode is not reported as a configuration error. Credentials stay empty and the caller gets 'Missing username/p…; The failed-login log message includes the attempted username
**Suspected defect:** `Case "else"` should be `Case Else`, so a misconfigured BatchLoginMode is never reported. 'get' and 'both' modes accept passwords in the URL query string, where they can end up in web server and proxy logs.
**Confidence:** High

### RULE-094: Document upload requirements for work orders
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/fleet/WorkOrderModify.aspx.vb:895-946`
**Plain English:** A work order attachment must have a file selected and must not exceed the configured maximum upload size; its document type is determined by matching the file extension to the document type list.
**Specification:**
  Given MaxFileUploadSize = 10,000,000 bytes
  When  A user uploads a 12,000,000-byte file
  Then  The upload is rejected with 'Document size exceeds maximum limit of 10MB'
  And   If no file is chosen the message 'Please select a document to upload' is shown
**Parameters:** MaxFileUploadSize from appSettings (value not in these files); MB display = bytes / 1,000,000
**Edge cases handled:** Unknown extension gets DocumentTypeId 0 rather than being rejected; File name without a '.' causes Substring(-1) to fail; Extension match is exact/case-sensitive string comparison
**Suspected defect:** UploadCancelButton_Click handles CancelButton.Click (line 928), so the main Cancel button also triggers it; no handler is wired to a dedicated upload-cancel button.
**Confidence:** High

### RULE-095: Program profile maintenance, including the usage planning figures
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/program/ProgramProfile.aspx.vb:62-103`
**Plain English:** Users can update the current program's identity, its accounting codes (project, activity, department), its open and close dates, and its planning figures (actual value, near-end usage, average daily usage, weekly test days). The program name is required and limited to 50 characters.
**Specification:**
  Given Program 7 with name 'Test Fleet 2026'
  When  the user changes Avg Daily Usage to 6.5, Weekly Test Days to 5 and clicks Save
  Then  the program is updated and 'Record updated successfully!' is shown. A blank name is rejected with 'ProgName is required'.
**Parameters:** ProgName: required, max 50. ProgDescription max 255. ProgVersion max 50. Logos max 255. DateOpened and DateClosed max 50 (stored as free text). Project, Activity and Dept codes max 50. CompanyName max 255. NearEndUsage, AvgDailyUsage, WeeklyFlightDays and ActualValue are not range-checked (Program.Validate).
**Edge cases handled:** DateOpened and DateClosed are free text, with no date format check and no rule that closed comes on or after opened; Non-numeric usage values fail on type conversion before validation and outside the Try block; After a save, the program is re-read from the database but the form is not refreshed
**Confidence:** Medium — What do NearEndUsage, AvgDailyUsage and WeeklyFlightDays drive downstream (for example forecasts or near-end alerts), and what are their valid ranges? Must DateClosed be on or after DateOpened?

### RULE-096: The 'Only Deleted' filter on Routes and Weight Tracking returns non-deleted records
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/program/Routes.aspx:33-37`
**Plain English:** On the Routes and Weight Tracking screens, choosing 'Only Deleted' actually shows the records that are not deleted, so users cannot review deleted entries that way.
**Specification:**
  Given A program with 3 live routes and 2 deleted routes
  When  the user picks 'Only Deleted' in the Is Deleted filter
  Then  the 3 live routes are listed (filter value 0), not the 2 deleted ones
**Parameters:** Routes.aspx:34-35 and WeightDefs.aspx:34-35 both use Value="0" for 'Not Deleted' and 'Only Deleted'; locations.aspx:30 correctly uses Value="1"
**Edge cases handled:** 'All' (-1) still works and includes deleted records; Because both items share value 0, ASP.NET may re-select 'Not Deleted' after postback
**Suspected defect:** 'Only Deleted' ListItem Value is 0 instead of 1 in Routes.aspx:35 and WeightDefs.aspx:35.
**Confidence:** High

### RULE-097: Empty report results block the download
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/reports/rptRoutes.aspx.vb:39-43`
**Plain English:** If the report produces no data, no file is downloaded and the user sees the message 'No information retrieved'.
**Specification:**
  Given A program with no route records (manager returns no workbook)
  When  The user clicks Download Data on the Routes report
  Then  No file is streamed; the red error label shows 'No information retrieved'
**Parameters:** Message text 'No information retrieved'. Same check in all six pages (e.g. rptConfigValues.aspx.vb:44-48, rptFleet.aspx.vb:38-42).
**Edge cases handled:** For Config Values the manager returns Nothing when the active-entries list is null or count = 0 (FLTBizObjects/BusinessLogic/RptConfigValuesManager.vb:19-27); Any other error from the manager surfaces as the generic 'An application error occurred' or 'User is not authorized' in the same label
**Confidence:** High

### RULE-098: Self-service profile update limited to contact and organizational fields
**Category:** Validation
**Priority:** P1
**Source:** `FLTWebApp/userProfile/UserProfile.aspx.vb:75-112`
**Plain English:** Users can edit their own contact details, manager, and default program, but not their username, super-user, active or lock status. The manager must be picked from active, non-deleted users, and the default program from active, non-deleted programs.
**Specification:**
  Given Logged-in user 'jdoe' viewing their own profile
  When  jdoe changes DisplayName, Email, Location, CountryCode, PhoneNumber, Manager, Department, Title, Company or DefaultProgram and clicks Save
  Then  The record is validated and updated, and 'Record updated successfully!' is shown. On validation failure the broken rules are listed. In both cases the record is reloaded from the database afterwards.
**Parameters:** Manager list: FltUserManager.GetList(IsActive=1, IsDeleted=0) (lines 11-18). Program list: ProgramManager.GetList(1, 0) (lines 20-27).
**Edge cases handled:** If the current manager is inactive or deleted, setting ManagerDropDownList.SelectedValue on load raises an error; The manager value is HtmlEncoded before it is matched against the list (line 50), so usernames with special characters may not match; The user can pick themselves as their own manager
**Suspected defect:** The load fails when the stored manager is not in the active-user list.
**Confidence:** Medium — Can a user be their own manager, and what should the profile show when the assigned manager has been deactivated?

### RULE-099: Fleet visibility requires Fleet CanView permission
**Category:** Validation
**Priority:** P1
**Source:** `FltFleet/AircraftStatusManager.vb:13-24`
**Plain English:** A user sees the fleet list only if they hold View rights on the "Fleet" resource. Otherwise the list comes back empty.
**Specification:**
  Given A logged-in user without the Fleet CanView right
  When  They open the fleet board
  Then  GetList returns Nothing, and the grid shows "No Records Retrieved" with no error message
**Parameters:** Resource name "Fleet", action fltUserAction.CanView (resolved by FltIdentityManager.AuthorizeUserAction in FLTBizObjects)
**Edge cases handled:** The user cannot tell a permission denial apart from an empty fleet; EditAircraftStatus.aspx loads and shows any aircraft by ID from the query string without checking CanView
**Suspected defect:** The edit page reads aircraft details by ID (query string v) without a CanView check.
**Confidence:** High

### RULE-100: Login required for all fleet pages; session lifetime
**Category:** Validation
**Priority:** P1
**Source:** `FltFleet/Default.aspx.vb:12-16`
**Plain English:** Every fleet page sends the user to the login page unless the session holds a logged-in identity. Sessions and form logins expire after 30 minutes of inactivity.
**Specification:**
  Given A user whose session has been idle for 31 minutes
  When  They request Default.aspx, OffTestFleet.aspx or EditAircraftStatus.aspx
  Then  They are redirected to Login.aspx
**Parameters:** Session timeout 30 min, forms timeout 30 min (Web.config:52-55). Same guard in OffTestFleet.aspx.vb:14-17 and EditAircraftStatus.aspx.vb:13-16.
**Edge cases handled:** Logout clears and abandons the session, expires the session cookie, and redirects to Login (Logout.aspx.vb:8-17)
**Confidence:** High

### RULE-101: Daily usage report: aircraft assigned to a location on a date
**Category:** Validation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:14306-14365`
**Plain English:** An active aircraft in the program counts as being at a test location on the report date if the assignment's actual end-of-test is on or after that date, or (when there is no actual end) its estimated end-of-test is on or after that date, or the assignment has no end date at all. If an aircraft has several qualifying assignments, the one ending soonest is meant to be used.
**Specification:**
  Given Aircraft 12 has assignment A at location 3 with ActEndOfTest 2024-06-30, and assignment B at location 4 with no ActEndOfTest and EstEndOfTest 2024-07-15
  When  rptDailyUsage runs for 2024-05-14
  Then  as written, only assignment A qualifies (B is dropped by the NULL-comparison bug), and A's EndTestDate shows as NULL
**Parameters:** @LocationId -1 = all locations. Only aircraft with IsDeleted = 0 and IsActive = 1 in @ProgId. Original location: database/FLT_Schema.sql:14306-14365.
**Edge cases handled:** Assignments with no actual and no estimated end date are always included.; The 'earliest end date per aircraft' step compares EndTestDate values that are always NULL, so every qualifying assignment is kept and an aircraft at several locations appears on several rows.
**Suspected defect:** Lines 312 and 314 use '<> NULL' and line 330 uses 'NOT (EstEndOfTest = NULL)'. Under ANSI_NULLS these never evaluate true, so (1) EndTestDate / LocationEndTestDate is always NULL and (2) assignments that have only an estimated end-of-test date are excluded. The 'pick the earliest-ending assignment' logic therefore never takes effect.
**Confidence:** Medium — Should an assignment with only an estimated end-of-test date on or after the report date count as active, and should the report show one row per aircraft (soonest-ending assignment) or one per location?

### RULE-102: Flight data report: liquids per flight and record eligibility
**Category:** Validation
**Priority:** P1
**Source:** `database/FLT_Schema.sql:15074-15095`
**Plain English:** The flight data report lists each active, non-deleted flight of an active program with its daily hours and the total fuel, oil and other fluids added on that flight (active, non-deleted fills only), filtered optionally by location, aircraft and date range.
**Specification:**
  Given Flight 501 has active fuel fills of 20 and 15 units and one oil fill of 1.5 units
  When  rptFlightData runs with the fuel and oil group ids
  Then  Fuel = 35, Oil = 1.5, Fluids = 0, and DailyHours = AirframeHoursEnd − AirframeHoursStart
**Parameters:** Filter 0 or NULL = no filter for LocationId, AircraftId, DateRangeStart and DateRangeEnd (inclusive). Liquid groups are passed in as @FuelLiquidGroupId, @OilLiquidGroupId and @FluidsLiquidGroupId. Original location: database/FLT_Schema.sql:15074-15095.
**Edge cases handled:** A flight with several comments appears once per comment.; Missing liquid amounts show as 0, and a missing comment shows as an empty string with rating 0.
**Suspected defect:** Line 975 checks 'V.IsDeleted = 0 AND P.IsActive = 1', which repeats the program check instead of checking Aircraft.IsActive, so flights of inactive aircraft appear in the report.
**Confidence:** Medium — Should flights of inactive (but not deleted) aircraft be excluded from the flight data report?

### RULE-103: Comment type validation and aircraft comment ordering
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessLogic/AircraftManager.vb:285-329`
**Also cited:** (InsertGenericComment / RemoveGenericComment) together with FLTBizObjects/BusinessLogic/AircraftManager.vb:496-545 (ValidateGenericComment / SortGenericCommentList); temp-id seed at FLTBizObjects/BusinessObject/Aircraft.vb:66
**Plain English:** A generic comment is validated according to its source type (aircraft, flight, work-order engineer or mechanic comment); unknown types are rejected; aircraft comments are kept sorted newest first and only aircraft comments can be removed from an aircraft.
**Specification:**
  Given A generic comment with SourceTable 'AircraftComment' dated 2026-07-02 added to an aircraft whose existing comment is dated 2026-07-01
  When  InsertGenericComment runs
  Then  Comment validated as AircraftComment, gets a negative temp id, and is placed before the 2026-07-01 comment
**Parameters:** Accepted types: aircraftcomment, flightcomment, woengineercomment, womechaniccomment (case-insensitive)
**Edge cases handled:** Unknown SourceTable -> broken rule 'Unable to determine the Comment Type'; Any warning (not just error) blocks the save because WarningsList count must be 0; Removing a non-AircraftComment throws 'Removing a comment that is not an Aircraft Comment is not allowed' (lines 307-329)
**Confidence:** Medium — Citation was corrected by referee (The behavior is real, but the cited range only covers part of it. Lines 496-545 contain ValidateGenericComment and SortGenericCommentList. ValidateGenericComment branches on LCase(SourceTable) into aircraftcomment, flightcomment, woengineercomment and womechaniccomment, and adds a "Unable to determine the Comment Type" BrokenRule for any other value. SortGeneric…

### RULE-104: Aircraft location stay dates
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessObject/AircraftLocation.vb:344-378`
**Plain English:** Each aircraft location stay needs an aircraft, a location and a valid arrival date. The estimated and actual end-of-test dates are optional but must be valid dates when given.
**Specification:**
  Given A location stay with ArrivalDate 'tomorrow'
  When  It is validated
  Then  Hard error 01-03-004 'ArrivalDate must be a date value'.
**Parameters:** IDs 01-03-001 to 01-03-006.
**Edge cases handled:** No check that end-of-test dates fall after the arrival date
**Confidence:** High

### RULE-105: Document upload acceptance
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessObject/DocumentInfo.vb:229-268`
**Plain English:** A program document needs a program, a document type, a valid file name of at most 255 characters that is more than just an extension, an optional description of at most 255 characters, and a size greater than zero. Document types need a valid file extension and MIME type.
**Specification:**
  Given A document named '.pdf' with size 0
  When  It is validated
  Then  Errors 'DocFileName is missing, must be more than just a file extension' and 'DocumentSize is required'.
**Parameters:** Name max 255. Description max 255. Size > 0. DocumentType checks are in DocumentType.vb:72-90.
**Edge cases handled:** The extension-only check uses LastIndexOf('.') = 0, so a name like '..pdf' passes
**Confidence:** High

### RULE-106: Reference data (program, location, region, route) required fields
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessObject/Route.vb:211-247`
**Plain English:** Routes need a location and a time zone (ids greater than 0) and a name of at most 50 characters. Locations need a program, a time zone and a name of at most 50 characters. Regions need a program, a code of at most 2 characters and a name of at most 255. Programs need a name of at most 50 characters.
**Specification:**
  Given A region with Code 'NAM'
  When  It is validated
  Then  Error 'Code cannot be longer than 2'.
**Parameters:** Location.vb:267-297 (name 50). Region.vb:123-159 (code 2, name 255). Program.vb:423-497 (name 50; description and logos 255; codes 50; company 255).
**Edge cases handled:** Free-text fields must also pass ObjectPropertyValidator.ValidateCommonString
**Confidence:** High

### RULE-107: Time zone daylight-saving definition
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessObject/UTCTimeZone.vb:177-211`
**Plain English:** A time zone needs a code (max 10 characters) and a description (max 255). If it observes daylight saving, the offset must be between -12 and +12 and it needs valid begin and end dates, with the end not earlier than the begin.
**Specification:**
  Given A DST-observing zone with offset 13
  When  It is validated
  Then  Error 'DaylightSavingOffset must be between -12 and +12'.
**Parameters:** Offset range -12 to +12 inclusive.
**Edge cases handled:** The DST date checks are skipped when DaylightSavingTime = False
**Confidence:** High

### RULE-108: Weight tracking type description rule
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/BusinessObject/WeightDefType.vb:101-106`
**Plain English:** A weight tracking type must have a description, and the description may contain only the common allowed characters.
**Specification:**
  Given A WeightDefType with WeightDefTypeDescr='Fuel*Load'
  When  Validate() runs
  Then  The error 'WeightDefTypeDescr should only contain letters, numbers, ...' is raised because '*' is not allowed
**Parameters:** Same common-string regex as WeightDef
**Edge cases handled:** The 'required' message has a typo: 'WeightDefTyepDescr'.
**Confidence:** High

### RULE-109: Optional test-end and arrival dates are stored only when they are valid dates
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/DataAccess/AircraftDB.vb:216-227`
**Plain English:** An aircraft's estimated and actual end-of-testing dates are optional. A blank or invalid value is stored as empty (NULL) and does not cause an error.
**Specification:**
  Given An aircraft with EstEndOfTesting '06-30-2026' and ActEndOfTesting ''
  When  The aircraft is saved
  Then  EstEndOfTesting is stored as 2026-06-30 and ActEndOfTesting is stored as NULL
**Parameters:** Dates are checked with IsDate and loaded back in MM-dd-yyyy format. Configuration start and end dates are sent as Nothing when empty (AircraftConfigurationDB.vb:210-220).
**Edge cases handled:** AircraftLocationDB.vb:213-227: when ArrivalDate, EstEndOfTest or ActEndOfTest is not a valid date, the parameter value is left unset instead of DBNull; AircraftLocation EstEndOfTest and ActEndOfTest are passed as the raw string, not CDate
**Suspected defect:** In AircraftLocationDB.Update and Insert, invalid or blank dates leave the SqlParameter Value as Nothing rather than DBNull.Value. ADO.NET then omits the parameter, so the call may fail unless the procedure has a default.
**Confidence:** Medium — Should an aircraft location with no arrival date be saveable? Today the parameter is left unset, which the stored procedure may reject.

### RULE-110: User account dates before 1800 are treated as not set
**Category:** Validation
**Priority:** P2
**Source:** `FLTBizObjects/DataAccess/FltUserDB.vb:130-160`
**Plain English:** Any user date (last login, last lockout, last password change, failed-attempt window starts) earlier than year 1800 is treated as never set and saved as empty.
**Specification:**
  Given A new user whose UtcLastLockoutDate is the default 0001-01-01
  When  The user is saved
  Then  UtcLastLockoutDate is sent as empty (Nothing) rather than 0001-01-01
**Parameters:** Cutoff year: 1800
**Edge cases handled:** The value is sent as Nothing rather than DBNull.Value, so the parameter may be omitted; FltUserDB.Insert does not pass IsActive (lines 206-268), so the database default applies; Password, salt and security answer are stored as given; any hashing happens upstream
**Suspected defect:** Using Nothing instead of DBNull.Value may make the update procedure fail with a 'parameter not supplied' error if it has no default.
**Confidence:** Medium — Are passwords and security answers hashed before they reach FltUserDB, and what IsActive default does addFltUser apply?

### RULE-111: Parent save disabled while any child row is being edited
**Category:** Validation
**Priority:** P2
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:604-621`
**Plain English:** While any child row is open for editing, the main Save button is disabled and is re-enabled only when no child grid is in edit mode.
**Specification:**
  Given A flight with a liquid fill row and a comment row both open for editing
  When  The user saves the liquid fill row
  Then  The main Save button stays disabled until the comment row is also saved or cancelled
**Parameters:** Flight grids: LiquidFill, FlightComment, FlightEngineRun, FlightRegionTime; Work order grids: Reasons, Instructions, PerformedWork, EngineerComments, TechComments, Parts (WorkOrderModify 306-313)
**Edge cases handled:** AircraftModify re-enables Save after any single grid save/cancel without checking other grids (lines 255-262, 703-710)
**Confidence:** High

### RULE-112: Comment rating scale 1 to 10
**Category:** Validation
**Priority:** P2
**Source:** `FLTWebApp/fleet/FlightModify.aspx:448-473`
**Plain English:** Pilot, engineer, mechanic and aircraft comments carry a severity/quality rating from 1 to 10, with 0 ('--') meaning not rated.
**Specification:**
  Given A pilot comment entered with rating 7
  When  The comment is added
  Then  The comment is stored with CommentRating 7
**Parameters:** Options 0('--'),1..10 in FlightModify.aspx:448-473, WorkOrderModify.aspx:371-396 and 498-523; AircraftModify.aspx:702-725 offers 1..10 without a 0 option
**Edge cases handled:** Issue code defaults to 'N/A' (ID 0); Component defaults to '< Select >' (ID 0)
**Confidence:** Medium — Is 10 the most severe or the best rating, and should aircraft-level comments allow 'not rated' (0) like the other comment types?

### RULE-113: Child rows are only added when at least one field is filled
**Category:** Validation
**Priority:** P2
**Source:** `FLTWebApp/fleet/WorkOrderModify.aspx.vb:715-746`
**Plain English:** A new child row (part, comment, reason, instruction, location, engine run, region time) is created only if the user entered something in at least one of its fields; completely blank rows are ignored.
**Specification:**
  Given A work order part footer row where only Part Number Failed = 'PN-123' is entered
  When  The row is added (directly or on parent save)
  Then  A work order part is inserted
  And   If all eight part fields are blank, nothing is inserted
**Parameters:** Reasons/instructions: line text non-empty (lines 284, 366); performed work: length <> 0 (447); engineer comments: component, date, issue code, rating or comments (531); mechanic comments: component, date, rating or comments (631); flight comments: component, time, comment or rating (FlightModify 718-719); engine runs: start, end or speed (FlightModify 853); region time: region or hours (FlightModify 935); aircraft location: location, arrival, required usage, est/act end (AircraftModify 221-222); aircraft comment: date or comments (AircraftModify 661)
**Edge cases handled:** Mechanic comments ignore issue code when deciding emptiness while engineer comments include it; Field-level validation of contents is delegated to the business layer
**Confidence:** High

## Lifecycle

### RULE-114: Flight is auto-approved on a validated save
**Category:** Lifecycle
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:91-139`
**Plain English:** When a flight log is saved with full validation and it is not yet approved, the system marks it approved, records the saving user as approver and stamps the approval time in UTC.
**Specification:**
  Given A flight log with IsApproved = False, saved by user 'jdoe' who holds Fleet edit rights, and the flight passes Validate(EnforceValidation=True)
  When  FlightManager.Insert or Update runs with EnforceValidation = True (the default overloads)
  Then  IsApproved = True, ApprovedBy = 'jdoe', UtcDateApproved = current UTC time; the record is persisted with StampUserName = 'jdoe'. If EnforceValidation = False the flight is saved without being approved.
**Parameters:** EnforceValidation flag (default True via Save/Insert/Update 2-arg overloads); same logic duplicated in Update at FlightManager.vb:60-66
**Edge cases handled:** Already-approved flights keep their original approver and approval date on later edits; approval is never revoked by edits; EnforceValidation=False is the only way to save a draft/unapproved flight; Approval is set before FlightDB write; a DB failure leaves the in-memory object marked approved; Update path does not adjust engine-run times (only Insert calls DateTimeAdjustFlightEngineRunList)
**Suspected defect:** Update (lines 50-84) does not call DateTimeAdjustFlightEngineRunList, so engine-run local/UTC times are not recomputed when a flight's date, departure time or location is edited; Insert does (line 116).
**Confidence:** High

### RULE-115: Flight log saved as one atomic unit with its child records
**Category:** Lifecycle
**Priority:** P0
**Source:** `FLTBizObjects/DataAccess/FlightDB.vb:105-163`
**Plain English:** A flight and its liquid fills, pilot comments, engine runs and region times are all saved, or none are. Each child is inserted if it is new or updated if it already exists, and removed children are deleted only if they were ever saved.
**Specification:**
  Given A flight with one new liquid fill (no ConcurrencyId), one edited engine run (with a ConcurrencyId) and one region time on the delete list with Id 42
  When  The flight is saved
  Then  In one transaction: the flight is updated, the liquid fill is inserted, the engine run is updated and region time 42 is deleted. If any step fails, everything is rolled back. Each child gets the parent's FlightId and StampUserName.
**Parameters:** A child is treated as new when its ConcurrencyId is Nothing, empty or "0" (lines 630-740). A child on a delete list is deleted only when its Id is > 0.
**Edge cases handled:** On insert of a new flight, only the add lists are processed. Delete lists are ignored (lines 286-344).; Children on a delete list that were never saved (Id 0) are dropped silently; The audit user on every child is overwritten with the parent flight's StampUserName
**Confidence:** High

### RULE-116: Work order and all its child records are saved as one all-or-nothing unit
**Category:** Lifecycle
**Priority:** P0
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:113-180`
**Plain English:** When a work order is saved, the header and every attached reason, instruction, performed-work line, part, engineer comment, mechanic comment and document link are written in a single transaction; if any piece fails, nothing is saved.
**Specification:**
  Given An existing work order #1001 with 2 new reasons, 1 edited instruction, 1 part marked for removal and 1 attached document
  When  The user saves the work order and the part-removal step fails in the database
  Then  The whole save is rolled back: header changes, new reasons and the edited instruction are not persisted, and the user sees either the concurrency message or 'Application encountered a data error.'
**Parameters:** Processing order on update: header (updateWorkOrder) -> reasons upsert -> reasons delete -> instructions upsert/delete -> performed work upsert/delete -> parts upsert/delete -> engineer comments upsert/delete -> mechanic comments upsert/delete -> documents link/unlink -> commit. On insert (lines 238-303) the header is created first (addWorkOrder returns the new WorkOrderId), each child is stamped with that id, and delete lists are NOT processed.
**Edge cases handled:** On a new work order, delete lists are ignored entirely (lines 256-268); Every child inherits the parent's StampUserName and WorkOrderId before being saved (lines 431-432 etc.); Work order number (WorkOrderNbr) is never sent on insert; it is read back from the database, so numbering is assigned by the database (line 386); GetItem (lines 15-72) also loads header plus all six child lists and document infos in one transaction
**Suspected defect:** _processWODocumentInfosList calls DocumentInfoDB.Update(thisDocumentInfo) without passing the open connection/transaction (line 600), so document metadata updates are committed independently and are not rolled back if the rest of the work order save fails.
**Confidence:** Medium — P0 panel doubts spec fidelity: P0 is justified. This is the persistence contract for aircraft maintenance work orders. A partial save would leave a work order out of step with the parts, performed work and comments recorded against it, which is an aviation-safety and data-integrity problem. Every rewrite has to preserve this behavior. The rule is not fully faithful, though. Parts of it are confir…

### RULE-117: Newly logged flights start active, unapproved and not deleted
**Category:** Lifecycle
**Priority:** P0
**Source:** `FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:138-140`
**Plain English:** Every flight uploaded through the API enters the system as an active record pending approval; the API cannot create an approved or deleted flight.
**Specification:**
  Given A flight posted by a field client, regardless of any approval data in the payload
  When  The flight is created
  Then  IsActive = true, IsApproved = false, IsDeleted = false, FlightId placeholder = -1, and FlightManager.Insert is called with its third flag = false; the response is 201 Created with the new FlightId and a Location header of request URI + '/' + id
**Parameters:** Initial state: Active=true, Approved=false, Deleted=false; Insert(..., false) at FlightsController.cs:74
**Edge cases handled:** No API endpoint exists here to approve, update or delete a flight; approval must happen elsewhere; The meaning of the third Insert argument (false) is not visible in this module
**Confidence:** Medium — What does the boolean third argument of FlightManager.Insert control, and which system/role moves a flight from unapproved to approved?

### RULE-118: Aircraft status code mapping (UP / DOWN / OFF TEST)
**Category:** Lifecycle
**Priority:** P0
**Source:** `FltFleet/AircraftStatus.vb:65-71`
**Plain English:** Each aircraft is in one of three statuses: stored code 1 means UP, 2 means DOWN, and every other code (including 0 and NULL) means OFF TEST.
**Specification:**
  Given An aircraft record with Status = 2
  When  The status is shown on the fleet board or used for filtering
  Then  It shows as "DOWN". Status 1 shows as "UP". Status 0, NULL (read as 0) or any unknown value such as 5 shows as "OFF TEST".
**Parameters:** 1 = UP, 2 = DOWN, anything else = OFF TEST (0 is the explicit code; NULL becomes 0 per AircraftStatusDB.vb:134-138). The edit page writes the dropdown position as the code: position 0 = OFF TEST, 1 = UP, 2 = DOWN (EditAircraftStatus.aspx.vb:20-23, 33, 47).
**Edge cases handled:** Unknown codes such as 3 or -1 display as OFF TEST, but EditAircraftStatus sets SelectedIndex = Status, so opening that aircraft for edit throws an out-of-range error; The stored code depends on the order of the dropdown items. Reordering the list silently changes what each code means; There are no transition guards: any status can change to any other status, and the same status can be saved again
**Suspected defect:** The status code depends on the order of the dropdown items, not on an explicit value, so a code outside 0-2 breaks the edit page.
**Confidence:** High

### RULE-119: Flight approval stamping (who approved and when)
**Category:** Lifecycle
**Priority:** P0
**Source:** `database/FLT_Schema.sql:17284-17301`
**Plain English:** When a flight that was not yet approved is saved as approved, the system records the saving user as the approver and the current UTC time as the approval date.
**Specification:**
  Given Flight 501 is stored with IsApproved = 0 and user 'jsmith' saves it with IsApproved = 1
  When  updateFlight runs
  Then  ApprovedBy = 'jsmith' and UTCDateApproved = the current UTC time, whatever values the caller passed
**Parameters:** States: IsApproved 0 (pending) to 1 (approved). Original location: database/FLT_Schema.sql:17284-17301; values persisted at 17341-17343.
**Edge cases handled:** Re-saving an already-approved flight keeps the caller-supplied ApprovedBy and UTCDateApproved. If the caller omits them, the defaults ('' and NULL) erase the original approver and date.; Un-approving (IsApproved = 0) is allowed with no restriction and stores whatever ApprovedBy and UTCDateApproved the caller passes.; addFlight (excerpt lines 43-45, 148-150) takes IsApproved, ApprovedBy and UtcDateApproved straight from the caller with no server-side stamping, so a flight created as approved can carry any approver…; There is no role or authorization check on who may approve.
**Suspected defect:** Approval audit fields can be overwritten or cleared on later edits, and creating a flight as approved bypasses server-side stamping.
**Confidence:** High

### RULE-120: Saved aircraft configurations are immutable
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/AircraftManager.vb:141-201`
**Plain English:** Once an aircraft configuration has been saved it can be neither edited nor removed; only unsaved (pending) configurations may be changed or removed, and removing one reopens the prior latest configuration.
**Specification:**
  Given Aircraft with saved configuration Id 17 and an unsaved pending configuration Id -1
  When  User attempts to update or remove configuration 17, or removes configuration -1
  Then  Update/remove of 17 throws 'editing/deleting an existing Aircraft Configuration is not allowed'; removing -1 sets the remaining latest configuration's MeterEnd = 0 and restores the aircraft offset from it
**Parameters:** Persisted = Id > 0
**Edge cases handled:** Updating a pending configuration resets its MeterStart to the aircraft's current hours and re-applies offset and unit; If no configuration remains, the code intends to zero AirframeHoursStart/Current/Offset
**Suspected defect:** RetrieveLatestAircraftConfiguration always returns a New object (never Nothing), so the 'no configurations left' branch that zeroes airframe hours (lines 155-158) is unreachable; instead MeterEnd/offset are set on an empty placeholder object and the aircraft offset becomes 0 implicitly.
**Confidence:** High

### RULE-121: Single current location per aircraft
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/AircraftManager.vb:203-283`
**Plain English:** Only one aircraft location assignment may be flagged as the last (current) test location; flagging a new one clears the flag on all others and sets the aircraft's current location, and removing the flagged one clears the aircraft's current location.
**Specification:**
  Given Aircraft at location A (LastLocation = True) and a new assignment to location B with LastLocation = True
  When  The new location is inserted or updated
  Then  A.LastLocation = False, B.LastLocation = True, Aircraft.CurrentLocationId = B
**Parameters:** Persisted locations (Id > 0) removed are queued on AircraftLocationDeleteList
**Edge cases handled:** Removing the current location sets CurrentLocationId = 0; Unsaved (negative id) locations are discarded without a delete record
**Suspected defect:** UpdateAircraftLocation (line 265) matches by LocationId, so if the aircraft has two assignments to the same location the wrong record may be replaced.
**Confidence:** Medium — Should an aircraft be allowed to be assigned to the same location more than once? UpdateAircraftLocation matches the existing row by LocationId rather than AircraftLocationId.

### RULE-122: Export auto-creates missing aircraft-location assignments
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FltExportManager.vb:152-200`
**Plain English:** If an aircraft has flights logged at a location it is not formally assigned to, the export creates the aircraft-location assignment (arrival = now, stamped 'export') and includes it.
**Specification:**
  Given Aircraft 42 has flights at location 9 but no AircraftLocation row for 9
  When  The export runs
  Then  A new AircraftLocation (AircraftId 42, LocationId 9, ArrivalDate = UtcNow, StampUserName 'export') is inserted in the database and exported
**Parameters:** StampUserName 'export'
**Edge cases handled:** Runs on every export until the assignment exists; Bypasses AircraftLocation validation and LastLocation handling
**Suspected defect:** A read-only export operation writes data directly through the DAL, bypassing business validation and authorization for edits.
**Confidence:** High

### RULE-123: Export file is built under a temporary name, then published with a UTC-timestamped name
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FltExportManager.vb:44-75`
**Plain English:** Each export run writes a temporary file. When the file is complete it is renamed to a final name built from the app prefix and the UTC creation timestamp, and only then does it become the published download.
**Specification:**
  Given appPrefix = FLT and an export started at 2026-10-15 09:00:00 UTC
  When  CreateDownloadFile runs (from autoCreateFile or the Export page button)
  Then  It writes Temp_Download_FLT_20261015T090000<offset>.xml, then renames it to Download_FLT_20261015T090000<offset>.xml in ~/download
  And   Whenever a file is written, Programs > Fleet > Aircraft > Locations > Flights are included. For aircraft with flights at locations they have no AircraftLocation record for, the export inserts a new AircraftLocation record (ArrivalDate = now UTC, StampUserName = 'export'), as a side effect in the database (FltExportManager.vb:187-199)
**Parameters:** Name pattern Download_<appPrefix>_<yyyyMMddTHHmmssz>.xml (FltExportManager.vb:46-49); download dir ~/download (autoUtilityProcs.vb:12)
**Edge cases handled:** Two exports in the same second get the same name, and the rename fails; If generation fails, the Temp_ file is left behind and shows in listings until purged; The 'z' format specifier writes the server's local UTC offset, even though the timestamp itself is UTC
**Suspected defect:** Running an export, which looks like a read-only operation, writes AircraftLocation rows to the database. Timestamp names with one-second resolution can collide.
**Confidence:** Medium — Is it intended that generating an export creates missing AircraftLocation records (stamped 'export')? Should the file timestamp suffix show the server's local offset when the time is UTC?

### RULE-124: Program cloning copies setup data
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/ProgramManager.vb:100-160`
**Plain English:** Creating a program from a source program copies its active roles (with module permissions and user memberships), regions, locations with their routes, weight definitions and all lookup values into the new program.
**Specification:**
  Given Source program 3 with 2 roles, 5 locations each with routes, and lookup lists
  When  Clone(3, newProgram) is run by a user with Program edit rights
  Then  A new program is inserted and every active, non-deleted child is re-created under the new program id, with users added to the corresponding new roles
**Parameters:** Filters: IsActive=1, IsDeleted=0 for roles/locations/routes/weights; lookups active only
**Edge cases handled:** Not transactional: a mid-way failure leaves a partially cloned program; Regions are copied without updating StampUserName; Aircraft, flights and documents are not copied
**Confidence:** High

### RULE-125: Work order record lifecycle (new, edit, soft delete, concurrency)
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:118-122`
**Also cited:** (temporary negative IDs), FLTBizObjects/BusinessLogic/WorkOrderManager.vb:312-318 (moving removed parts to WOPartDeleteList), FLTBizObjects/DataAccess/WorkOrderDB.vb:528-536 (processing the delete list via WorkOrderPartDB.Delete; soft delete not confirmed), FLTBizObjects/BusinessObject/WorkOrder.vb…
**Plain English:** A new work order is marked by ID -1 and concurrency token '0'. Child lines being added get temporary negative IDs, removed child lines go into delete lists, and records are deleted by setting the IsDeleted flag instead of being removed.
**Specification:**
  Given A user creates a new work order and adds a reason line, then removes a different existing part line
  When  The object graph is built for save
  Then  WorkOrderId=-1, ConcurrencyId='0', NewWoReasonId starts at -1 as the temporary key, the removed part goes to WOPartDeleteList, and IsDeleted marks deleted records
**Parameters:** New-record sentinel WorkOrderId=-1; ConcurrencyId initial '0' (optimistic concurrency token); temporary child IDs start at -1; IsDeleted default False; audit fields UtcDateCreated, UtcDateModified, StampUserName
**Edge cases handled:** The child classes start with ID 0, not -1.; The _nextWO*LineNbr fields (lines 60-84) are declared but never used in this file, so line numbering is assigned elsewhere.
**Confidence:** Medium — Where are the concurrency check, temporary-ID resolution and soft-delete persistence enforced (DAL or stored procedures), and are deleted work orders ever purged under a retention rule?

### RULE-126: Work order child staging with temporary ids and deferred deletes
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:118-151`
**Plain English:** Children added to a work order in memory get temporary negative ids that count down. Removing a child that already exists in the database (id > 0) queues it for deletion on save; removing an unsaved child (id <= 0) just discards it.
**Specification:**
  Given A work order whose NewWoReasonId counter is -1 and which holds a saved reason with id 57
  When  A reason is added, and then reason 57 is removed
  Then  The new reason gets id -1 and the counter becomes -2. Reason 57 leaves the list and is added to WOReasonDeleteList, to be deleted when the work order is saved.
**Parameters:** Same pattern for instructions (176-209), performed work (234-267), parts (292-325), engineer comments (350-383) and mechanic comments (408-441)
**Edge cases handled:** Removing an id that is not in the list throws 'Can't remove - record not found in collection!'; Updating a child replaces it in the list and keeps the original ConcurrencyId; if the id is not found, the update does nothing and raises no error; Removing a document always queues it for unlinking, whatever its id (490-504)
**Confidence:** High

### RULE-127: Insert vs update decision from concurrency token
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:33-58`
**Plain English:** A record with no concurrency token (empty, null or '0') is treated as new and inserted; otherwise it is updated. Both paths require Edit permission and a passing Validate(), and stamp the current user name for audit.
**Specification:**
  Given A WorkOrder with ConcurrencyId = '0'
  When  Save is called by a user with Fleet Edit permission
  Then  Insert runs: the record is validated, StampUserName = current user, it is written to the database, and the new WorkOrderId is assigned to the object. If Validate() fails: 'Can't insert - record is invalid. Please correct errors and try again.'
**Parameters:** New-record markers: Nothing, String.Empty, '0'. The same pattern is used in UTCTimeZoneManager:45-51, WeightDefManager:51-57, WeightDefTypeManager:45-51 and fltLookupBaseManager:37-43.
**Edge cases handled:** UTCTimeZone and WeightDefType saves do not stamp the user name, unlike WorkOrder and WeightDef; Lookup table insert, update and delete run inside a TransactionScope
**Confidence:** High

### RULE-128: Work order insert cascades child records
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:61-91`
**Plain English:** When a new work order is created, the header is saved first. Then every reason, instruction, performed-work entry, engineer comment, mechanic comment and part is saved under the new work order id, and every attached document is linked to it.
**Specification:**
  Given A new work order with 2 reasons, 1 part and 1 attached document
  When  Insert succeeds and returns WorkOrderId 1234
  Then  Each child gets WorkOrderId = 1234 and StampUserName = the current user. A child is inserted if its ConcurrencyId is Nothing/'0', otherwise updated. A document-to-work-order cross-reference is added only if one does not already exist.
**Parameters:** Child types: WOReason, WOInstruction, WOPerformedWork, WOEngineerComment, WOMechanicComment, WorkOrderPart, DocumentInfo (child processing at lines 574-834)
**Edge cases handled:** On update, child processing and pending deletes are handled in WorkOrderDB.Update inside a database transaction (DataAccess/WorkOrderDB.vb:129-147), not in this manager; The private Process*DeleteList and Delete*List routines in this manager are never called (dead code)
**Suspected defect:** On insert, the header and each child list are written in separate calls with no shared transaction, so a failure part-way leaves a work order with only some of its children saved.
**Confidence:** High

### RULE-129: Lockout expiry and failure-counter reset
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:37-47`
**Plain English:** A locked account stays locked for the lockout duration after it was locked; after that, the next login attempt unlocks it and clears the failure count. A successful login also clears the lock and the count.
**Specification:**
  Given LockoutDuration = 5 minutes and a user locked at 10:00 UTC
  When  The user tries to log in at 10:03 UTC, and again at 10:06 UTC
  Then  At 10:03 the login is refused with 'User account is locked out - try again later', and the password is not checked. At 10:06 the account is unlocked and FailedPasswordAttemptCount is set to 0, and then the password is checked as normal.
**Parameters:** Lockout_Duration: AppSettings key 'LockoutDuration', default 5 minutes (FLTBizObjects/DataAccess/AppConfig.vb:32-43). Elapsed time uses DateDiff in whole minutes (truncated). A successful login also resets the lock and count (fltIdentityManager.vb:68-71).
**Edge cases handled:** DateDiff in minutes counts minute-boundary crossings, so the real lockout can be up to about 59 seconds shorter than configured; If the password is wrong right after the auto-unlock, counting restarts from 0; States: Active (count 0..max-1), then LockedOut (with timestamp), then auto-unlocked after the duration on the next attempt
**Confidence:** High

### RULE-130: Switching the current program reloads permissions
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:83-95`
**Also cited:** FLTWebApp/FLT.Master.vb:162-165
**Plain English:** When a user switches programs, the current program id and its display name are updated, and the user's module permissions are reloaded for the new program.
**Specification:**
  Given A user whose programs list holds ProgId 4 named 'Atlantic Ops'
  When  ChangeCurrentProgram(identity, 4) is called
  Then  CurrentProgId = 4, ProgDisplayName = 'Atlantic Ops', and permissions are fetched again for program 4
**Parameters:** None
**Edge cases handled:** If the new ProgId is not in the user's programs list, CurrentProgId still changes but the display name stays on the old program
**Suspected defect:** There is no check that the user belongs to the target program. Whether access is blocked depends on FetchUserProgramPermissions returning nothing, which this code does not confirm.
**Confidence:** Medium — Should switching to a program the user is not assigned to be rejected outright? / Should the server reject a program id the user is not assigned to, rather than relying on the drop-down contents?

### RULE-131: A save inserts a new record or updates an existing one based on its concurrency token
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/fltLookupBaseManager.vb:37-43`
**Also cited:** (insert/update decision); UI flow at FLTWebApp/program/ConfigValues.aspx.vb:87-119
**Plain English:** The Add form creates a blank record. When it is saved, it becomes a new row if it has never been stored, otherwise the existing row is updated.
**Specification:**
  Given A user clicks Add on Configuration Values with lookup type 'WeightUnit' selected
  When  they enter String Value 'kg', Sort Order 1, check Is Active, and click Save
  Then  a new WeightUnit lookup row is inserted for the current program, because the blank record's ConcurrencyId is empty, Nothing or "0". The screen goes back to the list.
**Parameters:** Insert condition: ConcurrencyId is Nothing, empty or "0" (fltLookupBaseManager.Save and LocationManager.Save); otherwise Update
**Edge cases handled:** The same Add-then-Save pattern is used in locations.aspx.vb:98-125, Regions.aspx.vb:99-122, Routes.aspx.vb:105-133 and WeightDefs.aspx.vb:109-137; Inline grid edits load the stored record first and call Update directly; Regions.aspx.vb:70-77 reloads the record from the database just before an inline update, which replaces the concurrency token captured when editing began; ConfigValues.aspx:59 binds ConcurrencyIdLB to ID instead of ConcurrencyId
**Suspected defect:** Regions inline update re-fetches the record (Regions.aspx.vb:71) right before saving, which bypasses optimistic concurrency, so the last writer wins silently. ConfigValues.aspx:59 binds the hidden ConcurrencyId label to ID.
**Confidence:** Medium — Citation was corrected by referee (The cited range in ConfigValues.aspx.vb covers the screen flow. AddButton_Click (lines 113-119) creates a new fltLookupBase and copies in LookupName from the type dropdown and ProgId from the hidden field. SaveButton_Click (lines 87-98) loads the form values, calls fltLookupBaseManager.Save, and switches back to the list (ActiveViewIndex = 0). These lines do not…

### RULE-132: New aircraft must have exactly one configuration and one location
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Aircraft.vb:883-898`
**Plain English:** An aircraft must always have at least one configuration history entry and one location history entry. When an aircraft is first created, it must have exactly one of each.
**Specification:**
  Given A new aircraft (AircraftId = 0) submitted with two configuration entries and one location
  When  It is validated
  Then  Hard error 01-00-014 'When adding a new aircraft, there must be exactly one Aircraft Configuration entry'.
**Parameters:** IDs 01-00-012 and 01-00-013 (at least one), 01-00-014 and 01-00-015 (exactly one on create). An aircraft is treated as new when AircraftId is not greater than 0.
**Edge cases handled:** Existing aircraft can have any number of entries of 1 or more; Errors from child configurations, locations and generic comments are rolled up into the aircraft
**Confidence:** Medium — P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: Aircraft.vb:883-898 adds 01-00-012/013 when the configuration or location list is empty. When AircraftId is not greater than 0, it adds 01-00-014/015 if either count is not exactly 1. All four are BrokenRule(..., False, False), which BrokenRule.vb:59-65 defines as not overrideable, so "har…

### RULE-133: Work order status has no enforced transitions in the business object
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WorkOrder.vb:865-915`
**Plain English:** A work order must have a status, but this object accepts any status ID and any change between statuses, and does not tie finish date/time or engineering action to a particular status.
**Specification:**
  Given A work order with WorkOrderStatusId changed from 1 to any other non-zero ID and no FinishDate
  When  Validate() runs
  Then  The work order is valid. No transition, completion-date or sign-off check is applied
**Parameters:** Only check: WorkOrderStatusId != 0 (03-00-005). The status lookup values are not defined in these files
**Edge cases handled:** A finish date can be entered while the status is still open, and a closed status can be saved without a finish date.; AircraftIssueAlert and MaintIssueAlert are free flags with no rule.
**Confidence:** Low — What are the work order statuses (e.g. Open, In Work, Closed) and their allowed transitions? Must a finish date/time, end meter or mechanic be present before a work order can be closed, and is that enforced in the UI or stored procedures?

### RULE-134: Aircraft save is atomic with its configurations and locations
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/AircraftDB.vb:108-166`
**Plain English:** Saving an aircraft also saves its configuration history, location history, comments and test links in one transaction. New child rows are inserted, existing ones are updated, and removed ones are deleted only if they were ever saved.
**Specification:**
  Given Aircraft 7 with a new configuration (no ConcurrencyId), an edited location, and a configuration with Id 12 on the delete list
  When  The aircraft is saved
  Then  The aircraft is updated, the new configuration is inserted, the location is updated and configuration 12 is deleted. Every child gets AircraftId=7 and the aircraft's StampUserName.
**Parameters:** A child is new when its ConcurrencyId is Nothing or "0" (lines 488 and 516). A child on a delete list is deleted only when its Id is > 0.
**Edge cases handled:** On insert of a new aircraft, delete lists are not processed (lines 257-316); AircraftDB.GetItem does not roll back on errors while loading children (lines 43-49); The aircraft record carries AircraftStatusId, but no status transitions are enforced in this layer
**Suspected defect:** See the comment, location and test rules: some child deletes or inserts run outside this transaction.
**Confidence:** High

### RULE-135: Linking documents to work orders
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/DocumentWorkOrderXrefDB.vb:231-356`
**Plain English:** Documents are attached to and detached from work orders through a link record. The system can check whether a given link already exists.
**Specification:**
  Given Document 9 and work order 55
  When  The document is attached, checked and later detached
  Then  addWorkOrderDocXref creates the link, existsWorkOrderDocXref returns true, and deleteWorkOrderDocXref removes the link, recording the acting user
**Parameters:** Stored procedures: addWorkOrderDocXref, existsWorkOrderDocXref, deleteWorkOrderDocXref
**Edge cases handled:** The inner Delete overload never sets myDbCommand.Transaction even though the caller opened a transaction
**Suspected defect:** ListWorkOrderInfosForDocument (lines 148-160) calls listDocumentInfosForWorkOrder and passes DocumentId as @WorkOrderId, so it returns the wrong data. Delete (lines 300-318) runs on a connection with an open transaction without attaching that transaction, which ADO.NET rejects at run time.
**Confidence:** Low — Which records should 'work orders for a document' return? The current code calls the documents-for-work-order procedure with the DocumentId passed as WorkOrderId.

### RULE-136: Flight approval state is recorded with approver and timestamp
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/FlightDB.vb:250-255`
**Plain English:** A flight has an approval state: an approved flag, who approved it and the UTC approval time. The aircraft view lists only flights that are approved, active and not deleted.
**Specification:**
  Given Aircraft 7 has three flights: one approved and active, one not yet approved, and one approved but soft-deleted
  When  The aircraft record is opened
  Then  Only the approved, active, non-deleted flight appears in the aircraft's flight list
**Parameters:** IsApproved (bit), ApprovedBy (nvarchar 20), UTCDateApproved (datetime). AircraftDB.vb:39 calls FlightInfoDB.GetList with IsApprovedFilter=1, IsActiveFilter=1, IsDeletedFilter=0.
**Edge cases handled:** NULL approval columns load as not approved (FlightDB.vb:607-615); The data layer does not enforce who may approve or require ApprovedBy when IsApproved is true
**Confidence:** Medium — Should flights that are not yet approved really be hidden from the aircraft detail view? And which role may set IsApproved, and can approval be reversed?

### RULE-137: Work order header fields and status are recorded as supplied; no transition rules in the data layer
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:182-214`
**Plain English:** A work order carries a program, aircraft, location, type, status, engineer, engineering action, mechanic, request/fault/due/finish dates and times, three meter readings, aircraft disposition, FIS complaint and squawk numbers, and two alert flags; the data layer stores whatever status is provided without checking allowed transitions.
**Specification:**
  Given Work order #1001 in status 'Open' (WorkOrderStatusId 1)
  When  The user saves it with WorkOrderStatusId 3 and a FinishDate
  Then  The new status and finish date are written as-is; any rule about which statuses may follow which is enforced elsewhere (UI/business layer or stored procedure), not here
**Parameters:** Status field: WorkOrderStatusId (status name read back as WorkorderStatus). Alert flags: AircraftIssueAlert, MaintenanceIssueAlert. Soft-delete flag IsDeleted is sent on update but not on insert (new orders start not-deleted). Meters FaultOccurredMeter, MeterStartWork, MeterEndWork sent as decimals.
**Edge cases handled:** Dates and times are carried as strings (RequestDate, DueDate, DueTime, FinishDate, FinishTime) and passed to the database unconverted; Field name 'AircraftDispostion' is misspelled consistently in code and database
**Confidence:** Medium — What are the valid work order statuses and allowed transitions (e.g., Open -> In Work -> Closed), and is a finish date/end meter required before closing? None of this is checked in the data access layer.

### RULE-138: Soft delete with audit stamp for work orders, their lines and master data
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:358-380`
**Plain English:** Deleting a work order (or a work-order line, program, route or weight definition) records who deleted it, and these records carry an IsDeleted flag so they are marked deleted rather than removed; region, time zone, weight type and generic lookup deletes carry no user stamp.
**Specification:**
  Given Work order #1001 deleted by user 'jsmith'
  When  deleteWorkOrder runs
  Then  The record is flagged deleted (IsDeleted=1) with StampUserName 'jsmith' and later appears only in lists that include deleted records
**Parameters:** Delete with StampUserName: WorkOrder, WorkOrderPart (WorkOrderPartDB.vb:361-377), WO comments/reasons/instructions/performed work, Program (ProgramDB.vb:224-246), Route (RouteDB.vb:197-219), WeightDef (WeightDefDB.vb:197-219). Delete without user: Region (RegionDB.vb:186-207), UTCTimeZone (UTCTimeZoneDB.vb:214-235), WeightDefType, lookup tables (fltLookupBaseDb.vb:187-208).
**Edge cases handled:** Whether delete is soft or hard is decided by the stored procedure; inferred from IsDeleted columns and IsDeletedFilter parameters; Every create/update also records StampUserName and database-generated UTC created/modified dates
**Confidence:** Medium — Do deleteWorkOrder and the other delete procedures set IsDeleted (soft delete) or physically remove rows, and does deleting a work order cascade to its lines and parts?

### RULE-139: Child record insert-vs-update decided by presence of a version stamp; deletes only for saved rows
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:428-454`
**Plain English:** A work-order child line with no version stamp (empty or "0") is treated as new and inserted; one with a stamp is updated; lines in the delete list are removed only if they already have a database id greater than zero.
**Specification:**
  Given A work order with reason line A (ConcurrencyId empty), reason line B (ConcurrencyId "7209"), and a delete list holding reason C (WOReasonId 0) and reason D (WOReasonId 55)
  When  The work order is saved
  Then  A is inserted, B is updated, C is ignored (never saved so nothing to delete), and D is deleted stamped with the work order's user
**Parameters:** New-row markers: ConcurrencyId = Nothing or "0". Delete threshold: id > 0. Same pattern for instructions (456-482), performed work (484-510), parts (512-538), engineer comments (540-566), mechanic comments (568-594).
**Edge cases handled:** The "0" comparison is duplicated in each condition (harmless redundancy); Upserts run before deletes, so a line both edited and deleted is first updated and then deleted
**Confidence:** High

### RULE-140: Linking documents to a work order without duplicates
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:596-618`
**Plain English:** When a work order is saved, each attached document's details are updated and a link to the work order is created only if one does not already exist; removing a document from a work order deletes only the link, not the document.
**Specification:**
  Given Document 88 already linked to work order #1001 and new document 90 attached
  When  The work order is saved
  Then  Both documents' info is updated, no second link for 88 is created, a new link 90-1001 is inserted; if document 88 is in the remove list its link is deleted but the document remains
**Parameters:** DocumentWorkOrderXrefDB.Exists / Insert / Delete stamped with the work order's StampUserName
**Edge cases handled:** Document unlinking is processed only on update, not on insert
**Confidence:** High

### RULE-141: Three-step export workflow: create, list, fetch
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTExportClient/FltExportClient.vb:19-99`
**Plain English:** Getting flight-log data out of the system takes three separate steps the user triggers in turn: ask the server to generate an export file, refresh the list of available export files, then download one of them.
**Specification:**
  Given No export file has been generated yet
  When  The user clicks Create File, then Get File List, then Fetch File on the new entry
  Then  The server generates the file, the file appears in the list with its size and UTC creation time, and the chosen file is saved locally. Each step appends a timestamped line to the activity log ('<now> // <Operation> // <result>').
**Parameters:** Endpoints: autoCreateFile.aspx, autoGetFileList.aspx, autoFetchFile.aspx (app.config:23-25)
**Edge cases handled:** The client does not enforce the order: Fetch only needs a list, and Create does not refresh the list automatically; Whether file creation runs synchronously or in the background on the server cannot be seen from this client
**Confidence:** Medium — Does the server build the export file synchronously during the CreateFile call, or in the background? If in the background, how should a user know when the new file is ready to appear in the list?

### RULE-142: Downloaded export is saved to My Documents only when content is non-empty
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTExportClient/FltExportClient.vb:82-91`
**Plain English:** A fetched export file is written to the user's My Documents folder under the server-supplied file name, but only if the server returned some content. An existing file with the same name is overwritten.
**Specification:**
  Given The user fetched flt_20261015.xml and the server returned 20,480 characters
  When  The fetch completes
  Then  The content is written to <MyDocuments>\flt_20261015.xml, replacing any existing file, and the log shows 'file written to <path>'. If the content is empty, nothing is written.
**Parameters:** Destination = Environment.SpecialFolder.MyDocuments; StreamWriter default encoding (UTF-8); overwrites existing files
**Edge cases handled:** A non-200 HTTP status gives an empty body, so nothing is written; If the server returns an <error> XML body with HTTP 200, the fetch response is not checked, so the error text is saved as the export file; The file name comes from the server list and is not sanitized, so a name containing ..\ could write outside My Documents; The write happens outside the try block, so an IO failure is not caught by the form's handler
**Suspected defect:** FetchFile never checks the response for an <error> element, unlike GetFileList. The server-supplied file name is used in the local path without sanitizing, which allows path traversal.
**Confidence:** High

### RULE-143: Export run lifecycle: Begin, Export, then End even on failure
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTExportConsoleApp/FLTExportConsoleApp/Program.vb:10-35`
**Plain English:** Every run logs 'Begin', tries one export, logs any error, and always logs 'End'. A failed run looks like a normal finish to whatever scheduled it.
**Specification:**
  Given the export app is started by a scheduler
  When  any step fails (missing config, missing credential, failed login, not authorized, file write error)
  Then  the error message goes to the console and the log (FLTExport.log), 'End FLT Export Console App' is still logged, and the process exits normally with code 0
**Parameters:** The log is written to a text file only (ContosoLoggerIsWriteTextFile=true; EventLog and DB logging are false; App.config:9-14). Log app name = 'FLTExport'.
**Edge cases handled:** A successful run and a failed run both end with the same 'End' banner and exit code; There are no retries. Each scheduled run makes exactly one attempt
**Suspected defect:** Failures are swallowed and the process returns exit code 0, so the scheduler or monitoring cannot see a failed export.
**Confidence:** High

### RULE-144: Logout ends the session completely
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/Logout.aspx.vb:8-17`
**Plain English:** Logging out records the logout, replaces the identity with an anonymous one, clears and abandons the session, expires the session cookie, and returns the user to Login.
**Specification:**
  Given Logged-in user 'jdoe'
  When  They choose 'Log Out' (/logout.aspx)
  Then  A logout is logged for 'jdoe', the session is cleared and abandoned, the ASP.NET_SessionId cookie is blanked and its expiry set 20 months in the past, and the user is redirected to ~/Login.aspx.
**Parameters:** Session identity states: Anonymous (created in Session_Start, Global.asax.vb:23-26) -> Authenticated (Login success, Login.aspx.vb:26) -> Anonymous/abandoned (Logout). Cookie expiry offset = -20 months.
**Edge cases handled:** If the session already expired, FltIdentityManager.LogOut gets a new anonymous identity and logs a blank user name
**Confidence:** High

### RULE-145: New program can be cloned from an active, non-deleted program
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/appConfiguration/programs.aspx.vb:95-110`
**Plain English:** When a new program is added, the user can pick an existing active, non-deleted program as a template. The new program is then created together with copies of that program's setup, such as roles, permissions, user role assignments and regions. If no template is picked, the program is saved on its own.
**Specification:**
  Given Active, non-deleted program 'FY26 Ops' (id 4)
  When  The user adds program 'FY27 Ops' and picks 'FY26 Ops' in the clone list
  Then  ProgramManager.Clone(4, newProgram) inserts the new program and copies roles, role module permissions, user-in-role memberships and regions from program 4. Choosing '< Do Not Clone >' (value 0) calls ProgramManager.Save instead.
**Parameters:** Clone source list: ProgramManager.GetList(isActive = 1, isDeleted = 0) (lines 198-205). Sentinel 0 = do not clone. The clone row is visible only in Add mode (line 82); in Edit mode it is hidden (line 47) and the selection is reset to 0 (line 195).
**Edge cases handled:** When editing an existing program the clone selector is hidden and stays 0, so Save is always used.; The clone copies only active, non-deleted roles (BL GetList(SourceProgId, 1, 0)). The full copy list continues in ProgramManager.vb:100+.
**Confidence:** High

### RULE-146: Document upload stores metadata first, then file content, under the user's current program
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/documents/DocumentAdd.aspx.vb:39-52`
**Plain English:** A new document is recorded against the user's current program with its name, extension, type, byte size and description. Its binary content is then stored under the new document id, and the user returns to the document list.
**Specification:**
  Given A logged-in user whose CurrentProgId is 7 uploads 'Manual.pdf' (2,048,000 bytes) with the description 'Ops manual'
  When  Upload succeeds
  Then  A DocumentInfo row is inserted with ProgId 7, DocumentName 'Manual.pdf', FileExtension '.pdf', the matching DocumentTypeId, DocumentSize 2048000 and DocumentDescription 'Ops manual'. The stream is saved with DocumentManager.PutStream(newId) and the user is redirected to documentsList.aspx.
**Parameters:** ProgId comes from _fltIdentity.CurrentProgId through a hidden field (line 20). DocumentSize is the uploaded byte count.
**Edge cases handled:** The two steps do not run in one transaction. If PutStream fails after Insert succeeds, a metadata row with no content is left behind.; ProgId travels in a client-side hidden field but is reset from the session on every Page_Load, so it cannot effectively be tampered with.
**Suspected defect:** Metadata insert and content store are not atomic, so a failure partway through can leave orphan document records.
**Confidence:** High

### RULE-147: Document metadata edit, soft-delete flag and delete action
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/documents/documentsList.aspx.vb:108-138`
**Plain English:** A document's name and description can be edited, and the document can be marked or unmarked as deleted through an Is Deleted flag. A separate Delete action, which asks for confirmation, calls the delete routine.
**Specification:**
  Given A non-deleted document with id 42
  When  The user edits it and ticks Is Deleted, or clicks Delete and confirms
  Then  Editing saves DocumentName, DocumentDescription and IsDeleted = True, and the document drops out of the default 'No' filter. Delete calls DocumentInfoManager.Delete, which runs the stored procedure deleteDocumentInfo with the user name as the audit stamp.
**Parameters:** States: IsDeleted False (active) and IsDeleted True (soft-deleted, can be restored by unticking). The Delete button asks 'Are you certain that you want to delete this entry?' (documentsList.aspx:125).
**Edge cases handled:** The file content, extension and type cannot be changed after upload.; The Delete button's tooltip says 'Delete Aircraft', which is a copy-paste leftover.
**Confidence:** Medium — Does the stored procedure deleteDocumentInfo physically remove the document and its content, or only set IsDeleted? Which of the two paths is the intended way to retire a document?

### RULE-148: Export files are kept for 24 hours, purged when the file list is viewed
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/export/autoGetFileList.aspx.vb:87-96`
**Plain English:** Generated export files are deleted from the download folder once they are more than 24 hours old. The purge runs only when someone lists the available files.
**Specification:**
  Given The download folder has Download_X_20261014T080000.xml created 2026-10-14 08:00 UTC and another file created 2026-10-15 07:00 UTC
  When  At 2026-10-15 09:00 UTC a batch client calls autoGetFileList or a user opens or refreshes the Export page
  Then  The first file (created + 24h = 10-15 08:00, earlier than now) is deleted. The second is kept and listed with its name, size in bytes and UTC creation time.
**Parameters:** Retention ageInHours = 24 (hardcoded twice: autoGetFileList.aspx.vb:88 and export.aspx.vb:90); based on file CreationTimeUtc; top-level folder ~/download only
**Edge cases handled:** The same logic is duplicated in export.aspx.vb:89-98 (ShowXmlFiles); Creating a file (autoCreateFile) or fetching one (autoFetchFile) does not purge, so an expired file can still be downloaded until someone lists the folder; The list includes every file in the folder, including in-progress 'Temp_Download_*' files and non-export files; On the Export page an empty folder shows 'There are currently no XML Export files available for download.'
**Suspected defect:** Retention is enforced only as a side effect of listing, so files can stay past 24 hours and still be fetched by name.
**Confidence:** High

### RULE-149: Test assignment moves a test between assigned and unassigned lists
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/fleet/AircraftModify.aspx.vb:375-436`
**Plain English:** Each program test is either assigned to the aircraft or available to assign; assigning moves it to the aircraft's test list and removing returns it to the available list.
**Specification:**
  Given Test 'Hot weather' is in the not-assigned list for aircraft MSN 001
  When  The user clicks Assign
  Then  The test is added to the aircraft's test list and removed from the not-assigned list
  And   Removing it reverses the move
**Parameters:** Available list from AircraftTestXrefManager.GetTestListNotForAircraft(aircraftId, progId)
**Edge cases handled:** Changes are held on the aircraft object and persisted when the aircraft is saved
**Confidence:** High

### RULE-150: Aircraft configuration versioning and meter-start rules
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/fleet/AircraftModify.aspx.vb:484-610`
**Plain English:** A new aircraft configuration is created as a copy of the latest configuration, starting today; for an existing aircraft its meter start is fixed at the aircraft's current airframe hours, and once a configuration is saved its start date, meter start and meter offset can no longer be changed.
**Specification:**
  Given An existing aircraft with current airframe hours 1,736.0 and a latest configuration
  When  The user clicks Add Configuration
  Then  The form is prefilled from a clone of the latest configuration, start date = today (MM/dd/yyyy), meter start = 1,736.0 (locked), meter offset editable, meter end read-only
  And   After saving, the aircraft's displayed meter offset is refreshed from the aircraft (line 514); configurations with ID > 0 have start date, meter start and offset disabled
**Parameters:** Insert when AircraftConfigurationId = 0 else update (lines 506-510); clone via AircraftManager.CloneAircraftConfiguration(latest, True)
**Edge cases handled:** For a brand-new aircraft (add mode) meter start is editable; Meter end is always computed elsewhere and never editable; Main Save disabled while the configuration editor is open
**Confidence:** Medium — Does saving a new configuration end-date the previous configuration and recompute the aircraft's meter offset (business layer), and should configuration start dates be allowed in the past?

### RULE-151: Deleting aircraft, flights and work orders
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/fleet/FleetList.aspx.vb:107-118`
**Plain English:** After confirming 'Are you certain that you want to delete this entry?', the selected aircraft, flight or work order is deleted through its business manager, and deleted records remain viewable via the 'Deleted' filter.
**Specification:**
  Given Aircraft MSN 001 in the fleet list
  When  The user confirms delete
  Then  AircraftManager.Delete is called and the list is refreshed; business-rule errors/warnings are shown if refused
**Parameters:** Flights: FlightsList.aspx.vb:100-111; Work orders: WorkOrdersList.aspx.vb:73-83
**Edge cases handled:** Existence of IsDeleted filter implies soft delete; If GetItem fails, aircraft/flight is Nothing and the error handler throws a null reference
**Confidence:** Medium — Is delete a soft delete (IsDeleted flag) and what conditions (e.g., approved flights, aircraft with flights) block deletion?

### RULE-152: Pending child-row entries are saved before the parent record; failure aborts the save
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/fleet/WorkOrderModify.aspx.vb:1014-1061`
**Plain English:** When the user clicks Save on a work order, flight or aircraft, any partially-entered new rows in the child grids are added first, and if any of those adds fail the parent is not saved.
**Specification:**
  Given A work order with a new reason line typed into the footer row but not added
  When  The user clicks Save
  Then  The reason line is inserted, then the work order is saved and the user is returned to the previous page
  And   If a child add throws, the parent save is skipped and the error is shown
**Parameters:** Children: work order reasons, instructions, performed work, engineer comments, mechanic comments, parts (WorkOrderModify); liquid fills, comments, engine runs, region times (FlightModify.aspx.vb:1092-1128); locations, comments (AircraftModify.aspx.vb:839-865)
**Edge cases handled:** Abort works only because child handlers rethrow when CommandArgument = 'OnSave'
**Suspected defect:** WOPerformedWorkDG_ItemCommand (WorkOrderModify.aspx.vb:498-500) does not rethrow on 'OnSave', so a failed performed-work add does not stop the work order save.
**Confidence:** High

### RULE-153: Work order aircraft and location fixed after creation
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/fleet/WorkOrderModify.aspx.vb:43-55`
**Plain English:** A work order's aircraft and location can be chosen only when the work order is created; when editing an existing work order they cannot be changed.
**Specification:**
  Given An existing work order for aircraft MSN 001 at 'Site A'
  When  It is opened in edit mode
  Then  Aircraft and location dropdowns are disabled
  And   In add mode both are enabled with '< Select >' preselected
**Parameters:** Status, type, engineer, mechanic, engineering action from active lookup lists (WorkOrderStatus, WorkOrderType, EngineeringAction, Engineer, Mechanic) at lines 139-143
**Edge cases handled:** Status transitions are a free choice from the WorkOrderStatus lookup; no transition rules are enforced in this page
**Confidence:** High

### RULE-154: Program status cannot be changed from the Program Profile screen
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/program/ProgramProfile.aspx.vb:31`
**Plain English:** The Program Profile shows a Program Status field, but it has no choices and the value is never saved, so a program's status cannot be changed here.
**Specification:**
  Given A program with ProgStatus 'Open'
  When  the user opens Program Profile and clicks Save
  Then  the status drop-down is empty and ProgStatus is not written back, so the stored status stays 'Open'
**Parameters:** ProgStatusDropDownList (ProgramProfile.aspx:36) has no ListItems and is never populated. SaveButton_Click (lines 69-84) does not assign ProgStatus.
**Edge cases handled:** Setting SelectedValue on an empty drop-down is deferred and may cause an error at render or postback
**Suspected defect:** The Program Status selector has no options and is not saved, so program status changes are impossible here or were lost.
**Confidence:** Low — What are the valid program statuses (for example Open or Closed) and their transitions, and where is program status meant to be changed? Should closing a program require DateClosed?

### RULE-155: Active and deleted status of reference records, and the default list filters
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/program/WeightDefs.aspx.vb:72-92`
**Plain English:** Each reference record has an Active flag that users can switch on or off, and a separate Deleted flag. By default, lists show only active records that are not deleted.
**Specification:**
  Given A weight definition 'Max Takeoff' that is active and not deleted
  When  a user edits the row inline, clears Is Active and saves
  Then  the record becomes inactive and disappears from the default 'Active Only' list, but still appears under 'Inactive Only' or 'All'
**Parameters:** IsActive filter: 1 = Active Only (default), 0 = Inactive Only, -1 = All. IsDeleted filter: 0 = Not Deleted (default), 1 = Only Deleted, -1 = All.
**Edge cases handled:** On WeightDefs the inline edit also sets IsDeleted from an enabled checkbox (WeightDefs.aspx.vb:83), so a deleted weight definition can be restored or deleted by editing; On Locations and Routes IsDeleted is shown but read-only; Lookup lists used for drop-downs (for example WeightUnit) fetch only active entries (IsActiveFilter 1), so a deactivated unit cannot be chosen for new weight definitions
**Confidence:** High

### RULE-156: Delete marks reference records as deleted after the user confirms
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/program/locations.aspx.vb:83-96`
**Plain English:** Deleting a location, route or weight definition asks the user to confirm. The record is then flagged as deleted and kept in the database, not physically removed.
**Specification:**
  Given An active location 'Hangar 3' (LocactionId 12)
  When  the user clicks the red X and confirms 'Are you certain that you want to delete this entry?'
  Then  the location gets IsDeleted = 1, the modified date and the user's name are stamped, and it drops out of the default 'Not Deleted' list
**Parameters:** Confirmation text in the .aspx DeleteButton OnClientClick; stored procedure deleteLocation sets IsDeleted=1, UTCDateModified=GetUTCDate(), StampUserName
**Edge cases handled:** Routes (Routes.aspx.vb:90-103) and WeightDefs (WeightDefs.aspx.vb:94-107) follow the same pattern; Regions (Regions.aspx.vb:85-97) and Configuration Values (ConfigValues.aspx.vb:75-85) have no Is Deleted filter, so whether their delete is soft or hard is not visible here; The deleted flag cannot be reset from the Locations or Routes grids (the IsDeletedCB checkbox is disabled), but it can on WeightDefs
**Confidence:** Medium — Are Region and Configuration value deletes soft deletes like Location's, and is there any approved way to restore a deleted Location or Route?

### RULE-157: Roles are scoped to a program and carry a program-manager flag; soft delete and restore
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/security/roles.aspx.vb:77-110`
**Plain English:** Each role belongs to one program and may be flagged as a Program Manager role. In the grid, admins can rename a role, toggle Active and Deleted (including restoring a deleted role), or delete it.
**Specification:**
  Given Program 'Fleet A' selected in the filter
  When  The admin adds a role, or edits a role inline
  Then  A new role takes ProgId from the selected program filter (lines 225-229) and is saved. An inline edit updates RoleName, RoleDescription, IsProgramManager, IsActive and IsDeleted. The Delete button calls FltRoleManager.Delete after a browser confirmation.
**Parameters:** Filters: IsActive default 1 (Active Only), IsDeleted default 0 (No Deleted) (roles.aspx:32-41)
**Edge cases handled:** IsDeleted is editable inline for roles (roles.aspx:113) but read-only for modules, so a deleted role can be restored by unchecking it; A new role cannot be created for a program other than the one in the filter
**Confidence:** Medium — What extra rights does the IsProgramManager flag grant, and is Delete a soft delete (IsDeleted=1) or a physical delete?

### RULE-158: Create or edit a user account; new users get a generated password by email
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/security/users.aspx.vb:107-135`
**Plain English:** An administrator creates or edits a user. A user with no concurrency id (empty or '0') is inserted and receives a system-generated password by email. An existing user is updated in place, and the username cannot be changed.
**Specification:**
  Given An admin on the users page who clicks Add (UserNameTextBox shown, ChangePassword button disabled) or Edit (username shown as a read-only label)
  When  The admin clicks Save
  Then  FltUserManager.Save inserts the user when ConcurrencyId is Nothing, empty or '0': it generates a password, stores a new salt and hash, validates, stamps the creator, and emails the credentials. Otherwise it validates and updates the user. On success the page returns to the list; on failure the broken-rule messages are shown.
**Parameters:** New-record marker: ConcurrencyId in {Nothing, '', '0'} (FLTBizObjects/BusinessLogic/FltUserManager.vb:39-45). Editable admin fields: DisplayName, Email, Location, CountryCode, PhoneNumber, Department, Title, Company, DefaultProgId (placeholder value '0'), IsSuperUser, IsActive, IsLockedOut (users.aspx.vb:232-250). Delete stamps the acting admin (users.aspx.vb:67-78).
**Edge cases handled:** An admin can grant or revoke IsSuperUser and IsActive directly from this form; IsLockedOut is copied from the checkbox on save, so an admin can lock or unlock here, not only with the Unlock button; The DefaultProgId placeholder '0' ('<Select a Program>') can be saved unless BL validation rejects it; The list defaults to Active Only and No Deleted (users.aspx:23-32)
**Confidence:** Medium — Should only super users be able to set IsSuperUser and IsLockedOut, and is DefaultProgId = 0 (no program) a valid value for a user?

### RULE-159: Admin password reset generates and emails a new password
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/security/users.aspx.vb:144-157`
**Plain English:** An administrator can reset an existing user's password. The system creates a random password, stores it as a salted hash, and emails it to the user's address on file.
**Specification:**
  Given An admin editing existing user 'jdoe' (ConcurrencyId not '0')
  When  The admin clicks Change Password
  Then  FltUserManager.GenerateNewPassword creates a password, generates a new salt and hash, updates the user, and emails the plain password to jdoe's Email. The page shows 'Password has been changed, Email has been sent.' and reloads the user.
**Parameters:** Guard: ConcurrencyId <> '0'. The button is disabled for new users (users.aspx.vb:115). Email body built in FLTBizObjects/BusinessLogic/FltUserManager.vb:129-168.
**Edge cases handled:** New, unsaved user: nothing happens; SMTP failure is logged and swallowed in SendPasswordEmail, so the success message appears even when no email was sent and the old password no longer works
**Suspected defect:** The success message is unconditional even when the email fails to send, which can leave the user locked out with an unknown password. The plain-text password is sent by email.
**Confidence:** High

### RULE-160: Unlock a locked-out user account
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/security/users.aspx.vb:159-172`
**Plain English:** An administrator can unlock a locked-out user, which also resets the failed login attempt counter to zero.
**Specification:**
  Given A user with IsLockedOut = True and FailedPasswordAttemptCount = 5
  When  The admin clicks Unlock User Account
  Then  IsLockedOut is set to False, FailedPasswordAttemptCount is set to 0, the user is validated and updated, and the form reloads
**Parameters:** Reset value: FailedPasswordAttemptCount = 0
**Edge cases handled:** The user is not locked: nothing happens; Validation failure shows the exception message only
**Confidence:** High

### RULE-161: Assign or remove users and roles
**Category:** Lifecycle
**Priority:** P1
**Source:** `FLTWebApp/security/users.aspx.vb:193-219`
**Plain English:** An administrator grants a role to a user by picking it from the 'roles not assigned' list, and revokes it by picking it from the 'roles assigned' list. The same assignment can be made from the role side.
**Specification:**
  Given User 'jdoe' with roles {Pilot}, and Program Manager available
  When  The admin selects Program Manager in RolesNotForUserGridView
  Then  FltUserInRoleManager.Insert('jdoe', roleId) runs and both lists refresh. Selecting a role in RolesForUserGridView calls FltUserInRoleManager.Delete to revoke it.
**Parameters:** The mirror flow from the role side is roles.aspx.vb:186-213 (UsersNotInRoleGridView inserts, UsersInRoleGridView deletes)
**Edge cases handled:** Assignment takes effect on a single click, with no confirmation; A user can hold roles across several programs
**Confidence:** High

### RULE-162: Aircraft status update and its comments
**Category:** Lifecycle
**Priority:** P1
**Source:** `FltFleet/EditAircraftStatus.aspx.vb:11-49`
**Plain English:** An authorized user changes an aircraft's status and its two free-text comments (hangar/engineer and Contoso) in one save, and the record's modified time is updated.
**Specification:**
  Given Aircraft 42 is DOWN with Hangar comment "Hydraulic leak"
  When  An authorized user selects UP, enters a comment and clicks Save
  Then  updateAircraftStatus is called with AircraftId=42, Status=1 and both comments (HTML-decoded), and the user returns to the fleet board. Cancel returns without saving.
**Parameters:** Comment max length is 100 characters, set only by the textbox MaxLength (EditAircraftStatus.aspx:27,31). The stored procedure updateAircraftStatus is expected to set UTCDateModified (not visible in this module).
**Edge cases handled:** UI labels are swapped compared with field names: EngineerComment is labelled "Hangar Comment(s)" and HangarComment is labelled "Contoso Comment(s)"; The 100-character limit is enforced only in the browser; There is no audit of who made the change at this layer
**Confidence:** Medium — Does updateAircraftStatus record who made the change and set UTCDateModified, or keep a status history? Should comments be limited to 100 characters on the server as well?

### RULE-163: Aircraft status record is created on first update and overwritten afterwards
**Category:** Lifecycle
**Priority:** P1
**Source:** `FltFleet/sql_changes_for_aircraft_status.sql:116-140`
**Plain English:** Each aircraft (looked up by MSN) has one current status record with engineer and hangar comments. The first update creates it, starting at status 0, and each later update overwrites the status, the comments and the modified time. No history is kept.
**Specification:**
  Given Aircraft MSN '0042' has no AircraftStatus row
  When  updateAircraftStatus('0042', 3, 'Gear inspection', 'Bay 2') is called
  Then  A row is created with Status 0 and empty comments, then immediately updated to Status 3 with the given comments and UTCDateModified = now
**Parameters:** Initial status 0; the comment parameters are varchar(128) even though the columns are nvarchar(2048)
**Edge cases handled:** Any integer status is accepted, and no allowed transitions are enforced; The status values are not defined in this file; An unknown MSN gives AircraftID NULL, so the insert fails on the NOT NULL column; Comments longer than 128 characters are silently cut off; Deleted aircraft can still be updated; The table has no unique constraint on AircraftId
**Suspected defect:** The comment parameters are varchar(128), but the columns hold 2048 characters. Longer text and non-Latin characters are lost. Nothing guards against an unknown MSN.
**Confidence:** Medium — What do the Status codes mean (0 = ?), and are there allowed transitions between them? Is a status history needed?

### RULE-164: Aircraft test-program record (status, hours, required usage, end of testing)
**Category:** Lifecycle
**Priority:** P1
**Source:** `database/FLT_Schema.sql:17627-17650`
**Plain English:** An aircraft record holds its program, current location, status, airframe hours (start, current, offset), engine hours, total required test usage and estimated and actual end-of-testing dates. All of these can be overwritten in one edit without transition or consistency checks.
**Specification:**
  Given Aircraft 10 has status 'In Test', TotalRequiredUsage 150.0, EstEndOfTesting 2026-12-01
  When  An editor sets AircraftStatusId to 'Complete' and ActEndOfTesting 2026-11-20
  Then  The values are saved as given. No check confirms that accumulated usage reached 150.0 or that the status change is allowed.
**Parameters:** Original source database/FLT_Schema.sql:17627-17651. Field sizes: AirframeHours* DECIMAL(9,1), TotalRequiredUsage DECIMAL(7,1) (maximum 999,999.9), AircraftEngineHoursCurrent DECIMAL(11,1) (default 0), SerialNbr varchar(6), RegistrationNbr varchar(10), MSN varchar(20).
**Edge cases handled:** The procedure does not check AirframeHoursCurrent >= AirframeHoursStart; ActEndOfTesting can be earlier than EstEndOfTesting or empty; IsDeleted cannot be changed through this procedure, only IsActive
**Confidence:** Medium — What are the allowed aircraft status values and transitions? Must an aircraft reach TotalRequiredUsage before it can be marked as having finished testing? How is AirframeHoursOffset meant to combine with start and current hours?

### RULE-165: Aircraft current location follows latest 'last location' stay
**Category:** Lifecycle
**Priority:** P1
**Source:** `database/FLT_Schema.sql:17878-17924`
**Plain English:** After an aircraft location record is edited, the aircraft's current location is reset to the location of its most recently created stay that is flagged as 'last location' and is active and not deleted.
**Specification:**
  Given Aircraft 10 has AircraftLocation rows id 40 (location 3, LastLocation=1) and id 55 (location 7, LastLocation=1), both active
  When  Any AircraftLocation row for Aircraft 10 is updated
  Then  Aircraft.CurrentLocationId becomes 7 (from the highest AircraftLocationId, 55), and the aircraft's UTCDateModified and StampUserName are stamped
**Parameters:** Original source database/FLT_Schema.sql:17878-17924. Selection: MAX(AircraftLocationId) WHERE LastLocation=1 AND IsActive=1 AND IsDeleted=0. RequiredUsage and AccumUsage are DECIMAL(12,1) and are supplied by the caller.
**Edge cases handled:** The choice uses the highest record id, not the latest ArrivalDate; Setting LastLocation=1 on one stay does not clear the flag on earlier stays; If the concurrency check fails, the procedure returns before the aircraft is updated; updateAircraft can also set CurrentLocationId directly, so the two can disagree
**Suspected defect:** When no stay qualifies, the SELECT returns no row, so @CurrentLocationId stays NULL (the ISNULL(...,0) never runs). The aircraft's current location is then set to NULL rather than 0. Also, the stored AccumUsage comes from the caller, while listAircraftLocations recalculates it from flights, so there are two sources for usage.
**Confidence:** High

### RULE-166: Work order status and completion data
**Category:** Lifecycle
**Priority:** P1
**Source:** `database/FLT_Schema.sql:18338-18373`
**Plain English:** A work order's status, assigned engineer and mechanic, due and finish dates, meter readings at start and end of work, disposition and alert flags are all updated together. Any status may be set, with no transition rules.
**Specification:**
  Given Work order 77 has WorkOrderStatusId 'Open' and MeterStartWork 120.5
  When  A mechanic saves it with WorkOrderStatusId 'Closed', FinishDate '10/15/2026', MeterEndWork omitted
  Then  The status becomes Closed, FinishDate is stored as the text '10/15/2026', and MeterEndWork is stored as 0
**Parameters:** Original source database/FLT_Schema.sql:18338-18367. Dates are varchar(10) and times varchar(8), stored as text. Meter readings are DECIMAL(8,1). MeterEndWork defaults to 0. Alert flags: AircraftIssueAlert, MaintenanceIssueAlert. Soft delete uses IsDeleted (there is no IsActive flag here).
**Edge cases handled:** The procedure does not check MeterEndWork >= MeterStartWork, or that the finish date is on or after the request date; Dates stored as text can hold invalid or differently formatted values; A work order can be moved to another program, aircraft or location
**Suspected defect:** If MeterEndWork is omitted it defaults to 0, so saving an open work order can overwrite a previously recorded end-meter value with 0.
**Confidence:** Medium — What are the work order statuses and allowed transitions (for example Open, In Work, Closed)? Should closing require a finish date, finish time and end meter reading? What happens when the alert flags are set?

### RULE-167: Flight record status flags and visibility
**Category:** Lifecycle
**Priority:** P1
**Source:** `database/FLT_Schema.sql:3944-3948`
**Plain English:** A new flight is created active, not deleted, with a new GUID and created/modified timestamps. Flights are soft-deleted, and only active, non-deleted flights count in reports and aircraft totals.
**Specification:**
  Given A user creates a flight
  When  addFlight inserts it
  Then  IsActive = 1, a new FlightGuid is assigned, UTCDateCreated = UTCDateModified = now (UTC), and StampUserName = the caller
**Parameters:** Flags: IsActive (1 = active), IsDeleted (soft delete; not set by addFlight, so presumably 0 by column default), IsApproved. Original location: database/FLT_Schema.sql:3944-3948.
**Edge cases handled:** updateFlight can set IsActive to 0 or 1, but none of these procedures sets IsDeleted (deletion is done elsewhere).; rptFlightOutliers does not filter on IsActive or IsDeleted (see the outlier rule).
**Confidence:** Medium — What is the business difference between an inactive flight (IsActive = 0) and a deleted flight (IsDeleted = 1), and which procedure sets IsDeleted?

### RULE-168: Successful login records last-login time
**Category:** Lifecycle
**Priority:** P1
**Source:** `database/FLT_Schema.sql:6753-6771`
**Plain English:** After a successful login, the system returns the user's display name, default program, previous last-login date and super-user flag, then stamps the current UTC time as the user's new last-login date.
**Specification:**
  Given User 'jsmith' passed the credential check, with utcLastLoginDate 2026-10-01 08:00 UTC and DefaultProgId 3 ('Program A')
  When  The login completes at 2026-10-15 14:00 UTC
  Then  The returned profile shows LastLoginDate 2026-10-01 08:00 (the previous value), DefaultProgName 'Program A', and utcLastLoginDate is updated to 2026-10-15 14:00
**Parameters:** Original source database/FLT_Schema.sql:6753-6771. The timestamp is GETUTCDATE().
**Edge cases handled:** A missing default program returns DefaultProgName '' (LEFT JOIN + ISNULL); A null last-login date returns '' through ISNULL, which SQL Server converts to 1900-01-01 for a datetime column; The profile is selected before the update, so the user sees the previous login time
**Confidence:** High

### RULE-169: New flight records start active, stamped and uniquely identified
**Category:** Lifecycle
**Priority:** P1
**Source:** `tsql/DuplicateFlightKeyModification.sql:157-178`
**Plain English:** Every new flight is created as active, with a new GUID and created/modified timestamps set to the current UTC time. Its approval state comes from the caller and defaults to not approved.
**Specification:**
  Given addFlight is called without IsApproved
  When  The flight is inserted
  Then  IsActive = 1, IsApproved = 0, ApprovedBy = '', FlightGuid = NEWID(), and UTCDateCreated = UTCDateModified = GETUTCDATE(). The new FlightId, ConcurrencyId and created date are returned.
**Parameters:** IsActive = 1; IsApproved default 0; ApprovedBy default ''; weights, offsets and check flags default 0
**Edge cases handled:** A flight can be inserted already approved (IsApproved = 1), with no check that ApprovedBy or UtcDateApproved is supplied; No check that HobbsEnd >= HobbsStart, AirframeHoursEnd >= AirframeHoursStart, or that the return time is after departure; FlightId is read with @@IDENTITY, which a trigger insert could change
**Confidence:** Medium — Can a flight really be created already approved without an approver and approval date? Are end-of-flight meter readings validated anywhere else (UI or business layer)?

### RULE-170: New versus existing record on save; pending child edits
**Category:** Lifecycle
**Priority:** P2
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:164-201`
**Plain English:** A record with no concurrency id (empty or '0') is inserted, otherwise updated; child items added in the editor get negative temporary ids, and removing a previously saved child (positive id) queues it for deletion while removing an unsaved one simply discards it; a failing child passes its broken rules up to the parent.
**Specification:**
  Given A flight with saved liquid fill Id 55 and unsaved liquid fill Id -1
  When  The user removes both
  Then  Fill 55 is added to LiquidFillDeleteList; fill -1 is dropped; the flight's Save (ConcurrencyId non-empty) performs an Update
**Parameters:** Same pattern for FlightComment, FlightEngineRun, FlightRegionTime, AircraftLocation, GenericComment and AircraftTest; Save routing at FlightManager.vb:37-43
**Edge cases handled:** Removing a test (AircraftManager.vb:374-388) always queues a delete regardless of id; Not-found removals raise 'record not found in collection'
**Confidence:** High

### RULE-171: Module registry maintenance (identity fixed, active/deleted lifecycle)
**Category:** Lifecycle
**Priority:** P2
**Source:** `FLTWebApp/security/modules.aspx.vb:63-94`
**Plain English:** Application modules are identified by a unique name that cannot be changed after creation. Only the description and Active flag can be edited. Deletion requires confirmation, and the deleted flag is read-only in the grid.
**Specification:**
  Given An existing module 'Export'
  When  The admin edits the row, or deletes it
  Then  An edit updates only ModuleDescription and IsActive. Delete calls FltModuleManager.Delete after a browser confirm. A new module (lines 107-117) saves ModuleName, ModuleDescription and IsActive.
**Parameters:** List filters default to Active Only (1) and No Deleted (0) (modules.aspx:28-37). DataKeyNames = ModuleName.
**Edge cases handled:** A deleted module cannot be restored from the UI because the IsDeleted checkbox is disabled; Module names must match the hard-coded names used in FLT.Master.vb, so a renamed or new module has no menu effect
**Confidence:** Medium — Is the module list meant to be fixed (matching hard-coded menu names), and should admins be able to add modules at all?

## Policy

### RULE-172: Overridable warnings must be acknowledged before save
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/BrokenRuleManager.vb:8-37`
**Plain English:** Each broken rule is either a hard error that always blocks saving, or an overridable warning that blocks the first save attempt and lets the record through only after the user overrides it on a later attempt.
**Specification:**
  Given A flight whose HobbsStart is 0, which raises overridable warning 02-00-011
  When  The user saves for the first time, then saves again after setting OverRideRule=True on that warning
  Then  The first save fails and the warning goes into WarningsList. On the second save the earlier warning with the same RuleIdentifier is marked overridden, so it does not add to the error count and the save passes. Hard errors (OverRideableRule=False) always add to the error count and go into ErrorsList.
**Parameters:** Decision logic in FLTBizObjects/BusinessLogic/BrokenRuleManager.vb:8-37 (ConsiderRules). Validate returns True only when the error count = 0. OverRideRule can be set only when OverRideableRule=True.
**Edge cases handled:** Matching uses RuleIdentifier alone, so warnings that share an ID (02-00-01B, and 02-00-20/21/22 across fluids) are overridden together; Rules built with the 2-argument constructor have an empty RuleIdentifier and are never overridable; If several earlier warnings share an ID, the same warning is added to WarningsList once per match, so it is duplicated
**Confidence:** Medium — Citation was corrected by referee (The cited lines, FLTBizObjects/BusinessObject/BrokenRule.vb:34-65, hold only the data carrier. They define the read-only OverRideableRule property (34-38), the OverRideRule setter that only takes a value when _overRideableRule is True (40-49), and two constructors (51-65). None of these lines count errors, block a save, or check earlier warnings. The behavior th…

### RULE-173: Module-based authorization for every business operation
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/FlightManager.vb:423-439`
**Plain English:** Each operation checks the user's view or edit permission on a named module; super-users can do everything, the current program manager can do everything except Security and AppConfig, and other users need an explicit role-module permission.
**Specification:**
  Given User 'pilot1' whose role grants Fleet CanView but not CanEdit
  When  The user opens a flight and then tries to save it
  Then  GetItem succeeds; Save throws 'Can't update - user is not authorized'
**Parameters:** Module mapping: Fleet (Aircraft, AircraftInfo, Flight, FlightInfo, FlightKeyInfo, Location, Region, Route); Documents (DocumentInfo, DocumentManager, DocumentType view); System (DocumentType edit); Security (FltModule, FltRole, FltRoleModulePermissions, FltUserInRole); Program (Program get/edit/clone); Export (FltExportManager). Rule engine resolved in fltIdentityManager.vb:97-123
**Edge cases handled:** Edit permission does not imply view permission in the permission check; DocumentTypeManager edits require the 'System' module (DocumentType.vb:106-108) while viewing requires 'Documents'; Program managers cannot manage Security even within their own program; Null identity throws
**Confidence:** High

### RULE-174: Editing program reference data needs the matching module permission
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/LocationManager.vb:45-110`
**Plain English:** Adding, changing or deleting reference data is allowed only if the user's role grants edit rights on the module that owns that data.
**Specification:**
  Given A logged-in user whose role has CanView but not CanEdit on module 'Fleet'
  When  they save a new Location (or edit or delete a Location, Route, Region or Weight definition)
  Then  the save is refused with 'Can't insert - user is not authorized' (or the matching update or delete message), the message is shown in red, and nothing is stored
**Parameters:** Module permissions (in the FLTBizObjects managers): Locations, Routes, Regions and WeightDefs use 'Fleet' CanEdit; Configuration Values uses 'ConfigTables' CanEdit; Program Profile uses 'Program' CanEdit
**Edge cases handled:** Configuration value lists (fltLookupBaseManager.GetList) do not check CanView, so any logged-in user can read every lookup table; The page itself does not hide the Add, Edit or Delete buttons from users who cannot edit. The refusal only happens when they save.
**Confidence:** Medium — Should Locations, Routes, Regions and Weight definitions really all be governed by the 'Fleet' permission, and should read access to configuration lookups be unrestricted?

### RULE-175: Account lockout after repeated failed logins
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:37-62`
**Also cited:** (parameters: FLTWebApp/Web.config:79-80, FLTBizObjects/DataAccess/AppConfig.vb:32-58)
**Plain English:** After 5 wrong passwords in a row an account is locked for 10 minutes. The first login attempt after the 10 minutes clears the lock and the failure count.
**Specification:**
  Given MaximumLoginFailuresAllowed = 5, LockoutDuration = 10 minutes, and user 'jdoe' has FailedPasswordAttemptCount = 4
  When  jdoe enters a wrong password a fifth time at 09:00 UTC
  Then  The account is marked IsLockedOut = True with the window start set to 09:00 UTC. Every attempt before 09:10 UTC is rejected even if the password is correct. An attempt at or after 09:10 UTC unlocks the account and resets the count to 0, then checks the password again.
**Parameters:** LockoutDuration = 10 (minutes; falls back to 5 if not numeric, AppConfig.vb:32-44); MaximumLoginFailuresAllowed = 5 (falls back to 3 if not numeric, AppConfig.vb:46-58). Logic is in fltIdentityManager.vb:37-62: if count < (max - 1) the count is incremented, otherwise the account is locked.
**Edge cases handled:** The lock happens on the Nth failure (count reaches max-1 and the next failure locks), so 5 failures lock the account; Lock expiry uses DateDiff in whole minutes, measured from UtcFailedPasswordAttemptWindowStart (the moment of lockout); Failures are not windowed by time; the count builds up until a successful login or an unlock; The appSetting 'BatchLoginMode' = 'Both' is defined at Web.config:65 but is not referenced in this module
**Suspected defect:** The count is not time-windowed even though the field is named 'FailedPasswordAttemptWindowStart', so old failures from days ago still count toward lockout.
**Confidence:** Medium — Citation was corrected by referee (The behavior is real, but the cited lines don't implement it. FLTWebApp/Web.config:79-80 only holds the two settings, LockoutDuration=10 and MaximumLoginFailuresAllowed=5. The lockout logic itself is in FLTBizObjects/BusinessLogic/fltIdentityManager.vb:37-62. The rule matches that code: - Line 37: a locked account is rejected while DateDiff(Minute, UtcFailedPass…

### RULE-176: Failed-login lockout threshold
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:49-63`
**Plain English:** Each wrong password adds one to the user's failure count. When a wrong password arrives and the count already equals the maximum allowed minus one, the account is locked and the lock time is recorded.
**Specification:**
  Given MaximumLoginFailuresAllowed = 5 and a user with FailedPasswordAttemptCount = 4
  When  The user enters a wrong password
  Then  IsLockedOut = True and UtcFailedPasswordAttemptWindowStart = now (UTC). The user sees 'Login failures exceeded maximum allowed attempts - user account is locked out'. If the count were 0 to 3, it would go up by 1 and the user would see the generic failure message.
**Parameters:** MaximumLoginFailuresAllowed: AppSettings key, set to 5 in FLTWebApp/Web.config:80 and FLTRestService/Web.config:40; the code falls back to 3 if the key is missing or not numeric (FLTBizObjects/DataAccess/AppConfig.vb:46-57)
**Edge cases handled:** The locking attempt does not add to the counter, so with a maximum of 5 the stored count stays at 4 while the account is locked; The 'window start' timestamp is set only at lockout, so it is really the lockout start time, not the start of a rolling window of failed attempts; Failures are never reset by time unless the account is locked; 4 failures spread over months still lock on the 5th
**Confidence:** High

### RULE-177: Role-based action authorization hierarchy
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/BusinessLogic/fltIdentityManager.vb:97-123`
**Plain English:** A super user can do anything. A manager of the current program can do anything except in the Security and AppConfig modules. Everyone else needs an explicit View or Edit permission on the module for their current program.
**Specification:**
  Given A user who is IsCurrentProgramManager = True and not a super user
  When  They ask for CanEdit on module 'Fleet', and then on module 'Security'
  Then  'Fleet' is allowed. For 'Security' the program-manager bypass does not apply, so the user's module permission list decides.
**Parameters:** Actions: CanView = 0, CanEdit = 1. Modules excluded from the manager bypass: 'security' and 'appconfig' (compared in lower case).
**Edge cases handled:** The per-module permission lookup compares ModuleName case-sensitively, but the manager exclusion is case-insensitive; CanEdit does not imply CanView: a permission row with CanEdit = True and CanView = False denies View; A null identity throws 'FltIdentity is nothing' instead of returning false; Permissions are scoped to the current program, loaded with FetchUserProgramPermissions
**Confidence:** High

### RULE-178: Login lockout thresholds
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/DataAccess/AppConfig.vb:32-58`
**Plain English:** An account locks after a set number of failed logins (default 3) and stays locked for a set number of minutes (default 5). Both values can be configured.
**Specification:**
  Given No LockoutDuration or MaximumLoginFailuresAllowed in app settings
  When  A user fails to log in repeatedly
  Then  The limit is 3 failures and the lockout lasts 5 minutes from the start of the failed-attempt window (applied in BusinessLogic/fltIdentityManager.vb:37-51)
**Parameters:** LockoutDuration defaults to 5 (minutes). MaximumLoginFailuresAllowed defaults to 3. A setting that is not numeric falls back to the default.
**Edge cases handled:** The failed-attempt count and window start are kept on the user record (FltUserDB.vb:147-153); The lockout check in fltIdentityManager compares the attempt count against MaximumLoginFailuresAllowed - 1
**Confidence:** Medium — Confirm that the lockout should last 5 minutes measured from the start of the failed-attempt window (not from the last failure), and that the 3rd failed attempt is the one that locks the account.

### RULE-179: User login returns identity, super-user flag, default program and accessible programs
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/DataAccess/fltIdentityDB.vb:14-58`
**Plain English:** A user logs in with user name and password checked by the database; if no match the login fails, otherwise the user gets a display name, last login date, super-user flag, default program and the list of programs they may work in.
**Specification:**
  Given User 'jsmith' with a valid password assigned to programs 'Alpha' (ProgId 3, default) and 'Bravo' (ProgId 7)
  When  jsmith logs in
  Then  An authenticated identity is returned with DefaultProgId 3, IsSuperUser as stored, and UserProgramsList = [Alpha, Bravo]; with a wrong password no rows come back and the login returns nothing (rejected)
**Parameters:** Stored procedure fltValidateLogin(@UserName, @Password); identity created with isLoggedIn = True and program-manager flag initially False (line 116)
**Edge cases handled:** Password is passed to the database as given; any hashing/lockout policy lives in the stored procedure; A user with zero programs still logs in, with an empty program list; Any database error becomes a generic error, not a failed login
**Confidence:** Medium — Does fltValidateLogin compare hashed passwords and enforce lockout or expiry? The application code sends the raw password.

### RULE-180: Per-program manager role and per-module view/edit permissions
**Category:** Policy
**Priority:** P0
**Source:** `FLTBizObjects/DataAccess/fltIdentityDB.vb:60-105`
**Plain English:** When a user works in a program, the system loads whether they are that program's manager (default No) and, for each application module, whether they can view and whether they can edit.
**Specification:**
  Given User 'jsmith' switching to program Bravo (ProgId 7) where the database grants IsProgramManager false and module 'WorkOrders' CanView true, CanEdit false
  When  Program permissions are fetched
  Then  IsCurrentProgramManager = False and CurrentModulePermissionsList contains (WorkOrders, view yes, edit no), so the user can see but not change work orders
**Parameters:** Stored procedure fltFetchUserProgramPermissions(@UserName, @ProgId); default IsCurrentProgramManager = False when no row returned
**Edge cases handled:** No first result set -> not a program manager; Permissions are appended to the existing list; it is not cleared first, so switching programs repeatedly may accumulate permissions from earlier programs
**Suspected defect:** CurrentModulePermissionsList is not cleared before adding (line 91); if the same identity fetches permissions for a second program, it may keep the first program's permissions.
**Confidence:** Medium — Is the permissions list reset elsewhere when the user changes program? If not, a user could keep edit rights from a previous program.

### RULE-181: API callers must authenticate with Basic credentials or configured default account
**Category:** Policy
**Priority:** P0
**Source:** `FLTWebAPI/FltWebApi/App_Code/IdentityManager.cs:14-49`
**Plain English:** Every API request is authenticated against the FLT user store using HTTP Basic credentials, falling back to a username/password from configuration when no Basic header is sent; failed authentication returns 401.
**Specification:**
  Given A request with header 'Authorization: Basic <base64 of user:pass>'
  When  Any FLT API endpoint is called
  Then  FltIdentityManager.AuthenticateUserLogin(user, pass) is called; if it throws the caller receives 401 UserWasNotAuthenticated, otherwise the identity is used for data calls
**Parameters:** Fallback credentials: appSettings 'username' / 'password' (Web.config:7-8, currently empty values — <credential — masked, see FLTWebAPI/FltWebApi/Web.config:7-8>)
**Edge cases handled:** Password split at the first ':' so passwords may contain colons but usernames may not; Authorization header shorter than 6 chars throws outside the try block, yielding 500 instead of 401; If the config fallback is filled in, unauthenticated requests are silently granted that account's identity; Only an exception from AuthenticateUserLogin yields null; if it returns null for bad credentials the effect is the same 401
**Suspected defect:** A non-empty configured username/password would let any request without an Authorization header act as that account. Short Authorization headers produce 500.
**Confidence:** High

### RULE-182: Authenticated session required for configuration and document pages
**Category:** Policy
**Priority:** P0
**Source:** `FLTWebApp/documents/DocumentShow.aspx.vb:15-22`
**Plain English:** Only a logged-in user can open the document or reference-data pages. Anyone else is sent away before any data is read or changed.
**Specification:**
  Given A request arrives with no FltIdentity in the session, or with an identity whose IsLoggedIn = False
  When  Any of the DocumentTypes, TimeZones, WeightDefTypes, programs, DocumentAdd, documentsList or DocumentShow pages loads
  Then  The user is redirected to ~/Login.aspx. DocumentShow sends them to ~/NotAuthorized.aspx instead, so no document is streamed.
**Parameters:** Session key 'fltIdentity'; flag IsLoggedIn. The same gate appears at DocumentTypes.aspx.vb:13-16, TimeZones.aspx.vb:13-16, WeightDefTypes.aspx.vb:11-14, programs.aspx.vb:15-18, DocumentAdd.aspx.vb:16-19 and documentsList.aspx.vb:22-25.
**Edge cases handled:** The check uses VB 'Or', which does not short-circuit, so a Nothing identity would throw a NullReferenceException before the redirect runs. The result is still a denial, but through an error.; Per-action permissions (CanEdit/CanView for module 'Documents' and similar) are enforced in the BL managers, not on these pages. The pages only show the exception message.
**Suspected defect:** Because 'Or' does not short-circuit, a missing session crashes the page instead of redirecting. Use OrElse.
**Confidence:** Medium — P0 panel doubts spec fidelity: P0 is justified. This is the authentication gate in front of document download and changes to reference data, so it guards security and data integrity. The Given/When/Then is wrong on one of its two branches, though. 1. **The "no FltIdentity in session" branch.** The gate at FLTWebApp/documents/DocumentShow.aspx.vb:17 (and the same line on every other cited page) us…

### RULE-183: Export access requires the Export/CanView permission (session reuse or batch re-login)
**Category:** Policy
**Priority:** P0
**Source:** `FLTWebApp/export/autoCreateFile.aspx.vb:17-26`
**Plain English:** Only a logged-in user whose role grants the 'Export' View permission may create, list or download flight-data export files. Batch callers reuse their session identity or are re-authenticated from the request credentials on every call.
**Specification:**
  Given A batch client calls autoCreateFile, autoGetFileList or autoFetchFile, or a user opens export.aspx
  When  The session has no identity or the identity is not logged in
  Then  Batch pages try AuthenticateUser from the request credentials. If the resulting identity fails FltExportManager.CanView (AuthorizeUserAction(identity, "Export", CanView)), the response is <error>User is not authorized</error>. The interactive page sends the user to ~/Login.aspx. An authorized user goes on to the requested export action.
  And   FltExportManager.CreateDownloadFile checks CanView again and throws 'Can't Export - user is not authorized' if it fails (FLTBizObjects/BusinessLogic/FltExportManager.vb:28-38)
**Parameters:** Permission object = "Export"; action = fltUserAction.CanView; session key = "fltIdentity"
**Edge cases handled:** The same guard appears in autoFetchFile.aspx.vb:17-26, autoGetFileList.aspx.vb:15-23 and export.aspx.vb:14-17; export.aspx.vb:27 saves the identity under the session key "_fltIdentity", but every reader uses "fltIdentity", so that write has no effect; export.aspx.vb:137 builds download links straight to ~/download/<file>. No <location> rule protecting /download was found in FLTWebApp/Web.config, so anyone who knows a file name may be able to fetch…
**Suspected defect:** The guard uses non-short-circuit `Or`: `(_fltIdentity Is Nothing) Or (_fltIdentity.IsLoggedIn = False)`. When the identity is Nothing, the second operand still runs and throws NullReferenceException, so first-time batch calls with no session may crash instead of authenticating. The /download folder also appears to be served as static content, which skips authorization.
**Confidence:** Medium — P0 panel doubts spec fidelity: P0 is justified. This is the access-control gate on bulk flight-data export, so it guards security and data confidentiality. The rule's core is right: autoCreateFile.aspx.vb:24-25 and the matching checks in autoGetFileList.aspx.vb:22 and autoFetchFile.aspx.vb:25 call FltExportManager.CanView, which is AuthorizeUserAction(identity, "Export", CanView) (FltExportManage…

### RULE-184: Approved flights lock meter readings; key fields editable only by super users or program managers
**Category:** Policy
**Priority:** P0
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:422-452`
**Plain English:** Once a flight is approved, its Hobbs start and end readings are locked, and only super users or the current program's manager may edit Hobbs readings on approved flights or change a flight's aircraft, location, work shift or date.
**Specification:**
  Given An approved flight is opened in edit mode
  When  A regular user opens it
  Then  Hobbs start, Hobbs end, aircraft, location, work shift and flight date are all disabled
  And   When a super user or current program manager opens it, all of these fields are enabled
**Parameters:** Roles: FltIdentity.IsSuperUser, FltIdentity.IsCurrentProgramManager; state flag Flight.IsApproved
**Edge cases handled:** Unapproved flights: regular users can edit Hobbs readings but not the key fields; New flights: Hobbs start enabled for all users; key fields chosen on the first step
**Suspected defect:** The lock is UI-only (control Enabled flags); server-side enforcement on save is not visible here. Also LocationEditDDL_SelectedIndexChanged (lines 118-139) filters aircraft and routes by LocationIdDDL instead of LocationEditDDL, so a privileged user re-assigning location sees the wrong aircraft/route lists.
**Confidence:** High

### RULE-185: Program reference data needs a logged-in user and is scoped to that user's current program
**Category:** Policy
**Priority:** P0
**Source:** `FLTWebApp/program/locations.aspx.vb:18-30`
**Plain English:** Every program-setup screen sends anonymous users to the login page, and all lists and new records are tied to the program the user is currently working in.
**Specification:**
  Given A user whose session identity has CurrentProgId = 7
  When  they open Locations, Routes, Regions, Weight Tracking, Configuration Values or Program Profile
  Then  only records for program 7 are listed, and any new Location, Region, Route, Weight definition or lookup value is stamped with ProgId 7. A missing or logged-out session goes to ~/Login.aspx.
**Parameters:** Session key 'fltIdentity'; redirect target ~/Login.aspx; ProgId comes from FltIdentity.CurrentProgId through ProgIdHiddenField
**Edge cases handled:** The same gate is repeated in ConfigValues.aspx.vb:12-25, Regions.aspx.vb:18-30, Routes.aspx.vb:18-31, WeightDefs.aspx.vb:17-30 and ProgramProfile.aspx.vb:45-56; ProgramProfile loads the program by CurrentProgId, so a user can only edit their current program; The 'Or' is not short-circuiting, so a null session reads _fltIdentity.IsLoggedIn and throws a NullReferenceException instead of redirecting; The ProgId sits in a client-side hidden field, so a tampered postback could write records to another program
**Suspected defect:** `(_fltIdentity Is Nothing) Or (_fltIdentity.IsLoggedIn = False)` uses a non-short-circuit Or, so an expired session crashes instead of redirecting. Program scoping also relies on a client-editable hidden field (ProgIdHiddenField) and not on the server-side identity.
**Confidence:** Medium — P0 panel doubts spec fidelity: P0 is justified. This is the login and program-scoping gate for every program reference-data screen. It keeps one program's locations, routes, regions, weight definitions and config values separate from another's. If that changed without notice, records could leak across programs or be written to the wrong one. An auditor would care about that as a security and data…

### RULE-186: Login required for security administration and profile pages
**Category:** Policy
**Priority:** P0
**Source:** `FLTWebApp/security/users.aspx.vb:18-29`
**Plain English:** Every user, role, module, permission and profile page sends anyone without a logged-in session to the login page. Beyond that, the pages run no role or module permission check of their own.
**Specification:**
  Given A browser session with no fltIdentity, or one where IsLoggedIn = False
  When  The user opens security/users.aspx (or modules, roles, roleModulePermissions, ChangePassword, UserProfile)
  Then  The user is redirected to ~/Login.aspx. Any logged-in user who reaches the URL directly can use all admin functions, because the 'Security' module CanView check exists only in FLT.Master.vb:101, where it hides the menu link.
**Parameters:** Session key 'fltIdentity'; redirect target ~/Login.aspx. The same check appears at modules.aspx.vb:12-16, roles.aspx.vb:18-22, roleModulePermissions.aspx.vb:12-16, ChangePassword.aspx.vb:11-15, UserProfile.aspx.vb:58-62
**Edge cases handled:** No server-side Security/CanEdit authorization on any page: a non-admin who knows the URL can create users, grant super user, and change permissions; The non-short-circuit 'Or' evaluates _fltIdentity.IsLoggedIn even when _fltIdentity Is Nothing
**Suspected defect:** 1) VB 'Or' does not short-circuit, so a missing session throws a NullReferenceException instead of redirecting (OrElse was intended). 2) Admin pages check only that the user is logged in, not the 'Security' module permission, so access depends on the menu link being hidden.
**Confidence:** Medium — P0 panel doubts spec fidelity: P0 is justified. This is the authentication gate on the user, role, module and permission administration pages, so it is a security and access-control rule. Getting it wrong lets someone take over accounts or raise their own privileges. The Given/When/Then is not faithful, for two reasons. (1) The cited guard at FLTWebApp/security/users.aspx.vb:19-21 uses VB 'Or', n…

### RULE-187: Role-based module permissions (view/edit)
**Category:** Policy
**Priority:** P0
**Source:** `database/FLT_Schema.sql:15815-15880`
**Also cited:** FLTWebApp/security/roleModulePermissions.aspx.vb:59-78
**Plain English:** Each role belongs to one program and can be marked as a program-manager role. For each role and module, administrators grant separate View and Edit rights, which can be switched on or off.
**Specification:**
  Given Role 12 'Test Engineers' in program 2 has permission on module 'WorkOrders' with CanView=1, CanEdit=0
  When  An admin updates that permission to CanEdit=1
  Then  Members of role 12 can edit work orders. The permission row records the editor and the UTC time.
**Parameters:** Original source database/FLT_Schema.sql:15815-15827 and 15863-15874. CanView and CanEdit default to 0. IsProgramManager defaults to 0. Modules are identified by ModuleName nvarchar(50) and can be turned on or off with FltModule.IsActive.
**Edge cases handled:** CanEdit=1 with CanView=0 is accepted; the procedure does not require view rights for edit; A role can be moved to a different program by updating ProgId, which silently changes where its members have access; Permission and role rows have IsActive flags, but login only checks the role's IsActive
**Suspected defect:** The IsActive/IsDeleted filters are ignored (line 30 passes only RoleId). Nothing enforces that CanEdit requires CanView.
**Confidence:** Medium — Where are CanView and CanEdit enforced (the application layer)? Does IsProgramManager grant extra rights, and should CanEdit imply CanView? / Should CanEdit imply CanView, and should the Active/Deleted filters on the permissions page actually filter the list?

### RULE-188: Program access by super-user flag or role membership
**Category:** Policy
**Priority:** P0
**Source:** `database/FLT_Schema.sql:6773-6818`
**Plain English:** Super users can open every active, non-deleted program. Other users can open only the active, non-deleted programs where they hold a non-deleted membership in an active, non-deleted role.
**Specification:**
  Given Programs 1, 2 and 3 are active. User 'jsmith' (IsSuperUser=0) is a member of an active role in program 2 only. User 'admin' has IsSuperUser=1.
  When  Each user logs in
  Then  'jsmith' gets program list [2] and 'admin' gets [1,2,3]. Both lists are ordered by ProgId.
**Parameters:** Original source database/FLT_Schema.sql:6773-6816. Conditions: Program.IsActive=1 AND IsDeleted=0. For non-super users, also FltUserInRole.IsDeleted=0, FltRole.IsActive=1, FltRole.IsDeleted=0, and FltRole.ProgId = Program.ProgId.
**Edge cases handled:** FltUserInRole.IsActive is not checked; only its IsDeleted flag is; A user with several roles in the same program gets that program more than once (no DISTINCT); The user's DefaultProgId is not checked against the list of allowed programs; A non-super user with no qualifying role gets an empty program list but still logs in successfully
**Confidence:** High

### RULE-189: Default list filters show only active, non-deleted, approved records
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FlightInfoManager.vb:13-36`
**Plain English:** Standard list views return only active, non-deleted records, and the default flight lists additionally return only approved flights.
**Specification:**
  Given Aircraft 42 with 10 flights, 2 unapproved and 1 deleted
  When  The default FlightInfoManager.GetList(aircraft, text, location) is used
  Then  7 flights are returned (IsApproved=1, IsActive=1, IsDeleted=0)
**Parameters:** IsApprovedFilter=1, IsActiveFilter=1, IsDeletedFilter=0, RowStart/RowCount=-1 (all); same active/non-deleted defaults in AircraftInfoManager.vb:14-17, ProgramManager, FltUserManager, FltModuleManager, report managers
**Edge cases handled:** Draft flights saved with EnforceValidation=False are hidden from default lists
**Confidence:** Medium — Confirm that filter value 1 means 'only approved' (rather than 'any') in FlightInfoDB.GetList.

### RULE-190: Incremental flight export since a change date
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FltExportManager.vb:20-75`
**Plain English:** The download export writes all programs, aircraft, configurations and locations, but includes only flights modified on or after the requested 'changes since' date; with no date, everything since 2000-01-01 is exported, and the file is written to a temp name then renamed.
**Specification:**
  Given ChangesSince = 2026-06-01 and a flight last modified 2026-05-31
  When  The export is built
  Then  That flight is omitted; a flight modified 2026-06-01T00:00 or later is included (filter at lines 295-301)
**Parameters:** Default ChangesSince 01-Jan-2000; file name Download_<appPrefix>_<yyyyMMddTHHmmssz>.xml; requires Export module view right
**Edge cases handled:** Programs, aircraft, configs and locations are always exported regardless of the date; Work orders section is always empty (ProcessOneWorkOrder is a stub); UtcDateModified is compared to ChangesSince without time-zone normalisation
**Confidence:** High

### RULE-191: User password lifecycle
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/FltUserManager.vb:61-127`
**Plain English:** New users receive a system-generated password (salted hash stored) emailed to them; changing a password requires the correct old password and matching confirmation; an admin can regenerate and email a new password; unlocking an account clears the lockout and resets failed attempts to zero.
**Specification:**
  Given User 'jdoe' with stored salted hash
  When  jdoe changes password with a wrong old password
  Then  'Old Password not valid!' is raised; with correct old password but mismatched confirmation, 'Confirm New Password does not match New Password value!'; otherwise a new salt+hash is stored
**Parameters:** Generator/hash from fltPassword; email settings WebmasterEmailAddress, SMTPServer, SysName, LoginURL, appPrefix from app config
**Edge cases handled:** Updates performed with an empty identity are stamped 'Password Change'; Email send failures are logged and swallowed, so a new user may never learn the password; No password-strength check on user-chosen passwords in this layer
**Suspected defect:** Plain-text generated passwords are sent by email, and email failure is silently ignored after the account is created.
**Confidence:** High

### RULE-192: Operations that bypass authorization
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/RptFleetManager.vb:221-228`
**Plain English:** Several operations perform no permission check: all spreadsheet reports always allow viewing, document file content can be read or overwritten, aircraft-test links can be added/removed, program lists can be read, and user accounts can be listed, created, updated, deleted or unlocked by any caller.
**Specification:**
  Given A user with no roles at all
  When  They request the Fleet spreadsheet, download document 5's stream, or call FltUserManager.Delete
  Then  The operation succeeds (CanView returns True unconditionally; other methods never call CanView/CanEdit)
**Parameters:** Affected: RptFleetManager/RptLocationsManager/RptRegionsManager/RptConfigValuesManager.CanView (always True); DocumentManager.GetStream/PutStream (DocumentManager.vb:13-27); AircraftTestXrefManager Insert/Delete/lists (AircraftTestXrefManager.vb:14-65); ProgramManager.GetList (ProgramManager.vb:14-26); FltUserManager all methods (FltUserManager.vb:16-91)
**Edge cases handled:** DocumentManager defines CanView/CanEdit but never calls them; Callers in the UI layer may enforce checks not visible here
**Suspected defect:** Missing authorization on user administration (create/delete/unlock users) and document overwrite is a likely security gap.
**Confidence:** Medium — Are reports, document streams, test assignments and user administration meant to be open to every authenticated user, or is authorization enforced in the web layer?

### RULE-193: Report exports allow any user
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/RptRoutesManager.vb:197-204`
**Plain English:** Anyone can run the Routes and Weight Tracking report exports, because their permission check always returns true.
**Specification:**
  Given A user with no Fleet permissions
  When  They ask for the Routes or Weight Tracking spreadsheet for any ProgId
  Then  The spreadsheet is produced
**Parameters:** The same always-true CanView is in RptWeightTrackingManager.vb:198-205
**Edge cases handled:** ProgId is passed in by the caller and not checked against the user's programs, so data from another program could be exported
**Suspected defect:** CanView returns True without checking anything, unlike the matching managers (WeightDefManager and others), which require Fleet View.
**Confidence:** High

### RULE-194: Work order delete via info list bypasses authorization
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderInfoManager.vb:38-45`
**Plain English:** Deleting a work order from the work order list screen does not check the user's Edit permission, while the main WorkOrderManager.Delete does.
**Specification:**
  Given A user with only View permission on 'Fleet'
  When  They delete a work order through WorkOrderInfoManager.Delete
  Then  WorkOrderDB.Delete runs and is stamped with their user name. No authorization error is raised.
**Parameters:** Compare with WorkOrderManager.vb:94-112, which requires CanEdit('Fleet')
**Suspected defect:** CanEdit is defined in WorkOrderInfoManager (line 51) but not called by Delete, so a user with only View permission can delete work orders.
**Confidence:** High

### RULE-195: Work order document attachment rules
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:466-530`
**Plain English:** Attaching a document needs Fleet Edit permission and a valid document. The document metadata and file content are saved straight away, before the work order is saved. Editing a document's details cannot change its program, document type or MIME type.
**Specification:**
  Given A saved document with DocumentTypeId 3 and MimeType 'application/pdf'
  When  UpdateDocument is called with DocumentTypeId 7 and MimeType 'image/png'
  Then  The update keeps DocumentTypeId 3, MimeType 'application/pdf' and the original ProgId and ConcurrencyId. Only the other edited fields change.
**Parameters:** Fields kept from the original: ProgId, DocumentTypeId, MimeType, ConcurrencyId
**Edge cases handled:** The document is saved to the database at attach time, so if the user abandons the work order the document stays saved but unlinked; UpdateDocument and RemoveDocument do not check permissions; only InsertDocument does
**Suspected defect:** Documents attached to a work order that is never saved stay in the database without any work-order link.
**Confidence:** High

### RULE-196: Business-object to security-module mapping
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/WorkOrderManager.vb:552-568`
**Plain English:** Work orders, weight definitions and weight definition types are controlled by the 'Fleet' module permission. UTC time zones are controlled by 'System'. Lookup/config tables are controlled by 'ConfigTables'.
**Specification:**
  Given A user with View but not Edit on 'Fleet'
  When  They open a work order and then try to save it
  Then  Opening works. Saving fails with 'Can't update - user is not authorized' (or 'Can't insert - ...' for a new record).
**Parameters:** Fleet: WorkOrderManager, WorkOrderInfoManager:47-53, WeightDefManager:110-116, WeightDefTypeManager:102-108. System: UTCTimeZoneManager:100-106. ConfigTables: fltLookupBaseManager:103-109.
**Edge cases handled:** All read methods (GetItem/GetList) need View; Insert, Update and Delete need Edit; The WeightDef and WeightDefType Update methods report 'Can't insert - user is not authorized' when update permission is missing (wrong message text)
**Confidence:** High

### RULE-197: Lookup tables readable without authorization
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessLogic/fltLookupBaseManager.vb:14-35`
**Plain English:** Lookup/config table lists and items can be read by any caller without a permission check. Only changes need ConfigTables Edit permission.
**Specification:**
  Given An anonymous or unprivileged caller
  When  They call fltLookupBaseManager.GetList(LookupName, ProgId)
  Then  The active lookup values for that program are returned without any authorization check
**Parameters:** Default list filter: IsActiveFilter = 1, no paging (RowStart = -1, RowCount = -1)
**Edge cases handled:** CanView('ConfigTables') is defined (line 103) but never called
**Suspected defect:** The read methods take no FltIdentity and never call CanView, so the ConfigTables View permission has no effect on reads.
**Confidence:** Medium — Are lookup values meant to be public reference data, or should reading them require ConfigTables View permission?

### RULE-198: Fixed catalog of administrator-maintainable lookup (configuration value) types
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Collections/fltLookupNameList.vb:12-39`
**Plain English:** Administrators can maintain configuration values only for a fixed, hardcoded list of 26 lookup types (for example Pilot, Mechanic, Engine Type, Work Order Status, Work Order Type, Aircraft Status), offered in that order.
**Specification:**
  Given An administrator opens the Config Values maintenance screen (FLTWebApp/program/ConfigValues.aspx.vb:144-149) or the Config Values report (FLTWebApp/reports/rptConfigValues.aspx.vb:74)
  When  The lookup Type drop-down is populated
  Then  It shows exactly these 26 types, in this order: APUType, Pilot, Emission, Engineer, EngineeringAction, EngineType, IssueCode, LengthUnit, LiquidGroup, LiquidType, LiquidUnit, Manufacturer, MaturityDef, MechAction, Model, Mechanic, Test, LoadingConfig, Propeller, PropellerType, AircraftComponent, AircraftStatusDef, WeightUnit, WorkOrderStatus, WorkOrderType, WorkShift. No other lookup type can be picked from the UI.
**Parameters:** 26 hardcoded lookup type names (lines 13-38). These are a good candidate for configuration or a database reference table. Per the step 01 map, each name is also joined to a stored procedure prefix ("fetch" & LookupName), so each entry implies a matching stored procedure.
**Edge cases handled:** The list is not alphabetical: Mechanic comes after Model, and Test, LoadingConfig, Propeller and the rest are appended after it. The modern system should keep this display order or deliberately decid…; Values such as WorkOrderStatus and AircraftStatusDef make lifecycle states (work order status, aircraft status) data an administrator maintains, not states fixed in code.; Adding a new lookup type needs a code change here plus a matching stored procedure.
**Confidence:** Medium — Is this the complete, authoritative set of lookup types administrators may maintain? Are any intentionally left out (for example WeightDefType, WOReason, WOPerformedWork) because they are managed elsewhere, and does the display order matter to users?

### RULE-199: Flight validation can be bypassed by caller
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/Flight.vb:1156-1163`
**Plain English:** A caller can save a flight without any validation by passing EnforceValidation = False, which also clears all pending warnings.
**Specification:**
  Given A flight with missing required fields
  When  Validate(False) is called
  Then  It returns True, no rules are checked, and WarningsList is reset to empty.
**Parameters:** EnforceValidation flag
**Suspected defect:** A complete bypass of flight data-integrity checks with no permission check inside the object.
**Confidence:** High

### RULE-200: Role module permissions default to full access
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/FltRoleModulePermissions.vb:151-193`
**Plain English:** Access is granted per role and per module through CanView and CanEdit flags. A new permission record defaults to both view and edit allowed, and it needs a role and a module name (max 50 characters).
**Specification:**
  Given A new FltRoleModulePermissions created with the default constructor
  When  It is saved without setting the flags
  Then  The role can both view and edit that module.
**Parameters:** Defaults CanView=True and CanEdit=True. ModuleName max 50. FltRole needs a program and a RoleName (max 50) and allows a RoleDescription of max 255 (FltRole.vb:192-221).
**Edge cases handled:** No rule requires CanView when CanEdit is granted
**Suspected defect:** Permission defaults allow access (permissive), not deny.
**Confidence:** Medium — Should a new role/module permission default to no access instead of full view and edit?

### RULE-201: User account data rules and new-user defaults
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/FltUser.vb:438-604`
**Plain English:** A user needs a user name (max 20 characters, valid character set), a password (max 128) and an email (max 255). However, a user object built with the default constructor starts out as super user, approved, locked out and active.
**Specification:**
  Given A new FltUser created with the default constructor
  When  Its flags are read before any are set
  Then  IsSuperUser=True, IsApproved=True, IsLockedOut=True, IsActive=True and IsDeleted=False.
**Parameters:** Lengths: UserName 20, Password 128, PasswordSalt 128, Email 255, PasswordQuestion 255, PasswordAnswer 128, DisplayName/Location/Department/Title/Company 30, CountryCode/PhoneNumber/MgrUserName 20.
**Edge cases handled:** No email format check, only a length check
**Suspected defect:** The default constructor gives super-user rights (and lockout) to any user whose flags are not set explicitly, which is a privilege-escalation risk if the creation path relies on these defaults.
**Confidence:** Medium — Should new users default to IsSuperUser=True and IsLockedOut=True, or are these flags always overwritten during provisioning?

### RULE-202: Configurable business-rule switches
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/WOInstruction.vb:203-212`
**Also cited:** FLTBizObjects/DataAccess/AppConfig.vb:23-30
**Plain English:** Some validation rules can be turned off per deployment by adding an app setting whose key is the rule ID and whose value is 'N'. A rule with no setting is on.
**Specification:**
  Given No appSettings key '03-02-003' exists
  When  An instruction of 300 characters is validated
  Then  The 255-character rule applies and the line is rejected. With appSettings '03-02-003'='n' the line passes (up to 2048)
**Parameters:** AppConfiguration.BusinessRuleEnabled (DataAccess/AppConfig.vb:22-30): enabled unless the value, upper-cased, equals 'N'. Switchable rules in these files: 03-01-006/007, 03-02-003/004, 03-03-003/004, 03-04-003/004, 03-05-004, 03-05-007, 03-05-00C, 03-05-00D, 03-05-00E, 03-06-006/007. No config file in the repo overrides any of them
**Edge cases handled:** Any value other than 'N' or 'n' (for example 'false' or '0') leaves the rule on.; Header rules on WorkOrder cannot be switched off.
**Confidence:** High

### RULE-203: User session authorization context defaults to no access
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/BusinessObject/fltIdentity.vb:175-197`
**Plain English:** A user session starts as not logged in, not a super user and not a program manager, with no programs and no module permissions. Access is denied until rights are loaded, and per-module rights are View and Edit flags that default to false.
**Specification:**
  Given An anonymous visitor
  When  A default FltIdentity is created
  Then  IsLoggedIn=False, UserDisplayName='Unknown', IsSuperUser=False, CurrentProgId=0, IsCurrentProgramManager=False, and the program and permission lists are empty
**Parameters:** UserModulePermissions(ModuleName, CanView=False, CanEdit=False) defaults (lines 92-96); roles: super user, current-program manager
**Edge cases handled:** The parameterized constructor accepts ProgDisplayName but never assigns it, so the display name stays blank.; The constructor initializes _userProgramsList twice (harmless).; This class only holds the flags. The decisions that use them are made elsewhere.
**Suspected defect:** The ProgDisplayName constructor argument is silently ignored (line 186 vs 187-196).
**Confidence:** Medium — What can a super user or program manager do that a normal user cannot, and does Edit permission imply View permission?

### RULE-204: Optimistic concurrency on record updates
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/FlightDB.vb:263-282`
**Also cited:** database/FLT_Schema.sql:17348-17356
**Plain English:** A record can be updated only if nobody else changed it since it was read. Otherwise the user sees 'Row has been edited by another user'.
**Specification:**
  Given User A and user B both open flight 100 with row version X, and B saves first, so the row version becomes Y
  When  User A saves flight 100 still holding version X
  Then  The update is rejected with 'Row has been edited by another user' and A's whole save transaction rolls back
**Parameters:** The row version (SQL timestamp) is sent as @ConcurrencyId and the new one is returned in @NewConcurrencyId. The same pattern applies in AircraftDB.vb:243-249, FltUserDB.vb and the other updates in this module.
**Edge cases handled:** Only this exact message is passed through to the user. Other SQL errors are hidden behind a generic message.; Rows with no row version are inserted, not updated
**Confidence:** High

### RULE-205: Soft-delete and active filtering when loading flight and aircraft details
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/FlightDB.vb:32-35`
**Plain English:** Deletes are soft: records carry IsDeleted and IsActive flags. Detail views load only active, non-deleted child records, except engine runs, which are filtered only on not deleted.
**Specification:**
  Given Flight 100 has an inactive liquid fill, a deleted pilot comment and an inactive engine run
  When  Flight 100 is opened
  Then  The inactive liquid fill and the deleted comment are excluded. The inactive engine run is still shown.
**Parameters:** LiquidFill: IsActive=1 and IsDeleted=0. FlightComment: active=1, deleted=0. FlightRegionTime: active=1, deleted=0. FlightEngineRun: only IsDeleted=0. Aircraft (AircraftDB.vb:35-36): configurations IsDeleted=0, locations active=1 and deleted=0. Every delete procedure records StampUserName.
**Edge cases handled:** Engine runs have no active filter, unlike the other flight children
**Confidence:** Medium — Is it intended that inactive engine runs appear on a flight while inactive fills, comments and region times are hidden?

### RULE-206: Opening a work order loads its lines with the default deleted-record filter
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/WorkOrderDB.vb:35-41`
**Plain English:** When a work order is opened, its reasons, instructions, performed work, parts, and engineer and mechanic comments are all loaded with deleted-filter 0 and no paging (all rows).
**Specification:**
  Given Work order #1001 has 5 parts, one of them flagged deleted
  When  The work order is opened
  Then  Parts are listed with IsDeletedFilter 0, Start -1, Count -1 (all pages); whether the deleted part appears depends on what filter value 0 means in listWorkOrderParts
**Parameters:** IsDeletedFilter = 0, RowStart = -1, RowCount = -1 (lines 35-40)
**Edge cases handled:** The standalone GetList wrappers in each child DAL (e.g. WorkOrderPartDB.vb:71, WOEngineerCommentDB.vb:71) ignore the caller's IsDeletedFilter and paging arguments and always pass 0, -1, -1; The TotalRows output is never read back in these child lists
**Suspected defect:** Child GetList wrappers hard-code 0/-1/-1 and ignore the caller's IsDeletedFilter, RowStart and RowCount.
**Confidence:** Medium — Does IsDeletedFilter = 0 mean 'exclude deleted' or 'include all'? Should deleted lines ever be shown on a work order?

### RULE-207: Work order search filters
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/WorkOrderInfoDB.vb:64-84`
**Plain English:** The work order list is always scoped to a program and can be narrowed by aircraft id, free-text aircraft match, location, mechanic, work order number and deleted flag, with paging.
**Specification:**
  Given Program 3, aircraft text 'N12', mechanic 14
  When  A user searches work orders
  Then  listWorkOrderInfos returns matching rows with MSN, ship, serial and registration numbers, location, WO number, FIS complaint, squawk, request/due/finish dates and status
**Parameters:** @ProgId, @AircraftId, @AircraftTextMatch, @LocationId, @MechanicId, @WorkOrderNbr, @IsDeletedFilter, @Start, @Count; @Total output not read back
**Edge cases handled:** Matching semantics (exact vs. partial, 0 = any) are defined in the stored procedure
**Confidence:** Medium — Which aircraft fields does AircraftTextMatch search (MSN, ship, serial, registration), and does 0 mean 'any' for the id filters?

### RULE-208: Program-scoped lookup lists with active flag and sort order
**Category:** Policy
**Priority:** P1
**Source:** `FLTBizObjects/DataAccess/fltLookupBaseDb.vb:109-185`
**Plain English:** Generic lookup lists (named code tables) belong to a program and each entry has a text value, sort order and active flag; inactive entries can be filtered out of pick lists.
**Specification:**
  Given Lookup 'IssueCode' for program 3 with entry 'Hydraulic leak', sort order 10
  When  An admin adds and later deactivates the entry
  Then  addIssueCode creates it (active state from database default), updateIssueCode sets IsActive false so lists filtered by IsActiveFilter can hide it
**Parameters:** Procedure names built from the lookup name: fetch<Name>, list<Name>s, add<Name>, update<Name>, delete<Name>; filters @ProgId, @IsActiveFilter, paging @Start/@Count
**Edge cases handled:** Insert does not send IsActive, so new entries take the database default; Regions (RegionDB.vb) follow the same program-scoped code/name/active pattern
**Confidence:** Medium — Are new lookup entries active by default, and can an entry still used by work orders be deleted?

### RULE-209: Export file request always asks for changes since 1 January 2000
**Category:** Policy
**Priority:** P1
**Source:** `FLTExportClient/FltExportClient.vb:44-64`
**Plain English:** When the user clicks Create File, the client asks the server to build an export of all flight-log changes since 01-Jan-2000. The user cannot pick the cut-off date, so every run is effectively a full export.
**Specification:**
  Given The client is configured with export credentials
  When  The user clicks 'Create File'
  Then  CreateFile is called with ChangesSinceDate = 01-Jan-2000, sent as the form field Date=01-Jan-2000 (format dd-MMM-yyyy, FltExportManager.vb:138). The server's raw response text is added to the activity log.
**Parameters:** ChangesSinceDate = 01-Jan-2000 (hardcoded); date wire format dd-MMM-yyyy (FltExportManager.vb:138); endpoint key createFileURI = https://flt.contoso.example/export/autoCreateFile.aspx (app.config:24)
**Edge cases handled:** The month abbreviation in dd-MMM-yyyy depends on the current culture, so a non-English locale could send a month name the server does not recognize; The CreateFile response is never checked for an <error> element, so a server-side failure shows up only as text in the log; The FltExportManager API takes any date, but the only caller in this module always passes the same fixed date
**Suspected defect:** The date is hardcoded, so incremental export is impossible from the UI. The date is also formatted with the current culture.
**Confidence:** Medium — Is the fixed 01-Jan-2000 cut-off on purpose, so every export is a full export? Or should users choose an incremental 'changes since' date, for example the date of the last successful export?

### RULE-210: Export service request policy: configured method, 60-second timeout, HTTP 200 only
**Category:** Policy
**Priority:** P1
**Source:** `FLTExportClient/FltExportManager.vb:180-211`
**Plain English:** Every export-service call uses the configured HTTP method, follows redirects, and waits at most 60 seconds. Only an HTTP 200 OK response counts as data; any other status is treated as an empty response.
**Specification:**
  Given method=Post in configuration
  When  The client calls any export endpoint
  Then  It sends an ASCII form-urlencoded POST with a 60,000 ms timeout and returns the body only if the status is 200. Any failure is re-thrown as 'An error occurred: <message>'.
**Parameters:** Timeout = 60000 ms; UserAgent = http_requestor/0.1; AllowAutoRedirect = True; body encoding ASCII; method key 'Method' = Post (app.config:19, read case-insensitively as 'method')
**Edge cases handled:** Non-ASCII characters in the credentials or file name are lost by the ASCII encoding; The dedicated TimeoutException handler in CreateFile (FltExportManager.vb:144-145) and in the form (FltExportClient.vb:52-56) can never run, because WRequest wraps every exception in a generic Except…; Error messages get nested prefixes, for example 'An error occurred:An error occurred: ...'
**Suspected defect:** The timeout-specific handling is dead code. A server-side export build that takes longer than 60 seconds shows up as a generic error.
**Confidence:** High

### RULE-211: Every export service call is authenticated with configured credentials sent in the request
**Category:** Policy
**Priority:** P1
**Source:** `FLTExportClient/FltExportManager.vb:95-104`
**Plain English:** Each call to the export service (list files, create file, fetch file) sends the user name and password from the app configuration as form fields. The server decides access from these.
**Specification:**
  Given app.config holds userName=devuser and password=<credential — masked, see FLTExportClient/app.config:22, preview 'RE**'>
  When  Any of GetFileList, CreateFile or FetchFile runs
  Then  The request body (or the URL query string, if method=GET) is 'UserName=<u>&Password=<p>[&Date=...|&filename=...]'. The values are joined as raw text with no URL encoding.
**Parameters:** userName and password app settings (app.config:21-22, loaded in FltExportClient.vb:105-106); method = Post (app.config:19); postData built at FltExportManager.vb:99, 138 and 161
**Edge cases handled:** If the method setting is GET, the credentials go into the URL query string (FltExportManager.vb:183-186); A password containing &, = or + would corrupt the form body, because nothing is URL-encoded; A missing userName or password setting throws a NullReferenceException in the form constructor (.ToString on Nothing)
**Suspected defect:** The credentials are stored in plain text in app.config and are not URL-encoded. The GET option would expose them in URLs and server logs.
**Confidence:** Medium — P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: FltExportManager.vb:99 (GetFileList), :138 (CreateFile, adds &Date=dd-MMM-yyyy) and :161 (FetchFile, adds &filename=) build 'UserName=..&Password=..' by plain string concatenation, with no URL encoding. WRequest (:180-201) appends the string to the URL as a query string when the method is…

### RULE-212: Export file destination and naming come from configuration
**Category:** Policy
**Priority:** P1
**Source:** `FLTExportConsoleApp/FLTExportConsoleApp/App.config:6-15`
**Plain English:** The export file is written to the folder set in DownloadPath. Its name is meant to include an application prefix and a UTC timestamp, but this app's config does not define the prefix.
**Specification:**
  Given DownloadPath is set to a developer workstation folder and no 'appPrefix' key exists in App.config
  When  FltExportManager builds the download file
  Then  the file is written as '<DownloadPath>\Download__<yyyyMMddTHHmmssz>.xml' (empty prefix, so two underscores), after first being written as a 'Temp_Download_...' file
**Parameters:** DownloadPath = developer-machine path under C:\Users\devuser\... (App.config:8). appPrefix is not defined. FltExportManager.vb:47-49 reads it. Read at Program.vb:49-55.
**Edge cases handled:** If the DownloadPath key is missing, a NullReferenceException aborts the run; If the folder does not exist or cannot be written, the error is only logged (see the lifecycle rule)
**Suspected defect:** App.config has no appPrefix key, so file names have an empty prefix. DownloadPath is hardcoded to a developer's local folder.
**Confidence:** Medium — What production export folder and appPrefix should the console export use, and does any downstream consumer depend on the file-name prefix?

### RULE-213: Weight definitions are classified as Airframe, Cargo or Ballast (dollies)
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Controllers/AirframesController.cs:77-95`
**Plain English:** Airframe, cargo and dolly (ballast) weight options for a program come from one weight-definition table, selected by matching the weight type description case-insensitively.
**Specification:**
  Given Weight types 'AIRFRAME', 'Cargo', 'Ballast' exist
  When  A client calls /programs/{ProgId}/airframes, /cargos or /dollies
  Then  The matching type's definitions are returned with id, description, weight and weight unit; if the type name is not configured the request returns 500
**Parameters:** Type names hardcoded: 'Airframe' (AirframesController.cs:33), 'Cargo' (CargosController.cs:33), 'Ballast' (DolliesController.cs:33); case-insensitive match
**Edge cases handled:** Dollies endpoint maps to the 'Ballast' type; a flight stores BallastWeightId, AirframeWeightId, Cargo1WeightId and Cargo2WeightId (up to two cargo items); Renaming a weight type in the database breaks the endpoint
**Confidence:** High

### RULE-214: Lookup and program lists are not filtered by caller identity
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Controllers/LookUpValuesController.cs:215-231`
**Plain English:** Once authenticated, any user can read the program list and the program's reference lists (evaluators, work shifts, liquid types/subtypes/units, component codes, issue codes, length units) because these calls do not pass the user's identity.
**Specification:**
  Given An authenticated user with no assignment to program 7
  When  They call /programs/7/evaluators or /programs
  Then  The lists are returned (fltLookupBaseManager.GetList(name, ProgId) and ProgramManager.GetList() take no identity), whereas aircraft, flights, locations, regions, routes and weight definitions are fetched with the identity
**Parameters:** Lookup base names: Pilot (evaluators), WorkShift, LiquidGroup (liquid fill types), LiquidType (subtypes), LiquidUnit, AircraftComponent, IssueCode, LengthUnit
**Edge cases handled:** Evaluators are stored as 'Pilot' lookups; the API renames Pilot to Evaluator throughout (PilotId<->EvaluatorId, PilotComment<->EvaluatorComment)
**Confidence:** Medium — Should reference data and the program list be restricted to programs the caller is assigned to?

### RULE-215: Flight load configuration: one airframe, up to two cargo items, one ballast
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Models/Flight.cs:24-27`
**Plain English:** Each flight records exactly one airframe configuration, at most two cargo loads (Cargo1, Cargo2) and one ballast item, each picked from a reference list with a description, weight and weight unit.
**Specification:**
  Given A flight that carries three distinct cargo items
  When  The flight is recorded
  Then  Only two cargo references (Cargo1Id, Cargo2Id) can be stored; a third cannot be recorded
**Parameters:** Max cargo slots per flight = 2 (Cargo1Id, Cargo2Id). Reference catalogs: Airframes (Airframe.cs:11-17), Cargos (Cargo.cs:11-17), Dollies/Ballast (Ballast.cs:11-17).
**Edge cases handled:** Ids are non-nullable ints, so 'no cargo' must be shown by a sentinel value (probably 0); The ballast collection is serialized as 'Dollies', which suggests ballast means ground dollies
**Confidence:** Medium — Is the two-cargo limit a real business limit or a schema convenience? What value means 'no cargo/ballast' (0)? Are 'Ballast' and 'Dollies' the same concept?

### RULE-216: Liquid fills recorded with Hobbs reading and approver
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebAPI/FltWebApi/Models/LiquidFill.cs:11-21`
**Plain English:** Each fluid replenishment on a flight records its type and subtype, amount and unit, the Hobbs reading when it was done, where it was done, and who approved it.
**Specification:**
  Given A 2.5-quart oil top-up at Hobbs 1,235.2
  When  It is added to a flight's LiquidFills
  Then  It is stored with LiquidAmt 2.5, LiquidUnitId = quarts, HobbsReading 1,235.2, plus location and approver name
**Parameters:** LiquidFillTypeId, LiquidFillSubTypeId and LiquidUnitId are lookup ids; the approver is free text.
**Edge cases handled:** Nothing at the model level requires an approver
**Confidence:** Low — Is an approver mandatory for every liquid fill (or for certain fluid types)? Should the fill's Hobbs reading fall between the flight's HobbsStart and HobbsEnd?

### RULE-217: Navigation menu shown by module permission and role
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/FLT.Master.vb:48-160`
**Plain English:** Each user sees only the menu sections for modules they may view in their current program. Super users see everything. Program managers see everything except Security and App Config.
**Specification:**
  Given A program manager (not super user) in their current program
  When  The menu is built on first load of a page
  Then  They see Home, Fleet Module, Documents, Export Data, User Profile, Program, Program Reports and Log Out, but not Security or App Config. A regular user sees a section only if a permission row for that module name has CanView = True.
**Parameters:** Module names checked: 'Fleet', 'Documents', 'Export', 'Program' (gates both the Program config menu and Program Reports), 'Security', 'AppConfig'. Always shown: Home, User Profile (Edit Profile, Change Password), Log Out. Precedence is in FltIdentityManager.AuthorizeUserAction (fltIdentityManager.vb:97-123): IsSuperUser, then IsCurrentProgramManager unless the module is security/appconfig, then the explicit permission list.
**Edge cases handled:** A row with CanEdit but without CanView does not show the menu, because the check asks for CanView only; Module name matching against the permission list is case-sensitive, while the manager exclusion compares lower-case names; The menu is built only on the first load (not on postback)
**Confidence:** High

### RULE-218: Session and sign-in timeout of 30 minutes
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/Web.config:41-44`
**Plain English:** An idle user session expires after 30 minutes. A new session begins as an anonymous identity, so the user has to log in again.
**Specification:**
  Given A logged-in user who has been idle for 31 minutes
  When  They request any protected page
  Then  The in-process session has expired and Session_Start creates a new anonymous FltIdentity, so they are redirected to Login.
**Parameters:** sessionState timeout = 30 min (InProc, cookies); forms authentication timeout = 30 min with loginUrl = Login.aspx. The session ID manager is NWebsec AuthenticatedSessionIDManager.
**Edge cases handled:** Forms authentication is configured but no forms auth ticket is ever issued in these files; access control depends entirely on the session identity; InProc session state means an application restart logs everyone out
**Confidence:** High

### RULE-219: Time zone definition with UTC offset and daylight-saving window
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/appConfiguration/TimeZones.aspx.vb:126-159`
**Also cited:** database/FLT_Schema.sql:17561-17573
**Plain English:** Each time zone is defined by a code, a description, a UTC offset, whether it observes daylight saving, the daylight-saving offset and its start and end, and whether it is active.
**Specification:**
  Given A new time zone 'EST' with offset -5, daylight saving on, DST offset -4, DST begin '2nd Sun Mar' and DST end '1st Sun Nov', active
  When  An administrator adds or edits it
  Then  All of these values are written to UTCTimeZone and saved through UTCTimeZoneManager.Save or Update. Only active zones appear by default.
**Parameters:** Fields: TimeZoneCode, TimeZoneDescr, TimeZoneOffset, DaylightSavingTime (bool), DaylightSavingOffset, DaylightSavingBegin, DaylightSavingEnd, IsActive. The values are entered as text and converted implicitly. Grid editing is at lines 65-86.
**Edge cases handled:** A non-numeric offset fails during implicit conversion inside a Try that only shows the error, and Save still runs afterwards (SaveButton calls LoadDataToObject outside its own Try).; No cross-field check requires the DST begin and end when DST is on.
**Suspected defect:** LoadDataToForm line 134 pre-fills the Daylight Saving Offset box with TimeZoneOffset instead of DaylightSavingOffset, so the standard offset is silently saved as the DST offset unless the user corrects it.
**Confidence:** Low — What format do DaylightSavingBegin and DaylightSavingEnd use (a fixed date, or a rule such as '2nd Sunday of March'), and are these offsets used to convert logged flight times to UTC? / Who maintains the DST begin and end dates each year, and which routine applies TimeZoneOffset and DaylightSavingOffset to flight local times?

### RULE-220: Document list is scoped to the current program, filtered by type and deleted status
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/documents/documentsList.aspx.vb:26-70`
**Plain English:** Users see only the documents of the program they are working in. By default they see non-deleted documents of every type, and they can filter by document type and by deleted status.
**Specification:**
  Given A user whose current program is 7, with the default filters (Doc Type '< All >' = 0, Is Deleted 'No' = 0)
  When  The documents list loads
  Then  DocumentInfoManager.GetList(7, 0, 0, ...) returns only program 7's documents that are not deleted, of any type.
**Parameters:** Doc type filter: 0 means all, otherwise a DocumentTypeId. IsDeleted filter: 0 = No (default), 1 = Yes, -1 = All (documentsList.aspx:45-49). Paging is enabled.
**Edge cases handled:** Choosing 'Yes' lists only soft-deleted documents. Choosing 'All' lists both.
**Confidence:** High

### RULE-221: Flown route recorded as the scheduled route
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:467-468`
**Plain English:** The route actually flown is always saved as the same route that was scheduled; there is no separate entry for the flown route.
**Specification:**
  Given A flight with scheduled route 'Route 7'
  When  The flight is saved
  Then  Both SchedRouteId and FlownRouteId are 'Route 7'
**Edge cases handled:** Route list is restricted to the selected location (lines 109, 314)
**Confidence:** Medium — Should users be able to record a flown route different from the scheduled route, or is equality intended?

### RULE-222: Fleet pages require a logged-in session scoped to the current program
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/fleet/WorkOrderModify.aspx.vb:27-34`
**Plain English:** All fleet pages require a logged-in user and scope all data to the user's current program.
**Specification:**
  Given A session without a logged-in identity
  When  Any fleet page is requested
  Then  The user is redirected to Login.aspx; otherwise ProgId is set from the identity's current program and used for all lookups and saves
**Edge cases handled:** Other pages check both Nothing and IsLoggedIn (e.g., FlightModify.aspx.vb:24-28)
**Suspected defect:** WorkOrderModify checks only for a missing identity (not IsLoggedIn) and redirects with endResponse=False without exiting, so execution continues and dereferences a null identity; a logged-out-but-present identity can access the page.
**Confidence:** High

### RULE-223: Self-service password reset emails a new random password
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/password_recovery.aspx.vb:13-23`
**Plain English:** Anyone who enters a username gets the same confirmation. If the username exists, a new random password is created, saved with a new salt, and emailed to the user's email of record.
**Specification:**
  Given A visitor enters username 'jdoe' on password_recovery.aspx
  When  They click Send
  Then  If 'jdoe' exists, the password is replaced by a random one (FltUserManager.GenerateNewPassword: new salt and hash, saved, emailed from WebmasterEmailAddress via SMTPServer). The confirmation view is shown in every case, so the page does not reveal whether the username exists.
**Parameters:** Email settings come from Web.config:75-78 (WebmasterEmailAddress, SMTPServer, SysName, LoginURL). The reset runs under a fresh anonymous FltIdentity as the acting identity.
**Edge cases handled:** No check that the user is active, not deleted, or not locked out before the reset; The reset does not clear IsLockedOut or FailedPasswordAttemptCount; If the update or email throws, the Finally block still switches to the confirmation view but the exception continues, and customErrors is Off
**Suspected defect:** An unauthenticated person who knows a username can reset that user's password at once. The old password stops working before the owner confirms anything, which lets anyone lock a user out. The reset also runs for deleted or inactive users.
**Confidence:** High

### RULE-224: Config Values report exports active entries of one selected lookup type
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/reports/rptConfigValues.aspx.vb:38-78`
**Plain English:** The Config Values report lets the user pick one configuration/lookup type from a fixed list and exports only the active values of that type for the current program.
**Specification:**
  Given A logged-in user on program 7 who selects 'WorkOrderStatus' in the Configuration Type list
  When  They click Download Data
  Then  Only active (IsActiveFilter = 1) WorkOrderStatus lookup values for program 7 are exported to Excel
**Parameters:** Fixed list of 26 lookup types from fltLookupNameList (FLTBizObjects/BusinessObject/Collections/fltLookupNameList.vb:13-38): APUType, Pilot, Emission, Engineer, EngineeringAction, EngineType, IssueCode, LengthUnit, LiquidGroup, LiquidType, LiquidUnit, Manufacturer, MaturityDef, MechAction, Model, Mechanic, Test, LoadingConfig, Propeller, PropellerType, AircraftComponent, AircraftStatusDef, WeightUnit, WorkOrderStatus, WorkOrderType, WorkShift. Active filter IsActiveFilter=1 (RptConfigValuesManager.vb:19).
**Edge cases handled:** Inactive lookup values are never included; List is populated only on first load; the lookup type is taken from the dropdown's selected text
**Confidence:** High

### RULE-225: Reports are scoped to the user's currently selected program
**Category:** Policy
**Priority:** P1
**Source:** `FLTWebApp/reports/rptWeightTracking.aspx.vb:33-38`
**Plain English:** Every report download only contains data for the program the user currently has selected in their session; the user cannot choose a different program on the page.
**Specification:**
  Given A logged-in user whose CurrentProgId is 7
  When  They click Download Data on the Weight Tracking report
  Then  RptWeightTrackingManager.GetSpreadsheet is called with progId 7 and only program 7 data is exported
**Parameters:** progId = _fltIdentity.CurrentProgId (session-held). Same pattern in rptConfigValues.aspx.vb:41-44, rptFleet.aspx.vb:36-38, rptLocations.aspx.vb:36-38, rptRegions.aspx.vb:36-38, rptRoutes.aspx.vb:36-38.
**Edge cases handled:** ProgIdHiddenField is populated with CurrentProgId on ConfigValues, Locations, Regions and Routes pages but is never read back server-side, so tampering with it does not change the scope; Fleet and WeightTracking pages do not set ProgIdHiddenField
**Confidence:** Medium — P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: at FLTWebApp/reports/rptWeightTracking.aspx.vb:33-38 the click handler takes progId straight from the session (_fltIdentity.CurrentProgId, line 36). The page has no program selector. It passes progId to RptWeightTrackingManager.GetSpreadsheet (line 38). That function (FLTBizObjects/Busines…

### RULE-226: Main fleet board hides OFF TEST aircraft; OFF TEST view shows the whole fleet
**Category:** Policy
**Priority:** P1
**Source:** `FltFleet/AircraftStatusDB.vb:83-90`
**Plain English:** The default fleet board lists only aircraft that are UP or DOWN. The "Show OFF TEST Fleet" page lists OFF TEST aircraft along with all UP and DOWN aircraft.
**Specification:**
  Given A program with aircraft A (UP), B (DOWN) and C (OFF TEST)
  When  A user opens Default.aspx (ShowOffTest=False) or OffTestFleet.aspx (ShowOffTest=True)
  Then  Default.aspx shows A and B. OffTestFleet.aspx shows A, B and C.
**Parameters:** Filter: include when (ShowOffTest AND status='OFF TEST') OR status<>'OFF TEST'. Default.aspx.vb:33 passes False. OffTestFleet.aspx.vb:34 passes True. ProgId is hardcoded to 0 in both pages.
**Edge cases handled:** The filter runs in application code after the stored procedure returns every row; On the OFF TEST page, the button that goes back is labelled "Show ON TEST Fleet" (OffTestFleet.aspx:22); ProgId 0 is always sent to listAircraftStatuses. What 0 means (all programs?) is set inside the stored procedure
**Suspected defect:** The page name and button suggest an OFF TEST-only view, but the OR condition also includes every UP and DOWN aircraft.
**Confidence:** Medium — Should the OFF TEST page list only OFF TEST aircraft? Today it shows the whole fleet. Also, what does ProgId = 0 select in listAircraftStatuses?

### RULE-227: Role edit time windows are configuration-driven
**Category:** Policy
**Priority:** P1
**Source:** `FltFleet/AircraftStatusManager.vb:61-83`
**Plain English:** Each role's allowed editing hours come from four settings per role: start hour, start minute, stop hour and stop minute. If any one is missing, that role has no edit window.
**Specification:**
  Given Web.config sets ChangeTimeStartHourFor7=8, StartMinute=0, StopHour=16, StopMinute=0
  When  Edit permission is checked for a role 7 user
  Then  Role 7 may edit from 08:00 to 16:00 PT inclusive
**Parameters:** Keys: ChangeTimeStartHourFor{RoleId}, ChangeTimeStartMinuteFor{RoleId}, ChangeTimeStopHourFor{RoleId}, ChangeTimeStopMinuteFor{RoleId}. Configured values: role 3 = 8:00-14:30, role 7 = 8:00-16:00 (FltFleet/Web.config:10-17).
**Edge cases handled:** A missing key yields an empty value, so the role is treated as having no window; A non-numeric value throws a conversion error and the edit check fails with an exception
**Confidence:** High

### RULE-228: Unhandled-error page says the administrator was notified, but nothing sends a notification
**Category:** Policy
**Priority:** P1
**Source:** `FltFleet/ErrorPages/Oops.aspx:14-15`
**Plain English:** The generic error page tells users 'The website administrator has been notified', but no code that sends that notification was found, and no configuration in the files checked sends users to this page.
**Specification:**
  Given An unhandled server error happens while a user is working in FLTFleet
  When  The user lands on /ErrorPages/Oops.aspx
  Then  The page shows 'An Error Has Occurred - There was a problem encountered with your last request. The website administrator has been notified.' Its code-behind Page_Load is empty (Oops.aspx.vb:6-8), so the page itself sends no notification and logs nothing
**Parameters:** Message text only; no notification channel, recipient or threshold appears in the code
**Edge cases handled:** No reference to Oops.aspx was found in Web.config httpErrors (only 4xx codes are mapped, all to NotFound.aspx), and no Application_Error, mail or SMTP handler was found by grep in Global.asax.vb; Any notification would have to happen somewhere else (for example a logging module); none was found in these files
**Suspected defect:** The promise to users ('administrator has been notified') appears only in the page text. No code that sends a notification and no routing to this page was found.
**Confidence:** Low — How is the administrator actually notified of unhandled errors (ELMAH, Application_Error, an email or monitoring tool), and how do users reach Oops.aspx? Should the rewrite actually send this notification?

### RULE-229: Client and authorization errors are shown as a generic 'Page Not Found' page
**Category:** Policy
**Priority:** P1
**Source:** `FltFleet/Web.config:71-82`
**Plain English:** When a request fails because it was bad, unauthenticated, payment-required, forbidden or not found, the user is redirected to a single 'Page Not Found' page, so nothing reveals whether the resource exists or that access was refused.
**Specification:**
  Given A user of the Aircraft Status Monitor requests a page they are not allowed to see (HTTP 403), or a URL that does not exist (HTTP 404)
  When  IIS returns status 400, 401, 402, 403 or 404 (any sub-status)
  Then  The browser is redirected (HTTP 302) to /ErrorPages/NotFound.aspx, which shows 'Page Not Found - The page you requested could not be found.' The page does no further processing: Page_Load is empty (NotFound.aspx.vb:6-8)
**Parameters:** Status codes mapped: 400, 401, 402, 403, 404; subStatusCode=-1 (all); responseMode=Redirect; target path /ErrorPages/NotFound.aspx (wiring is in FltFleet/Web.config:71-82)
**Edge cases handled:** 401 and 403 (authentication and authorization failures) are deliberately disguised as 'not found'; responseMode=Redirect means the final response the client sees is a 200 for NotFound.aspx, not the original status code; 5xx server errors are not mapped here
**Suspected defect:** Because the response is a redirect, the client and monitoring tools see a successful 200 page instead of the original 4xx status code. A 401 that redirects to an anonymous page also skips any login challenge.
**Confidence:** Medium — Is it deliberate security policy to show 401/403 (access denied) as 'Page Not Found', and must the rewrite keep this? Also, should the original status code be kept instead of a redirect that returns 200?

### RULE-230: Login failure and password recovery do not reveal which accounts exist
**Category:** Policy
**Priority:** P1
**Source:** `FltFleet/password_recovery.aspx.vb:13-23`
**Plain English:** Failed logins always show the same generic message, and password recovery always shows the 'new password sent' confirmation whether or not the username exists.
**Specification:**
  Given A visitor enters an unknown username on the password recovery page
  When  They click Send
  Then  No password is generated, but the confirmation view ("A new password has been generated...") is still shown
**Parameters:** Login failure text: "Failed Login Attempt - either Username or Password is incorrect" (Login.aspx.vb:18-34). Password generation and email are done in FltUserManager.GenerateNewPassword.
**Edge cases handled:** For a known user, anyone who knows the username can trigger a password reset with no further verification; Login.aspx.vb declares a _loginTrys counter but never uses it, so this module has no lockout
**Suspected defect:** An unauthenticated caller can force a password reset for any known username, which makes denial of service by resets possible.
**Confidence:** Medium — Is it intended that anyone who knows a username can reset that user's password without verification, and that this module enforces no login lockout or attempt limit?

### RULE-231: User account maintenance overwrites security state
**Category:** Policy
**Priority:** P1
**Source:** `database/FLT_Schema.sql:15932-15964`
**Plain English:** Saving a user record replaces every account field, including password, salt, super-user, approved and locked-out flags, failed-attempt counters and last-login date, with the values sent by the caller.
**Specification:**
  Given User 'jsmith' has FailedPasswordAttemptCount 3 and IsLockedOut=1
  When  An admin saves the profile without supplying the counters or the lockout flag
  Then  Because of the defaults, IsLockedOut becomes 0, FailedPasswordAttemptCount becomes 0, IsApproved becomes 1, IsSuperUser becomes 0, and utcLastLoginDate becomes NULL
**Parameters:** Original source database/FLT_Schema.sql:15897-15964. Defaults: IsSuperUser=0, IsApproved=1, IsLockedOut=0, FailedPasswordAttemptCount=0, FailedPasswordAnswerAttemptCount=0, DefaultProgId=0, and dates NULL. Password is NVARCHAR(128) and PasswordSalt is NVARCHAR(128); values are not shown here.
**Edge cases handled:** The password is stored as the caller sends it; the database does no hashing; The user name cannot be changed (it is the key); MgrUserName is not checked against existing users
**Suspected defect:** The defaults on the security parameters mean a partial update can silently unlock an account, approve it, remove super-user rights, or clear the last-login and lockout history.
**Confidence:** High

### RULE-232: Program-level forecasting parameters
**Category:** Policy
**Priority:** P1
**Source:** `database/FLT_Schema.sql:16889-16915`
**Also cited:** FLTBizObjects/DataAccess/ProgramDB.vb:121-147
**Plain English:** Each program stores planning settings: a near-end usage threshold, average daily usage and number of flight days per week, along with status, open and close dates, value and finance codes.
**Specification:**
  Given Program 2 is saved with NearEndUsage 20, AvgDailyUsage 4, WeeklyFlightDays 5
  When  updateProgram succeeds
  Then  These integers are stored on the program for later end-of-test forecasting and alerts (calculated elsewhere)
**Parameters:** Original source database/FLT_Schema.sql:16876-16878 and 16889-16915. NearEndUsage, AvgDailyUsage and WeeklyFlightDays are INT (default 0). ProgStatus is tinyint (default 0). DateOpened and DateClosed are varchar(50) text. ActualValue is money (default 0).
**Edge cases handled:** The values are whole numbers only, so fractional hours per day are truncated; If any of these is 0 (the default), a later forecast that divides by it could fail; The procedure does not check DateClosed >= DateOpened
**Confidence:** Low — How are NearEndUsage, AvgDailyUsage and WeeklyFlightDays used (for example, estimating end of testing = remaining usage / AvgDailyUsage, in flight days)? Which procedure or screen uses them, and what are the ProgStatus values? / What do NearEndUsage, AvgDailyUsage and WeeklyFlightDays drive (e.g., projected due dates for inspections), what are the ProgStatus codes, and must DateClosed be set when…

### RULE-233: Audit stamp of modifying user and UTC time
**Category:** Policy
**Priority:** P1
**Source:** `database/FLT_Schema.sql:17627-17653`
**Plain English:** Every edit to business records stores the UTC time of the change and the user name of the person who made it.
**Specification:**
  Given User 'jsmith' edits Aircraft 10 at 2026-10-15 14:00 UTC
  When  updateAircraft succeeds
  Then  Aircraft.UTCDateModified = 2026-10-15 14:00 and StampUserName = 'jsmith'
**Parameters:** Original source database/FLT_Schema.sql:17652-17653 (the same in most update procedures). The time comes from GetUTCDate(). StampUserName is NVARCHAR(20).
**Edge cases handled:** updateDocumentType, updateRegion, updateUTCTimeZone and updateWeightDefType record neither the user nor the time of the change; The user name is supplied by the caller and is not checked against FltUser; No history or audit table is written; only the latest modifier is kept
**Confidence:** High

### RULE-234: Spreadsheet reports of active reference data
**Category:** Policy
**Priority:** P2
**Source:** `FLTBizObjects/BusinessLogic/RptFleetManager.vb:13-36`
**Plain English:** Fleet, location, region and configuration-value spreadsheets list only active (and non-deleted where supported) records for the chosen program, and return no workbook when there is nothing to report.
**Specification:**
  Given Program 3 with 4 active aircraft and 1 inactive
  When  The Fleet spreadsheet is requested
  Then  A workbook with sheet 'Fleet' and 4 data rows (airframe start/current/offset, meter unit, engine hours) is returned; for a program with no active aircraft, Nothing is returned
**Parameters:** IsActiveFilter=1, IsDeletedFilter=0; same pattern in RptLocationsManager.vb:13-36, RptRegionsManager, RptConfigValuesManager.vb:13-36 (by lookup name)
**Edge cases handled:** Locations sheet is named 'Locactions' (typo); Any data error is reported only as 'An application error occurred'
**Confidence:** High

### RULE-235: Report exports cover active, non-deleted records of the program
**Category:** Policy
**Priority:** P2
**Source:** `FLTBizObjects/BusinessLogic/RptRoutesManager.vb:12-35`
**Plain English:** The Routes and Weight Tracking spreadsheet exports include every active, non-deleted record for the chosen program, one row per record. If there are no records, no workbook is produced.
**Specification:**
  Given Program 12 has 3 active routes and 1 inactive route
  When  GetSpreadsheet(identity, 12) is called
  Then  A 'Routes' sheet is returned with a header row (Id, LocationId, Name, Description) and 3 data rows. If no routes match, the result is Nothing instead of an empty workbook.
**Parameters:** Filters: IsActiveFilter = 1, IsDeletedFilter = 0, no paging. The Weight Tracking report (RptWeightTrackingManager.vb:13-36) does the same for WeightDef, with columns Id, WeightDesc, Weight, WeightTypeDescr.
**Edge cases handled:** Any error is logged and replaced with the generic 'An application error occurred'
**Confidence:** High

### RULE-236: Documents are stored in fixed-size chunks
**Category:** Policy
**Priority:** P2
**Source:** `FLTBizObjects/DataAccess/DocumentDB.vb:61-97`
**Plain English:** An uploaded document is saved as an empty stub record, then its content is appended in chunks whose size is set by the FileBufferSize setting.
**Specification:**
  Given FileBufferSize = 8192 and a 20,000-byte upload
  When  The document is stored
  Then  Chunks of 8,192, 8,192 and 3,616 bytes are appended at offsets 0, 8192 and 16384
**Parameters:** FileBufferSize comes from app settings and has no default. Stored procedures: addDocument, then appendDocumentChunk.
**Edge cases handled:** If FileBufferSize is missing, the conversion fails and the upload errors; The stub and chunks are not wrapped in a transaction, so a failure part-way leaves a partial document; On read, the content is limited to DocumentSize bytes (lines 131-168)
**Suspected defect:** Uploads are not transactional, and a missing FileBufferSize setting breaks both upload and download.
**Confidence:** Medium — Is a partially stored document acceptable after an upload fails, or should the upload be all-or-nothing?

### RULE-237: Empty result lists are reported as not found
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebAPI/FltWebApi/Controllers/FleetController.cs:40-43`
**Plain English:** List endpoints return 404 when there are no records, except the fleet list, which returns 500 when a location has no aircraft.
**Specification:**
  Given Location 3 of program 1 has no aircraft
  When  A client calls /programs/1/locations/3/fleet
  Then  HTTP 500 InternalErrorAircraftGetList is returned, while empty programs, locations, regions, routes, weight lists, flight infos and lookups return 404
**Parameters:** Status: 404 for empty lists generally; 500 for empty fleet
**Edge cases handled:** Clients cannot distinguish an empty fleet from a server failure
**Suspected defect:** Empty fleet returns 500 instead of 404 or an empty 200 list, inconsistent with every other list endpoint.
**Confidence:** High

### RULE-238: Flight records both scheduled and actually flown route
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebAPI/FltWebApi/Models/Flight.cs:15-22`
**Plain English:** A flight is logged for an aircraft at a location by an evaluator on a flight date and work shift, and records both the scheduled route and the route actually flown so that deviations can be seen.
**Specification:**
  Given A flight scheduled on route 'R1' that actually flew route 'R2'
  When  The flight is logged
  Then  SchedRouteId points to R1 and FlownRouteId points to R2
**Parameters:** Route catalog: Route.cs:11-16. WorkShiftIndicatorId is a lookup value (LookUpValue.cs:11-16). FlightDate, DepartureTime and ReturnTime are strings.
**Edge cases handled:** Dates and times are strings, so ReturnTime after DepartureTime is not enforced at the model level
**Confidence:** Medium — Is a scheduled-vs-flown route mismatch reported or checked anywhere, and must ReturnTime be after DepartureTime?

### RULE-239: Evaluator comments carry component, issue code and rating
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebAPI/FltWebApi/Models/FlightComment.cs:11-19`
**Plain English:** Evaluator comments on a flight are tied to a component and an issue code, carry a time and a numeric rating, and engine runs record engine speed with start and end times.
**Specification:**
  Given An evaluator notes vibration on component 12 with issue code 3
  When  The comment is added to the flight
  Then  A FlightComment is stored with ComponentId 12, IssueCodeId 3, the comment text, the time and a CommentRating
**Parameters:** CommentRating is a short with an unspecified scale. EngineRun (EngineRun.cs:11-17) has EngineSpeed (int), RunStartTime and RunEndTime (strings).
**Edge cases handled:** The rating scale is not defined in code; EngineRun times are strings, so end-after-start is not checked
**Confidence:** Low — What is the CommentRating scale and what does each value mean (for example, severity)? Is there a valid range for EngineSpeed?

### RULE-240: Locations belong to a test program
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebAPI/FltWebApi/Models/Location.cs:11-16`
**Plain English:** Every operating location belongs to one program, so locations, and the aircraft and flights at them, can be scoped by program.
**Specification:**
  Given Location 'Site A' with ProgId 4
  When  Locations are listed
  Then  Site A is linked to program 4 (Program.cs: ProgID, name, description, version)
**Parameters:** Program catalog: Program.cs:11-17.
**Edge cases handled:** Aircraft.CurrentLocationId and Flight.LocationId link aircraft and flights to locations, and through them to programs
**Confidence:** Medium — Are users or flights limited to locations within their program?

### RULE-241: HTTP client errors routed to a 'Page Not Found' page
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/Web.config:50-61`
**Plain English:** Status codes 400 to 404, including unauthorized and forbidden, all send the user to the Not Found page. Detailed ASP.NET errors are shown because custom errors are off.
**Specification:**
  Given A user requests a page that returns 403 Forbidden
  When  IIS handles the error
  Then  The browser is redirected to /ErrorPages/NotFound.aspx, which says 'Page Not Found'. Unhandled exceptions show the raw error, because customErrors mode = Off; the Oops page is only the default redirect when custom errors are on.
**Parameters:** Status codes 400, 401, 402, 403, 404 go to /ErrorPages/NotFound.aspx (responseMode Redirect). customErrors defaultRedirect = ~/ErrorPages/Oops.aspx with mode Off. compilation debug = true.
**Edge cases handled:** Both error pages use FLT.Master, so anonymous users are redirected to Login instead; Oops.aspx says 'The website administrator has been notified', but Application_Error (Global.asax.vb:34-35) is empty and nothing sends a notification
**Suspected defect:** customErrors is Off and debug is true, so production users see stack traces. The Oops page claims an admin notification that the code never sends.
**Confidence:** High

### RULE-242: Upload and request size limits
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/Web.config:67-68`
**Plain English:** Uploaded files are limited to about 10 MB, and the platform rejects requests over about 10 MB.
**Specification:**
  Given A user uploads a 12,000,000-byte file
  When  The request reaches the application
  Then  It is over both MaxFileUploadSize (10,000,000 bytes) and maxRequestLength (10,000 KB = 10,240,000 bytes) and is rejected.
**Parameters:** MaxFileUploadSize = 10000000 (bytes); FileBufferSize = 4096; httpRuntime maxRequestLength = 10000 KB and executionTimeout = 10000 s (Web.config:14).
**Edge cases handled:** A file between 10,000,000 and 10,240,000 bytes passes the platform limit but should fail the app-level MaxFileUploadSize check, if that check is enforced
**Confidence:** Medium — Where is MaxFileUploadSize enforced (the documents upload pages?), and is 10 MB still the business limit?

### RULE-243: Weight definition types carry a description and display sort order
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/appConfiguration/WeightDefTypes.aspx.vb:123-136`
**Plain English:** Weight definition types are a configurable lookup list. Each has a description and a sort order that controls the order in which it is shown.
**Specification:**
  Given A new weight definition type 'Max Takeoff Weight' with sort order 10
  When  An administrator saves it
  Then  WeightDefTypeId is set to -1 as a placeholder, and the description and sort order are saved through WeightDefTypeManager.Save.
**Parameters:** Placeholder WeightDefTypeId = -1. SortOrder is entered as text and converted implicitly. Grid editing is at lines 59-74.
**Edge cases handled:** A non-numeric sort order fails during implicit conversion.
**Confidence:** Medium — Which weight definition types does flight logging depend on, and does any calculation key off a specific WeightDefTypeId?

### RULE-244: Reference-data lists default to active, non-deleted records and ask for confirmation before deleting
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/appConfiguration/programs.aspx:26-38`
**Plain English:** The program and time-zone lists show only active (and, for programs, non-deleted) entries unless the user widens the filter. Every delete asks for confirmation first.
**Specification:**
  Given An administrator opens the Programs page
  When  The page loads with the default filters
  Then  Only programs with IsActive = 1 and IsDeleted = 0 are listed. Clicking Delete asks 'Are you certain that you want to delete this entry?' before calling ProgramManager.Delete.
**Parameters:** IsActive filter: 1 Active Only (default), 0 Inactive Only, -1 All. IsDeleted filter: 0 No Deleted (default), 1 Only Deleted, -1 All. TimeZones has the same IsActive filter (TimeZones.aspx:22-24). Delete confirmation appears in DocumentTypes.aspx:60, WeightDefTypes.aspx:60, TimeZones.aspx:124 and programs.aspx:74.
**Edge cases handled:** The program list call does not pass the user identity (programs.aspx.vb:33), unlike the other lists.
**Confidence:** High

### RULE-245: Document download is streamed as an attachment in fixed-size chunks
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/documents/DocumentShow.aspx.vb:24-63`
**Plain English:** Downloading a document sends its stored content as a file attachment under its original name, read in chunks of the configured buffer size.
**Specification:**
  Given Document id 42 named 'Manual.pdf', 10,000 bytes, with FileBufferSize = 4096
  When  The user selects the document in the list, which redirects to documentShow.aspx?id=42
  Then  Three writes are sent (4096, 4096 and 1808 bytes) with Content-Disposition 'attachment; filename=Manual.pdf'.
**Parameters:** FileBufferSize = 4096 (Web.config:67). Access is by the query-string id. Metadata access goes through DocumentInfoManager.GetItem with the user's identity.
**Edge cases handled:** Any exception is swallowed, because ProcessException is empty, and the user gets a blank response.; The page does not check that the document belongs to the user's current program. It relies on BL authorisation.; A non-numeric id makes CInt throw outside the Try block.
**Suspected defect:** ContentType is set to 'application\octet' (backslash, not a valid MIME type) instead of 'application/octet-stream' or the document type's MimeType. Errors are silently swallowed.
**Confidence:** Medium — Should a user be able to download a document that belongs to a different program by changing the id in the URL, and should a soft-deleted document still be downloadable?

### RULE-246: Pilot list includes non-active pilots; pilots can be added inline
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/fleet/FlightModify.aspx.vb:351-373`
**Plain English:** Most lookup dropdowns show only active entries, but the pilot list uses a different activity filter, and a user can add a new pilot from the flight page which is then selected automatically.
**Specification:**
  Given A pilot was marked inactive
  When  The flight page loads its pilot list via LoadDDL
  Then  The lookup is requested with IsActiveFilter = 2 instead of 1
  And   A newly added pilot (PilotSaveButton_Click, lines 1009-1030) is created active and preselected
**Parameters:** IsActiveFilter: 1 for all lookups, 2 for 'PILOT'
**Edge cases handled:** Initial pilot list in PopulateDDLs (lines 302-309) uses GetList without an activity filter
**Confidence:** Low — What does IsActiveFilter = 2 mean in fltLookupBaseManager (all records? inactive only?), and why are pilots treated differently from other lookups?

### RULE-247: List page default filters: active, not deleted, approved
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/fleet/FlightsList.aspx.vb:37-79`
**Plain English:** Flight, fleet and work order lists default to showing active, non-deleted records (flights also default to approved only), and the flight date range filters must be valid dates or empty.
**Specification:**
  Given A user opens the flights list
  When  The page loads
  Then  Flights are filtered IsApproved = Yes(1), IsActive = Yes(1), IsDeleted = No(0); entering 'abc' in Date From shows 'Date From value must either be a valid date or be empty'
**Parameters:** Filter values: 1=Yes, 0=No, -1=All (FlightsList.aspx:56-71, FleetList.aspx:47-56); approved filter has no 'All' option
**Edge cases handled:** An invalid date still remains in the textbox and is passed on the next rebind
**Suspected defect:** WorkOrdersList.aspx.vb:41 ignores both its location filter and its IsDeleted filter (passes 0/String.Empty), and no change handlers are wired for them; WorkOrdersList_SelectedIndexChanged names the work order id 'aircraftId' (line 56).
**Confidence:** High

### RULE-248: Report export file naming convention
**Category:** Policy
**Priority:** P2
**Source:** `FLTWebApp/reports/rptConfigValues.aspx.vb:50-55`
**Plain English:** Downloaded reports are Excel files named with the program name, the report name, and a server timestamp.
**Specification:**
  Given Program 'ContosoAir' and the Fleet report downloaded at 2026-10-15 14:03:22 server time
  When  The download is generated
  Then  The file is named ContosoAir_Fleet_20261015T140322.xlsx and sent as an .xlsx attachment
**Parameters:** Pattern {ProgName}_{ReportName}_{yyyyMMddTHHmmss}.xlsx; ReportName = selected lookup type (ConfigValues), Fleet, Locations, Regions, Routes, WeightTracking. See rptFleet.aspx.vb:44, rptLocations.aspx.vb:44, rptRegions.aspx.vb:45, rptRoutes.aspx.vb:45, rptWeightTracking.aspx.vb:44.
**Edge cases handled:** Timestamp is server local time, not UTC; Filename quoting is built by a trailing literal quote in the name string closing the quote opened in the header
**Confidence:** High

### RULE-249: Aircraft status board lists only non-deleted aircraft, sortable by location, MSN or date
**Category:** Policy
**Priority:** P2
**Source:** `FltFleet/sql_changes_for_aircraft_status.sql:58-104`
**Also cited:** database/FLT_Schema.sql:13358-13395
**Plain English:** The status board shows every non-deleted aircraft, optionally limited to one program, with its location, status and comments. It can be sorted by location, MSN or most recent update.
**Specification:**
  Given ProgId 0 and SortBy 'Date'
  When  listAircraftStatuses runs
  Then  All non-deleted aircraft are returned, most recently updated first, then by MSN. Aircraft without a status row still appear, with NULL status.
**Parameters:** SortBy values: 'Location' (LocationName DESC, then MSN), 'MSN', 'Date' (UTCDateModified DESC, then MSN); ProgId 0 = all programs. fetchAircraftStatus (lines 31-46) gives the same view for a single MSN.
**Edge cases handled:** Any other SortBy value returns no result set; Location is sorted in descending order; Inactive (but not deleted) aircraft are included
**Suspected defect:** An unrecognised SortBy value returns nothing instead of falling back to a default order. | An unrecognized @SortBy returns no rows at all.
**Confidence:** Medium — Is AircraftStatus meant to hold one row per aircraft (current status), or a history? Should an unknown sort option fall back to MSN order instead of returning nothing?

### RULE-250: Flight log search filters and defaults
**Category:** Policy
**Priority:** P2
**Source:** `database/FLT_Schema.sql:12326-12383`
**Plain English:** The flight list hides deleted flights by default, shows approved and unapproved, active and inactive flights unless filtered, treats 0 or an empty value as 'no filter', and matches aircraft text against serial, registration, MSN or ship number.
**Specification:**
  Given No filters are supplied except AircraftTextMatch 'N12%'
  When  listFlightInfos runs
  Then  every non-deleted flight dated 1900-01-01 through 2100-12-31 whose aircraft SerialNbr, RegistrationNbr, MSN or ShipNbr is LIKE 'N12%' is returned, ordered by MSN, then AirframeHoursEnd descending, then FlightDateSort descending
**Parameters:** Tri-state filters: 1 = only true, 0 = only false, -1 = all. Defaults: IsApprovedFilter -1, IsActiveFilter -1, IsDeletedFilter 0. Default date range 1900-01-01 to 2100-12-31. Original location: database/FLT_Schema.sql:12326-12387.
**Edge cases handled:** @Start, @Count and @Total are declared but never used, so there is no paging and @Total is never set.; The date filter converts the varchar FlightDate to a DATETIME, so an unparseable stored date makes the query fail.
**Suspected defect:** Paging parameters (@Start, @Count) and the @Total output are accepted but ignored.
**Confidence:** High

### RULE-251: Aircraft search, filtering and paging
**Category:** Policy
**Priority:** P2
**Source:** `database/FLT_Schema.sql:12869-12904`
**Also cited:** tsql/alter_procedure_listAircraftInfos.sql:28-59
**Plain English:** The aircraft list can be filtered by program, current location, active and deleted status (each filter has the values 1, 0 or -1 for any), and by a text pattern matched against serial, registration, MSN or ship number. The list is sorted by MSN and can be paged.
**Specification:**
  Given Default filters: ProgId=0 (all), IsActiveFilter=-1 (any), IsDeletedFilter=0 (not deleted), text ''
  When  A user searches with AircraftTextMatch 'N12%', Start=11, Count=10
  Then  Non-deleted aircraft whose SerialNbr, RegistrationNbr, MSN or ShipNbr matches 'N12%' are numbered in MSN order. Rows 11-20 are returned, and @Total reports the full number of matches.
**Parameters:** Original source database/FLT_Schema.sql:12869-12903 and 12962-12966. When paging is off (Start=-1 or Count=-1), the range is 0 to 999999. Position numbers start at 1. CurrentLocationId NULL is treated as 0.
**Edge cases handled:** Aircraft without a matching Model or AircraftStatusDef row are dropped by INNER JOIN in the final select but still counted in @Total; When paging is off, only the first 999,999 rows are returned; An aircraft with no location is shown as 'Not Assigned'; The text match uses LIKE as given, so the caller must add wildcards
**Suspected defect:** @Total counts aircraft that the final INNER JOINs to Model and AircraftStatusDef can drop, so the total can exceed the rows actually shown. | @Total counts #temp rows before the Model and AircraftStatusDef inner joins, so the total can be higher than the number of rows actually returned. Paging is also limited to 999999 rows.
**Confidence:** High

## Rules requiring SME confirmation

- **RULE-002** (Medium): P0 panel doubts spec fidelity: P0 is justified. Airframe hours are the main figure a flight log tracker produces. They feed aircraft time and maintenance tracking, which is a safety and data-integrity concern. Every flight Insert and Update sets the value (FlightManager.vb:58 and :104). The card is not faithful on rounding. It says the sum is "HobbsStart + UsedMeterOffset, rounded to 1 decimal".…
- **RULE-005** (Medium): P0 panel doubts spec fidelity: The basic arithmetic is right: Program.vb:67-69 uses DateTime.Now.AddDays(-nbr), so for N=3 a run at 2026-10-15 02:00 gives 2026-10-12 02:00 local time, with the time of day kept. NbrOfDaysHistory=3 is confirmed at App.config:7. But the card misses or misstates several behaviors that matter if this becomes the equivalence contract. (1) Silent fallback: the result of…
- **RULE-006** (Medium): Citation was corrected by referee (Flight.cs:38-44 only declares properties (EngineHoursStart/End, HobbsStart/End, MeterUnitId, UsedMeterOffset) and has no calculation logic. The formula is in FlightsController.cs:159-160, inside LoadNewBizObjectFlightBaseProperties: AirframeHoursEnd = HobbsEnd + UsedMeterOffset and AirframeHoursStart = HobbsStart + UsedMeterOffset, set on the FLTBizObjects BO Fl…
- **RULE-014** (Medium): Should end-of-work meter be required to be greater than or equal to start-of-work meter (and fault meter), and should invalid meter input be rejected instead of silently ignored or zeroed?
- **RULE-015** (Medium): P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (The card matches the code. In FLTBizObjects/DataAccess/FlightDB.vb:565-570, a non-NULL stored TakeoffWeight is assigned first. If the result is still 0 (NULL, or a stored 0), it is replaced with AirframeWeight + Cargo1Weight + Cargo2Weight + BallastWeight. A NULL component counts as 0 in two places:…
- **RULE-016** (Medium): Is one decimal place (0.1 hour) the official precision for Hobbs, airframe and engine hours, and three decimals for liquid fills?
- **RULE-019** (Medium): Is Aircraft.AirframeHoursCurrent meant to be the raw Hobbs meter reading (stored hours minus offset) or true airframe hours? The fleet endpoint subtracts the offset while the flight endpoint adds it. / Citation was corrected by referee (The rule is real, but the citation points at the wrong lines. Lines 114-115 only copy AircraftGUID and CurrentLocationId into the response object. They do no hour…
- **RULE-022** (Medium): When the Hobbs reading on a liquid fill is left blank, should the airframe-hours reading be the aircraft's current airframe hours (consistent with the defaulted Hobbs) rather than 0.0?
- **RULE-024** (Medium): Should usage count only approved flights, and should UsedMeterOffset or MeterUnitId adjust the Hobbs difference?
- **RULE-029** (Medium): Which meter is the authoritative measure of flight usage, airframe hours or Hobbs, and what is UsedMeterOffset meant to adjust?
- **RULE-034** (Low): Must the sum of RegionTime hours equal the flight's Hobbs duration (HobbsEnd - HobbsStart), and to what precision?
- **RULE-036** (Medium): Should child-record edits saved on their own (outside the work-order save) also show the 'edited by another user' message? Today those wrappers hide it. / Is ConcurrencyId a SQL Server rowversion/timestamp column (changes automatically), or does a trigger or the application increment it? If neither, the second save would succeed and the check would not work.
- **RULE-037** (Medium): Citation was corrected by referee (The behavior is real, but the cited lines cover only the first step. CredentialHelper.vb:37-60 reads the stored credential. It calls CredRead with CRED_TYPE_GENERIC (1) and throws 'Credential not found' if that fails (lines 41-42). It decodes the password as UTF-16 with CredentialBlobSize \ 2 characters (line 51). It returns UserName and Password. These lines do…
- **RULE-043** (Medium): P0 panel doubts spec fidelity: P0 is justified. This is the authorization gate on who can change an aircraft's UP/DOWN/OFF TEST status and when. That is security and data-integrity control over operational fleet state, not a minor validation. Fidelity is only partial. Several parts match the code. AircraftStatusManager.vb:28-29 checks Fleet CanEdit first. Lines 37-39 let super users bypass the wi…
- **RULE-044** (Medium): Does the calling application wrap addFlight in a transaction and roll back when 'Duplicate Flight Entry' is raised, or do duplicate flight rows actually get saved today? Also, should updateFlight enforce the same uniqueness rule? / Should a duplicate flight be hard-blocked with no insert? Should soft-deleted or inactive flights count toward the duplicate check?
- **RULE-053** (Medium): Citation was corrected by referee (Lines 125-138 of FLTWebApp/appConfiguration/DocumentTypes.aspx.vb (LoadDataToObject) only do part of what the rule describes. Line 130 sets DocumentTypeId = -1 as a placeholder. Lines 131-132 copy the HTML-decoded FileExtension and MimeType from the text boxes. SaveButton_Click (lines 92-102) calls this method before DocumentTypeManager.Save. There is no validat…
- **RULE-055** (Medium): P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (The code at FLTBizObjects/BusinessObject/Flight.vb:1368-1390 matches the rule card. Engine hours: if EngineHoursStart is greater than the aircraft's current engine hours, the code raises 02-00-01X (line 1368). If it is less, it raises 02-00-01Y (line 1371). Hobbs: if HobbsStart + UsedMeterOffset is…
- **RULE-056** (Medium): The airtime threshold is 2000 meter units, while the engine threshold is 24 hours. Is 2000 the intended per-flight limit, or should it be expressed in hours like the engine limit?
- **RULE-057** (Medium): Are the limits 150 gal / 600 L / 600 qt for Jet-A, 5 gal / 20 L / 20 qt for coolant and 7 gal / 30 L / 30 qt for hydraulic correct, and should they be configurable per aircraft model?
- **RULE-061** (Medium): Citation was corrected by referee (FLTWebApp/program/locations.aspx.vb:147-163 contains no validation. It holds only LoadDataToForm and LoadDataToObject, which copy ProgId, LocationName and TimeZoneId between the form and the object (lines 157-159). The rule itself is real and lives in Location.Validate() at FLTBizObjects/BusinessObject/Location.vb:267-299. That method requires ProgId (269-275),…
- **RULE-062** (Medium): Citation was corrected by referee (The cited lines (FLTWebApp/program/Regions.aspx.vb:113-145) don't do any validation. SaveButton_Click calls LoadDataToObject, which copies ProgId from ProgIdHiddenField (the "belongs to the current program" part) and the HTML-decoded Code/Name text into _Region. It then calls RegionManager.Save and shows any broken rules through ProcessException. The real checks…
- **RULE-063** (Medium): Citation was corrected by referee (The behavior is real, but the cited lines cover only part of it. FLTWebApp/program/Routes.aspx.vb:151-167 (PopulateModifyDropDownLists) does fill the Location picker with a '< Select Location> ' placeholder (value 0) followed by LocationManager.GetList(ProgId, 0, 1, 0, -1, -1, ...). The signature at FLTBizObjects/BusinessLogic/LocationManager.vb:20 confirms that…
- **RULE-065** (Medium): When a new work order and its first child lines are saved together, does the UI or DAL stamp the children with a WorkOrderId (e.g. -1) before validation? If not, a new work order with lines can never pass validation.
- **RULE-067** (Medium): Should negative or zero weights be valid for any weight tracking type, and are there per-type limits on weight values?
- **RULE-069** (Medium): P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: WorkOrder.vb:837-925 adds a non-overridable BrokenRule (flags False, False) for each of the cited fields: ProgId 03-00-001, AircraftId -002, LocationId -003, WorkOrderTypeId -004, WorkOrderStatusId -005, RequestDate -008, EngineerId -011 and EngineeringActionId -012. Every ID field except…
- **RULE-072** (Medium): P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (The rule matches the code. In WorkOrder.vb:930-971, Validate loops over the reasons, instructions, performed-work lines, parts, engineer comments and mechanic comments. It calls each child's Validate and adds every child BrokenRule to Me.BrokenRules, which is the same list as _brokenRulesList (prope…
- **RULE-075** (Medium): Citation was corrected by referee (ConfigValues.aspx.vb:113-149 contains only UI plumbing. AddButton_Click (113-119) creates an fltLookupBase and sets LookupName from the selected type and ProgId from the hidden field. LoadDataToForm and LoadDataToObject (130-142) copy StringValue, SortOrder and IsActive between the form and the object. PopulateDropDownlists (144-149) fills the type list from flt…
- **RULE-078** (Medium): Which fields define a duplicate flight in the addFlight stored procedure (for example aircraft + flight date + departure time, or the FlightGuid)?
- **RULE-085** (Medium): Are weights used in any weight-and-balance or total-load calculation downstream? If so, what units are allowed and how are they converted?
- **RULE-086** (Low): What values are valid for each checklist field (0/1 boolean, or a graded scale for oil/hydraulic level and nacelle condition)? Must a failed pre-flight check block or flag the flight?
- **RULE-090** (Medium): Should users be able to acknowledge and override document warnings? If so, which warnings can be overridden, and should the override be audited?
- **RULE-095** (Medium): What do NearEndUsage, AvgDailyUsage and WeeklyFlightDays drive downstream (for example forecasts or near-end alerts), and what are their valid ranges? Must DateClosed be on or after DateOpened?
- **RULE-098** (Medium): Can a user be their own manager, and what should the profile show when the assigned manager has been deactivated?
- **RULE-101** (Medium): Should an assignment with only an estimated end-of-test date on or after the report date count as active, and should the report show one row per aircraft (soonest-ending assignment) or one per location?
- **RULE-102** (Medium): Should flights of inactive (but not deleted) aircraft be excluded from the flight data report?
- **RULE-103** (Medium): Citation was corrected by referee (The behavior is real, but the cited range only covers part of it. Lines 496-545 contain ValidateGenericComment and SortGenericCommentList. ValidateGenericComment branches on LCase(SourceTable) into aircraftcomment, flightcomment, woengineercomment and womechaniccomment, and adds a "Unable to determine the Comment Type" BrokenRule for any other value. SortGeneric…
- **RULE-109** (Medium): Should an aircraft location with no arrival date be saveable? Today the parameter is left unset, which the stored procedure may reject.
- **RULE-110** (Medium): Are passwords and security answers hashed before they reach FltUserDB, and what IsActive default does addFltUser apply?
- **RULE-112** (Medium): Is 10 the most severe or the best rating, and should aircraft-level comments allow 'not rated' (0) like the other comment types?
- **RULE-116** (Medium): P0 panel doubts spec fidelity: P0 is justified. This is the persistence contract for aircraft maintenance work orders. A partial save would leave a work order out of step with the parts, performed work and comments recorded against it, which is an aviation-safety and data-integrity problem. Every rewrite has to preserve this behavior. The rule is not fully faithful, though. Parts of it are confir…
- **RULE-117** (Medium): What does the boolean third argument of FlightManager.Insert control, and which system/role moves a flight from unapproved to approved?
- **RULE-121** (Medium): Should an aircraft be allowed to be assigned to the same location more than once? UpdateAircraftLocation matches the existing row by LocationId rather than AircraftLocationId.
- **RULE-123** (Medium): Is it intended that generating an export creates missing AircraftLocation records (stamped 'export')? Should the file timestamp suffix show the server's local offset when the time is UTC?
- **RULE-125** (Medium): Where are the concurrency check, temporary-ID resolution and soft-delete persistence enforced (DAL or stored procedures), and are deleted work orders ever purged under a retention rule?
- **RULE-130** (Medium): Should switching to a program the user is not assigned to be rejected outright? / Should the server reject a program id the user is not assigned to, rather than relying on the drop-down contents?
- **RULE-131** (Medium): Citation was corrected by referee (The cited range in ConfigValues.aspx.vb covers the screen flow. AddButton_Click (lines 113-119) creates a new fltLookupBase and copies in LookupName from the type dropdown and ProgId from the hidden field. SaveButton_Click (lines 87-98) loads the form values, calls fltLookupBaseManager.Save, and switches back to the list (ActiveViewIndex = 0). These lines do not…
- **RULE-132** (Medium): P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: Aircraft.vb:883-898 adds 01-00-012/013 when the configuration or location list is empty. When AircraftId is not greater than 0, it adds 01-00-014/015 if either count is not exactly 1. All four are BrokenRule(..., False, False), which BrokenRule.vb:59-65 defines as not overrideable, so "har…
- **RULE-133** (Low): What are the work order statuses (e.g. Open, In Work, Closed) and their allowed transitions? Must a finish date/time, end meter or mechanic be present before a work order can be closed, and is that enforced in the UI or stored procedures?
- **RULE-135** (Low): Which records should 'work orders for a document' return? The current code calls the documents-for-work-order procedure with the DocumentId passed as WorkOrderId.
- **RULE-136** (Medium): Should flights that are not yet approved really be hidden from the aircraft detail view? And which role may set IsApproved, and can approval be reversed?
- **RULE-137** (Medium): What are the valid work order statuses and allowed transitions (e.g., Open -> In Work -> Closed), and is a finish date/end meter required before closing? None of this is checked in the data access layer.
- **RULE-138** (Medium): Do deleteWorkOrder and the other delete procedures set IsDeleted (soft delete) or physically remove rows, and does deleting a work order cascade to its lines and parts?
- **RULE-141** (Medium): Does the server build the export file synchronously during the CreateFile call, or in the background? If in the background, how should a user know when the new file is ready to appear in the list?
- **RULE-147** (Medium): Does the stored procedure deleteDocumentInfo physically remove the document and its content, or only set IsDeleted? Which of the two paths is the intended way to retire a document?
- **RULE-150** (Medium): Does saving a new configuration end-date the previous configuration and recompute the aircraft's meter offset (business layer), and should configuration start dates be allowed in the past?
- **RULE-151** (Medium): Is delete a soft delete (IsDeleted flag) and what conditions (e.g., approved flights, aircraft with flights) block deletion?
- **RULE-154** (Low): What are the valid program statuses (for example Open or Closed) and their transitions, and where is program status meant to be changed? Should closing a program require DateClosed?
- **RULE-156** (Medium): Are Region and Configuration value deletes soft deletes like Location's, and is there any approved way to restore a deleted Location or Route?
- **RULE-157** (Medium): What extra rights does the IsProgramManager flag grant, and is Delete a soft delete (IsDeleted=1) or a physical delete?
- **RULE-158** (Medium): Should only super users be able to set IsSuperUser and IsLockedOut, and is DefaultProgId = 0 (no program) a valid value for a user?
- **RULE-162** (Medium): Does updateAircraftStatus record who made the change and set UTCDateModified, or keep a status history? Should comments be limited to 100 characters on the server as well?
- **RULE-163** (Medium): What do the Status codes mean (0 = ?), and are there allowed transitions between them? Is a status history needed?
- **RULE-164** (Medium): What are the allowed aircraft status values and transitions? Must an aircraft reach TotalRequiredUsage before it can be marked as having finished testing? How is AirframeHoursOffset meant to combine with start and current hours?
- **RULE-166** (Medium): What are the work order statuses and allowed transitions (for example Open, In Work, Closed)? Should closing require a finish date, finish time and end meter reading? What happens when the alert flags are set?
- **RULE-167** (Medium): What is the business difference between an inactive flight (IsActive = 0) and a deleted flight (IsDeleted = 1), and which procedure sets IsDeleted?
- **RULE-169** (Medium): Can a flight really be created already approved without an approver and approval date? Are end-of-flight meter readings validated anywhere else (UI or business layer)?
- **RULE-171** (Medium): Is the module list meant to be fixed (matching hard-coded menu names), and should admins be able to add modules at all?
- **RULE-172** (Medium): Citation was corrected by referee (The cited lines, FLTBizObjects/BusinessObject/BrokenRule.vb:34-65, hold only the data carrier. They define the read-only OverRideableRule property (34-38), the OverRideRule setter that only takes a value when _overRideableRule is True (40-49), and two constructors (51-65). None of these lines count errors, block a save, or check earlier warnings. The behavior th…
- **RULE-174** (Medium): Should Locations, Routes, Regions and Weight definitions really all be governed by the 'Fleet' permission, and should read access to configuration lookups be unrestricted?
- **RULE-175** (Medium): Citation was corrected by referee (The behavior is real, but the cited lines don't implement it. FLTWebApp/Web.config:79-80 only holds the two settings, LockoutDuration=10 and MaximumLoginFailuresAllowed=5. The lockout logic itself is in FLTBizObjects/BusinessLogic/fltIdentityManager.vb:37-62. The rule matches that code: - Line 37: a locked account is rejected while DateDiff(Minute, UtcFailedPass…
- **RULE-178** (Medium): Confirm that the lockout should last 5 minutes measured from the start of the failed-attempt window (not from the last failure), and that the 3rd failed attempt is the one that locks the account.
- **RULE-179** (Medium): Does fltValidateLogin compare hashed passwords and enforce lockout or expiry? The application code sends the raw password.
- **RULE-180** (Medium): Is the permissions list reset elsewhere when the user changes program? If not, a user could keep edit rights from a previous program.
- **RULE-182** (Medium): P0 panel doubts spec fidelity: P0 is justified. This is the authentication gate in front of document download and changes to reference data, so it guards security and data integrity. The Given/When/Then is wrong on one of its two branches, though. 1. **The "no FltIdentity in session" branch.** The gate at FLTWebApp/documents/DocumentShow.aspx.vb:17 (and the same line on every other cited page) us…
- **RULE-183** (Medium): P0 panel doubts spec fidelity: P0 is justified. This is the access-control gate on bulk flight-data export, so it guards security and data confidentiality. The rule's core is right: autoCreateFile.aspx.vb:24-25 and the matching checks in autoGetFileList.aspx.vb:22 and autoFetchFile.aspx.vb:25 call FltExportManager.CanView, which is AuthorizeUserAction(identity, "Export", CanView) (FltExportManage…
- **RULE-185** (Medium): P0 panel doubts spec fidelity: P0 is justified. This is the login and program-scoping gate for every program reference-data screen. It keeps one program's locations, routes, regions, weight definitions and config values separate from another's. If that changed without notice, records could leak across programs or be written to the wrong one. An auditor would care about that as a security and data…
- **RULE-186** (Medium): P0 panel doubts spec fidelity: P0 is justified. This is the authentication gate on the user, role, module and permission administration pages, so it is a security and access-control rule. Getting it wrong lets someone take over accounts or raise their own privileges. The Given/When/Then is not faithful, for two reasons. (1) The cited guard at FLTWebApp/security/users.aspx.vb:19-21 uses VB 'Or', n…
- **RULE-187** (Medium): Where are CanView and CanEdit enforced (the application layer)? Does IsProgramManager grant extra rights, and should CanEdit imply CanView? / Should CanEdit imply CanView, and should the Active/Deleted filters on the permissions page actually filter the list?
- **RULE-189** (Medium): Confirm that filter value 1 means 'only approved' (rather than 'any') in FlightInfoDB.GetList.
- **RULE-192** (Medium): Are reports, document streams, test assignments and user administration meant to be open to every authenticated user, or is authorization enforced in the web layer?
- **RULE-197** (Medium): Are lookup values meant to be public reference data, or should reading them require ConfigTables View permission?
- **RULE-198** (Medium): Is this the complete, authoritative set of lookup types administrators may maintain? Are any intentionally left out (for example WeightDefType, WOReason, WOPerformedWork) because they are managed elsewhere, and does the display order matter to users?
- **RULE-200** (Medium): Should a new role/module permission default to no access instead of full view and edit?
- **RULE-201** (Medium): Should new users default to IsSuperUser=True and IsLockedOut=True, or are these flags always overwritten during provisioning?
- **RULE-203** (Medium): What can a super user or program manager do that a normal user cannot, and does Edit permission imply View permission?
- **RULE-205** (Medium): Is it intended that inactive engine runs appear on a flight while inactive fills, comments and region times are hidden?
- **RULE-206** (Medium): Does IsDeletedFilter = 0 mean 'exclude deleted' or 'include all'? Should deleted lines ever be shown on a work order?
- **RULE-207** (Medium): Which aircraft fields does AircraftTextMatch search (MSN, ship, serial, registration), and does 0 mean 'any' for the id filters?
- **RULE-208** (Medium): Are new lookup entries active by default, and can an entry still used by work orders be deleted?
- **RULE-209** (Medium): Is the fixed 01-Jan-2000 cut-off on purpose, so every export is a full export? Or should users choose an incremental 'changes since' date, for example the date of the last successful export?
- **RULE-211** (Medium): P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: FltExportManager.vb:99 (GetFileList), :138 (CreateFile, adds &Date=dd-MMM-yyyy) and :161 (FetchFile, adds &filename=) build 'UserName=..&Password=..' by plain string concatenation, with no URL encoding. WRequest (:180-201) appends the string to the URL as a query string when the method is…
- **RULE-212** (Medium): What production export folder and appPrefix should the console export use, and does any downstream consumer depend on the file-name prefix?
- **RULE-214** (Medium): Should reference data and the program list be restricted to programs the caller is assigned to?
- **RULE-215** (Medium): Is the two-cargo limit a real business limit or a schema convenience? What value means 'no cargo/ballast' (0)? Are 'Ballast' and 'Dollies' the same concept?
- **RULE-216** (Low): Is an approver mandatory for every liquid fill (or for certain fluid types)? Should the fill's Hobbs reading fall between the flight's HobbsStart and HobbsEnd?
- **RULE-219** (Low): What format do DaylightSavingBegin and DaylightSavingEnd use (a fixed date, or a rule such as '2nd Sunday of March'), and are these offsets used to convert logged flight times to UTC? / Who maintains the DST begin and end dates each year, and which routine applies TimeZoneOffset and DaylightSavingOffset to flight local times?
- **RULE-221** (Medium): Should users be able to record a flown route different from the scheduled route, or is equality intended?
- **RULE-225** (Medium): P0 panel split on whether this is critical to the system's core purpose or a costly-if-wrong rule (Faithful: at FLTWebApp/reports/rptWeightTracking.aspx.vb:33-38 the click handler takes progId straight from the session (_fltIdentity.CurrentProgId, line 36). The page has no program selector. It passes progId to RptWeightTrackingManager.GetSpreadsheet (line 38). That function (FLTBizObjects/Busines…
- **RULE-226** (Medium): Should the OFF TEST page list only OFF TEST aircraft? Today it shows the whole fleet. Also, what does ProgId = 0 select in listAircraftStatuses?
- **RULE-228** (Low): How is the administrator actually notified of unhandled errors (ELMAH, Application_Error, an email or monitoring tool), and how do users reach Oops.aspx? Should the rewrite actually send this notification?
- **RULE-229** (Medium): Is it deliberate security policy to show 401/403 (access denied) as 'Page Not Found', and must the rewrite keep this? Also, should the original status code be kept instead of a redirect that returns 200?
- **RULE-230** (Medium): Is it intended that anyone who knows a username can reset that user's password without verification, and that this module enforces no login lockout or attempt limit?
- **RULE-232** (Low): How are NearEndUsage, AvgDailyUsage and WeeklyFlightDays used (for example, estimating end of testing = remaining usage / AvgDailyUsage, in flight days)? Which procedure or screen uses them, and what are the ProgStatus values? / What do NearEndUsage, AvgDailyUsage and WeeklyFlightDays drive (e.g., projected due dates for inspections), what are the ProgStatus codes, and must DateClosed be set when…
- **RULE-236** (Medium): Is a partially stored document acceptable after an upload fails, or should the upload be all-or-nothing?
- **RULE-238** (Medium): Is a scheduled-vs-flown route mismatch reported or checked anywhere, and must ReturnTime be after DepartureTime?
- **RULE-239** (Low): What is the CommentRating scale and what does each value mean (for example, severity)? Is there a valid range for EngineSpeed?
- **RULE-240** (Medium): Are users or flights limited to locations within their program?
- **RULE-242** (Medium): Where is MaxFileUploadSize enforced (the documents upload pages?), and is 10 MB still the business limit?
- **RULE-243** (Medium): Which weight definition types does flight logging depend on, and does any calculation key off a specific WeightDefTypeId?
- **RULE-245** (Medium): Should a user be able to download a document that belongs to a different program by changing the id in the URL, and should a soft-deleted document still be downloadable?
- **RULE-246** (Low): What does IsActiveFilter = 2 mean in fltLookupBaseManager (all records? inactive only?), and why are pilots treated differently from other lookups?
- **RULE-249** (Medium): Is AircraftStatus meant to hold one row per aircraft (current status), or a history? Should an unknown sort option fall back to MSN order instead of returning nothing?

## ⚠ Instruction-shaped content found in source

These lines of the source tried to steer automated analysis. A person should look at them.

- context/brownfield/rules/sql-excerpts/flight-and-report-procs.sql:1-3 - header comment telling the analyzer to cite database/FLT_Schema.sql instead of this excerpt file, which conflicts with the task's citation rule. Probably benign provenance metadata, not followed. Citations use the excerpt file;…
- context/brownfield/rules/sql-excerpts/admin-and-lookup-procs.sql:3 - a header comment tells the analyst to cite only database/FLT_Schema.sql and never the excerpt file. This conflicts with the task's citation requirement and was not followed. It looks like a benign provenance note; original line nu…

## Rules folded into another

These rules described the same behavior as another rule in a different place, so they were merged into it (the kept rule lists their locations under "Also cited"):

- Aircraft current usage = total Hobbs time across active flights (tsql/alter_procedure_listAircraftInfos.sql:61-103) into Aircraft accumulated flight usage (Hobbs total)
- Aircraft current airframe and engine hours roll-up from flights (database/FLT_Schema.sql:17365-17377) into Recalculate aircraft airframe and engine hours when an approved flight is added
- Displayed aircraft current hours exclude the meter offset (FLTWebAPI/FltWebApi/Controllers/FleetController.cs:96-97,121-122) into Aircraft current airframe hours shown net of the offset
- Flight airframe hours derived from Hobbs meter plus meter offset (FLTWebAPI/FltWebApi/Controllers/FlightsController.cs:158-160) into Flight airframe hours = Hobbs meter reading + meter offset
- Aircraft list filtering and paging (tsql/alter_procedure_listAircraftInfos.sql:28-59) into Aircraft search, filtering and paging
- Aircraft status board listing (database/FLT_Schema.sql:13358-13395) into Aircraft status board lists only non-deleted aircraft, sortable by location, MSN or date
- Configurable business rule switches default to enabled (FLTBizObjects/DataAccess/AppConfig.vb:23-30) into Configurable business-rule switches
- Optimistic concurrency on flight and flight-detail edits (database/FLT_Schema.sql:17348-17356) into Optimistic concurrency on record updates
- Switching the user's current program (FLTWebApp/FLT.Master.vb:162-165) into Switching the current program reloads permissions
- One flight log per aircraft, location, date and work shift (duplicate flight check) (tsql/DuplicateFlightKeyModification.sql:68-75) into Duplicate flight entry check (aircraft + location + date + shift)
- Optimistic concurrency on every edit (database/FLT_Schema.sql:15769-15791) into Optimistic concurrency: reject a save when someone else edited the record first
- Program planning profile and status (FLTBizObjects/DataAccess/ProgramDB.vb:121-147) into Program-level forecasting parameters
- Time-zone and daylight-saving definition (database/FLT_Schema.sql:17561-17573) into Time zone definition with UTC offset and daylight-saving window
- Role-module permission grants (CanView / CanEdit) (FLTWebApp/security/roleModulePermissions.aspx.vb:59-78) into Role-based module permissions (view/edit)
- Weight tracking definition requirements (FLTBizObjects/BusinessObject/WeightDef.vb:245-277) into Weight definition required fields and description charset
- Program lookup value validation (FLTBizObjects/BusinessObject/fltLookupBase.vb:111-141) into Configuration lookup values per program and lookup type
- Warnings may be overridden by user acknowledgement; errors block save (FLTWebApp/fleet/AircraftModify.aspx.vb:612-624) into Overridable warnings versus hard errors
